v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 410 -210 410 -190 {
lab=gnd}
N 250 -90 250 -70 {
lab=gnd}
N 460 -210 480 -210 {
lab=sel_hum}
N 260 -120 260 -100 {
lab=gnd}
N 250 -120 260 -120 {
lab=gnd}
N 340 -260 340 -240 {
lab=vc}
N 410 -210 420 -210 {
lab=gnd}
N 340 -240 420 -240 {
lab=vc}
N 250 -240 340 -240 {
lab=vc}
N 250 -180 250 -150 {
lab=#net1}
N 420 -180 420 -150 {
lab=c_hum}
N 70 -210 70 -190 {
lab=vdd}
N 70 -50 70 -30 {
lab=gnd}
N 70 -160 80 -160 {
lab=vdd}
N 80 -190 80 -160 {
lab=vdd}
N 70 -190 80 -190 {
lab=vdd}
N 70 -80 80 -80 {
lab=gnd}
N 80 -80 80 -50 {
lab=gnd}
N 70 -50 80 -50 {
lab=gnd}
N 70 -120 70 -110 {
lab=#net2}
N 30 -120 30 -80 {
lab=sel_hum}
N 0 -120 30 -120 {
lab=sel_hum}
N 30 -160 30 -120 {
lab=sel_hum}
N 70 -120 210 -120 {
lab=#net2}
N 70 -130 70 -120 {
lab=#net2}
N 480 -210 480 -10 {
lab=sel_hum}
N 0 -120 0 -10 {
lab=sel_hum}
N 0 -10 480 -10 {
lab=sel_hum}
C {lab_pin.sym} 250 -70 0 1 {name=p62 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 440 -210 2 0 {name=Msw_R
l=0.34u
w=5u
ng=4
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 230 -120 2 1 {name=Msw_M
l=0.34u
w=5u
ng=4
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 420 -150 2 1 {name=p64 lab=c_hum}
C {sg13g2_pr/sg13_lv_pmos.sym} 50 -160 0 0 {name=M10
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 50 -80 2 1 {name=M11
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 260 -100 0 1 {name=p65 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 410 -190 0 0 {name=p66 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 250 -210 0 0 {name=C2
model=cap_cmim
w=6.99e-6
l=6.99e-6
m=1
spiceprefix=X}
C {iopin.sym} 340 -260 2 1 {name=p1 lab=vc}
C {ipin.sym} 480 -210 2 0 {name=p4 lab=sel_hum}
C {iopin.sym} 70 -210 2 1 {name=p2 lab=vdd}
C {iopin.sym} 70 -30 2 1 {name=p3 lab=gnd}
