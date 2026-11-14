v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {ref_vbias - referencia de tension para Vbias (dos transistores en serie)} -700 -420 0 0 0.4 0.4 {}
C {opin.sym} -700 -300 0 0 {name=p1 lab=vbias}
C {iopin.sym} -700 -260 0 0 {name=p2 lab=vdd}
C {iopin.sym} -700 -220 0 0 {name=p3 lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -200 0 0 {name=Mtop
l=1u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 20 -170 100 -170 {lab=vbias}
C {lab_pin.sym} 100 -170 2 0 {name=l4 sig_type=std_logic lab=vbias}
N -20 -200 -60 -200 {lab=vbias}
C {lab_pin.sym} -60 -200 0 0 {name=l5 sig_type=std_logic lab=vbias}
N 20 -230 100 -230 {lab=vdd}
C {lab_pin.sym} 100 -230 2 0 {name=l6 sig_type=std_logic lab=vdd}
N 20 -200 100 -200 {lab=vdd}
C {lab_pin.sym} 100 -200 2 0 {name=l7 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 0 0 0 {name=Mbot
l=2.2u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 20 -30 100 -30 {lab=vbias}
C {lab_pin.sym} 100 -30 2 0 {name=l8 sig_type=std_logic lab=vbias}
N -20 0 -60 0 {lab=vdd}
C {lab_pin.sym} -60 0 0 0 {name=l9 sig_type=std_logic lab=vdd}
N 20 30 100 30 {lab=gnd}
C {lab_pin.sym} 100 30 2 0 {name=l10 sig_type=std_logic lab=gnd}
N 20 0 100 0 {lab=gnd}
C {lab_pin.sym} 100 0 2 0 {name=l11 sig_type=std_logic lab=gnd}
T {Mtop: PMOS en diodo (gate = drain). Mbot: NMOS con gate a VDD.
vout = vbias = 0.372 V, I = 2 uA. Alimentada desde VVDD.} -700 120 0 0 0.25 0.25 {layer=8}
