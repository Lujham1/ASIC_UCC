# 🚀 Proyecto Integrador ASIC - UCC (Universidad Católica de Córdoba)

Este repositorio contiene el diseño colaborativo a nivel de circuito y layout físico de nuestro ASIC. El proyecto evalúa dos arquitecturas distintas (`Enfoque_A` y `Enfoque_B`) utilizando el nodo tecnológico **IHP SG13G2 (130nm)** y herramientas Open-Source EDA.

Para asegurar que todo el equipo trabaje con las mismas versiones de software y reglas de diseño (PDK), utilizamos el entorno virtualizado unificado de **OSIC Tools** basado en contenedores.

---

## 💻 Fase 1: Instalación del Entorno (Solo la primera vez)

No necesitas configurar contenedores ni variables de entorno manualmente. Abre tu terminal y ejecuta el comando correspondiente a tu sistema operativo para instalar las herramientas y el PDK de IHP.

### Instalación en Windows
Abre **PowerShell como Administrador** y ejecuta:
```powershell
powershell -c "irm https://osic.tools/install.ps1 | iex"
```

**⚠️ MUY IMPORTANTE: Durante la instalación en Windows, el script te hará varias preguntas. Respóndelas así:**
1. **Disclaimer:** Te pedirá aceptar responsabilidad `[y/N]`. Escribe `y` y presiona Enter.
2. **Container Engine (Motor de contenedores):** Te preguntará *"Use Podman instead of Docker Desktop...?"* `[y/N]`. Escribe `y` y presiona Enter. **Es obligatorio usar Podman**.
3. **Instalaciones individuales:** Te preguntará si quieres instalar Git, WSL2 y Podman. A todo dile que sí (`y`). 
4. **Directorio del repositorio:** Te preguntará dónde clonar `iic-osic-tools`. Presiona **Enter** para dejar la ruta por defecto (generalmente tu carpeta de usuario).
5. **Reinicio:** Al final te sugerirá reiniciar la PC (`y/N`). Escribe `y`. La computadora se reiniciará en 60 segundos. (Si instalaste WSL2 por primera vez, este paso es crítico).

*(Si después de reiniciar algo no funciona, vuelve a abrir PowerShell como Administrador y ejecuta el mismo comando de nuevo. El script es inteligente y solo instalará lo que falte).*

---

### Instalación en Linux
Abre tu terminal y ejecuta:
```bash
curl -fsSL https://osic.tools/install.sh | bash
```

---

## 📥 Fase 2: Clonar el Proyecto

Una vez que la instalación del entorno haya finalizado y tu PC haya reiniciado, descarga el repositorio oficial de la universidad en tu computadora (abre un PowerShell normal, no hace falta que sea Administrador):

```powershell
git clone https://github.com/Lujham1/ASIC_UCC.git
cd ASIC_UCC
```

---

## 🔄 Fase 3: Rutina de Trabajo Diaria

Nunca trabajes directamente en la rama `main` para evitar conflictos con el código de tus compañeros. Sigue siempre esta secuencia:

### 1. Sincronizar y aislar tu tarea
```powershell
# 1. Trae los últimos cambios aprobados por el integrador
git switch main
git pull origin main

# 2. Crea tu propia rama para la tarea asignada (Ej: ruteo del bandgap)
git switch -c feat/enfoqueA-bandgap
```

### 2. Iniciar las herramientas EDA
Abre tu terminal **dentro de la carpeta del proyecto** (`ASIC_UCC`) e inicia el entorno con el comando rápido:
```powershell
osic
```
*(Esto abrirá automáticamente tu navegador en `http://localhost:8590` con KLayout y XSchem listos para usar, y tu carpeta local vinculada al directorio `/foss/designs`).*

### 3. Diseñar
Navega a `/foss/designs` dentro del entorno virtual y trabaja exclusivamente en tu carpeta del `Enfoque_A` o `Enfoque_B` según la asignación. 
**⚠️ REGLA ESTRICTA:** Tienes prohibido modificar los archivos de nivel superior (`ASIC_TOP.sch` o `ASIC_TOP.gds`). Solo el integrador del proyecto está autorizado a editarlos.

---

## ✅ Fase 4: Validación y Entrega (Pull Request)

Tu bloque solo será integrado al chip final si cumple con los estándares de fabricación.

1. **Verificación Local:** Tu diseño debe pasar el DRC (sin errores geométricos) y el LVS (el layout coincide con el esquemático). Toma capturas de pantalla de los reportes de verificación en verde.
2. **Guardar en Git:**
   ```powershell
   git add .
   git commit -m "feat: layout finalizado del bloque Bandgap. DRC y LVS clean."
   ```
3. **Subir a GitHub:**
   ```powershell
   git push -u origin feat/enfoqueA-bandgap
   ```
4. **Solicitar Integración:**
   Ve a la página del repositorio en GitHub. Haz clic en el botón verde **"Compare & pull request"**. Completa el checklist de validación automático, adjunta tus capturas de pantalla y espera la revisión del integrador.
