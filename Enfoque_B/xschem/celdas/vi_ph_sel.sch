v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 30 -280 40 -280 {
lab=vdd}
N 40 -280 40 -250 {
lab=vdd}
N 30 -250 40 -250 {
lab=vdd}
N -10 -250 -10 -200 {
lab=#net1}
N -10 -200 30 -200 {
lab=#net1}
N 30 -220 30 -200 {
lab=#net1}
N 30 -310 30 -280 {
lab=vdd}
N 30 -170 40 -170 {
lab=gnd}
N -30 -170 -10 -170 {
lab=vin_ph}
N 40 -170 40 -140 {
lab=gnd}
N 30 -140 30 -120 {
lab=#net2}
N 30 -90 40 -90 {
lab=gnd}
N 30 -60 40 -60 {
lab=gnd}
N 40 -90 40 -60 {
lab=gnd}
N -30 -90 -10 -90 {
lab=vdd}
N 30 -60 30 -40 {
lab=gnd}
N 190 -170 270 -170 {
lab=#net1}
N 190 -140 230 -140 {
lab=vdd}
N 270 -200 270 -170 {
lab=#net1}
N 270 -170 360 -170 {
lab=#net1}
N 400 -140 460 -140 {
lab=sel_ph}
N 460 -140 460 -70 {
lab=sel_ph}
N 500 -200 500 -180 {
lab=vdd}
N 500 -40 500 -20 {
lab=gnd}
N 500 -110 500 -100 {
lab=#net3}
N 500 -150 510 -150 {
lab=vdd}
N 510 -180 510 -150 {
lab=vdd}
N 500 -180 510 -180 {
lab=vdd}
N 500 -70 510 -70 {
lab=gnd}
N 510 -70 510 -40 {
lab=gnd}
N 500 -40 510 -40 {
lab=gnd}
N 270 -110 360 -110 {
lab=vg_mt2}
N 500 -110 570 -110 {
lab=#net3}
N 500 -120 500 -110 {
lab=#net3}
N 320 -140 365 -140 {
lab=gnd}
N 570 -110 570 0 {
lab=#net3}
N 460 -240 460 -140 {
lab=sel_ph}
N 150 0 570 0 {
lab=#net3}
N 150 -140 150 0 {
lab=#net3}
N 270 -110 270 -70 {
lab=vg_mt2}
N 190 -110 270 -110 {
lab=vg_mt2}
N 30 -200 270 -200 {
lab=#net1}
C {sg13g2_pr/sg13_lv_pmos.sym} 10 -250 0 0 {name=MTR1
l=0.34u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 10 -170 2 1 {name=MTR2
l=10u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 10 -90 2 1 {name=MTR3
l=0.34u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} -30 -90 0 0 {name=p24 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 40 -140 0 1 {name=p28 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 380 -140 2 0 {name=Mn_mid1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 170 -140 2 1 {name=Mp_mid5
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 230 -140 0 1 {name=p29 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 480 -150 0 0 {name=M5
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 480 -70 2 1 {name=M6
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 320 -140 0 0 {name=p38 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 500 -200 0 1 {name=p48 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 30 -40 0 1 {name=p19 sig_type=std_logic lab=gnd}
C {iopin.sym} 30 -310 0 0 {name=p1 lab=vdd}
C {iopin.sym} 500 -20 0 0 {name=p2 lab=gnd}
C {opin.sym} 270 -70 0 0 {name=p3 lab=vg_mt2}
C {ipin.sym} -30 -170 0 0 {name=p4 lab=vin_ph}
C {ipin.sym} 460 -240 0 0 {name=p5 lab=sel_ph}
