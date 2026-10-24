# 🚀 Proyecto Integrador ASIC - UCC (Universidad Católica de Córdoba)

Este repositorio contiene el diseño colaborativo a nivel de circuito y layout físico de nuestro ASIC. El proyecto evalúa dos arquitecturas distintas (`Enfoque_A` y `Enfoque_B`) utilizando el nodo tecnológico **IHP SG13G2 (130nm)** y herramientas Open-Source EDA.

Para asegurar que todo el equipo trabaje con exactamente la misma versión del PDK y de las herramientas, utilizamos el contenedor **IIC-OSIC-TOOLS** corriendo sobre **Podman** en modo X-Server nativo (WSLg), junto con el PDK oficial integrado como submódulo de Git.

### 📌 Versión del PDK

| | |
|---|---|
| PDK | [IHP-GmbH/IHP-Open-PDK](https://github.com/IHP-GmbH/IHP-Open-PDK), rama **`dev`** |
| Commit fijado | **`cb743f75`** (2026-10-23) |
| Ubicación en el repo | `pdk/ihp-sg13g2` (submódulo) |

Cada vez que hagas `git pull`, tu PDK queda **clavado en ese commit**, aunque IHP siga actualizando `dev`. Solo el integrador cambia la versión. Detalles y procedimiento de actualización en [docs/PDK.md](docs/PDK.md).

> El contenedor trae su propio PDK en `/foss/pdks`. **No lo usamos**: `SOURCEME` hace que KLayout, Xschem y ngspice usen el PDK fijado del repo.

---

## 🛡️ Reglas de Oro del Repositorio (Git Workflow)

1. **Todo Git se maneja desde PowerShell (Windows):** Para evitar conflictos de permisos entre sistemas operativos, **todos los comandos de Git (`clone`, `pull`, `switch`, `commit`, `push`) se ejecutan exclusivamente desde PowerShell en Windows**. La terminal de Linux del contenedor se utiliza únicamente para abrir las herramientas EDA (`XSchem`, `KLayout`, `Ngspice`) y para correr `scripts/setup.sh`, que no modifica el repo.
2. **Rama `main` Protegida:** Está **estrictamente prohibido** trabajar, hacer commits o intentar hacer `push` directamente a la rama `main`. Solo el docente/integrador a cargo del proyecto modifica `main`.
3. **Una Rama (`Branch`) por Alumno:** Cada alumno debe crear y trabajar exclusivamente dentro de su propia rama personal siguiendo el formato estricto: **`feat/nombre_apellido`** (ejemplo: `feat/juan_perez`).
4. **Prohibido tocar el TOP:** Tienes prohibido modificar los archivos de integración superior (`ASIC_TOP.sch` o `ASIC_TOP.gds`). Solo el integrador del proyecto puede editarlos.
5. **Entregas vía Pull Request (PR):** Todo avance terminado y verificado (DRC y LVS Clean) se sube a tu rama personal desde PowerShell y se solicita su integración a `main` abriendo un **Pull Request** en GitHub para que el docente lo revise y apruebe (adjuntar fotos de los DRC/LVS clean).
6. **Modificaciones del TOP:** Si es necesario, solicitá al integrador la modificación a nivel top para que tu subcelda pueda ser integrada sin problema (por ejemplo, metal de alimentación muy cercano a otro que no pasa DRC).
7. **Prohibido cambiar la versión del PDK:** No commitees cambios en `pdk/ihp-sg13g2`, `.gitmodules`, `SOURCEME`, `xschemrc` ni `scripts/setup.sh`. La verificación automática del PR los rechaza.

---

## 💻 Fase 1: Instalación del Entorno (Solo la primera vez)

Abre **PowerShell como Administrador** y ejecuta el instalador interactivo oficial:

```powershell
powershell -c "irm https://osic.tools/install.ps1 | iex"
```

**⚠️ MUY IMPORTANTE: Durante la instalación el script te hará 5 preguntas en consola. Respóndelas así:**
1. **Disclaimer:** Aceptar responsabilidad `[y/N]` -> Escribe **`y`** y presiona Enter.
2. **Container Engine:** *"Use Podman instead of Docker Desktop...?"* `[y/N]` -> Escribe **`y`** y presiona Enter (**Es obligatorio usar Podman**).
3. **Instalación de componentes:** Instalar Git, WSL2 y Podman `[y/N]` -> Escribe **`y`** en todos.
4. **Directorio de `iic-osic-tools`:** Dónde clonar el repositorio de arranque -> Presiona **Enter** para dejar la ruta por defecto (`C:\Users\TU_USUARIO\iic-osic-tools`). Recomendado dejarlo en default; si no hay espacio en ese disco y lo quieren en un secundario, háganlo sin problema.
5. **Reinicio:** Reiniciar Windows al finalizar `[y/N]` -> Escribe **`y`**.

---

## ⚙️ Fase 2: Inicializar Podman y Crear el Contenedor (Solo la primera vez, tras reiniciar)

Una vez que la PC reinicie, abre un **PowerShell normal** y sigue estos pasos para crear la máquina virtual y levantar por primera vez el contenedor `iic-osic-tools_xserver`:

```powershell
# 1. Inicializar y encender la máquina virtual de Podman
podman machine init
podman machine start

# 2. Ir a la carpeta donde se descargaron los scripts de arranque (Fase 1, paso 4)
cd $env:USERPROFILE\iic-osic-tools

# 3. Ejecutar el script de modo gráfico X11/WSLg (descargará ~4 GB la primera vez)
.\start_x.bat
```
Al terminar, se abrirá automáticamente una **ventana de terminal de Linux** posicionada en `/foss/designs`. Además, este paso habrá creado tu contenedor persistente llamado **`iic-osic-tools_xserver`** y la carpeta `eda\designs` en tu usuario de Windows.

---

## 📥 Fase 3: Configurar Git, Clonar el Proyecto e Inicializar el PDK (Desde PowerShell)

**⚠️ CRÍTICO:** El contenedor mapea tu carpeta local `eda\designs` de Windows directamente al directorio **`/foss/designs`** dentro de Linux. **El repositorio debe vivir obligatoriamente allí adentro.**

Abre **PowerShell en Windows** y ejecuta:

```powershell
# 0. Configuración de Git (UNA sola vez por PC). Es obligatoria:
git config --global core.autocrlf false     # no convertir archivos a formato Windows (rompe scripts y modelos)
git config --global core.longpaths true     # el PDK tiene rutas largas
git config --global submodule.recurse true  # git pull / git switch actualizan el PDK solos

# 1. Ir a la carpeta compartida con el contenedor en Windows:
cd $env:USERPROFILE\eda\designs

# 2. Clonar el repositorio (con el PDK) y entrar a la carpeta:
git clone --recurse-submodules https://github.com/Lujham1/ASIC_UCC.git
cd ASIC_UCC

# 3. Por las dudas, asegurar el PDK en la versión fijada:
git submodule update --init --recursive
```

Luego, en la **terminal de Linux del contenedor**, prepará el PDK (una sola vez, y cada vez que el docente avise que cambió la versión):

```bash
cd /foss/designs/ASIC_UCC
bash scripts/setup.sh
source ./SOURCEME
```

`setup.sh` verifica que tengas el PDK correcto, compila los modelos de transistores para ngspice (1-3 minutos), registra las celdas estándar en KLayout y configura el contenedor para que **cada terminal nueva cargue sola el PDK fijado**.

### 🔁 ¿Ya habías clonado el repo antes de octubre 2026?

El repositorio se **reinició con un historial nuevo**, así que tu copia vieja ya no sirve. Hacé esto **una sola vez**:

1. Si tenés archivos tuyos sin subir, **copialos a otra carpeta** (fuera de `eda\designs\ASIC_UCC`).
2. En **PowerShell**, borrá la copia vieja y cloná de nuevo:

```powershell
podman stop iic-osic-tools_xserver                  # para que no tenga archivos abiertos
cd $env:USERPROFILE\eda\designs
Remove-Item -Recurse -Force .\ASIC_UCC

git config --global core.autocrlf false
git config --global core.longpaths true
git config --global submodule.recurse true

git clone --recurse-submodules https://github.com/Lujham1/ASIC_UCC.git
cd ASIC_UCC
git switch -c feat/nombre_apellido                  # tu rama, creada de nuevo
```

3. Volvé a copiar tus archivos a la carpeta de tu enfoque y seguí con la terminal Linux del contenedor: `cd /foss/designs/ASIC_UCC && bash scripts/setup.sh`. El script también limpia la configuración vieja que había dejado el `setup.sh` anterior en `/foss/designs/.designinit`.

---

## 🔄 Fase 4: Rutina de Trabajo Diaria

### 1. Sincronizar Git, colocarte en tu rama y levantar el contenedor (En PowerShell)

```powershell
# 1. Ir a la carpeta del proyecto
cd $env:USERPROFILE\eda\designs\ASIC_UCC

# 2. Traer los últimos cambios aprobados en main (con submodule.recurse, el PDK se actualiza solo)
git switch main
git pull origin main

# 3. Asegurar que el PDK esté en la versión fijada (no hace nada si ya lo está)
git submodule update --init --recursive

# 4A. SI ES TU PRIMERA VEZ: Crea tu propia rama con el formato feat/nombre_apellido
git switch -c feat/nombre_apellido

# 4B. SI YA CREASTE TU RAMA DÍAS ANTERIORES: Simplemente cámbiate a ella y actualízala con main
git switch feat/nombre_apellido
git merge main

# 5. Encender Podman y abrir el contenedor gráfico
podman machine start
podman start iic-osic-tools_xserver
```
*(En unos segundos se abrirá en tu pantalla la **terminal de Linux** directamente en `/foss/designs`).*

### 2. Verificar el PDK y lanzar XSchem / KLayout (En la Terminal de Linux)

```bash
cd /foss/designs/ASIC_UCC

# Cargar el PDK fijado (si corriste setup.sh se carga solo; repetirlo no hace daño)
source ./SOURCEME
# Debe mostrar: [OK] PDK ihp-sg13g2 fijado (commit cb743f75) | PDK_ROOT=/foss/designs/ASIC_UCC/pdk/ihp-sg13g2

# Si el docente avisó que cambió la versión del PDK:
bash scripts/setup.sh

# Para abrir XSchem (entra primero a la carpeta xschem de tu enfoque):
cd /foss/designs/ASIC_UCC/Enfoque_A/xschem
xschem &

# Para abrir KLayout en modo edición:
cd /foss/designs/ASIC_UCC/Enfoque_B/klayout
klayout -e ASIC_TOP.gds &
```

> ⚠️ **No uses `sak-pdk ihp-sg13g2`**: vuelve a apuntar KLayout al PDK del contenedor. Si lo corriste, ejecutá de nuevo `source ./SOURCEME`.

**Simulaciones:** en los esquemáticos incluí los modelos sin ruta absoluta, por ejemplo:

```spice
.lib cornerMOSlv.lib mos_tt
.lib cornerHBT.lib hbt_typ
```

ngspice los encuentra solo en el PDK fijado. Nunca uses rutas como `/foss/pdks/...`, `/opt/pdks/...` ni de tu PC: la verificación del PR las rechaza.

---

## 🔄 ¿Cómo actualizar el contenedor y las herramientas si sale una nueva versión?

Las herramientas (KLayout, Xschem, ngspice) vienen del contenedor. Para que todos tengan las mismas, el docente indicará qué versión (tag) usar, por ejemplo `2026.10`. En **PowerShell**:

```powershell
# 1. Eliminar el contenedor viejo (tus archivos en eda\designs NO se borran)
podman rm -f iic-osic-tools_xserver

# 2. Actualizar los scripts y recrear el contenedor con la versión indicada
cd $env:USERPROFILE\iic-osic-tools
git pull
$env:DOCKER_TAG = "2026.10"
.\start_x.bat
```

Después, en la terminal Linux: `cd /foss/designs/ASIC_UCC && bash scripts/setup.sh` (recompila los modelos con el openvaf del contenedor nuevo).

---

## ✅ Fase 5: Validación y Entrega (Solicitud de Pull Request)

Recuerda que **nunca debes subir cambios a `main`** y que **todo el control de versiones se hace desde PowerShell**. Cuando termines tu bloque o quieras respaldar tu avance en la nube:

1. **Verificación Local:** Para entregas finales, tu bloque debe pasar **DRC Clean** y **LVS Clean**. Guarda capturas de pantalla de ambos reportes en verde. Corré también `bash scripts/setup.sh --check` en el contenedor.
2. **Subir tus cambios a TU rama desde PowerShell (Windows):**
   ```powershell
   cd $env:USERPROFILE\eda\designs\ASIC_UCC

   # Verifica siempre estar en tu rama feat/nombre_apellido (y NO en main)
   git branch

   # Revisá qué vas a subir: NO debe aparecer pdk/ihp-sg13g2
   git status

   # Agrega, guarda y sube tus cambios a tu rama remota
   git add .
   git commit -m "feat: layout finalizado del bloque X. DRC y LVS clean."
   git push -u origin feat/nombre_apellido
   ```
   Si `git status` muestra `modified: pdk/ihp-sg13g2`, **no lo subas**: ejecutá `git submodule update --init --recursive` y volvé a revisar.
3. **Solicitar Pull Request (PR):**
   * Entra a [https://github.com/Lujham1/ASIC_UCC](https://github.com/Lujham1/ASIC_UCC) desde tu navegador.
   * Verás un cartel amarillo con tu rama recién subida (`feat/nombre_apellido`); haz clic en el botón verde **"Compare & pull request"**.
   * Asegúrate de que la flecha apunte desde tu rama (`compare: feat/nombre_apellido`) hacia `base: main`.
   * Completá el checklist de la plantilla y adjuntá las capturas de **DRC Clean**, **LVS Clean** y simulaciones relevantes.
   * Esperá que la **verificación automática** quede en verde ✔️ y avisá al docente para su revisión e integración a `main`.

---

## 🗂️ Estructura del repositorio

```
ASIC_UCC/
├── pdk/ihp-sg13g2/        # Submódulo: IHP-Open-PDK, rama dev, commit fijado (NO tocar)
├── Enfoque_A/             # xschem/ (esquemáticos + xschemrc), klayout/, sim/
├── Enfoque_B/             # ídem; contiene ASIC_TOP (solo integrador)
├── SOURCEME               # Selecciona el PDK fijado (source ./SOURCEME)
├── xschemrc               # Config común de Xschem (la cargan los xschemrc de cada enfoque)
├── scripts/setup.sh       # Prepara el PDK en el contenedor (OSDI, KLayout, autocarga)
├── docs/PDK.md            # Versión fijada y cómo actualizarla
├── release/               # GDS/netlists de entregas
└── .github/               # Verificación automática de PRs y plantilla
```

## 🧑‍🏫 Para el integrador: configuración de GitHub (una sola vez)

En **Settings → Branches → Add branch ruleset** (o *branch protection rule*) para `main`:

- *Require a pull request before merging* (con al menos 1 aprobación).
- *Require status checks to pass* → seleccionar **Verificación del repo / check**.
- *Block force pushes*.

El archivo `.github/CODEOWNERS` hace que cada PR te pida revisión automáticamente.
