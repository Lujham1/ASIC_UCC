#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL_PDK_PATH="$REPO_DIR/pdk/ihp-sg13g2"

echo "[INFO] Configurando el entorno para usar el submódulo PDK local..."

# Configurar .designinit dentro del contenedor para que apunte al PDK local del repo
cat << INIT > /foss/designs/.designinit
export PDK=ihp-sg13g2
export PDK_ROOT=$LOCAL_PDK_PATH
export KLAYOUT_PATH="\$PDK_ROOT/libs.tech/klayout"
export SPICE_USERINIT_DIR="\$PDK_ROOT/libs.tech/ngspice"
echo "[OK] Entorno ASIC_UCC listo | Usando PDK versionado (Commit: \$(git -C $LOCAL_PDK_PATH rev-parse --short HEAD))"
INIT

# Crear archivos xschemrc en los enfoques
for dir in "$REPO_DIR/Enfoque_A/xschem" "$REPO_DIR/Enfoque_B/xschem"; do
    mkdir -p "$dir"
    cat << 'XRC' > "$dir/xschemrc"
source $env(PDK_ROOT)/libs.tech/xschem/xschemrc
append XSCHEM_LIBRARY_PATH :[pwd]
set netlist_dir [pwd]/../sim
XRC
done

echo "[OK] Configuración con submódulo PDK aplicada con éxito."