# Versión del PDK IHP SG13G2

El PDK vive en `pdk/ihp-sg13g2` como **submódulo de Git**, apuntando a la rama
**`dev`** del repositorio oficial
[IHP-GmbH/IHP-Open-PDK](https://github.com/IHP-GmbH/IHP-Open-PDK).

Un submódulo guarda un **commit exacto**, no "lo último de la rama". Por eso,
cuando un alumno hace `git pull` + `git submodule update --init --recursive`
(o solo `git pull` si configuró `submodule.recurse true`), obtiene **siempre el
mismo commit** que eligió el integrador, aunque IHP siga subiendo cambios a `dev`.

## Versión fijada actualmente

| Campo | Valor |
|---|---|
| Repositorio | `https://github.com/IHP-GmbH/IHP-Open-PDK.git` |
| Rama seguida | `dev` |
| Commit fijado | `cb743f75aabc96e30450e9e53afc8d3c4867e5e2` |
| Fecha del commit | 2026-10-23 (merge PR #1289 "PyCell for Klayout") |
| Herramientas mínimas declaradas por el PDK (`versions.txt`) | KLayout 0.30.5 · ngspice 43 · xschem 3.4.8RC · magic 8.3.589 · openvaf 23.5.0 |

¿Por qué `dev` y no `main`? En IHP-Open-PDK la rama `main` se actualiza poco
(último merge: 2026-09-01) y el tag más reciente (`v0.3.0`) es de marzo 2026,
con más de 1100 commits de diferencia. Las correcciones de DRC/LVS, modelos y
PCells que se usan en los tapeouts están en `dev`, y el contenedor
IIC-OSIC-TOOLS también construye su PDK desde `dev`.

> **Antes de un tapeout:** las reglas que valen son las del *precheck* de la
> corrida (shuttle) en la que se envía el diseño. El integrador debe actualizar
> el commit fijado al que indique esa corrida (o al último de `dev`), volver a
> correr DRC/LVS sobre el TOP y recién ahí enviar.

## Cómo verifica cada alumno su versión

En la terminal Linux del contenedor:

```bash
cd /foss/designs/ASIC_UCC
bash scripts/setup.sh --check
```

## Cómo actualizar el PDK (solo el integrador)

Desde **PowerShell**, en una rama propia (nunca directo en `main`):

```powershell
cd $env:USERPROFILE\eda\designs\ASIC_UCC
git switch main
git pull
git switch -c chore/pdk-update

# Traer la rama dev de IHP y elegir el commit
git -C pdk/ihp-sg13g2 fetch origin dev
git -C pdk/ihp-sg13g2 log --oneline -10 origin/dev     # revisar qué cambió
git -C pdk/ihp-sg13g2 checkout <COMMIT_ELEGIDO>          # o: origin/dev
git -C pdk/ihp-sg13g2 submodule update --init --recursive

# Registrar el nuevo commit en el repo
git add pdk/ihp-sg13g2
git commit -m "chore(pdk): fijar IHP-Open-PDK dev en <commit corto>"
git push -u origin chore/pdk-update
```

Después:

1. Actualizar la tabla de esta página.
2. Abrir el Pull Request; la verificación automática comprueba que el commit
   pertenezca a la rama `dev` oficial.
3. En el contenedor: `bash scripts/setup.sh` (recompila los modelos OSDI para el
   commit nuevo) y correr DRC/LVS del TOP antes de aprobar.
4. Avisar a los alumnos que hagan `git pull` (con `submodule.recurse` activado
   se actualiza solo) y luego `bash scripts/setup.sh` en el contenedor.
