v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {ASIC_TOP - Conversor multisensor a frecuencia (Informe v2)
Modo (s1 s0) -> canal activo
 0 0 -> sel_poto : potenciostato (corriente)
 0 1 -> sel_ph   : pH (tension, modulo V-I)
 1 0 -> sel_ntc  : temperatura (termistor NTC externo)
 1 1 -> sel_hum  : humedad (capacitor externo)
PENDIENTE: en modos NTC y humedad nadie maneja vg_mt2 (gate de MT2 flotante).} -990 200 0 0 0.3 0.3 {}
C {Enfoque_B/xschem/celdas/deco_2a4.sym} -520 0 0 0 {name=x_deco}
C {devices/ipin.sym} -640 -10 0 0 {name=p1 lab=s0}
C {devices/ipin.sym} -640 10 0 0 {name=p2 lab=s1}
C {devices/lab_pin.sym} -400 -30 2 0 {name=l3 lab=sel_poto}
C {devices/lab_pin.sym} -400 -10 2 0 {name=l4 lab=sel_ph}
C {devices/lab_pin.sym} -400 10 2 0 {name=l5 lab=sel_ntc}
C {devices/lab_pin.sym} -400 30 2 0 {name=l6 lab=sel_hum}
C {devices/lab_pin.sym} -520 -80 0 0 {name=l7 lab=vdd}
C {devices/lab_pin.sym} -520 80 0 0 {name=l8 lab=gnd}
C {Enfoque_B/xschem/celdas/espejo_poto_sel.sym} 0 -460 0 0 {name=x_poto}
C {devices/ipin.sym} -120 -460 0 0 {name=p9 lab=ipoto_in}
C {devices/lab_pin.sym} -120 -420 0 0 {name=l10 lab=sel_poto}
C {devices/lab_pin.sym} 120 -460 2 0 {name=l11 lab=vg_mt2}
C {devices/lab_pin.sym} 0 -540 0 0 {name=l12 lab=vdd}
C {devices/lab_pin.sym} 0 -380 0 0 {name=l13 lab=gnd}
C {Enfoque_B/xschem/celdas/vi_ph_sel.sym} 0 -210 0 0 {name=x_ph}
C {devices/ipin.sym} -120 -210 0 0 {name=p14 lab=vin_ph}
C {devices/lab_pin.sym} -120 -170 0 0 {name=l15 lab=sel_ph}
C {devices/lab_pin.sym} 120 -210 2 0 {name=l16 lab=vg_mt2}
C {devices/lab_pin.sym} 0 -290 0 0 {name=l17 lab=vdd}
C {devices/lab_pin.sym} 0 -130 0 0 {name=l18 lab=gnd}
C {Enfoque_B/xschem/celdas/sel_r_ntc.sym} 0 60 0 0 {name=x_selr}
C {devices/lab_pin.sym} -120 60 0 0 {name=l19 lab=r}
C {devices/lab_pin.sym} -120 100 0 0 {name=l20 lab=sel_ntc}
C {devices/iopin.sym} 120 40 0 0 {name=p21 lab=r_ntc}
C {devices/lab_pin.sym} 0 -20 0 0 {name=l22 lab=vdd}
C {devices/lab_pin.sym} 0 140 0 0 {name=l23 lab=gnd}
C {Enfoque_B/xschem/celdas/sel_c_hum.sym} 0 310 0 0 {name=x_selc}
C {devices/lab_pin.sym} -120 310 0 0 {name=l24 lab=vc}
C {devices/lab_pin.sym} -120 350 0 0 {name=l25 lab=sel_hum}
C {devices/iopin.sym} 120 290 0 0 {name=p26 lab=c_hum}
C {devices/lab_pin.sym} 0 230 0 0 {name=l27 lab=vdd}
C {devices/lab_pin.sym} 0 390 0 0 {name=l28 lab=gnd}
C {Enfoque_B/xschem/celdas/osc_relax.sym} 520 -100 0 0 {name=x_osc}
C {devices/ipin.sym} 400 -130 0 0 {name=p29 lab=vbias}
C {devices/lab_pin.sym} 400 -110 0 0 {name=l30 lab=vg_mt2}
C {devices/lab_pin.sym} 400 -90 0 0 {name=l31 lab=r}
C {devices/lab_pin.sym} 400 -70 0 0 {name=l32 lab=vc}
C {devices/opin.sym} 640 -100 0 0 {name=p33 lab=vrst}
C {devices/lab_pin.sym} 520 -180 0 0 {name=l34 lab=vdd}
C {devices/lab_pin.sym} 520 -20 0 0 {name=l35 lab=gnd}
C {devices/iopin.sym} -700 -500 0 0 {name=p36 lab=vdd}
C {devices/iopin.sym} -700 -460 0 0 {name=p37 lab=gnd}
