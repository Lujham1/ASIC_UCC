"""Compact ref_vbias using editable SG13_dev PCells, as in the tutorial.

Run with the pinned SOURCEME environment using KLayout -zz -r.
The output replaces this cell only. Interface is proposed for integration review.
"""
import os
import json
import pya
import sys

root=os.environ.get('ASIC_UCC_ROOT','/foss/designs/ASIC_UCC')
out=root+'/Enfoque_B/klayout'
name=os.environ.get('REF_VBIAS_GDS_NAME','ref_vbias.gds')
# Explicit bootstrap also supports KLayout -b without its GUI autorun macros.
pdk_klayout=root+'/pdk/ihp-sg13g2/ihp-sg13g2/libs.tech/klayout'
sys.path.append(pdk_klayout+'/python')
sys.path.append(pdk_klayout+'/python/pycell4klayout-api/source/python')
import sg13g2_pycell_lib
ly=pya.Layout()
ly.dbu=.001
ly.technology_name='sg13g2'
top=ly.create_cell('ref_vbias')
manifest=[]

def device(kind,params,x,y):
    cell=ly.create_cell(kind,'SG13_dev',params)
    if cell is None: raise RuntimeError('Cannot create SG13_dev '+kind)
    top.insert(pya.DCellInstArray(cell.cell_index(),pya.DTrans(pya.DVector(x,y))))
    manifest.append({'pcell':kind,'parameters':cell.pcell_parameters_by_name(),'origin_um':[x,y]})

device('pmos',{'w':'2u','ws':'2u','l':'1u','ng':1,'guardRingType':'none'},1.5,4.5)
device('nmos',{'w':'0.15u','ws':'0.15u','l':'2.2u','ng':1,'guardRingType':'none'},1.5,1.5)
device('ntap1',{'w':'1.68u','l':'0.78u'},1.5,7.2)
device('ptap1',{'w':'2.94u','l':'0.78u'},1.5,0)

def box(n,a,b,c,d,dt=0):
    top.shapes(ly.layer(n,dt)).insert(pya.DBox(a,b,c,d))

def wire(points,w=.30):
    top.shapes(ly.layer(8,0)).insert(pya.DPath([pya.DPoint(*p) for p in points],w,w/2,w/2))

def gate_contact(x,y):
    box(5,x-.15,y-.15,x+.15,y+.15)
    box(6,x-.08,y-.08,x+.08,y+.08)
    box(8,x-.15,y-.15,x+.15,y+.15)

# Continuous PMOS NWell, joining the ntap at the top. Body is vdd.
box(31,1.19,4.19,3.49,8.29)

# PMOS diode: gate and drain connect to vbias.
box(5,2.19,3.75,2.49,4.55)
gate_contact(2.34,3.9)
wire([(2.34,3.9),(3.03,3.9),(3.03,5.5)])

# Nmos gate at vdd, extended upward for the poly-to-M1 contact.
box(5,2.82,1.7,3.12,2.5)
gate_contact(2.97,2.35)

# Left M1 supply spine: PMOS source + ntap + NMOS gate.
wire([(2.97,2.35),(.65,2.35),(.65,7.59),(2.34,7.59)])
wire([(1.65,5.5),(.65,5.5)])

# Right M1 bias spine: both drains + PMOS gate; output on right.
wire([(3.03,5.5),(5.2,5.5),(5.2,1.65),(4.29,1.65)])
wire([(5.2,3.9),(5.8,3.9)])

# Bottom substrate tap and NMOS source at gnd.
wire([(1.65,1.65),(1.65,.39),(2.97,.39)])

def pin(net,x1,y1,x2,y2):
    box(8,x1,y1,x2,y2,2)
    text=pya.DText(net,pya.DTrans(pya.DVector((x1+x2)/2,(y1+y2)/2)))
    text.size=.22
    top.shapes(ly.layer(8,25)).insert(text)

pin('vdd',.5,7.44,1.1,7.74)
pin('gnd',2.6,.24,3.3,.54)
pin('vbias',5.3,3.75,5.9,4.05)
# Non-manufacturing annotation of a proposed cell envelope.
box(189,0,-.1,6,8.5,4)

options=pya.SaveLayoutOptions()
options.write_context_info=True
options.add_cell(top.cell_index())
ly.write(out+'/'+name,options)

# Reopen while SG13_dev is loaded to ensure parameters survived GDS export.
check=pya.Layout()
check.technology_name='sg13g2'
check.read(out+'/'+name)
instances=[]
for inst in check.cell('ref_vbias').each_inst():
    c=inst.cell
    params=c.pcell_parameters_by_name() if c.is_pcell_variant() else {}
    instances.append({'cell':c.name,'editable_pcell':c.is_pcell_variant(),'parameters':params})
if len(instances)!=4 or not all(i['editable_pcell'] for i in instances):
    raise RuntimeError('PCell context was not preserved: '+str(instances))

meta={'top':'ref_vbias','bbox_um':str(top.dbbox()),'proposed_size_um':[6,8.6],
      'pcells':manifest,'reopened_instances':instances,'routing':'Metal1',
      'note':'Tutorial-style contacted wells/substrate, no optional enclosing guard rings; integrator review still required.'}
os.makedirs(out+'/verification/ref_vbias',exist_ok=True)
with open(out+'/verification/ref_vbias/compact_geometry.json','w') as f:
    json.dump(meta,f,indent=2)
print('Generated editable compact layout: '+out+'/'+name,flush=True)
print(json.dumps(instances,indent=2),flush=True)
