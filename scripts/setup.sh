#!/usr/bin/env bash
# =============================================================================
#  scripts/setup.sh — Prepara el PDK fijado del repo DENTRO del contenedor
#  IIC-OSIC-TOOLS. Es idempotente: se puede correr todas las veces que quieras.
#
#  Uso (terminal Linux del contenedor, desde la raíz del repo):
#      bash scripts/setup.sh              # verifica + compila + autocarga
#      bash scripts/setup.sh --check      # solo verifica, no cambia nada
#      bash scripts/setup.sh --no-autoload  # no toca /foss/designs/.designinit
#
#  Qué hace:
#    1. Verifica que el submódulo del PDK esté descargado y en el commit fijado.
#    2. Detecta finales de línea CRLF (checkout de Windows con autocrlf=true).
#    3. Compila los modelos Verilog-A (OSDI) que ngspice necesita para simular.
#       Se guardan dentro del PDK, en archivos que el propio PDK ignora en git.
#    4. Registra las celdas estándar como librerías de KLayout (.pdk_local/).
#    5. Agrega a /foss/designs/.designinit la carga automática de SOURCEME,
#       así cada terminal nueva del contenedor ya usa el PDK fijado.
#
#  NO hace operaciones de git que modifiquen el repo: todo git se maneja
#  desde PowerShell (ver README).
# =============================================================================
set -euo pipefail

MODE="setup"
AUTOLOAD=1
for arg in "$@"; do
  case "$arg" in
    --check) MODE="check" ;;
    --no-autoload) AUTOLOAD=0 ;;
    -h|--help) sed -n '2,25p' "$0"; exit 0 ;;
    *) echo "[ERROR] Opción desconocida: $arg" >&2; exit 2 ;;
  esac
done

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PDK_ROOT_LOCAL="$REPO_DIR/pdk/ihp-sg13g2"
PDK_NAME="ihp-sg13g2"
PDK_PATH="$PDK_ROOT_LOCAL/$PDK_NAME"
LOCAL_DIR="$REPO_DIR/.pdk_local"
OSDI_DIR="$PDK_PATH/libs.tech/ngspice/osdi"
VA_DIR="$PDK_PATH/libs.tech/verilog-a"

# El repo vive en una carpeta de Windows montada: el dueño de los archivos no
# coincide con el usuario del contenedor y git se niega a leerlo
# ("dubious ownership"). Solo para las lecturas de este script:
export GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=safe.directory GIT_CONFIG_VALUE_0='*'

ok()   { echo "[OK]    $*"; }
info() { echo "[INFO]  $*"; }
warn() { echo "[WARN]  $*" >&2; }
fail() { echo "[ERROR] $*" >&2; exit 1; }

echo "=== ASIC_UCC · preparación del PDK IHP SG13G2 fijado ==="

# --- 0. ¿Estamos en el contenedor? -------------------------------------------
if [ ! -d /foss/tools ]; then
  warn "No parece el contenedor IIC-OSIC-TOOLS (/foss/tools no existe). Sigo igual."
fi

# --- 1. Submódulo presente y en el commit fijado ------------------------------
[ -f "$PDK_PATH/libs.tech/xschem/xschemrc" ] || fail \
"El PDK no está descargado en pdk/ihp-sg13g2.
        Desde PowerShell, en la carpeta del repo:  git submodule update --init --recursive"

PINNED="$(git -C "$REPO_DIR" ls-tree HEAD pdk/ihp-sg13g2 | awk '{print $3}')"
CURRENT="$(git -C "$PDK_ROOT_LOCAL" rev-parse HEAD 2>/dev/null || echo desconocido)"
if [ "$PINNED" != "$CURRENT" ]; then
  fail "El PDK descargado (${CURRENT:0:8}) no es el fijado por el repo (${PINNED:0:8}).
        Desde PowerShell:  git submodule update --init --recursive"
fi
ok "PDK en el commit fijado ${PINNED:0:8} (rama dev de IHP-GmbH/IHP-Open-PDK)"

# Submódulos internos del PDK (las PCells de KLayout dependen de ellos)
if [ -z "$(ls -A "$PDK_PATH/libs.tech/klayout/python/pycell4klayout-api" 2>/dev/null)" ]; then
  fail "Faltan los submódulos internos del PDK (PCells de KLayout).
        Desde PowerShell:  git submodule update --init --recursive"
fi
ok "Submódulos internos del PDK presentes"

# --- 2. Finales de línea ------------------------------------------------------
crlf_files=()
for f in "$VA_DIR/psp103/psp103.va" \
         "$PDK_PATH/libs.tech/ngspice/models/cornerMOSlv.lib" \
         "$PDK_PATH/libs.tech/xschem/xschemrc"; do
  if [ -f "$f" ] && grep -q $'\r' "$f"; then crlf_files+=("${f#"$REPO_DIR"/}"); fi
done
if [ ${#crlf_files[@]} -gt 0 ]; then
  printf '[ERROR] Archivos con finales de línea de Windows (CRLF):\n' >&2
  printf '          %s\n' "${crlf_files[@]}" >&2
  cat >&2 <<'MSG'
        Git de Windows convirtió el PDK al descargarlo. Arreglalo UNA vez desde PowerShell,
        en la carpeta del repo (solo vuelve a descargar el PDK, tu trabajo no se toca):
          git config --global core.autocrlf false
          git submodule deinit -f pdk/ihp-sg13g2
          git submodule update --init --recursive
        Después volvé a correr:  bash scripts/setup.sh
MSG
  exit 1
fi
ok "Finales de línea correctos (LF)"

# --- 3. Modelos OSDI para ngspice --------------------------------------------
OSDI_MODELS=(
  "psp103.osdi:psp103/psp103.va"
  "psp103_nqs.osdi:psp103/psp103_nqs.va"
  "r3_cmc.osdi:r3_cmc/r3_cmc.va"
  "mosvar.osdi:mosvar/mosvar.va"
  "cap_cmomi.osdi:cap_cmomi/cap_cmomi.va"
  "cap_cmomf.osdi:cap_cmomf/cap_cmomf.va"
)
STAMP="$OSDI_DIR/.asic_ucc_pdk_commit"

osdi_ok=1
for m in "${OSDI_MODELS[@]}"; do
  [ -f "$OSDI_DIR/${m%%:*}" ] || osdi_ok=0
done
[ -f "$STAMP" ] && [ "$(cat "$STAMP")" = "$PINNED" ] || osdi_ok=0

if [ "$osdi_ok" -eq 1 ]; then
  ok "Modelos OSDI ya compilados para este commit del PDK"
elif [ "$MODE" = "check" ]; then
  warn "Modelos OSDI faltantes o de otro commit del PDK (correr: bash scripts/setup.sh)"
else
  export PATH="${TOOLS:-/foss/tools}/openvaf/bin:$PATH"
  if command -v openvaf-r >/dev/null 2>&1; then VAC=openvaf-r
  elif command -v openvaf >/dev/null 2>&1; then VAC=openvaf
  else fail "No encuentro openvaf (debería venir en el contenedor, en /foss/tools/openvaf/bin)."
  fi
  info "Compilando modelos Verilog-A con $VAC (tarda 1-3 minutos)..."
  mkdir -p "$OSDI_DIR"
  for m in "${OSDI_MODELS[@]}"; do
    out="${m%%:*}"; src="${m#*:}"
    [ -f "$VA_DIR/$src" ] || { warn "No existe $src en este PDK; lo salteo"; continue; }
    info "  $out"
    ( cd "$VA_DIR" && "$VAC" -D__NGSPICE__ --target_cpu generic -o "$OSDI_DIR/$out" "$src" ) \
      || fail "Falló la compilación de $src"
  done
  echo "$PINNED" > "$STAMP"
  ok "Modelos OSDI compilados en pdk/ihp-sg13g2/$PDK_NAME/libs.tech/ngspice/osdi"
fi

# --- 4. Librerías de celdas para KLayout --------------------------------------
LIB_DIR="$LOCAL_DIR/klayout/libraries"
if [ "$MODE" = "check" ]; then
  [ -d "$LIB_DIR" ] && ok "Librerías de KLayout registradas" \
                    || warn "Librerías de KLayout sin registrar (correr: bash scripts/setup.sh)"
else
  mkdir -p "$LIB_DIR"
  for lib in sg13g2_stdcell sg13g2_stdcell_hv sg13g2_io; do
    gds="$PDK_PATH/libs.ref/$lib/gds/$lib.gds"
    [ -f "$gds" ] || continue
    rm -f "$LIB_DIR/$lib.gds"
    # Enlace relativo; si el sistema de archivos no permite symlinks, se copia.
    ln -s "../../../pdk/ihp-sg13g2/$PDK_NAME/libs.ref/$lib/gds/$lib.gds" "$LIB_DIR/$lib.gds" 2>/dev/null \
      || cp "$gds" "$LIB_DIR/$lib.gds"
  done
  ok "Librerías de KLayout registradas en .pdk_local/klayout/libraries"
fi

# --- 5. Autocarga de SOURCEME en el contenedor ---------------------------------
DESIGNINIT="${DESIGNS:-/foss/designs}/.designinit"
BEGIN="# >>> ASIC_UCC: PDK fijado >>>"
END="# <<< ASIC_UCC: PDK fijado <<<"
if [ "$MODE" = "check" ] || [ "$AUTOLOAD" -eq 0 ]; then
  grep -qF "$BEGIN" "$DESIGNINIT" 2>/dev/null \
    && ok "Autocarga de SOURCEME presente en $DESIGNINIT" \
    || info "Sin autocarga: en cada terminal ejecutá  source $REPO_DIR/SOURCEME"
elif [ -d "$(dirname "$DESIGNINIT")" ]; then
  tmp="$(mktemp)"
  if [ -f "$DESIGNINIT" ]; then
    # Quita un bloque nuestro anterior y la configuración vieja (rota) del setup.sh original
    awk -v b="$BEGIN" -v e="$END" '
      $0==b {skip=1; next} $0==e {skip=0; next} skip {next}
      index($0, "Entorno ASIC_UCC listo") {next}
      index($0, "$PDK_ROOT/libs.tech/") {next}
      /^export (PDK|PDK_ROOT)=/ && index($0, "ihp-sg13g2") {next}
      {print}' "$DESIGNINIT" > "$tmp"
  fi
  {
    echo "$BEGIN"
    echo "# Generado por $REPO_DIR/scripts/setup.sh — usa el PDK fijado del repo"
    echo "if [ -n \"\${BASH_VERSION:-}\${ZSH_VERSION:-}\" ] && [ -f \"$REPO_DIR/SOURCEME\" ]; then"
    echo "  . \"$REPO_DIR/SOURCEME\""
    echo "fi"
    echo "$END"
  } >> "$tmp"
  cat "$tmp" > "$DESIGNINIT"; rm -f "$tmp"
  ok "Autocarga agregada a $DESIGNINIT (aplica en terminales/containers nuevos)"
fi

echo
if [ "$MODE" = "check" ]; then
  echo "Verificación terminada."
else
  echo "Listo. En ESTA terminal ejecutá:  source $REPO_DIR/SOURCEME"
fi
