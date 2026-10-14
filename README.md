# 🚀 Proyecto Integrador ASIC - UCC (Universidad Católica de Córdoba)

Este repositorio contiene el diseño colaborativo a nivel de circuito y layout físico de nuestro ASIC. El proyecto evalúa dos arquitecturas distintas (`Enfoque_A` y `Enfoque_B`) utilizando el nodo tecnológico **IHP SG13G2 (130nm)** y herramientas Open-Source EDA.

Para asegurar que todo el equipo trabaje con exactamente la misma versión del PDK y de las herramientas, utilizamos el contenedor **IIC-OSIC-TOOLS** corriendo sobre **Podman** en modo X-Server nativo (WSLg).

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
4. **Directorio de `iic-osic-tools`:** Dónde clonar el repositorio de arranque -> Presiona **Enter** para dejar la ruta por defecto (`C:\Users\TU_USUARIO\iic-osic-tools`).
5. **Reinicio:** Reiniciar Windows al finalizar `[y/N]` -> Escribe **`y`**.

---

## ⚙️ Fase 2: Inicializar Podman y Crear el Contenedor (Solo la primera vez, tras reiniciar)

Una vez que la PC reinicie, abre un **PowerShell normal** y sigue estos pasos para crear la máquina virtual y levantar por primera vez el contenedor `iic-osic-tools_xserver`:

```powershell
# 1. Inicializar y encender la máquina virtual de Podman
podman machine init
podman machine start

# 2. Ir a la carpeta donde se descargaron los scripts de arranque de IIC-OSIC-TOOLS
cd $env:USERPROFILE\iic-osic-tools

# 3. Ejecutar el script de modo gráfico X11/WSLg (descargará ~4 GB la primera vez)
.\start_x.bat
```
Al terminar, se abrirá automáticamente una **ventana de terminal de Linux** posicionada en `/foss/designs`. Además, este paso habrá creado tu contenedor persistente llamado **`iic-osic-tools_xserver`** y la carpeta `eda\designs` en tu usuario de Windows.

---

## 📥 Fase 3: Clonar el Proyecto en `/foss/designs`

**⚠️ CRÍTICO:** El contenedor mapea tu carpeta local `eda\designs` de Windows directamente al directorio **`/foss/designs`** dentro de Linux. **El repositorio debe vivir obligatoriamente allí adentro.**

Puedes clonarlo directamente desde la **terminal de Linux (`/foss/designs`)** que te abrió el contenedor (o desde PowerShell en `$env:USERPROFILE\eda\designs`):

```bash
# Dentro de la terminal de Linux (en /foss/designs):
git clone [https://github.com/Lujham1/ASIC_UCC.git](https://github.com/Lujham1/ASIC_UCC.git)
cd ASIC_UCC
```

---

## 🔄 Fase 4: Rutina de Trabajo Diaria (Cómo abrir las terminales y herramientas)

Cada vez que enciendas tu PC para trabajar en el diseño, sigue este flujo:

### 1. Levantar el entorno desde PowerShell (Windows)
Abre PowerShell y ejecuta:
```powershell
podman machine start
podman start iic-osic-tools_xserver
```
*(En unos segundos se abrirá en tu pantalla la **terminal de Linux** directamente en `/foss/designs`).*

### 2. Sincronizar Git y crear tu rama de trabajo
En la terminal de Linux que se abrió, entra al proyecto y asegúrate de tener los últimos cambios antes de trabajar (nunca trabajes sobre `main`):
```bash
cd /foss/designs/ASIC_UCC

# 1. Traer los últimos cambios aprobados
git switch main
git pull origin main

# 2. Crear o cambiar a tu rama asignada
git switch -c feat/enfoqueA-bandgap
```

### 3. Verificar el PDK y lanzar XSchem / KLayout
Desde la **terminal de Linux** (`/foss/designs/ASIC_UCC`), verifica que el PDK activo sea **IHP SG13G2** y lanza las herramientas:

```bash
# Asegurar que el entorno apunte al PDK IHP SG13G2
sak-pdk ihp-sg13g2

# Para abrir XSchem (entra primero a la carpeta xschem de tu enfoque):
cd /foss/designs/ASIC_UCC/Enfoque_A/xschem
xschem &

# Para abrir KLayout en modo edición:
cd /foss/designs/ASIC_UCC/Enfoque_B/klayout
klayout -e ASIC_TOP.gds &
```
**⚠️ REGLA ESTRICTA:** Tienes prohibido modificar los archivos de integración superior (`ASIC_TOP.sch` o `ASIC_TOP.gds`). Solo el integrador del proyecto puede editarlos.

---

## 🔄 ¿Cómo actualizar el PDK y las herramientas si sale una nueva versión?

Si durante el cursado se anuncia una actualización del contenedor o del PDK `ihp-sg13g2`, ejecuta en PowerShell:
```powershell
# 1. Eliminar el contenedor viejo (tus archivos en /foss/designs NO se borran)
podman rm -f iic-osic-tools_xserver

# 2. Descargar la nueva imagen y recrear el contenedor
cd $env:USERPROFILE\iic-osic-tools
git pull
podman pull docker.io/hpretl/iic-osic-tools:latest
.\start_x.bat
```

---

## ✅ Fase 5: Validación y Entrega (Pull Request)

1. **Verificación Local:** Tu bloque debe pasar **DRC Clean** y **LVS Clean**. Guarda capturas de pantalla de los reportes en verde.
2. **Subir tus cambios a GitHub:**
   ```bash
   git add .
   git commit -m "feat: layout finalizado del bloque X. DRC y LVS clean."
   git push -u origin feat/tu-rama
   ```
3. **Abrir Pull Request:** Entra al repositorio en GitHub, haz clic en **"Compare & pull request"**, completa la lista de verificación adjuntando las capturas de DRC/LVS y solicita la revisión.
