v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {fase_gen - fases negadas para las TG (dominio vdd2x)} -560 -360 0 0 0.4 0.4 {}
C {ipin.sym} -560 -200 0 0 {name=p1 lab=vp1}
C {ipin.sym} -560 -160 0 0 {name=p2 lab=vp2}
C {opin.sym} -560 -120 0 0 {name=p3 lab=vp1b}
C {opin.sym} -560 -80 0 0 {name=p4 lab=vp2b}
C {iopin.sym} -560 -40 0 0 {name=p5 lab=vdd2x}
C {iopin.sym} -560 0 0 0 {name=p6 lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -160 -120 0 0 {name=M8
l=0.13u
w=2.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -140 -90 -60 -90 {lab=vp1b}
C {lab_pin.sym} -60 -90 2 0 {name=l7 sig_type=std_logic lab=vp1b}
N -180 -120 -220 -120 {lab=vp1}
C {lab_pin.sym} -220 -120 0 0 {name=l8 sig_type=std_logic lab=vp1}
N -140 -150 -60 -150 {lab=vdd2x}
C {lab_pin.sym} -60 -150 2 0 {name=l9 sig_type=std_logic lab=vdd2x}
N -140 -120 -60 -120 {lab=vdd2x}
C {lab_pin.sym} -60 -120 2 0 {name=l10 sig_type=std_logic lab=vdd2x}
C {sg13g2_pr/sg13_lv_nmos.sym} -160 40 0 0 {name=M7
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -140 10 -60 10 {lab=gnd}
C {lab_pin.sym} -60 10 2 0 {name=l11 sig_type=std_logic lab=gnd}
N -180 40 -220 40 {lab=vp1}
C {lab_pin.sym} -220 40 0 0 {name=l12 sig_type=std_logic lab=vp1}
N -140 70 -60 70 {lab=vp1b}
C {lab_pin.sym} -60 70 2 0 {name=l13 sig_type=std_logic lab=vp1b}
N -140 40 -60 40 {lab=gnd}
C {lab_pin.sym} -60 40 2 0 {name=l14 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 200 -120 0 0 {name=M16
l=0.13u
w=2.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 220 -90 300 -90 {lab=vp2b}
C {lab_pin.sym} 300 -90 2 0 {name=l15 sig_type=std_logic lab=vp2b}
N 180 -120 140 -120 {lab=vp2}
C {lab_pin.sym} 140 -120 0 0 {name=l16 sig_type=std_logic lab=vp2}
N 220 -150 300 -150 {lab=vdd2x}
C {lab_pin.sym} 300 -150 2 0 {name=l17 sig_type=std_logic lab=vdd2x}
N 220 -120 300 -120 {lab=vdd2x}
C {lab_pin.sym} 300 -120 2 0 {name=l18 sig_type=std_logic lab=vdd2x}
C {sg13g2_pr/sg13_lv_nmos.sym} 200 40 0 0 {name=M15
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 220 10 300 10 {lab=gnd}
C {lab_pin.sym} 300 10 2 0 {name=l19 sig_type=std_logic lab=gnd}
N 180 40 140 40 {lab=vp2}
C {lab_pin.sym} 140 40 0 0 {name=l20 sig_type=std_logic lab=vp2}
N 220 70 300 70 {lab=vp2b}
C {lab_pin.sym} 300 70 2 0 {name=l21 sig_type=std_logic lab=vp2b}
N 220 40 300 40 {lab=gnd}
C {lab_pin.sym} 300 40 2 0 {name=l22 sig_type=std_logic lab=gnd}
