# Correcciones de layout — `llaves_gmt2` (Enfoque B, IHP SG13G2)

**Estado: VERIFICADA el 25-11-2026.** DRC, antena y LVS estricto pasan. No se hizo commit ni push.

| Corrección del docente | Qué se cambió | Cómo se verificó |
|---|---|---|
| PCells SG13_dev, MOS de 0,15/0,13 µm | Se conservaron los PCells nmos, pmos y via_stack; dimensiones `w=0.15u`, `l=0.13u`; no se editaron matrices de PCell. | `build` regeneró `llaves_gmt2.gds`; LVS extrae los seis MOS con L=0,13 µm y W=0,15 µm. |
| Sin anillos; bulk conectado a rieles | Sin guard rings. Los taps NMOS van a VSS y los PMOS a VDD con via_stack y pistas de Metal4/Metal2, sin formar anillos. | LVS estricto: bulk NMOS=`gnd`, bulk PMOS=`vdd`; DRC deep y flat limpios. |
| PMOS arriba, NMOS abajo; señales por el mismo lado | Se conserva la disposición PMOS arriba/NMOS abajo y los seis accesos de control hacia el borde izquierdo. `sel2` usa un puente corto en M5 para cruzar el bus de `vbias` en M4. | Vista final del layout; LVS estricto reconoce `sel0`, `sel1`, `sel2`, `u`, `t`, `v`. |
| Ruteo ortogonal, anchos mínimos y no subir de metal más de lo necesario | Las rutas son ortogonales; `sel2` sube sólo en un puente M5 corto para cruzar `vbias` en M4. Los taps NMOS usan M4. Se eliminaron rellenos de ranuras que tocaban redes distintas. Sólo se cerraron dos uniones de misma red: salida `s_mpmos` en M3 y el codo de `g_mt2` en M2. | DRC deep y flat, ambos con `--no_density --antenna`, sin violaciones. |
| Seis pads M1 de gate bajo área mínima | En cada acceso GatPoly→Metal3 se añadió un parche M1 de 0,30×0,32 µm (0,096 µm²) fusionado al landing. Los seis parches mantienen separación al menos 0,21 µm respecto de source/drain vecino. Las matrices de todos los PCells quedan intactas. | DRC deep y flat: 0 violaciones M1; LVS estricto confirma conexión de las seis compuertas. |
| Antena resuelta con jumpers a Metal3, sin diodos | Los seis accesos mantienen el salto desde GatPoly a Metal3; `sel2` añade un puente localizado en M5 para evitar el bus M4 de `vbias`. No se agregaron diodos de antena. | Antena habilitada en DRC deep y flat; ambos chequeos reportan cero violaciones. |
| Codo de M5 ancho y solapado | Se conserva el codo de `s_mtr1` formado por rectángulos de ancho 0,24 µm con solape completo. | DRC deep y flat: 0 violaciones M5. |
| NoFillerStack ni capas de bloqueo | No se agregaron NoFillerStack ni capas de bloqueo. | Inspección del generador y DRC deep/flat. |

## Resultados guardados

- **DRC deep** `--no_density --antenna`: PASS, 0 violaciones — `Enfoque_B/klayout/verification/gmt2_v3/drc_sixtieth/`.
- **DRC flat** `--no_density --antenna`: PASS, 0 violaciones — `Enfoque_B/klayout/verification/gmt2_v3/drc_sixty-first/`.
- **LVS estricto flat**, con `--top_lvl_pins` y sin ignorar discrepancias de puertos: PASS, 0 errores, 0 warnings — `Enfoque_B/klayout/verification/gmt2_v3/lvs_tenth/`. El netlist extraído coincide con los seis MOS del netlist de referencia.
- Generador final para el commit: `Enfoque_B/klayout/scripts/rebuild_gmt2.py`.
- Capturas: `Capturas_layout_24-11-2026/GMT2_layout.png`, `GMT2_DRC_OK.png` y `GMT2_LVS_OK.png`.

La celda `llaves_rc` no se tocó. No hay commit ni push pendiente de esta tarea.
