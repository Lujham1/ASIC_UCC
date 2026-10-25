v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {bjt_pair - Q1 (Nx=1) y Q2 (Nx=8) en diodo} -560 -360 0 0 0.4 0.4 {}
C {iopin.sym} -560 -200 0 0 {name=p1 lab=vbe1}
C {iopin.sym} -560 -160 0 0 {name=p2 lab=vbe2}
C {iopin.sym} -560 -120 0 0 {name=p3 lab=gnd}
C {sg13g2_pr/npn13G2.sym} -100 0 0 0 {name=Q1
model=npn13G2
spiceprefix=X
Nx=1
le=900e-9}
N -80 -30 0 -30 {lab=vbe1}
C {lab_pin.sym} 0 -30 2 0 {name=l4 sig_type=std_logic lab=vbe1}
N -120 0 -160 0 {lab=vbe1}
C {lab_pin.sym} -160 0 0 0 {name=l5 sig_type=std_logic lab=vbe1}
N -80 30 0 30 {lab=gnd}
C {lab_pin.sym} 0 30 2 0 {name=l6 sig_type=std_logic lab=gnd}
N -80 0 0 0 {lab=gnd}
C {lab_pin.sym} 0 0 2 0 {name=l7 sig_type=std_logic lab=gnd}
C {sg13g2_pr/npn13G2.sym} 260 0 0 0 {name=Q2
model=npn13G2
spiceprefix=X
Nx=8
le=900e-9}
N 280 -30 360 -30 {lab=vbe2}
C {lab_pin.sym} 360 -30 2 0 {name=l8 sig_type=std_logic lab=vbe2}
N 240 0 200 0 {lab=vbe2}
C {lab_pin.sym} 200 0 0 0 {name=l9 sig_type=std_logic lab=vbe2}
N 280 30 360 30 {lab=gnd}
C {lab_pin.sym} 360 30 2 0 {name=l10 sig_type=std_logic lab=gnd}
N 280 0 360 0 {lab=gnd}
C {lab_pin.sym} 360 0 2 0 {name=l11 sig_type=std_logic lab=gnd}
