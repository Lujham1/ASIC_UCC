# ref_vbias — revision de layout

Revision del layout entregado en el commit `6f585f0`, segun la devolucion de Lauti.

## Circuito conservado

| Instancia | PCell SG13_dev | W / L (um) | Conexion |
|---|---|---|---|
| Mtop | pmos | 2 / 1 | Fuente y cuerpo a vdd; gate y drain a vbias |
| Mbot | nmos | 0.15 / 2.2 | Gate a vdd; fuente y cuerpo a gnd; drain a vbias |

Un dedo y multiplicidad 1 en ambos MOS. PCells editables, tecnologia sg13g2 y PDK del repositorio en `cb743f75aabc96e30450e9e53afc8d3c4867e5e2`.

Se conserva el nombre local `vdd` del esquema. La conexion al dominio de alimentacion del circuito, incluida VVDD, corresponde al integrador. Los valores 0.372 V / 2 uA son la anotacion del esquema; esta revision no incluye nuevas simulaciones analogicas.

## Correcciones aplicadas

- `ntap1` y `ptap1` reemplazados por via_stack Activ -> Metal1. Los dos arrays son de 9 x 1 contactos: Activ de 3.02 x 0.30 um, similar al ancho fisico maximo de los dispositivos (2.94 um).
- Contacto de cuerpo del PMOS dentro del NWell continuo; contacto de sustrato del NMOS encerrado en pSD, sobre el sustrato P.
- Accesos a gates y cambios entre metales con via_stack originales del PDK. No hay cortes Cont/Via dibujados directamente en la celda superior. Los contactos internos que ya traen las PCells MOS siguen intactos.
- Metal1 reservado a tres conexiones internas rectas entre dispositivos y contactos; sin los recorridos con vueltas de la version anterior.
- Metal2 horizontal para unir el PMOS en diodo con vbias; Metal3 vertical para unir el gate del NMOS directamente con VDD.
- Dos via_stack Metal1 -> TopMetal2 sobre las barras de alimentacion, para que el integrador acceda desde la Power Grid. Los stacks incluyen todos los metales intermedios. Sus areas de aterrizaje no son pistas de ruteo ni la Power Grid del chip.
- Conductores de refuerzo donde se requieren por area minima. Son parches de metal; los contactos y vias pertenecen siempre a PCells via_stack.
- Contactos de gate acercados a ambos transistores: la distancia entre el corte Cont sobre GatPoly y el Activ del canal es 0.14 um, minimo de la regla Cnt.e. El acceso marcado del NMOS se acerco 0.355 um; el del PMOS, 0.280 um respecto de su Activ.
- Se compacto tambien la separacion entre los dispositivos y las barras de alimentacion. Se respetan 0.18 um entre polys independientes, 0.30 um desde pSD al gate efectivo del NMOS y 2.00 um entre los accesos de TopMetal2 de VDD/GND. Las dimensiones electricas W/L y las conexiones no cambian.

## Contorno e interfaz propuestos

Boundary: x=0.25..3.90, y=-0.455..5.685 um. Dimensiones 3.65 x 6.14 um, area 22.411 um2. Es aproximadamente 17.6 % menor que la revision local previa (27.1925 um2) y 56.6 % menor que los 51.6 um2 del primer layout.

| Pin | Capa | Rectangulo accesible (um) |
|---|---|---|
| vdd | TopMetal2 | x=1.07..3.07; y=3.595..5.595 |
| gnd | TopMetal2 | x=1.07..3.07; y=-0.405..1.595 |
| vbias | Metal2 | x=3.60..3.90; y=1.635..1.835 |

Cada pin tiene marca en la capa .pin y etiqueta de igual nombre en .text. Los accesos de VDD y GND estan alineados en x=2.07 um.

La posicion definitiva de los accesos de Power Grid requiere revision de Lauti. El boundary no constituye una declaracion de que dos copias puedan encastrarse sin ajustes: no se hizo una verificacion de adyacencia. No se modifico ASIC_TOP ni la version del PDK.

## Comprobaciones

Consultar `validacion.json` para el SHA256 exacto del GDS y los resultados:

- DRC con el PDK fijado, modo Flat, sin densidad ni antena, segun el procedimiento de los videos. Incluye reglas principales y extra.
- LVS contra el netlist exportado directamente del esquematico original con Xschem; top `ref_vbias`, pines `vbias`, `vdd`, `gnd`. Se omite la extraccion de taps como dispositivos adicionales; las conexiones de cuerpos siguen comprobadas. No se usan uniones implicitas ni se ignoran diferencias de pines.
- `bash scripts/setup.sh --check` paso sin errores durante esta revision.

Los reportes completos de esta compactacion estan dentro de `Enfoque_B/klayout/verification/ref_vbias/revision_20261128/compactacion_2/20261128T211522Z/`, carpeta ignorada por Git. DRC: 0 violaciones. LVS: netlists coincidentes. Las verificaciones de antena/densidad a nivel chip y la integracion quedan pendientes.

## Abrir

```bash
cd /foss/designs/ASIC_UCC
source ./SOURCEME
klayout -e Enfoque_B/klayout/ref_vbias.gds &
```

Mostrar toda la jerarquia para ver las PCells. `vista_previa.png` muestra todas las capas; `vista_ruteo.png` oculta Metal4 y superiores para poder seguir las conexiones de los MOS. Ambas son vistas del mismo GDS; no son capturas del navegador de resultados DRC/LVS.

La entrega contiene layout, vistas y documentacion. Los auxiliares de generacion y comprobacion se conservaron localmente fuera de la entrega. Su retirada se hace como un cambio normal; la version anterior sigue disponible en el historial de Git.
