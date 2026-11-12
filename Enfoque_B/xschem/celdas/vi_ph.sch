v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {vi_ph - modulo V-I para la entrada de tension (pH)} -700 -420 0 0 0.4 0.4 {}
C {ipin.sym} -700 -300 0 0 {name=p1 lab=vin_ph}
C {opin.sym} -700 -260 0 0 {name=p2 lab=s_mtr1}
C {iopin.sym} -700 -220 0 0 {name=p3 lab=vdd}
C {iopin.sym} -700 -180 0 0 {name=p4 lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -200 0 0 {name=MTR1
l=0.34u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 20 -170 100 -170 {lab=s_mtr1}
C {lab_pin.sym} 100 -170 2 0 {name=l5 sig_type=std_logic lab=s_mtr1}
N -20 -200 -60 -200 {lab=s_mtr1}
C {lab_pin.sym} -60 -200 0 0 {name=l6 sig_type=std_logic lab=s_mtr1}
N 20 -230 100 -230 {lab=vdd}
C {lab_pin.sym} 100 -230 2 0 {name=l7 sig_type=std_logic lab=vdd}
N 20 -200 100 -200 {lab=vdd}
C {lab_pin.sym} 100 -200 2 0 {name=l8 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 0 0 0 {name=MTR2
l=10u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 20 -30 100 -30 {lab=s_mtr1}
C {lab_pin.sym} 100 -30 2 0 {name=l9 sig_type=std_logic lab=s_mtr1}
N -20 0 -60 0 {lab=vin_ph}
C {lab_pin.sym} -60 0 0 0 {name=l10 sig_type=std_logic lab=vin_ph}
N 20 30 100 30 {lab=n_tr}
C {lab_pin.sym} 100 30 2 0 {name=l11 sig_type=std_logic lab=n_tr}
N 20 0 100 0 {lab=gnd}
C {lab_pin.sym} 100 0 2 0 {name=l12 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 200 0 0 {name=MTR3
l=0.34u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 20 170 100 170 {lab=n_tr}
C {lab_pin.sym} 100 170 2 0 {name=l13 sig_type=std_logic lab=n_tr}
N -20 200 -60 200 {lab=vdd}
C {lab_pin.sym} -60 200 0 0 {name=l14 sig_type=std_logic lab=vdd}
N 20 230 100 230 {lab=gnd}
C {lab_pin.sym} 100 230 2 0 {name=l15 sig_type=std_logic lab=gnd}
N 20 200 100 200 {lab=gnd}
C {lab_pin.sym} 100 200 2 0 {name=l16 sig_type=std_logic lab=gnd}
T {Vin 0 - 400 mV, offset 0.625 V. INL 2.1 %.} -700 120 0 0 0.25 0.25 {layer=8}
