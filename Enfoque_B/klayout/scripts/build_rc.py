"""Rebuild llaves_rc with editable SG13_dev PCells and explicit orthogonal routing."""
import os, sys, math, pya
PDK_KLAYOUT=os.path.join(os.environ['PDK_ROOT'],os.environ['PDK'],'libs.tech','klayout')
sys.path.insert(0,os.path.join(PDK_KLAYOUT,'python'))
sys.path.insert(0,os.path.join(PDK_KLAYOUT,'python','pycell4klayout-api','source','python'))
import sg13g2_pycell_lib
DBU=0.001
OUT='/foss/designs/ASIC_UCC/Enfoque_B/klayout/llaves_rc.gds'
def u(v): return int(round(v/DBU))
def layer(ly,n,d=0): return ly.layer(pya.LayerInfo(n,d))
def box(top,li,x1,y1,x2,y2): top.shapes(li).insert(pya.Box(u(x1),u(y1),u(x2),u(y2)))
def path(top,li,pts,w=0.20): top.shapes(li).insert(pya.Path([pya.Point(u(x),u(y)) for x,y in pts],u(w)))
def label(top,li,name,x,y): top.shapes(li).insert(pya.Text(name,pya.Trans(pya.Trans.R0,u(x),u(y))))
def pcell(ly,top,name,params,x,y):
 c=ly.create_cell(name,'SG13_dev',params)
 if c is None or c.is_empty() or not c.is_pcell_variant(): raise RuntimeError('bad PCell %s %r'%(name,params))
 top.insert(pya.CellInstArray(c.cell_index(),pya.Trans(pya.Trans.R0,u(x),u(y))))
 return c
def via(ly,top,b,t,x,y,cols=1,rows=1):
 return pcell(ly,top,'via_stack',{'b_layer':b,'t_layer':t,'vn_columns':cols,'vn_rows':rows,'vt1_columns':1,'vt1_rows':1,'vt2_columns':1,'vt2_rows':1},x,y)
ly=pya.Layout(); ly.dbu=DBU; ly.technology_name='sg13g2'; top=ly.create_cell('llaves_rc')
M1=layer(ly,8); M2=layer(ly,10); M3=layer(ly,30); M4=layer(ly,50); M5=layer(ly,67); TM1=layer(ly,126); POLY=layer(ly,5); PSD=layer(ly,14); M2TEXT=layer(ly,10,25); M2PIN=layer(ly,10,2)
mos={'w':'5u','l':'0.34u','ng':1,'m':'1','model':'sg13_lv_nmos','guardRingType':'none'}
# One cmim PCell with m=2 preserves the schematic multiplicity.  C=5p is
# supplied explicitly so the PCell callback calculates the 57.68um square.
cap={'Calculate':'w&l','C':'5p','w':'57.67u','l':'57.67u','m':2,'model':'cap_cmim','guardRingType':'none'}
# Compact aligned switch bank; each device's source is the left M1 rail,
# drain the right M1 rail, and gate is the center GatPoly stripe.
devices=[
 ('MN22',5.0,12.0,'sel3','rref_ext','s_m0'),
 ('MN23',5.0,19.0,'sel4','rsens_ext','s_m0'),
 ('MN24',5.0,26.0,'sel5','c1_int','s_m1'),
 ('MN25',5.0,33.0,'sel6','csens_ext','s_m1'),
]
for name,x,y,g,s,d in devices: pcell(ly,top,'nmos',mos,x,y)
capx,capy=42.0,8.5; cap2x=102.0
cap1=pcell(ly,top,'cmim',dict(cap,m=1),capx,capy)
cap2=pcell(ly,top,'cmim',dict(cap,m=1),cap2x,capy)
print('CMIM_VARIANTS',cap1.pcell_parameters_by_name(),cap2.pcell_parameters_by_name())
# Gate access: continue the PCell's poly gate beyond the active edge, then
# use an Activ-independent GatPoly->M2 PCell stack for a clean contact.
gate_points={}
for name,x,y,g,s,d in devices:
 gx=x+0.51; gy=y-0.70
 box(top,POLY,gx-0.17,gy-0.25,gx+0.17,y-0.10)
 via(ly,top,'GatPoly','Metal2',gx,gy)
 box(top,M1,gx-0.21,gy-0.21,gx+0.21,gy+0.21)
 box(top,M2,gx-0.21,gy-0.21,gx+0.21,gy+0.21)
 path(top,M2,[(1.0,gy),(gx,gy)],0.20)
 box(top,M2,0.75,gy-0.25,1.25,gy+0.25); box(top,M2PIN,0.75,gy-0.25,1.25,gy+0.25); label(top,M2TEXT,g,1.0,gy)
 gate_points[name]=(gx,gy)
# Source and drain access from PCell M1 bars. Short M1-to-M2 stacks make
# each net escape onto orthogonal M2 routing immediately.
source_nodes={}; drain_nodes={}
for name,x,y,g,s,d in devices:
 cy=y+2.5; sx=x+0.15; dx=x+0.87
 via(ly,top,'Metal1','Metal2',dx,cy)
 if name=='MN24': via(ly,top,'Metal1','Metal3',sx,cy)
 else: via(ly,top,'Metal1','Metal2',sx,cy)
 box(top,M1,sx-0.22,cy-0.22,sx+0.22,cy+0.22); box(top,M1,dx-0.22,cy-0.22,dx+0.22,cy+0.22)
 if name=='MN24':
  box(top,M3,sx-0.22,cy-0.22,sx+0.22,cy+0.22)
 else: box(top,M2,sx-0.22,cy-0.22,sx+0.22,cy+0.22)
 box(top,M2,dx-0.22,cy-0.22,dx+0.22,cy+0.22)
 source_nodes[name]=(sx,cy,s); drain_nodes[name]=(dx,cy,d)
# Analog terminals all exit left, each on its own M2 track.
for name,x,y,g,s,d in devices:
 sx,cy,net=source_nodes[name]
 if net=='c1_int': continue
 path(top,M2,[(1.0,cy),(sx,cy)],0.20)
 box(top,M2,0.75,cy-0.25,1.25,cy+0.25); box(top,M2PIN,0.75,cy-0.25,1.25,cy+0.25); label(top,M2TEXT,net,1.0,cy)
# Drain rails and output ports exit right. Their M2 tracks stay separate.
for net, names, rail_x, pin_y in [('s_m0',['MN22','MN23'],16.0,18.0),('s_m1',['MN24','MN25'],18.0,32.0)]:
 ys=[]
 for name in names:
  dx,cy,_=drain_nodes[name]; path(top,M2,[(dx,cy),(rail_x,cy)],0.20); ys.append(cy)
  box(top,M2,rail_x-0.21,cy-0.21,rail_x+0.21,cy+0.21)
 path(top,M2,[(rail_x,min(ys)),(rail_x,max(ys))],0.20)
 path(top,M2,[(rail_x,pin_y),(170.0,pin_y)],0.20)
 box(top,M2,169.75,pin_y-0.25,170.25,pin_y+0.25); box(top,M2PIN,169.75,pin_y-0.25,170.25,pin_y+0.25); label(top,M2TEXT,net,170.0,pin_y)
# Substrate bulk contacts: via_stack Activ->M1 beside each transistor,
# P+ implant around the active tap, then a short stack to M4/GND.
tap_x=8.0; tap_ys=[]
for name,x,y,g,s,d in devices:
 ty=y+5.8
 via(ly,top,'Activ','Metal1',tap_x,ty,2,1)
 box(top,PSD,tap_x-0.42,ty-0.42,tap_x+0.42,ty+0.42)
 via(ly,top,'Metal1','Metal2',tap_x,ty)
 via(ly,top,'Metal2','Metal3',tap_x,ty)
 via(ly,top,'Metal3','Metal4',tap_x,ty)
 box(top,M1,tap_x-0.22,ty-0.22,tap_x+0.22,ty+0.22); box(top,M2,tap_x-0.22,ty-0.22,tap_x+0.22,ty+0.22); box(top,M3,tap_x-0.22,ty-0.22,tap_x+0.22,ty+0.22); box(top,M4,tap_x-0.22,ty-0.22,tap_x+0.22,ty+0.22)
 tap_ys.append(ty)
# Shared GND on M4 collects all bulk contacts and the MIM bottom plate.
cap_right2=cap2x+58.28
cap_ground_x=162.0; cap_ground_y=capy+30.0
# Short M5 bridge ties both PCell bottom plates in parallel and reaches an M4/M5 via.
path(top,M5,[(capx+58.28,cap_ground_y),(cap2x-0.6,cap_ground_y),(cap_right2,cap_ground_y),(cap_ground_x,cap_ground_y)],0.30)
via(ly,top,'Metal4','Metal5',cap_ground_x,cap_ground_y)
gnd_x=170.0; gnd_y=4.0
# M4 via route from each local tap to a common right-side vertical trunk.
for ty in tap_ys[:-1]: box(top,M4,tap_x,ty-0.10,165.0,ty+0.10)
box(top,M4,tap_x-0.10,tap_ys[-1]-0.30,tap_x+0.10,tap_ys[-1]+0.10)
box(top,M4,tap_x,cap_ground_y-0.10,165.0,cap_ground_y+0.10)
box(top,M4,164.90,min(tap_ys[:-1]),165.10,cap_ground_y)
box(top,M4,cap_ground_x,cap_ground_y-0.10,165.21,cap_ground_y+0.10)
box(top,M4,cap_ground_x-0.10,cap_ground_y-0.10,cap_ground_x+0.10,min(tap_ys)+0.10)
box(top,M4,164.90,gnd_y,165.10,min(tap_ys))
box(top,M4,164.79,gnd_y-0.10,gnd_x,gnd_y+0.10)
via(ly,top,'Metal2','Metal4',gnd_x,gnd_y)
box(top,M3,gnd_x-0.22,gnd_y-0.22,gnd_x+0.22,gnd_y+0.22); box(top,M4,gnd_x-0.22,gnd_y-0.22,gnd_x+0.22,gnd_y+0.22)
box(top,M2,gnd_x-0.25,gnd_y-0.25,gnd_x+0.25,gnd_y+0.25); box(top,M2PIN,gnd_x-0.25,gnd_y-0.25,gnd_x+0.25,gnd_y+0.25); label(top,M2TEXT,'gnd',gnd_x,gnd_y)
# C1 top: one simple TopMetal1 rectangle spans both PCell electrodes.
capx,capy=42.0,8.5; cap2x=102.0
c1_via_x=70.0; c1_via_y=capy+59.5
box(top,TM1,capx+0.10,capy+0.10,cap2x+57.58,c1_via_y+0.30)
via(ly,top,'Metal3','TopMetal1',c1_via_x,c1_via_y)
box(top,M3,c1_via_x-0.22,c1_via_y-0.22,c1_via_x+0.22,c1_via_y+0.22)
box(top,M4,c1_via_x-0.22,c1_via_y-0.22,c1_via_x+0.22,c1_via_y+0.22)
box(top,M5,c1_via_x-0.22,c1_via_y-0.22,c1_via_x+0.22,c1_via_y+0.22)
box(top,M3,5.05,28.28,c1_via_x+0.10,28.72)
box(top,M3,c1_via_x-0.10,28.5,c1_via_x+0.10,c1_via_y)
box(top,M2,4.93,28.28,5.37,28.72)
via(ly,top,'Metal1','Metal3',5.15,28.5)
box(top,M1,4.93,28.28,5.37,28.72)
box(top,M3,5.05,28.28,5.25,28.72)
box(top,M5,capx-0.6,cap_ground_y-0.15,capx+58.28,cap_ground_y+0.15)
box(top,M5,cap2x-0.6,cap_ground_y-0.15,cap2x+58.28,cap_ground_y+0.15)
box(top,M5,capx+58.28,cap_ground_y-0.15,cap_ground_x,cap_ground_y+0.15)
# Preserve exact schematic pins as edge pin boxes and text labels.
# Top-level coordinates are documented for the screenshot/verification.
opts=pya.SaveLayoutOptions(); opts.write_context_info=True
ly.write(OUT,opts)
print('WROTE',OUT,'top_bbox_um',top.bbox().width()*DBU,top.bbox().height()*DBU)
print('PCELL_COUNT',sum(1 for c in ly.each_cell() if c.is_pcell_variant()))



















