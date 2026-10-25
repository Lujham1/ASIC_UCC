v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 410 -210 410 -190 {
lab=gnd}
N 460 -210 480 -210 {
lab=sel_ntc}
N 340 -260 340 -240 {
lab=r}
N 410 -210 420 -210 {
lab=gnd}
N 250 -210 260 -210 {
lab=gnd}
N 340 -240 420 -240 {
lab=r}
N 250 -240 340 -240 {
lab=r}
N 420 -180 420 -150 {
lab=r_ntc}
N 260 -210 260 -190 {
lab=gnd}
N 250 -90 250 -70 {
lab=gnd}
N 260 -120 260 -100 {
lab=gnd}
N 250 -120 260 -120 {
lab=gnd}
N 250 -180 250 -150 {
lab=#net1}
N 80 -210 80 -190 {
lab=vdd}
N 80 -50 80 -30 {
lab=gnd}
N 80 -160 90 -160 {
lab=vdd}
N 90 -190 90 -160 {
lab=vdd}
N 80 -190 90 -190 {
lab=vdd}
N 80 -80 90 -80 {
lab=gnd}
N 90 -80 90 -50 {
lab=gnd}
N 80 -50 90 -50 {
lab=gnd}
N 40 -120 40 -80 {
lab=sel_ntc}
N 10 -120 40 -120 {
lab=sel_ntc}
N 40 -160 40 -120 {
lab=sel_ntc}
N 80 -120 80 -110 {
lab=#net2}
N 10 -120 10 -10 {
lab=sel_ntc}
N 80 -120 210 -120 {
lab=#net2}
N 80 -130 80 -120 {
lab=#net2}
N 80 -210 210 -210 {
lab=vdd}
N 10 -10 480 -10 {
lab=sel_ntc}
N 480 -210 480 -10 {
lab=sel_ntc}
C {sg13g2_pr/sg13_lv_nmos.sym} 440 -210 2 0 {name=Msw_R5
l=0.34u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 480 -210 2 1 {name=p70 lab=sel_ntc}
C {sg13g2_pr/sg13_lv_nmos.sym} 230 -210 2 1 {name=M_R1
l=0.13u
w=3.6u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 420 -150 2 1 {name=p71 lab=r_ntc}
C {lab_pin.sym} 260 -190 0 1 {name=p72 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 250 -70 0 1 {name=p73 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 230 -120 2 1 {name=Msw_M1
l=0.34u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 260 -100 0 1 {name=p74 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 -160 0 0 {name=M12
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 60 -80 2 1 {name=M13
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 410 -190 0 0 {name=p75 sig_type=std_logic lab=gnd}
C {iopin.sym} 340 -260 2 1 {name=p2 lab=r}
C {iopin.sym} 140 -210 1 1 {name=p1 lab=vdd}
C {iopin.sym} 80 -30 2 1 {name=p3 lab=gnd}
