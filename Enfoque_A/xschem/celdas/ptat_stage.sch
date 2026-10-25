v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {ptat_stage - phi2: CB en paralelo (dVBE); phi1: CB en serie con la etapa anterior} -560 -360 0 0 0.4 0.4 {}
C {iopin.sym} -560 -200 0 0 {name=p1 lab=top_prev}
C {iopin.sym} -560 -160 0 0 {name=p2 lab=bot_prev}
C {ipin.sym} -560 -120 0 0 {name=p3 lab=vp1}
C {ipin.sym} -560 -80 0 0 {name=p4 lab=vp1b}
C {ipin.sym} -560 -40 0 0 {name=p5 lab=vp2}
C {ipin.sym} -560 0 0 0 {name=p6 lab=vp2b}
C {iopin.sym} -560 40 0 0 {name=p7 lab=top}
C {iopin.sym} -560 80 0 0 {name=p8 lab=bot}
C {iopin.sym} -560 120 0 0 {name=p9 lab=vdd2x}
C {iopin.sym} -560 160 0 0 {name=p10 lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 -160 0 0 {name=xtop}
N -150 -160 -180 -160 {lab=top}
C {lab_pin.sym} -180 -160 0 0 {name=l11 sig_type=std_logic lab=top}
N -70 -160 -40 -160 {lab=top_prev}
C {lab_pin.sym} -40 -160 2 0 {name=l12 sig_type=std_logic lab=top_prev}
N -110 -190 -110 -220 {lab=vp2}
C {lab_pin.sym} -110 -220 0 0 {name=l13 sig_type=std_logic lab=vp2}
N -110 -130 -110 -100 {lab=vp2b}
C {lab_pin.sym} -110 -100 0 0 {name=l14 sig_type=std_logic lab=vp2b}
N -90 -190 -90 -220 {lab=vdd2x}
C {lab_pin.sym} -90 -220 2 0 {name=l15 sig_type=std_logic lab=vdd2x}
N -90 -130 -90 -100 {lab=gnd}
C {lab_pin.sym} -90 -100 2 0 {name=l16 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 40 0 0 {name=xbot}
N -150 40 -180 40 {lab=bot}
C {lab_pin.sym} -180 40 0 0 {name=l17 sig_type=std_logic lab=bot}
N -70 40 -40 40 {lab=bot_prev}
C {lab_pin.sym} -40 40 2 0 {name=l18 sig_type=std_logic lab=bot_prev}
N -110 10 -110 -20 {lab=vp2}
C {lab_pin.sym} -110 -20 0 0 {name=l19 sig_type=std_logic lab=vp2}
N -110 70 -110 100 {lab=vp2b}
C {lab_pin.sym} -110 100 0 0 {name=l20 sig_type=std_logic lab=vp2b}
N -90 10 -90 -20 {lab=vdd2x}
C {lab_pin.sym} -90 -20 2 0 {name=l21 sig_type=std_logic lab=vdd2x}
N -90 70 -90 100 {lab=gnd}
C {lab_pin.sym} -90 100 2 0 {name=l22 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/Ll.sym} 0 240 0 0 {name=xser}
N -150 240 -180 240 {lab=bot}
C {lab_pin.sym} -180 240 0 0 {name=l23 sig_type=std_logic lab=bot}
N -70 240 -40 240 {lab=top_prev}
C {lab_pin.sym} -40 240 2 0 {name=l24 sig_type=std_logic lab=top_prev}
N -110 210 -110 180 {lab=vp1}
C {lab_pin.sym} -110 180 0 0 {name=l25 sig_type=std_logic lab=vp1}
N -110 270 -110 300 {lab=vp1b}
C {lab_pin.sym} -110 300 0 0 {name=l26 sig_type=std_logic lab=vp1b}
N -90 210 -90 180 {lab=vdd2x}
C {lab_pin.sym} -90 180 2 0 {name=l27 sig_type=std_logic lab=vdd2x}
N -90 270 -90 300 {lab=gnd}
C {lab_pin.sym} -90 300 2 0 {name=l28 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 200 -60 0 0 {name=Cb
model=cap_cmim
w=23.04e-6
l=23.04e-6
m=1
spiceprefix=X}
N 200 -90 200 -110 {lab=top}
C {lab_pin.sym} 200 -110 0 0 {name=l29 sig_type=std_logic lab=top}
N 200 -30 200 -10 {lab=bot}
C {lab_pin.sym} 200 -10 0 0 {name=l30 sig_type=std_logic lab=bot}
