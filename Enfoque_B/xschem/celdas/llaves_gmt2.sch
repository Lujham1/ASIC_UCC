v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {llaves_gmt2 - llaves de paso (TG) hacia G_MT2} -700 -420 0 0 0.4 0.4 {}
C {iopin.sym} -700 -300 0 0 {name=p1 lab=s_mpmos}
C {iopin.sym} -700 -260 0 0 {name=p2 lab=vbias}
C {iopin.sym} -700 -220 0 0 {name=p3 lab=s_mtr1}
C {ipin.sym} -700 -180 0 0 {name=p4 lab=sel0}
C {ipin.sym} -700 -140 0 0 {name=p5 lab=u}
C {ipin.sym} -700 -100 0 0 {name=p6 lab=sel1}
C {ipin.sym} -700 -60 0 0 {name=p7 lab=t}
C {ipin.sym} -700 -20 0 0 {name=p8 lab=sel2}
C {ipin.sym} -700 20 0 0 {name=p9 lab=v}
C {iopin.sym} -700 60 0 0 {name=p10 lab=g_mt2}
C {iopin.sym} -700 100 0 0 {name=p11 lab=vdd}
C {iopin.sym} -700 140 0 0 {name=p12 lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -100 -260 0 0 {name=MN19
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -80 -290 0 -290 {lab=s_mpmos}
C {lab_pin.sym} 0 -290 2 0 {name=l13 sig_type=std_logic lab=s_mpmos}
N -120 -260 -160 -260 {lab=sel0}
C {lab_pin.sym} -160 -260 0 0 {name=l14 sig_type=std_logic lab=sel0}
N -80 -230 0 -230 {lab=g_mt2}
C {lab_pin.sym} 0 -230 2 0 {name=l15 sig_type=std_logic lab=g_mt2}
N -80 -260 0 -260 {lab=gnd}
C {lab_pin.sym} 0 -260 2 0 {name=l16 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 200 -260 0 0 {name=MP19
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 220 -230 300 -230 {lab=s_mpmos}
C {lab_pin.sym} 300 -230 2 0 {name=l17 sig_type=std_logic lab=s_mpmos}
N 180 -260 140 -260 {lab=u}
C {lab_pin.sym} 140 -260 0 0 {name=l18 sig_type=std_logic lab=u}
N 220 -290 300 -290 {lab=g_mt2}
C {lab_pin.sym} 300 -290 2 0 {name=l19 sig_type=std_logic lab=g_mt2}
N 220 -260 300 -260 {lab=vdd}
C {lab_pin.sym} 300 -260 2 0 {name=l20 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -100 -40 0 0 {name=MN20
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -80 -70 0 -70 {lab=vbias}
C {lab_pin.sym} 0 -70 2 0 {name=l21 sig_type=std_logic lab=vbias}
N -120 -40 -160 -40 {lab=sel1}
C {lab_pin.sym} -160 -40 0 0 {name=l22 sig_type=std_logic lab=sel1}
N -80 -10 0 -10 {lab=g_mt2}
C {lab_pin.sym} 0 -10 2 0 {name=l23 sig_type=std_logic lab=g_mt2}
N -80 -40 0 -40 {lab=gnd}
C {lab_pin.sym} 0 -40 2 0 {name=l24 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 200 -40 0 0 {name=MP20
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 220 -10 300 -10 {lab=vbias}
C {lab_pin.sym} 300 -10 2 0 {name=l25 sig_type=std_logic lab=vbias}
N 180 -40 140 -40 {lab=t}
C {lab_pin.sym} 140 -40 0 0 {name=l26 sig_type=std_logic lab=t}
N 220 -70 300 -70 {lab=g_mt2}
C {lab_pin.sym} 300 -70 2 0 {name=l27 sig_type=std_logic lab=g_mt2}
N 220 -40 300 -40 {lab=vdd}
C {lab_pin.sym} 300 -40 2 0 {name=l28 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -100 180 0 0 {name=MN21
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -80 150 0 150 {lab=s_mtr1}
C {lab_pin.sym} 0 150 2 0 {name=l29 sig_type=std_logic lab=s_mtr1}
N -120 180 -160 180 {lab=sel2}
C {lab_pin.sym} -160 180 0 0 {name=l30 sig_type=std_logic lab=sel2}
N -80 210 0 210 {lab=g_mt2}
C {lab_pin.sym} 0 210 2 0 {name=l31 sig_type=std_logic lab=g_mt2}
N -80 180 0 180 {lab=gnd}
C {lab_pin.sym} 0 180 2 0 {name=l32 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 200 180 0 0 {name=MP21
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 220 210 300 210 {lab=s_mtr1}
C {lab_pin.sym} 300 210 2 0 {name=l33 sig_type=std_logic lab=s_mtr1}
N 180 180 140 180 {lab=v}
C {lab_pin.sym} 140 180 0 0 {name=l34 sig_type=std_logic lab=v}
N 220 150 300 150 {lab=g_mt2}
C {lab_pin.sym} 300 150 2 0 {name=l35 sig_type=std_logic lab=g_mt2}
N 220 180 300 180 {lab=vdd}
C {lab_pin.sym} 300 180 2 0 {name=l36 sig_type=std_logic lab=vdd}
C {sg13g2_pr/dantenna.sym} -400 -260 0 0 {name=DA_sel0
model=dantenna
l=0.8u
w=0.8u
spiceprefix=X
}
C {lab_pin.sym} -400 -230 2 0 {name=l37 sig_type=std_logic lab=gnd}
C {lab_pin.sym} -400 -290 0 0 {name=l38 sig_type=std_logic lab=sel0}
C {sg13g2_pr/dantenna.sym} -400 -40 0 0 {name=DA_sel1
model=dantenna
l=0.8u
w=0.8u
spiceprefix=X
}
C {lab_pin.sym} -400 -10 2 0 {name=l39 sig_type=std_logic lab=gnd}
C {lab_pin.sym} -400 -70 0 0 {name=l40 sig_type=std_logic lab=sel1}
C {sg13g2_pr/dantenna.sym} -400 180 0 0 {name=DA_sel2
model=dantenna
l=0.8u
w=0.8u
spiceprefix=X
}
C {lab_pin.sym} -400 210 2 0 {name=l41 sig_type=std_logic lab=gnd}
C {lab_pin.sym} -400 150 0 0 {name=l42 sig_type=std_logic lab=sel2}
C {sg13g2_pr/dantenna.sym} 400 -260 0 0 {name=DA_u
model=dantenna
l=0.8u
w=0.8u
spiceprefix=X
}
C {lab_pin.sym} 400 -230 2 0 {name=l43 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 400 -290 0 0 {name=l44 sig_type=std_logic lab=u}
C {sg13g2_pr/dantenna.sym} 400 -40 0 0 {name=DA_t
model=dantenna
l=0.8u
w=0.8u
spiceprefix=X
}
C {lab_pin.sym} 400 -10 2 0 {name=l45 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 400 -70 0 0 {name=l46 sig_type=std_logic lab=t}
C {sg13g2_pr/dantenna.sym} 400 180 0 0 {name=DA_v
model=dantenna
l=0.8u
w=0.8u
spiceprefix=X
}
C {lab_pin.sym} 400 210 2 0 {name=l47 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 400 150 0 0 {name=l48 sig_type=std_logic lab=v}


