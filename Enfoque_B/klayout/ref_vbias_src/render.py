import os
os.environ['QT_QPA_PLATFORM']='offscreen'
import klayout.lay as lay
import klayout.db as db
base='/foss/designs/ASIC_UCC/Enfoque_B/klayout'
v=lay.LayoutView()
v.load_layout(base+'/'+os.environ.get('REF_VBIAS_LAYOUT','ref_vbias.gds'),False)
v.load_layer_props('/foss/designs/ASIC_UCC/pdk/ihp-sg13g2/ihp-sg13g2/libs.tech/klayout/tech/sg13g2.lyp')
v.max_hier()
v.set_config('background-color','#101820')
v.zoom_fit()
v.save_image(base+'/verification/ref_vbias/layout.png',1200,1500)
print('Rendered layout.png')
