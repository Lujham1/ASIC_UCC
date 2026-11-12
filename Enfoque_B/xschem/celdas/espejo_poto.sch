v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {espejo_poto - corriente del potenciostato -> tension S_Mpmos (espejo 2:1)} -700 -420 0 0 0.4 0.4 {}
C {iopin.sym} -700 -300 0 0 {name=p1 lab=ipoto_in}
C {opin.sym} -700 -260 0 0 {name=p2 lab=s_mpmos}
C {iopin.sym} -700 -220 0 0 {name=p3 lab=vdd}
C {iopin.sym} -700 -180 0 0 {name=p4 lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 0 0 0 {name=M_in
l=1.2u
w=5.1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 -30 -200 -30 {lab=ipoto_in}
C {lab_pin.sym} -200 -30 2 0 {name=l5 sig_type=std_logic lab=ipoto_in}
N -320 0 -360 0 {lab=ipoto_in}
C {lab_pin.sym} -360 0 0 0 {name=l6 sig_type=std_logic lab=ipoto_in}
N -280 30 -200 30 {lab=gnd}
C {lab_pin.sym} -200 30 2 0 {name=l7 sig_type=std_logic lab=gnd}
N -280 0 -200 0 {lab=gnd}
C {lab_pin.sym} -200 0 2 0 {name=l8 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 0 0 0 {name=M_out
l=1.2u
w=2.55u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 20 -30 100 -30 {lab=s_mpmos}
C {lab_pin.sym} 100 -30 2 0 {name=l9 sig_type=std_logic lab=s_mpmos}
N -20 0 -60 0 {lab=ipoto_in}
C {lab_pin.sym} -60 0 0 0 {name=l10 sig_type=std_logic lab=ipoto_in}
N 20 30 100 30 {lab=gnd}
C {lab_pin.sym} 100 30 2 0 {name=l11 sig_type=std_logic lab=gnd}
N 20 0 100 0 {lab=gnd}
C {lab_pin.sym} 100 0 2 0 {name=l12 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -200 0 0 {name=M_pmos
l=1u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 20 -170 100 -170 {lab=s_mpmos}
C {lab_pin.sym} 100 -170 2 0 {name=l13 sig_type=std_logic lab=s_mpmos}
N -20 -200 -60 -200 {lab=s_mpmos}
C {lab_pin.sym} -60 -200 0 0 {name=l14 sig_type=std_logic lab=s_mpmos}
N 20 -230 100 -230 {lab=vdd}
C {lab_pin.sym} 100 -230 2 0 {name=l15 sig_type=std_logic lab=vdd}
N 20 -200 100 -200 {lab=vdd}
C {lab_pin.sym} 100 -200 2 0 {name=l16 sig_type=std_logic lab=vdd}
T {Potenciostato 0.1 uA - 10 uA. M_in : M_out = 2 : 1 (M_out 2.55/1.2, antes 5.1/1.2).} -700 120 0 0 0.25 0.25 {layer=8}
