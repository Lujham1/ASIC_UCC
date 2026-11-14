v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {osc_relax - nucleo del oscilador de relajacion + buffer + reset} -700 -420 0 0 0.4 0.4 {}
C {ipin.sym} -700 -300 0 0 {name=p1 lab=vbias}
C {ipin.sym} -700 -260 0 0 {name=p2 lab=g_mt2}
C {iopin.sym} -700 -220 0 0 {name=p3 lab=s_m0}
C {iopin.sym} -700 -180 0 0 {name=p4 lab=s_m1}
C {opin.sym} -700 -140 0 0 {name=p5 lab=vrst}
C {iopin.sym} -700 -100 0 0 {name=p6 lab=vdd}
C {iopin.sym} -700 -60 0 0 {name=p7 lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -300 -200 0 0 {name=MT3
l=1u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -280 -170 -200 -170 {lab=n_ref}
C {lab_pin.sym} -200 -170 2 0 {name=l8 sig_type=std_logic lab=n_ref}
N -320 -200 -360 -200 {lab=vbias}
C {lab_pin.sym} -360 -200 0 0 {name=l9 sig_type=std_logic lab=vbias}
N -280 -230 -200 -230 {lab=vdd}
C {lab_pin.sym} -200 -230 2 0 {name=l10 sig_type=std_logic lab=vdd}
N -280 -200 -200 -200 {lab=vdd}
C {lab_pin.sym} -200 -200 2 0 {name=l11 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -200 0 0 {name=MT2
l=1u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 20 -170 100 -170 {lab=n_cmp}
C {lab_pin.sym} 100 -170 2 0 {name=l12 sig_type=std_logic lab=n_cmp}
N -20 -200 -60 -200 {lab=g_mt2}
C {lab_pin.sym} -60 -200 0 0 {name=l13 sig_type=std_logic lab=g_mt2}
N 20 -230 100 -230 {lab=vdd}
C {lab_pin.sym} 100 -230 2 0 {name=l14 sig_type=std_logic lab=vdd}
N 20 -200 100 -200 {lab=vdd}
C {lab_pin.sym} 100 -200 2 0 {name=l15 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 0 0 0 {name=M0
l=1.2u
w=5.1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 -30 -200 -30 {lab=n_ref}
C {lab_pin.sym} -200 -30 2 0 {name=l16 sig_type=std_logic lab=n_ref}
N -320 0 -360 0 {lab=n_ref}
C {lab_pin.sym} -360 0 0 0 {name=l17 sig_type=std_logic lab=n_ref}
N -280 30 -200 30 {lab=s_m0}
C {lab_pin.sym} -200 30 2 0 {name=l18 sig_type=std_logic lab=s_m0}
N -280 0 -200 0 {lab=gnd}
C {lab_pin.sym} -200 0 2 0 {name=l19 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 0 0 0 {name=M1
l=1.2u
w=5.1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 20 -30 100 -30 {lab=n_cmp}
C {lab_pin.sym} 100 -30 2 0 {name=l20 sig_type=std_logic lab=n_cmp}
N -20 0 -60 0 {lab=n_ref}
C {lab_pin.sym} -60 0 0 0 {name=l21 sig_type=std_logic lab=n_ref}
N 20 30 100 30 {lab=s_m1}
C {lab_pin.sym} 100 30 2 0 {name=l22 sig_type=std_logic lab=s_m1}
N 20 0 100 0 {lab=gnd}
C {lab_pin.sym} 100 0 2 0 {name=l23 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 300 -200 0 0 {name=Mpbuf1
l=0.34u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 320 -170 400 -170 {lab=n_buf}
C {lab_pin.sym} 400 -170 2 0 {name=l24 sig_type=std_logic lab=n_buf}
N 280 -200 240 -200 {lab=n_cmp}
C {lab_pin.sym} 240 -200 0 0 {name=l25 sig_type=std_logic lab=n_cmp}
N 320 -230 400 -230 {lab=vdd}
C {lab_pin.sym} 400 -230 2 0 {name=l26 sig_type=std_logic lab=vdd}
N 320 -200 400 -200 {lab=vdd}
C {lab_pin.sym} 400 -200 2 0 {name=l27 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 300 0 0 0 {name=Mnbuf1
l=0.34u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 320 -30 400 -30 {lab=n_buf}
C {lab_pin.sym} 400 -30 2 0 {name=l28 sig_type=std_logic lab=n_buf}
N 280 0 240 0 {lab=n_cmp}
C {lab_pin.sym} 240 0 0 0 {name=l29 sig_type=std_logic lab=n_cmp}
N 320 30 400 30 {lab=gnd}
C {lab_pin.sym} 400 30 2 0 {name=l30 sig_type=std_logic lab=gnd}
N 320 0 400 0 {lab=gnd}
C {lab_pin.sym} 400 0 2 0 {name=l31 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 500 -100 0 0 {name=CD
model=cap_cmim
w=44.67e-6
l=44.67e-6
m=1
spiceprefix=X}
N 500 -130 500 -150 {lab=n_buf}
C {lab_pin.sym} 500 -150 0 0 {name=l32 sig_type=std_logic lab=n_buf}
N 500 -70 500 -50 {lab=gnd}
C {lab_pin.sym} 500 -50 0 0 {name=l33 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 700 -200 0 0 {name=Mpbuf2
l=0.34u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 720 -170 800 -170 {lab=vrst}
C {lab_pin.sym} 800 -170 2 0 {name=l34 sig_type=std_logic lab=vrst}
N 680 -200 640 -200 {lab=n_buf}
C {lab_pin.sym} 640 -200 0 0 {name=l35 sig_type=std_logic lab=n_buf}
N 720 -230 800 -230 {lab=vdd}
C {lab_pin.sym} 800 -230 2 0 {name=l36 sig_type=std_logic lab=vdd}
N 720 -200 800 -200 {lab=vdd}
C {lab_pin.sym} 800 -200 2 0 {name=l37 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 700 0 0 0 {name=Mnbuf2
l=0.34u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 720 -30 800 -30 {lab=vrst}
C {lab_pin.sym} 800 -30 2 0 {name=l38 sig_type=std_logic lab=vrst}
N 680 0 640 0 {lab=n_buf}
C {lab_pin.sym} 640 0 0 0 {name=l39 sig_type=std_logic lab=n_buf}
N 720 30 800 30 {lab=gnd}
C {lab_pin.sym} 800 30 2 0 {name=l40 sig_type=std_logic lab=gnd}
N 720 0 800 0 {lab=gnd}
C {lab_pin.sym} 800 0 2 0 {name=l41 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 700 200 0 0 {name=Ms1
l=1.2u
w=60u
ng=12
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 720 170 800 170 {lab=s_m1}
C {lab_pin.sym} 800 170 2 0 {name=l42 sig_type=std_logic lab=s_m1}
N 680 200 640 200 {lab=vrst}
C {lab_pin.sym} 640 200 0 0 {name=l43 sig_type=std_logic lab=vrst}
N 720 230 800 230 {lab=gnd}
C {lab_pin.sym} 800 230 2 0 {name=l44 sig_type=std_logic lab=gnd}
N 720 200 800 200 {lab=gnd}
C {lab_pin.sym} 800 200 2 0 {name=l45 sig_type=std_logic lab=gnd}
T {Vbias = 0.372 V (celda ref_vbias). S_M0 -> Rref / Rsens por llaves_rc; S_M1 -> C1 / Csens por llaves_rc.
CD = 3 pF en la salida del primer inversor (un MIM).
M1 = ex M9 (5.1/1.2). Ms1 (60/1.2, 12 dedos de 5 um) descarga S_M1 cuando vrst = 1.} -700 140 0 0 0.25 0.25 {layer=8}
