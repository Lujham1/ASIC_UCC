# Correcciones de layout — llaves_rc (Enfoque B, IHP SG13G2)

Se reconstruyó `Enfoque_B/klayout/llaves_rc.gds` con instancias PCell SG13_dev editables. El netlist manual preparado por el usuario se conservó y no se reexportó desde Xschem.

| Corrección del docente | Qué se cambió | Cómo se verificó |
|---|---|---|
| Dispositivos PCell editables | MN22–MN25 se generan como PCells `nmos` (5 µm / 0,34 µm); los apilados de vía son PCells `via_stack`; se guardó el contexto de layout. | Reapertura con la librería SG13_dev: 4 nmos, 2 cmim y 32 via_stack; parámetros se conservan. LVS flat estricto PASS. |
| C1: dos MIM de 5 pF en paralelo | Dos PCells `cmim`/`cap_cmim`, cada una con C=5p, w=l=57,67 µm y m=1. Se alineó el esquemático con el tamaño que genera SG13_dev; nota de ≈4,99 pF cada una (≈10 pF total). | LVS compara CC1 (m=2, w=l=57.67e-6) y termina PASS. |
| Sin anillo ni bloqueo de relleno | No hay guard ring, `NoFillerStack` ni capas de bloqueo sobre los MIM. | Inspección de estructura/PCELLs y DRC `--no_density`. |
| Contacto de bulk | Contacto PCell Activ→Metal1 2×1 junto a cada NMOS; ascenso por via_stack a Metal4 y unión al riel GND. Se separó el retorno de bulk del terminal de señal de MN24. | LVS flat estricto PASS; DRC `--no_density` sin errores. |
| TopMetal1 mínimo y simple | Un solo rectángulo ortogonal de TopMetal1 cubre y conecta las dos placas superiores MIM, con una subida a Metal3. | LVS reconoce C1 entre `c1_int` y `gnd`; DRC limpio. |
| Llaves agrupadas, contactos de poly y ruteo | MN22–MN25 agrupadas; gates salen a la izquierda con contacto PCell; rutas ortogonales, codos solapados, anchos de Metal2+ ≥0,20 µm y landings fusionados con las pistas. Se quitaron metales sueltos. | DRC `--no_density` limpio; LVS flat estricto PASS, sin puertos ignorados. |
| Puertos y lados de acceso | Nombres del esquemático preservados; selecciones y terminales de entrada salen por la izquierda; salidas y GND por la derecha. | `TOP_LVL_PINS=true` en LVS flat; PASS sin warnings ni errores. |
| Antena | Se usó el chequeo de antena del deck IHP sobre el GDS final, sin diodos. | Resultado incluido en la corrida final combinada. |
| Densidad/fill a nivel de celda | Se desactivaron reglas de densidad con `--no_density`; no se insertó `NoFillerStack`, para permitir fill en el top. | Corrida de DRC principal: PASS, cero violaciones no-fill. |

## Evidencia de verificación

- DRC IHP SG13G2 (`--no_density`): PASS, cero violaciones; resultados en `Enfoque_B/klayout/verification/rc_v3/review5_drc/`.
- LVS flat + `--top_lvl_pins`, sin `IGNORE_TOP_PORTS_MISMATCH`: PASS, warnings 0, errors 0; resultados en `Enfoque_B/klayout/verification/rc_v3/review5_lvs/`.
- Antena: PASS, cero violaciones; corrida combinada en `Enfoque_B/klayout/verification/rc_v3/review5_ant/`.


