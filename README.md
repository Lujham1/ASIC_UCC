# 🚀 Proyecto Integrador ASIC - UCC (Universidad Católica de Córdoba)

Este repositorio contiene el diseño colaborativo a nivel de circuito y layout físico de nuestro ASIC. El proyecto evalúa dos arquitecturas distintas (`Enfoque_A` y `Enfoque_B`) utilizando el nodo tecnológico **IHP SG13G2 (130nm)** y herramientas Open-Source EDA.

Para asegurar que todo el equipo trabaje con exactamente la misma versión del PDK y de las herramientas, utilizamos el contenedor **IIC-OSIC-TOOLS** corriendo sobre **Podman** en modo X-Server nativo (WSLg), junto con el PDK oficial integrado como submódulo de Git.

---

## 🛡️ Reglas de Oro del Repositorio (Git Workflow)

1. **Todo Git se maneja desde PowerShell (Windows):** Para evitar conflictos de permisos entre sistemas operativos, **todos los comandos de Git (`clone`, `pull`, `switch`, `commit`, `push`) se ejecutan exclusivamente desde PowerShell en Windows**. La terminal de Linux del contenedor se utiliza únicamente para abrir las herramientas EDA (`XSchem`, `KLayout`, `Ngspice`).
2. **Rama `main` Protegida:** Está **estrictamente prohibido** trabajar, hacer commits o intentar hacer `push` directamente a la rama `main`. Solo el docente/integrador a cargo del proyecto modifica `main`.
3. **Una Rama (`Branch`) por Alumno:** Cada alumno debe crear y trabajar exclusivamente dentro de su propia rama personal siguiendo el formato estricto: **`feat/nombre_apellido`** (ejemplo: `feat/juan_perez`).
4. **Prohibido tocar el TOP:** Tienes prohibido modificar los archivos de integración superior (`ASIC_TOP.sch` o `ASIC_TOP.gds`). Solo el integrador del proyecto puede editarlos.
5. **Entregas vía Pull Request (PR):** Todo avance terminado y verificado (DRC y LVS Clean) se sube a tu rama personal desde PowerShell y se solicita su integración a `main` abriendo un **Pull Request** en GitHub para que el docente lo revise y apruebe (adjuntar fotos de los DRC/LVS clean)
6. **Modificaciones del TOP:** Si es necesario solicitar al integrador alguna modificacion a nivel top para que su subcelda pueda ser integrada sin problema, por ejemplo, metal de alimentacion muy cercano a otro y no pasa DRC.

---

## 💻 Fase 1: Instalación del Entorno (Solo la primera vez)

Abre **PowerShell como Administrador** y ejecuta el instalador interactivo oficial:

```powershell
powershell -c "irm [https://osic.tools/install.ps1](https://osic.tools/install.ps1) | iex"
```

**⚠️ MUY IMPORTANTE: Durante la instalación el script te hará 5 preguntas en consola. Respóndelas así:**
1. **Disclaimer:** Aceptar responsabilidad `[y/N]` -> Escribe **`y`** y presiona Enter.
2. **Container Engine:** *"Use Podman instead of Docker Desktop...?"* `[y/N]` -> Escribe **`y`** y presiona Enter (**Es obligatorio usar Podman**).
3. **Instalación de componentes:** Instalar Git, WSL2 y Podman `[y/N]` -> Escribe **`y`** en todos.
4. **Directorio de `iic-osic-tools`:** Dónde clonar el repositorio de arranque -> Presiona **Enter** para dejar la ruta por defecto (`C:\Users\TU_USUARIO\iic-osic-tools`). Recomendado dejarlo en default, si no hay espacio en ese disco y lo quieren en un secundario, haganlo sin problema.
5. **Reinicio:** Reiniciar Windows al finalizar `[y/N]` -> Escribe **`y`**.

---

## ⚙️ Fase 2: Inicializar Podman y Crear el Contenedor (Solo la primera vez, tras reiniciar)

Una vez que la PC reinicie, abre un **PowerShell normal** y sigue estos pasos para crear la máquina virtual y levantar por primera vez el contenedor `iic-osic-tools_xserver`:

```powershell
# 1. Inicializar y encender la máquina virtual de Podman
podman machine init
podman machine start

# 2. Ir a la carpeta donde se descargaron los scripts de arranque de IIC-OSIC-TOOLS Buscar lo que se hizo en la fase 1 paso 4
cd $env:USERPROFILE\iic-osic-tools

# 3. Ejecutar el script de modo gráfico X11/WSLg (descargará ~4 GB la primera vez)
.\start_x.bat
```
Al terminar, se abrirá automáticamente una **ventana de terminal de Linux** posicionada en `/foss/designs`. Además, este paso habrá creado tu contenedor persistente llamado **`iic-osic-tools_xserver`** y la carpeta `eda\designs` en tu usuario de Windows.

---

## 📥 Fase 3: Clonar el Proyecto e Inicializar el PDK (Desde PowerShell)

**⚠️ CRÍTICO:** El contenedor mapea tu carpeta local `eda\designs` de Windows directamente al directorio **`/foss/designs`** dentro de Linux. **El repositorio debe vivir obligatoriamente allí adentro.**

Abre **PowerShell en Windows**, desplázate a la carpeta mapeada, clona el repositorio e inicializa los submódulos del PDK:

```powershell
# 1. Ir a la carpeta compartida con el contenedor en Windows:
cd $env:USERPROFILE\eda\designs

# 2. Clonar el repositorio y entrar a la carpeta:
git clone [https://github.com/Lujham1/ASIC_UCC.git](https://github.com/Lujham1/ASIC_UCC.git)
cd ASIC_UCC

# 3. Descargar e inicializar el submódulo del PDK (Obligatorio):
git submodule update --init --recursive
```

---

## 🔄 Fase 4: Rutina de Trabajo Diaria

Cada vez que enciendas tu PC para trabajar en el diseño, sigue este flujo:

### 1. Sincronizar Git, colocarte en tu rama y levantar el contenedor (En PowerShell)
Abre **PowerShell en Windows** y ejecuta:

```powershell
# 1. Ir a la carpeta del proyecto
cd $env:USERPROFILE\eda\designs\ASIC_UCC

# 2. Traer los últimos cambios aprobados en main
git switch main
git pull origin main

# 3. Asegurar que el submódulo del PDK esté actualizado
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
En la **terminal de Linux** que se acaba de abrir, entra al repositorio, verifica que el PDK activo sea **IHP SG13G2** y lanza las herramientas:

```bash
cd /foss/designs/ASIC_UCC

# Asegurar que el entorno apunte al PDK IHP SG13G2
sak-pdk ihp-sg13g2

# Para abrir XSchem (entra primero a la carpeta xschem de tu enfoque):
cd /foss/designs/ASIC_UCC/Enfoque_A/xschem
xschem &

# Para abrir KLayout en modo edición:
cd /foss/designs/ASIC_UCC/Enfoque_B/klayout
klayout -e ASIC_TOP.gds &
```

---

## 🔄 ¿Cómo actualizar el contenedor y las herramientas si sale una nueva versión?

Si durante el cursado se anuncia una actualización del contenedor principal, ejecuta en **PowerShell**:
```powershell
# 1. Eliminar el contenedor viejo (tus archivos en eda\designs NO se borran)
podman rm -f iic-osic-tools_xserver

# 2. Descargar la nueva imagen y recrear el contenedor
cd $env:USERPROFILE\iic-osic-tools
git pull
podman pull docker.io/hpretl/iic-osic-tools:latest
.\start_x.bat
```

---

## ✅ Fase 5: Validación y Entrega (Solicitud de Pull Request)

Recuerda que **nunca debes subir cambios a `main`** y que **todo el control de versiones se hace desde PowerShell**. Cuando termines tu bloque o quieras respaldar tu avance en la nube:

1. **Verificación Local:** Para entregas finales, tu bloque debe pasar **DRC Clean** y **LVS Clean**. Guarda capturas de pantalla de ambos reportes en verde.
2. **Subir tus cambios a TU rama desde PowerShell (Windows):**
   ```powershell
   cd $env:USERPROFILE\eda\designs\ASIC_UCC

   # Verifica siempre estar en tu rama feat/nombre_apellido (y NO en main)
   git branch

   # Agrega, guarda y sube tus cambios a tu rama remota
   git add .
   git commit -m "feat: layout finalizado del bloque X. DRC y LVS clean."
   git push -u origin feat/nombre_apellido
   ```
3. **Solicitar Pull Request (PR):**
   * Entra a [https://github.com/Lujham1/ASIC_UCC](https://github.com/Lujham1/ASIC_UCC) desde tu navegador.
   * Verás un cartel amarillo con tu rama recién subida (`feat/nombre_apellido`); haz clic en el botón verde **"Compare & pull request"**.
   * Asegúrate de que la flecha apunte desde tu rama (`compare: feat/nombre_apellido`) hacia `base: main`.
   * En la descripción, adjunta las capturas de pantalla de **DRC Clean**, **LVS Clean** y simulaciones relevantes.
   * Haz clic en **"Create pull request"** y avisa al docente para su revisión e integración a `main`.
