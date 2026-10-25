v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 100 -410 110 -410 {
lab=vdd}
N 110 -410 110 -380 {
lab=vdd}
N 100 -380 110 -380 {
lab=vdd}
N 100 -280 110 -280 {
lab=gnd}
N 100 -250 110 -250 {
lab=gnd}
N 110 -280 110 -250 {
lab=gnd}
N -10 -280 0 -280 {
lab=gnd}
N -10 -250 0 -250 {
lab=gnd}
N -10 -280 -10 -250 {
lab=gnd}
N 40 -280 60 -280 {
lab=ipoto_in}
N 0 -340 0 -310 {
lab=ipoto_in}
N 0 -250 0 -230 {
lab=gnd}
N 100 -250 100 -230 {
lab=gnd}
N 100 -440 100 -410 {
lab=vdd}
N 40 -310 40 -280 {
lab=ipoto_in}
N 0 -310 40 -310 {
lab=ipoto_in}
N 60 -380 60 -330 {
lab=#net1}
N 60 -330 100 -330 {
lab=#net1}
N 100 -350 100 -330 {
lab=#net1}
N 100 -330 100 -310 {
lab=#net1}
N 100 -330 190 -330 {
lab=#net1}
N 110 -170 190 -170 {
lab=#net1}
N 110 -140 150 -140 {
lab=vdd}
N 190 -170 280 -170 {
lab=#net1}
N 320 -140 380 -140 {
lab=sel_poto}
N 380 -140 380 -70 {
lab=sel_poto}
N 420 -40 420 -20 {
lab=gnd}
N 420 -110 420 -100 {
lab=#net2}
N 420 -150 430 -150 {
lab=vdd}
N 430 -180 430 -150 {
lab=vdd}
N 420 -180 430 -180 {
lab=vdd}
N 420 -70 430 -70 {
lab=gnd}
N 430 -70 430 -40 {
lab=gnd}
N 420 -40 430 -40 {
lab=gnd}
N 190 -110 280 -110 {
lab=out}
N 420 -110 490 -110 {
lab=#net2}
N 420 -120 420 -110 {
lab=#net2}
N 240 -140 285 -140 {
lab=gnd}
N 490 -110 490 0 {
lab=#net2}
N 380 -240 380 -140 {
lab=sel_poto}
N 70 0 490 0 {
lab=#net2}
N 70 -140 70 0 {
lab=#net2}
N 190 -110 190 -70 {
lab=out}
N 110 -110 190 -110 {
lab=out}
N 190 -330 190 -170 {
lab=#net1}
N 0 -230 100 -230 {lab=gnd}
N 100 -440 420 -440 {lab=vdd}
N 420 -440 420 -180 {lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 80 -280 2 1 {name=M_out
l=1.2u
w=5.1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 80 -380 0 0 {name=M_pmos
l=1u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 20 -280 2 0 {name=M_in
l=1.2u
w=5.1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 300 -140 2 0 {name=Mn_mid
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 90 -140 2 1 {name=Mp_mid
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 150 -140 0 1 {name=p31 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 400 -150 0 0 {name=M3
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 400 -70 2 1 {name=M4
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 240 -140 0 0 {name=p16 sig_type=std_logic lab=gnd}
C {ipin.sym} 380 -240 0 0 {name=p59 lab=sel_poto}
C {ipin.sym} 0 -340 0 0 {name=p14 lab=ipoto_in}
C {iopin.sym} 50 -230 1 0 {name=p11 lab=gnd}
C {opin.sym} 190 -70 0 0 {name=p12 lab=vg_mt2}
C {iopin.sym} 270 -440 3 0 {name=p13 lab=vdd}
C {iopin.sym} 420 -20 2 0 {name=p10 lab=gnd}
