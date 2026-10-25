v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 130 -340 140 -340 {
lab=vdd}
N 140 -340 140 -310 {
lab=vdd}
N 130 -310 140 -310 {
lab=vdd}
N 130 -370 130 -340 {
lab=vdd}
N 270 -340 280 -340 {
lab=vdd}
N 280 -340 280 -310 {
lab=vdd}
N 270 -310 280 -310 {
lab=vdd}
N 270 -370 270 -340 {
lab=vdd}
N 460 -330 470 -330 {
lab=vdd}
N 470 -330 470 -300 {
lab=vdd}
N 460 -300 470 -300 {
lab=vdd}
N 600 -330 610 -330 {
lab=vdd}
N 610 -330 610 -300 {
lab=vdd}
N 600 -300 610 -300 {
lab=vdd}
N 460 -200 470 -200 {
lab=gnd}
N 460 -170 470 -170 {
lab=gnd}
N 470 -200 470 -170 {
lab=gnd}
N 460 -170 460 -150 {
lab=gnd}
N 600 -200 610 -200 {
lab=gnd}
N 600 -170 610 -170 {
lab=gnd}
N 610 -200 610 -170 {
lab=gnd}
N 600 -170 600 -150 {
lab=gnd}
N 70 -310 90 -310 {
lab=vbias}
N 270 -250 270 -210 {
lab=#net1}
N 420 -250 420 -200 {
lab=#net1}
N 270 -180 280 -180 {
lab=gnd}
N 120 -180 130 -180 {
lab=gnd}
N 200 -180 230 -180 {
lab=#net2}
N 130 -210 200 -210 {
lab=#net2}
N 200 -210 200 -180 {
lab=#net2}
N 170 -180 200 -180 {
lab=#net2}
N 600 -250 600 -230 {
lab=vrst}
N 460 -250 460 -230 {
lab=#net3}
N 560 -250 560 -200 {
lab=#net3}
N 270 -280 270 -250 {
lab=#net1}
N 420 -300 420 -250 {
lab=#net1}
N 600 -250 690 -250 {
lab=vrst}
N 600 -270 600 -250 {
lab=vrst}
N 230 -310 230 -260 {
lab=vg_mt2}
N 280 -180 280 -140 {
lab=gnd}
N 120 -180 120 -140 {
lab=gnd}
N 480 -80 690 -80 {
lab=vrst}
N 270 -150 270 -110 {
lab=vc}
N 690 -250 690 -80 {
lab=vrst}
N 440 -50 440 -30 {
lab=gnd}
N 130 -150 130 -110 {
lab=r}
N 270 -250 420 -250 {
lab=#net1}
N 130 -280 130 -210 {
lab=#net2}
N 430 -80 440 -80 {
lab=gnd}
N 270 -110 440 -110 {
lab=vc}
N 430 -80 430 -50 {
lab=gnd}
N 430 -50 440 -50 {
lab=gnd}
N 460 -250 560 -250 {
lab=#net3}
N 460 -270 460 -250 {
lab=#net3}
N 560 -300 560 -250 {
lab=#net3}
N 460 -370 600 -370 {lab=vdd}
N 130 -370 270 -370 {lab=vdd}
N 600 -370 600 -330 {lab=vdd}
N 460 -370 460 -330 {lab=vdd}
N 270 -370 460 -370 {lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 110 -310 0 0 {name=MT3
l=1u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 250 -310 0 0 {name=MT2
l=1u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 250 -180 2 1 {name=M9
l=1.2u
w=5.1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 150 -180 2 0 {name=M0
l=1.2u
w=5.1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 580 -300 0 0 {name=Mpbuf2
l=0.34u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 440 -200 2 1 {name=Mnbuf1
l=0.34u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 580 -200 2 1 {name=Mnbuf2
l=0.34u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 460 -80 2 0 {name=Ms1
l=1.2u
w=20u
ng=4
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 440 -300 0 0 {name=Mpbuf1
l=0.34u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 460 -150 0 0 {name=p54 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 600 -150 0 0 {name=p55 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 280 -140 0 1 {name=p56 sig_type=std_logic lab=gnd}
C {iopin.sym} 270 -110 2 0 {name=p57 lab=vc}
C {iopin.sym} 130 -110 2 0 {name=p61 lab=r}
C {lab_pin.sym} 130 -370 0 0 {name=p79 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 120 -140 0 0 {name=p58 sig_type=std_logic lab=gnd}
C {iopin.sym} 390 -370 3 0 {name=p1 lab=vdd
}
C {iopin.sym} 440 -30 2 0 {name=p2 lab=gnd}
C {ipin.sym} 70 -310 0 0 {name=p5 lab=vbias}
C {ipin.sym} 230 -260 0 0 {name=p6 lab=vg_mt2}
C {opin.sym} 690 -170 0 0 {name=p7 lab=vrst}
