v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {ctat_div - escala VBE1 por CA1/(CA1+CA2)} -560 -360 0 0 0.4 0.4 {}
C {ipin.sym} -560 -200 0 0 {name=p1 lab=vbe1}
C {ipin.sym} -560 -160 0 0 {name=p2 lab=vp1}
C {ipin.sym} -560 -120 0 0 {name=p3 lab=vp1b}
C {ipin.sym} -560 -80 0 0 {name=p4 lab=vp2}
C {ipin.sym} -560 -40 0 0 {name=p5 lab=vp2b}
C {opin.sym} -560 0 0 0 {name=p6 lab=vctat}
C {iopin.sym} -560 40 0 0 {name=p7 lab=vdd2x}
C {iopin.sym} -560 80 0 0 {name=p8 lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 -160 0 0 {name=x7}
N -150 -160 -180 -160 {lab=vbe1}
C {lab_pin.sym} -180 -160 0 0 {name=l9 sig_type=std_logic lab=vbe1}
N -70 -160 -40 -160 {lab=vctat}
C {lab_pin.sym} -40 -160 2 0 {name=l10 sig_type=std_logic lab=vctat}
N -110 -190 -110 -220 {lab=vp2}
C {lab_pin.sym} -110 -220 0 0 {name=l11 sig_type=std_logic lab=vp2}
N -110 -130 -110 -100 {lab=vp2b}
C {lab_pin.sym} -110 -100 0 0 {name=l12 sig_type=std_logic lab=vp2b}
N -90 -190 -90 -220 {lab=vdd2x}
C {lab_pin.sym} -90 -220 2 0 {name=l13 sig_type=std_logic lab=vdd2x}
N -90 -130 -90 -100 {lab=gnd}
C {lab_pin.sym} -90 -100 2 0 {name=l14 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 40 0 0 {name=x17}
N -150 40 -180 40 {lab=vctat}
C {lab_pin.sym} -180 40 0 0 {name=l15 sig_type=std_logic lab=vctat}
N -70 40 -40 40 {lab=n4}
C {lab_pin.sym} -40 40 2 0 {name=l16 sig_type=std_logic lab=n4}
N -110 10 -110 -20 {lab=vp1}
C {lab_pin.sym} -110 -20 0 0 {name=l17 sig_type=std_logic lab=vp1}
N -110 70 -110 100 {lab=vp1b}
C {lab_pin.sym} -110 100 0 0 {name=l18 sig_type=std_logic lab=vp1b}
N -90 10 -90 -20 {lab=vdd2x}
C {lab_pin.sym} -90 -20 2 0 {name=l19 sig_type=std_logic lab=vdd2x}
N -90 70 -90 100 {lab=gnd}
C {lab_pin.sym} -90 100 2 0 {name=l20 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 240 0 0 {name=x18}
N -150 240 -180 240 {lab=gnd}
C {lab_pin.sym} -180 240 0 0 {name=l21 sig_type=std_logic lab=gnd}
N -70 240 -40 240 {lab=n4}
C {lab_pin.sym} -40 240 2 0 {name=l22 sig_type=std_logic lab=n4}
N -110 210 -110 180 {lab=vp2}
C {lab_pin.sym} -110 180 0 0 {name=l23 sig_type=std_logic lab=vp2}
N -110 270 -110 300 {lab=vp2b}
C {lab_pin.sym} -110 300 0 0 {name=l24 sig_type=std_logic lab=vp2b}
N -90 210 -90 180 {lab=vdd2x}
C {lab_pin.sym} -90 180 2 0 {name=l25 sig_type=std_logic lab=vdd2x}
N -90 270 -90 300 {lab=gnd}
C {lab_pin.sym} -90 300 2 0 {name=l26 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 200 -60 0 0 {name=Ca2
model=cap_cmim
w=32.61e-6
l=32.61e-6
m=1
spiceprefix=X}
N 200 -90 200 -110 {lab=vctat}
C {lab_pin.sym} 200 -110 0 0 {name=l27 sig_type=std_logic lab=vctat}
N 200 -30 200 -10 {lab=gnd}
C {lab_pin.sym} 200 -10 0 0 {name=l28 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 380 -60 0 0 {name=Ca1
model=cap_cmim
w=25.77e-6
l=25.77e-6
m=1
spiceprefix=X}
N 380 -90 380 -110 {lab=n4}
C {lab_pin.sym} 380 -110 0 0 {name=l29 sig_type=std_logic lab=n4}
N 380 -30 380 -10 {lab=gnd}
C {lab_pin.sym} 380 -10 0 0 {name=l30 sig_type=std_logic lab=gnd}
