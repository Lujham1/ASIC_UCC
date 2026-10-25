v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {vref_hold - transfiere la pila a Cref en phi1} -560 -360 0 0 0.4 0.4 {}
C {iopin.sym} -560 -200 0 0 {name=p1 lab=vin}
C {ipin.sym} -560 -160 0 0 {name=p2 lab=vp1}
C {ipin.sym} -560 -120 0 0 {name=p3 lab=vp1b}
C {opin.sym} -560 -80 0 0 {name=p4 lab=vref}
C {iopin.sym} -560 -40 0 0 {name=p5 lab=vdd2x}
C {iopin.sym} -560 0 0 0 {name=p6 lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 -40 0 0 {name=x16}
N -150 -40 -180 -40 {lab=vref}
C {lab_pin.sym} -180 -40 0 0 {name=l7 sig_type=std_logic lab=vref}
N -70 -40 -40 -40 {lab=vin}
C {lab_pin.sym} -40 -40 2 0 {name=l8 sig_type=std_logic lab=vin}
N -110 -70 -110 -100 {lab=vp1}
C {lab_pin.sym} -110 -100 0 0 {name=l9 sig_type=std_logic lab=vp1}
N -110 -10 -110 20 {lab=vp1b}
C {lab_pin.sym} -110 20 0 0 {name=l10 sig_type=std_logic lab=vp1b}
N -90 -70 -90 -100 {lab=vdd2x}
C {lab_pin.sym} -90 -100 2 0 {name=l11 sig_type=std_logic lab=vdd2x}
N -90 -10 -90 20 {lab=gnd}
C {lab_pin.sym} -90 20 2 0 {name=l12 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 200 -60 0 0 {name=Cref
model=cap_cmim
w=63.19e-6
l=63.19e-6
m=1
spiceprefix=X}
N 200 -90 200 -110 {lab=vref}
C {lab_pin.sym} 200 -110 0 0 {name=l13 sig_type=std_logic lab=vref}
N 200 -30 200 -10 {lab=gnd}
C {lab_pin.sym} 200 -10 0 0 {name=l14 sig_type=std_logic lab=gnd}
