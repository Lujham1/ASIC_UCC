"""Export Xschem netlist and check static GDS with pinned PDK. No Git commands.
Density is a top-level integration check; antenna and extra rules stay enabled.
"""
import concurrent.futures
import datetime
import hashlib
import json
import os
import pathlib
import subprocess
import xml.etree.ElementTree as ET

root=pathlib.Path(os.environ.get('ASIC_UCC_ROOT','/foss/designs/ASIC_UCC'))
base=root/'Enfoque_B/klayout'
layout=base/os.environ.get('REF_VBIAS_LAYOUT','ref_vbias.gds')
stamp=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%SZ')
checks=base/'verification/ref_vbias'/stamp
checks.mkdir(parents=True,exist_ok=False)
pdk=root/'pdk/ihp-sg13g2/ihp-sg13g2/libs.tech/klayout/tech'
exporter=pathlib.Path(__file__).with_name('export_ref.tcl')
env=os.environ.copy()
env['REF_VBIAS_CHECK_DIR']=str(checks)
export_cmd=['xschem','-n','-q','-x','--script',str(exporter),'celdas/ref_vbias.sch']
with open(checks/'xschem.log','w') as log:
    subprocess.run(export_cmd,cwd=root/'Enfoque_B/xschem',env=env,
                   stdout=log,stderr=subprocess.STDOUT,check=True)
if not (checks/'ref_vbias.spice').is_file():
    raise RuntimeError('Xschem did not export the reference netlist')
jobs={
    'drc': ['python3',str(pdk/'drc/run_drc.py'),'--path='+str(layout),
            '--topcell=ref_vbias','--run_dir='+str(checks/'drc'),'--no_density','--antenna'],
    'lvs': ['python3',str(pdk/'lvs/run_lvs.py'),'--layout='+str(layout),
            '--netlist='+str(checks/'ref_vbias.spice'),'--topcell=ref_vbias',
            '--run_dir='+str(checks/'lvs'),'--disable_tap_extraction'],
}
def run(pair):
    name,cmd=pair
    with open(checks/(name+'_console.log'),'w') as log:
        proc=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT)
    print(name+' returncode='+str(proc.returncode),flush=True)
    return name,proc.returncode
with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
    codes=dict(pool.map(run,jobs.items()))
reports=list((checks/'drc').glob('*full.lyrdb'))
if len(reports)!=1: raise RuntimeError('Missing or ambiguous DRC database')
errors=len(ET.parse(reports[0]).findall('.//items/item'))
lvs_log=(checks/'lvs'/(layout.stem+'.log')).read_text()
matched='Congratulations! Netlists match.' in lvs_log
summary={
    'layout':str(layout.relative_to(root)),
    'layout_sha256':hashlib.sha256(layout.read_bytes()).hexdigest(),
    'pdk_commit':'cb743f75aabc96e30450e9e53afc8d3c4867e5e2',
    'reference':'Enfoque_B/xschem/celdas/ref_vbias.sch (exported with Xschem)',
    'drc':{'status':'PASS' if codes['drc']==0 and errors==0 else 'FAIL',
           'violations':errors,'antenna':True,'extra_rules':True,'density':False},
    'lvs':{'status':'PASS' if matched and codes['lvs']==0 else 'FAIL',
           'tap_devices_extracted':False,'reason':'Taps are body contacts absent from schematic; well/substrate connectivity remains extracted.'},
    'run_dir':str(checks.relative_to(root)),
    'integration':'Proposed compact interface; final pin placement, guard strategy and top-level density require integrator review.',
    'electrical':'Same devices and connectivity as schematic; no claim of simulated 0.372 V / 2 uA.'
}
(checks/'summary.json').write_text(json.dumps(summary,indent=2))
(base/'verification/ref_vbias/latest.txt').write_text(str(checks)+'\n')
print(json.dumps(summary,indent=2),flush=True)
if summary['drc']['status']!='PASS' or summary['lvs']['status']!='PASS':
    raise SystemExit(1)
