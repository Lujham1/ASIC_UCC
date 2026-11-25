# ref_vbias: version con PCells editables

Esquema: `Enfoque_B/xschem/celdas/ref_vbias.sch`. PDK fijado: IHP SG13G2, commit `cb743f75aabc96e30450e9e53afc8d3c4867e5e2`.

## Componentes

| Instancia del esquema | PCell SG13_dev | W / L (um) | Conexiones |
|---|---|---|---|
| Mtop | pmos | 2 / 1 | S y cuerpo a vdd; G y D a vbias |
| Mbot | nmos | 0.15 / 2.2 | G a vdd; S y cuerpo a gnd; D a vbias |

Los MOS tienen un dedo, multiplicidad 1 y `guardRingType=none`. Se instancian las PCells originales, sin copiar sus figuras a celdas nuevas ni aplanarlas. El generador reabre el GDS y comprueba que las cuatro instancias siguen siendo PCells editables.

`ntap1` conecta el pozo N del PMOS a vdd y `ptap1` conecta el sustrato a gnd. Las dimensiones de los taps son 1.68 x 0.78 um y 2.94 x 0.78 um. NWell continuo une el PMOS al ntap.

El esquema del video es una llave de transmision, distinta de ref_vbias. Aqui se usa la misma biblioteca y el mismo metodo de construccion con PCells, pero los tamanos y conexiones son los del esquema de ref_vbias.

## Distribucion e interfaz propuestas

PMOS en (1.5,4.5), NMOS en (1.5,1.5), ntap en (1.5,7.2) y ptap en (1.5,0), en um. La colocacion se eligio para rutear ref_vbias, no porque la posicion de los simbolos del esquema obligue al layout.

Contorno propuesto: x=0..6, y=-0.1..8.5 um (6 x 8.6 um). Todo el ruteo es Metal1. Los contactos extendidos de compuerta usan GatPoly y Cont del PDK.

| Pin | Area de Metal1.pin (um) |
|---|---|
| vdd | x=0.5..1.1, y=7.44..7.74 |
| gnd | x=2.6..3.3, y=0.24..0.54 |
| vbias | x=5.3..5.9, y=3.75..4.05 |

Los nombres usan Metal1.text (8/25), las marcas de pin Metal1.pin (8/2), y el metal conductor Metal1.drawing (8/0). El integrador conectara el pin local vdd al dominio VVDD que indica el esquema del proyecto.

La distribucion, altura, pines y estrategia de aislamiento (taps locales o anillos a nivel superior) deben revisarse con Lauti para la integracion. La version anterior con anillos esta respaldada en `Enfoque_B/klayout/backups/ref_vbias_anillos/` y no se agrega al repo por el .gitignore existente.

## Abrir y revisar

```bash
cd /foss/designs/ASIC_UCC
source ./SOURCEME
klayout -e Enfoque_B/klayout/ref_vbias.gds &
```

Cerrar la pestana antigua sin guardar cambios si se estaba viendo la version anterior; abrir el archivo actualizado. Mostrar toda la jerarquia. Seleccionar la instancia pmos o nmos y abrir sus propiedades para ver parametros W, L y numero de dedos. Se necesita SG13_dev del PDK fijado cargada para editar las PCells. GDS conserva contexto de KLayout; otras herramientas pueden mostrar solo su geometria.

## Regeneracion y verificacion

El generador reemplaza solo el archivo de esta celda. Guardar una copia si se hicieron ajustes manuales antes de regenerar.

```bash
cd /foss/designs/ASIC_UCC
source ./SOURCEME
klayout -b -r Enfoque_B/klayout/ref_vbias_src/generate_ref_vbias.py
python3 Enfoque_B/klayout/ref_vbias_src/verify_final.py
python3 Enfoque_B/klayout/ref_vbias_src/render.py
```

LVS compara el GDS contra el netlist exportado directamente de Xschem con `lvs_netlist=1` y `top_is_subckt=1`. `--disable_tap_extraction` omite los taps como dispositivos extra, porque el esquema no los instancia. La conectividad de pozo, sustrato y cuerpo sigue verificandose; no se ignoran pines ni se agregan uniones implicitas.

DRC incluye reglas principales, extra, grilla, angulos, conectividad y antena. Densidad esta desactivada con `--no_density`; se debe resolver al integrar y rellenar el chip. Revisar `validacion.json` para el SHA256 y resultado exactos. Los reportes de cada corrida quedan en `verification/ref_vbias/`, ignorada por Git.

0.372 V y 2 uA son la referencia anotada en el esquema. Se conservaron sus dispositivos; esta entrega valida geometria y equivalencia, no una simulacion analogica de esos valores.
