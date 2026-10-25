v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {sc_bias - carga Cf desde vin en phi1 y la vuelca en vbe en phi2} -560 -360 0 0 0.4 0.4 {}
C {ipin.sym} -560 -200 0 0 {name=p1 lab=vin}
C {ipin.sym} -560 -160 0 0 {name=p2 lab=vp1}
C {ipin.sym} -560 -120 0 0 {name=p3 lab=vp1b}
C {ipin.sym} -560 -80 0 0 {name=p4 lab=vp2}
C {ipin.sym} -560 -40 0 0 {name=p5 lab=vp2b}
C {opin.sym} -560 0 0 0 {name=p6 lab=vbe}
C {iopin.sym} -560 40 0 0 {name=p7 lab=vdd2x}
C {iopin.sym} -560 80 0 0 {name=p8 lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 -160 0 0 {name=x1}
N -150 -160 -180 -160 {lab=vin}
C {lab_pin.sym} -180 -160 0 0 {name=l9 sig_type=std_logic lab=vin}
N -70 -160 -40 -160 {lab=n_top}
C {lab_pin.sym} -40 -160 2 0 {name=l10 sig_type=std_logic lab=n_top}
N -110 -190 -110 -220 {lab=vp1}
C {lab_pin.sym} -110 -220 0 0 {name=l11 sig_type=std_logic lab=vp1}
N -110 -130 -110 -100 {lab=vp1b}
C {lab_pin.sym} -110 -100 0 0 {name=l12 sig_type=std_logic lab=vp1b}
N -90 -190 -90 -220 {lab=vdd2x}
C {lab_pin.sym} -90 -220 2 0 {name=l13 sig_type=std_logic lab=vdd2x}
N -90 -130 -90 -100 {lab=gnd}
C {lab_pin.sym} -90 -100 2 0 {name=l14 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 260 -160 0 0 {name=x2}
N 110 -160 80 -160 {lab=n_top}
C {lab_pin.sym} 80 -160 0 0 {name=l15 sig_type=std_logic lab=n_top}
N 190 -160 220 -160 {lab=vbe}
C {lab_pin.sym} 220 -160 2 0 {name=l16 sig_type=std_logic lab=vbe}
N 150 -190 150 -220 {lab=vp2}
C {lab_pin.sym} 150 -220 0 0 {name=l17 sig_type=std_logic lab=vp2}
N 150 -130 150 -100 {lab=vp2b}
C {lab_pin.sym} 150 -100 0 0 {name=l18 sig_type=std_logic lab=vp2b}
N 170 -190 170 -220 {lab=vdd2x}
C {lab_pin.sym} 170 -220 2 0 {name=l19 sig_type=std_logic lab=vdd2x}
N 170 -130 170 -100 {lab=gnd}
C {lab_pin.sym} 170 -100 2 0 {name=l20 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 60 0 0 {name=x3}
N -150 60 -180 60 {lab=vin}
C {lab_pin.sym} -180 60 0 0 {name=l21 sig_type=std_logic lab=vin}
N -70 60 -40 60 {lab=n_bot}
C {lab_pin.sym} -40 60 2 0 {name=l22 sig_type=std_logic lab=n_bot}
N -110 30 -110 0 {lab=vp2}
C {lab_pin.sym} -110 0 0 0 {name=l23 sig_type=std_logic lab=vp2}
N -110 90 -110 120 {lab=vp2b}
C {lab_pin.sym} -110 120 0 0 {name=l24 sig_type=std_logic lab=vp2b}
N -90 30 -90 0 {lab=vdd2x}
C {lab_pin.sym} -90 0 2 0 {name=l25 sig_type=std_logic lab=vdd2x}
N -90 90 -90 120 {lab=gnd}
C {lab_pin.sym} -90 120 2 0 {name=l26 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 320 80 0 0 {name=M11
l=0.130u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 340 50 420 50 {lab=gnd}
C {lab_pin.sym} 420 50 2 0 {name=l27 sig_type=std_logic lab=gnd}
N 300 80 260 80 {lab=vp1}
C {lab_pin.sym} 260 80 0 0 {name=l28 sig_type=std_logic lab=vp1}
N 340 110 420 110 {lab=n_bot}
C {lab_pin.sym} 420 110 2 0 {name=l29 sig_type=std_logic lab=n_bot}
N 340 80 420 80 {lab=gnd}
C {lab_pin.sym} 420 80 2 0 {name=l30 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 640 -60 0 0 {name=Cf
model=cap_cmim
w=36.46e-6
l=36.46e-6
m=1
spiceprefix=X}
N 640 -90 640 -110 {lab=n_top}
C {lab_pin.sym} 640 -110 0 0 {name=l31 sig_type=std_logic lab=n_top}
N 640 -30 640 -10 {lab=n_bot}
C {lab_pin.sym} 640 -10 0 0 {name=l32 sig_type=std_logic lab=n_bot}
C {sg13g2_pr/cap_cmim.sym} 820 -60 0 0 {name=CL
model=cap_cmim
w=36.46e-6
l=36.46e-6
m=1
spiceprefix=X}
N 820 -90 820 -110 {lab=vbe}
C {lab_pin.sym} 820 -110 0 0 {name=l33 sig_type=std_logic lab=vbe}
N 820 -30 820 -10 {lab=gnd}
C {lab_pin.sym} 820 -10 0 0 {name=l34 sig_type=std_logic lab=gnd}
