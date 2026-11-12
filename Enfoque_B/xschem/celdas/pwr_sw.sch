v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {pwr_sw - switch de alimentacion (power gating): VDD siempre encendido -> VVDD} -700 -420 0 0 0.4 0.4 {}
C {ipin.sym} -700 -300 0 0 {name=p1 lab=en}
C {opin.sym} -700 -260 0 0 {name=p2 lab=vvdd}
C {iopin.sym} -700 -220 0 0 {name=p3 lab=vdd}
C {iopin.sym} -700 -180 0 0 {name=p4 lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -300 -200 0 0 {name=MPi
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -280 -170 -200 -170 {lab=g}
C {lab_pin.sym} -200 -170 2 0 {name=l5 sig_type=std_logic lab=g}
N -320 -200 -360 -200 {lab=en}
C {lab_pin.sym} -360 -200 0 0 {name=l6 sig_type=std_logic lab=en}
N -280 -230 -200 -230 {lab=vdd}
C {lab_pin.sym} -200 -230 2 0 {name=l7 sig_type=std_logic lab=vdd}
N -280 -200 -200 -200 {lab=vdd}
C {lab_pin.sym} -200 -200 2 0 {name=l8 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 0 0 0 {name=MNi
l=4u
w=0.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 -30 -200 -30 {lab=g}
C {lab_pin.sym} -200 -30 2 0 {name=l9 sig_type=std_logic lab=g}
N -320 0 -360 0 {lab=en}
C {lab_pin.sym} -360 0 0 0 {name=l10 sig_type=std_logic lab=en}
N -280 30 -200 30 {lab=gnd}
C {lab_pin.sym} -200 30 2 0 {name=l11 sig_type=std_logic lab=gnd}
N -280 0 -200 0 {lab=gnd}
C {lab_pin.sym} -200 0 2 0 {name=l12 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} -60 -100 0 0 {name=Cslew
model=cap_cmim
w=36.46e-6
l=36.46e-6
m=1
spiceprefix=X}
N -60 -130 -60 -150 {lab=g}
C {lab_pin.sym} -60 -150 0 0 {name=l13 sig_type=std_logic lab=g}
N -60 -70 -60 -50 {lab=gnd}
C {lab_pin.sym} -60 -50 0 0 {name=l14 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 200 -200 0 0 {name=Msw
l=0.13u
w=40u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 220 -170 300 -170 {lab=vvdd}
C {lab_pin.sym} 300 -170 2 0 {name=l15 sig_type=std_logic lab=vvdd}
N 180 -200 140 -200 {lab=g}
C {lab_pin.sym} 140 -200 0 0 {name=l16 sig_type=std_logic lab=g}
N 220 -230 300 -230 {lab=vdd}
C {lab_pin.sym} 300 -230 2 0 {name=l17 sig_type=std_logic lab=vdd}
N 220 -200 300 -200 {lab=vdd}
C {lab_pin.sym} 300 -200 2 0 {name=l18 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 200 0 0 0 {name=MNpd
l=1u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 220 -30 300 -30 {lab=vvdd}
C {lab_pin.sym} 300 -30 2 0 {name=l19 sig_type=std_logic lab=vvdd}
N 180 0 140 0 {lab=g}
C {lab_pin.sym} 140 0 0 0 {name=l20 sig_type=std_logic lab=g}
N 220 30 300 30 {lab=gnd}
C {lab_pin.sym} 300 30 2 0 {name=l21 sig_type=std_logic lab=gnd}
N 220 0 300 0 {lab=gnd}
C {lab_pin.sym} 300 0 2 0 {name=l22 sig_type=std_logic lab=gnd}
T {EN activo en alto: EN=1 -> g baja lento (MNi 0.3/4 + Cslew) -> Msw conduce, VVDD=VDD.
EN=0 -> g=VDD -> Msw abierto y MNpd descarga VVDD a GND.
Bulks: PMOS a VDD (incluido Msw), NMOS a GND. Msw: 40/0.13 en 8 dedos de 5 um.
Si EN viene activo en bajo, va directo a g y se omiten MPi y MNi.} -700 120 0 0 0.25 0.25 {layer=8}
