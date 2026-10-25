v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {tb_bandgap - mismas fuentes y comandos que el esquematico plano} -140 -350 0 0 0.4 0.4 {}
C {Enfoque_A/xschem/bandgap.sym} 0 0 0 0 {name=xbg}
C {lab_pin.sym} -120 -20 0 0 {name=l1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -120 0 0 0 {name=l2 sig_type=std_logic lab=vp1}
C {lab_pin.sym} -120 20 0 0 {name=l3 sig_type=std_logic lab=vp2}
C {lab_pin.sym} 120 0 2 0 {name=l4 sig_type=std_logic lab=vref}
C {lab_pin.sym} 0 -90 0 0 {name=l5 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} 0 90 0 0 {name=l6 sig_type=std_logic lab=0}
C {vsource.sym} -700 250 0 0 {name=V1 value=2.2 savecurrent=false}
C {lab_pin.sym} -700 220 0 0 {name=l7 sig_type=std_logic lab=vdd2x}
C {gnd.sym} -700 280 0 0 {name=g0 lab=0}
C {vsource.sym} -560 250 0 0 {name=Vi value=1.1V savecurrent=false}
C {lab_pin.sym} -560 220 0 0 {name=l8 sig_type=std_logic lab=vdd}
C {gnd.sym} -560 280 0 0 {name=g1 lab=0}
C {vsource.sym} -420 250 0 0 {name=V2 value="pulse( 0 2.2 0 10n 10n 15.0088u 30.5176u)" savecurrent=false}
C {lab_pin.sym} -420 220 0 0 {name=l9 sig_type=std_logic lab=vp1}
C {gnd.sym} -420 280 0 0 {name=g2 lab=0}
C {vsource.sym} -280 250 0 0 {name=V4 value="pulse( 0 2.2 15.2588u 10n 10n 15.0088u 30.5176u)" savecurrent=false}
C {lab_pin.sym} -280 220 0 0 {name=l10 sig_type=std_logic lab=vp2}
C {gnd.sym} -280 280 0 0 {name=g3 lab=0}
C {simulator_commands_shown.sym} -700 -400 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false
value=".lib cornerMOSlv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerCAP.lib cap_typ
.save all
.temp 25
.control
* paso maximo 20n: sin el, el VBIC de Q2 diverge (NaN) en un flanco de fase
tran 100n 8m 0 20n
*meas tran V3_AVG AVG v(xbg.vctat) FROM=6m TO=8m
*meas tran Vbe1 AVG v(xbg.vbe1) FROM=6m TO=8m
*meas tran Vbe2 AVG v(xbg.vbe2) FROM=6ms TO=8m
*meas tran V7_AVG AVG v(xbg.p3t) FROM=6m TO=8m
meas tran VREF_AVG AVG v(vref) FROM=6m TO=8m
*meas tran V4_AVG AVG v(xbg.x_ctat.n4) FROM=7m TO=10m
*plot v(vp1) v(xbg.x_ctat.n4)
*plot v(vp1) v(xbg.vctat)
*plot v(xbg.p1t)-v(xbg.p1b) v(xbg.p2t)-v(xbg.p2b) v(xbg.p3t)-v(xbg.p3b) v(vp1)
*plot v(vp2) v(xbg.vbe1) v(xbg.vbe2)
plot v(vp1) v(xbg.p3t)-v(xbg.p1b)
.endc
"}
