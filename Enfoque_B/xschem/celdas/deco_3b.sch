v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {deco_3b - decodificador de modo (A B C) -> llaves} -700 -420 0 0 0.4 0.4 {}
C {ipin.sym} -700 -400 0 0 {name=p1 lab=a}
C {ipin.sym} -700 -360 0 0 {name=p2 lab=b}
C {ipin.sym} -700 -320 0 0 {name=p3 lab=c}
C {opin.sym} -700 -280 0 0 {name=p4 lab=sel0}
C {opin.sym} -700 -240 0 0 {name=p5 lab=u}
C {opin.sym} -700 -200 0 0 {name=p6 lab=sel1}
C {opin.sym} -700 -160 0 0 {name=p7 lab=t}
C {opin.sym} -700 -120 0 0 {name=p8 lab=sel2}
C {opin.sym} -700 -80 0 0 {name=p9 lab=v}
C {opin.sym} -700 -40 0 0 {name=p10 lab=sel3}
C {opin.sym} -700 0 0 0 {name=p11 lab=sel4}
C {opin.sym} -700 40 0 0 {name=p12 lab=sel5}
C {opin.sym} -700 80 0 0 {name=p13 lab=sel6}
C {iopin.sym} -700 120 0 0 {name=p14 lab=vdd}
C {iopin.sym} -700 160 0 0 {name=p15 lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -300 -400 0 0 {name=MP1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -280 -370 -200 -370 {lab=na}
C {lab_pin.sym} -200 -370 2 0 {name=l16 sig_type=std_logic lab=na}
N -320 -400 -360 -400 {lab=a}
C {lab_pin.sym} -360 -400 0 0 {name=l17 sig_type=std_logic lab=a}
N -280 -430 -200 -430 {lab=vdd}
C {lab_pin.sym} -200 -430 2 0 {name=l18 sig_type=std_logic lab=vdd}
N -280 -400 -200 -400 {lab=vdd}
C {lab_pin.sym} -200 -400 2 0 {name=l19 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 -280 0 0 {name=MN1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 -310 -200 -310 {lab=na}
C {lab_pin.sym} -200 -310 2 0 {name=l20 sig_type=std_logic lab=na}
N -320 -280 -360 -280 {lab=a}
C {lab_pin.sym} -360 -280 0 0 {name=l21 sig_type=std_logic lab=a}
N -280 -250 -200 -250 {lab=gnd}
C {lab_pin.sym} -200 -250 2 0 {name=l22 sig_type=std_logic lab=gnd}
N -280 -280 -200 -280 {lab=gnd}
C {lab_pin.sym} -200 -280 2 0 {name=l23 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -400 0 0 {name=MP2
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 20 -370 100 -370 {lab=nb}
C {lab_pin.sym} 100 -370 2 0 {name=l24 sig_type=std_logic lab=nb}
N -20 -400 -60 -400 {lab=b}
C {lab_pin.sym} -60 -400 0 0 {name=l25 sig_type=std_logic lab=b}
N 20 -430 100 -430 {lab=vdd}
C {lab_pin.sym} 100 -430 2 0 {name=l26 sig_type=std_logic lab=vdd}
N 20 -400 100 -400 {lab=vdd}
C {lab_pin.sym} 100 -400 2 0 {name=l27 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 -280 0 0 {name=MN2
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 20 -310 100 -310 {lab=nb}
C {lab_pin.sym} 100 -310 2 0 {name=l28 sig_type=std_logic lab=nb}
N -20 -280 -60 -280 {lab=b}
C {lab_pin.sym} -60 -280 0 0 {name=l29 sig_type=std_logic lab=b}
N 20 -250 100 -250 {lab=gnd}
C {lab_pin.sym} 100 -250 2 0 {name=l30 sig_type=std_logic lab=gnd}
N 20 -280 100 -280 {lab=gnd}
C {lab_pin.sym} 100 -280 2 0 {name=l31 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 300 -400 0 0 {name=MP3
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 320 -370 400 -370 {lab=nc}
C {lab_pin.sym} 400 -370 2 0 {name=l32 sig_type=std_logic lab=nc}
N 280 -400 240 -400 {lab=c}
C {lab_pin.sym} 240 -400 0 0 {name=l33 sig_type=std_logic lab=c}
N 320 -430 400 -430 {lab=vdd}
C {lab_pin.sym} 400 -430 2 0 {name=l34 sig_type=std_logic lab=vdd}
N 320 -400 400 -400 {lab=vdd}
C {lab_pin.sym} 400 -400 2 0 {name=l35 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 300 -280 0 0 {name=MN3
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 320 -310 400 -310 {lab=nc}
C {lab_pin.sym} 400 -310 2 0 {name=l36 sig_type=std_logic lab=nc}
N 280 -280 240 -280 {lab=c}
C {lab_pin.sym} 240 -280 0 0 {name=l37 sig_type=std_logic lab=c}
N 320 -250 400 -250 {lab=gnd}
C {lab_pin.sym} 400 -250 2 0 {name=l38 sig_type=std_logic lab=gnd}
N 320 -280 400 -280 {lab=gnd}
C {lab_pin.sym} 400 -280 2 0 {name=l39 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -300 -100 0 0 {name=MP4
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -280 -70 -200 -70 {lab=sel1}
C {lab_pin.sym} -200 -70 2 0 {name=l40 sig_type=std_logic lab=sel1}
N -320 -100 -360 -100 {lab=na}
C {lab_pin.sym} -360 -100 0 0 {name=l41 sig_type=std_logic lab=na}
N -280 -130 -200 -130 {lab=vdd}
C {lab_pin.sym} -200 -130 2 0 {name=l42 sig_type=std_logic lab=vdd}
N -280 -100 -200 -100 {lab=vdd}
C {lab_pin.sym} -200 -100 2 0 {name=l43 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} -100 -100 0 0 {name=MP5
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -80 -70 0 -70 {lab=sel1}
C {lab_pin.sym} 0 -70 2 0 {name=l44 sig_type=std_logic lab=sel1}
N -120 -100 -160 -100 {lab=nb}
C {lab_pin.sym} -160 -100 0 0 {name=l45 sig_type=std_logic lab=nb}
N -80 -130 0 -130 {lab=vdd}
C {lab_pin.sym} 0 -130 2 0 {name=l46 sig_type=std_logic lab=vdd}
N -80 -100 0 -100 {lab=vdd}
C {lab_pin.sym} 0 -100 2 0 {name=l47 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 20 0 0 {name=MN4
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 -10 -200 -10 {lab=sel1}
C {lab_pin.sym} -200 -10 2 0 {name=l48 sig_type=std_logic lab=sel1}
N -320 20 -360 20 {lab=na}
C {lab_pin.sym} -360 20 0 0 {name=l49 sig_type=std_logic lab=na}
N -280 50 -200 50 {lab=x1}
C {lab_pin.sym} -200 50 2 0 {name=l50 sig_type=std_logic lab=x1}
N -280 20 -200 20 {lab=gnd}
C {lab_pin.sym} -200 20 2 0 {name=l51 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 140 0 0 {name=MN5
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 110 -200 110 {lab=x1}
C {lab_pin.sym} -200 110 2 0 {name=l52 sig_type=std_logic lab=x1}
N -320 140 -360 140 {lab=nb}
C {lab_pin.sym} -360 140 0 0 {name=l53 sig_type=std_logic lab=nb}
N -280 170 -200 170 {lab=gnd}
C {lab_pin.sym} -200 170 2 0 {name=l54 sig_type=std_logic lab=gnd}
N -280 140 -200 140 {lab=gnd}
C {lab_pin.sym} -200 140 2 0 {name=l55 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 300 -100 0 0 {name=MP6
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 320 -70 400 -70 {lab=t}
C {lab_pin.sym} 400 -70 2 0 {name=l56 sig_type=std_logic lab=t}
N 280 -100 240 -100 {lab=sel1}
C {lab_pin.sym} 240 -100 0 0 {name=l57 sig_type=std_logic lab=sel1}
N 320 -130 400 -130 {lab=vdd}
C {lab_pin.sym} 400 -130 2 0 {name=l58 sig_type=std_logic lab=vdd}
N 320 -100 400 -100 {lab=vdd}
C {lab_pin.sym} 400 -100 2 0 {name=l59 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 300 20 0 0 {name=MN6
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 320 -10 400 -10 {lab=t}
C {lab_pin.sym} 400 -10 2 0 {name=l60 sig_type=std_logic lab=t}
N 280 20 240 20 {lab=sel1}
C {lab_pin.sym} 240 20 0 0 {name=l61 sig_type=std_logic lab=sel1}
N 320 50 400 50 {lab=gnd}
C {lab_pin.sym} 400 50 2 0 {name=l62 sig_type=std_logic lab=gnd}
N 320 20 400 20 {lab=gnd}
C {lab_pin.sym} 400 20 2 0 {name=l63 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -300 320 0 0 {name=MP7
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -280 350 -200 350 {lab=u}
C {lab_pin.sym} -200 350 2 0 {name=l64 sig_type=std_logic lab=u}
N -320 320 -360 320 {lab=t}
C {lab_pin.sym} -360 320 0 0 {name=l65 sig_type=std_logic lab=t}
N -280 290 -200 290 {lab=vdd}
C {lab_pin.sym} -200 290 2 0 {name=l66 sig_type=std_logic lab=vdd}
N -280 320 -200 320 {lab=vdd}
C {lab_pin.sym} -200 320 2 0 {name=l67 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} -100 320 0 0 {name=MP8
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -80 350 0 350 {lab=u}
C {lab_pin.sym} 0 350 2 0 {name=l68 sig_type=std_logic lab=u}
N -120 320 -160 320 {lab=nc}
C {lab_pin.sym} -160 320 0 0 {name=l69 sig_type=std_logic lab=nc}
N -80 290 0 290 {lab=vdd}
C {lab_pin.sym} 0 290 2 0 {name=l70 sig_type=std_logic lab=vdd}
N -80 320 0 320 {lab=vdd}
C {lab_pin.sym} 0 320 2 0 {name=l71 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 440 0 0 {name=MN7
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 410 -200 410 {lab=u}
C {lab_pin.sym} -200 410 2 0 {name=l72 sig_type=std_logic lab=u}
N -320 440 -360 440 {lab=t}
C {lab_pin.sym} -360 440 0 0 {name=l73 sig_type=std_logic lab=t}
N -280 470 -200 470 {lab=x2}
C {lab_pin.sym} -200 470 2 0 {name=l74 sig_type=std_logic lab=x2}
N -280 440 -200 440 {lab=gnd}
C {lab_pin.sym} -200 440 2 0 {name=l75 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 560 0 0 {name=MN8
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 530 -200 530 {lab=x2}
C {lab_pin.sym} -200 530 2 0 {name=l76 sig_type=std_logic lab=x2}
N -320 560 -360 560 {lab=nc}
C {lab_pin.sym} -360 560 0 0 {name=l77 sig_type=std_logic lab=nc}
N -280 590 -200 590 {lab=gnd}
C {lab_pin.sym} -200 590 2 0 {name=l78 sig_type=std_logic lab=gnd}
N -280 560 -200 560 {lab=gnd}
C {lab_pin.sym} -200 560 2 0 {name=l79 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 300 320 0 0 {name=MP9
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 320 350 400 350 {lab=sel0}
C {lab_pin.sym} 400 350 2 0 {name=l80 sig_type=std_logic lab=sel0}
N 280 320 240 320 {lab=u}
C {lab_pin.sym} 240 320 0 0 {name=l81 sig_type=std_logic lab=u}
N 320 290 400 290 {lab=vdd}
C {lab_pin.sym} 400 290 2 0 {name=l82 sig_type=std_logic lab=vdd}
N 320 320 400 320 {lab=vdd}
C {lab_pin.sym} 400 320 2 0 {name=l83 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 300 440 0 0 {name=MN9
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 320 410 400 410 {lab=sel0}
C {lab_pin.sym} 400 410 2 0 {name=l84 sig_type=std_logic lab=sel0}
N 280 440 240 440 {lab=u}
C {lab_pin.sym} 240 440 0 0 {name=l85 sig_type=std_logic lab=u}
N 320 470 400 470 {lab=gnd}
C {lab_pin.sym} 400 470 2 0 {name=l86 sig_type=std_logic lab=gnd}
N 320 440 400 440 {lab=gnd}
C {lab_pin.sym} 400 440 2 0 {name=l87 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -300 740 0 0 {name=MP10
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -280 770 -200 770 {lab=v}
C {lab_pin.sym} -200 770 2 0 {name=l88 sig_type=std_logic lab=v}
N -320 740 -360 740 {lab=nb}
C {lab_pin.sym} -360 740 0 0 {name=l89 sig_type=std_logic lab=nb}
N -280 710 -200 710 {lab=vdd}
C {lab_pin.sym} -200 710 2 0 {name=l90 sig_type=std_logic lab=vdd}
N -280 740 -200 740 {lab=vdd}
C {lab_pin.sym} -200 740 2 0 {name=l91 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} -100 740 0 0 {name=MP11
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -80 770 0 770 {lab=v}
C {lab_pin.sym} 0 770 2 0 {name=l92 sig_type=std_logic lab=v}
N -120 740 -160 740 {lab=c}
C {lab_pin.sym} -160 740 0 0 {name=l93 sig_type=std_logic lab=c}
N -80 710 0 710 {lab=vdd}
C {lab_pin.sym} 0 710 2 0 {name=l94 sig_type=std_logic lab=vdd}
N -80 740 0 740 {lab=vdd}
C {lab_pin.sym} 0 740 2 0 {name=l95 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 860 0 0 {name=MN10
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 830 -200 830 {lab=v}
C {lab_pin.sym} -200 830 2 0 {name=l96 sig_type=std_logic lab=v}
N -320 860 -360 860 {lab=nb}
C {lab_pin.sym} -360 860 0 0 {name=l97 sig_type=std_logic lab=nb}
N -280 890 -200 890 {lab=x3}
C {lab_pin.sym} -200 890 2 0 {name=l98 sig_type=std_logic lab=x3}
N -280 860 -200 860 {lab=gnd}
C {lab_pin.sym} -200 860 2 0 {name=l99 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 980 0 0 {name=MN11
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 950 -200 950 {lab=x3}
C {lab_pin.sym} -200 950 2 0 {name=l100 sig_type=std_logic lab=x3}
N -320 980 -360 980 {lab=c}
C {lab_pin.sym} -360 980 0 0 {name=l101 sig_type=std_logic lab=c}
N -280 1010 -200 1010 {lab=gnd}
C {lab_pin.sym} -200 1010 2 0 {name=l102 sig_type=std_logic lab=gnd}
N -280 980 -200 980 {lab=gnd}
C {lab_pin.sym} -200 980 2 0 {name=l103 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 300 740 0 0 {name=MP12
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 320 770 400 770 {lab=sel2}
C {lab_pin.sym} 400 770 2 0 {name=l104 sig_type=std_logic lab=sel2}
N 280 740 240 740 {lab=v}
C {lab_pin.sym} 240 740 0 0 {name=l105 sig_type=std_logic lab=v}
N 320 710 400 710 {lab=vdd}
C {lab_pin.sym} 400 710 2 0 {name=l106 sig_type=std_logic lab=vdd}
N 320 740 400 740 {lab=vdd}
C {lab_pin.sym} 400 740 2 0 {name=l107 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 300 860 0 0 {name=MN12
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 320 830 400 830 {lab=sel2}
C {lab_pin.sym} 400 830 2 0 {name=l108 sig_type=std_logic lab=sel2}
N 280 860 240 860 {lab=v}
C {lab_pin.sym} 240 860 0 0 {name=l109 sig_type=std_logic lab=v}
N 320 890 400 890 {lab=gnd}
C {lab_pin.sym} 400 890 2 0 {name=l110 sig_type=std_logic lab=gnd}
N 320 860 400 860 {lab=gnd}
C {lab_pin.sym} 400 860 2 0 {name=l111 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -300 1160 0 0 {name=MP13
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -280 1190 -200 1190 {lab=sel3}
C {lab_pin.sym} -200 1190 2 0 {name=l112 sig_type=std_logic lab=sel3}
N -320 1160 -360 1160 {lab=b}
C {lab_pin.sym} -360 1160 0 0 {name=l113 sig_type=std_logic lab=b}
N -280 1130 -200 1130 {lab=vdd}
C {lab_pin.sym} -200 1130 2 0 {name=l114 sig_type=std_logic lab=vdd}
N -280 1160 -200 1160 {lab=vdd}
C {lab_pin.sym} -200 1160 2 0 {name=l115 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} -100 1160 0 0 {name=MP14
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -80 1190 0 1190 {lab=sel3}
C {lab_pin.sym} 0 1190 2 0 {name=l116 sig_type=std_logic lab=sel3}
N -120 1160 -160 1160 {lab=nc}
C {lab_pin.sym} -160 1160 0 0 {name=l117 sig_type=std_logic lab=nc}
N -80 1130 0 1130 {lab=vdd}
C {lab_pin.sym} 0 1130 2 0 {name=l118 sig_type=std_logic lab=vdd}
N -80 1160 0 1160 {lab=vdd}
C {lab_pin.sym} 0 1160 2 0 {name=l119 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 1280 0 0 {name=MN13
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 1250 -200 1250 {lab=sel3}
C {lab_pin.sym} -200 1250 2 0 {name=l120 sig_type=std_logic lab=sel3}
N -320 1280 -360 1280 {lab=b}
C {lab_pin.sym} -360 1280 0 0 {name=l121 sig_type=std_logic lab=b}
N -280 1310 -200 1310 {lab=x4}
C {lab_pin.sym} -200 1310 2 0 {name=l122 sig_type=std_logic lab=x4}
N -280 1280 -200 1280 {lab=gnd}
C {lab_pin.sym} -200 1280 2 0 {name=l123 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 1400 0 0 {name=MN14
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 1370 -200 1370 {lab=x4}
C {lab_pin.sym} -200 1370 2 0 {name=l124 sig_type=std_logic lab=x4}
N -320 1400 -360 1400 {lab=nc}
C {lab_pin.sym} -360 1400 0 0 {name=l125 sig_type=std_logic lab=nc}
N -280 1430 -200 1430 {lab=gnd}
C {lab_pin.sym} -200 1430 2 0 {name=l126 sig_type=std_logic lab=gnd}
N -280 1400 -200 1400 {lab=gnd}
C {lab_pin.sym} -200 1400 2 0 {name=l127 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 300 1160 0 0 {name=MP15
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 320 1190 400 1190 {lab=sel4}
C {lab_pin.sym} 400 1190 2 0 {name=l128 sig_type=std_logic lab=sel4}
N 280 1160 240 1160 {lab=sel3}
C {lab_pin.sym} 240 1160 0 0 {name=l129 sig_type=std_logic lab=sel3}
N 320 1130 400 1130 {lab=vdd}
C {lab_pin.sym} 400 1130 2 0 {name=l130 sig_type=std_logic lab=vdd}
N 320 1160 400 1160 {lab=vdd}
C {lab_pin.sym} 400 1160 2 0 {name=l131 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 300 1280 0 0 {name=MN15
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 320 1250 400 1250 {lab=sel4}
C {lab_pin.sym} 400 1250 2 0 {name=l132 sig_type=std_logic lab=sel4}
N 280 1280 240 1280 {lab=sel3}
C {lab_pin.sym} 240 1280 0 0 {name=l133 sig_type=std_logic lab=sel3}
N 320 1310 400 1310 {lab=gnd}
C {lab_pin.sym} 400 1310 2 0 {name=l134 sig_type=std_logic lab=gnd}
N 320 1280 400 1280 {lab=gnd}
C {lab_pin.sym} 400 1280 2 0 {name=l135 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} -300 1580 0 0 {name=MP16
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -280 1610 -200 1610 {lab=sel5}
C {lab_pin.sym} -200 1610 2 0 {name=l136 sig_type=std_logic lab=sel5}
N -320 1580 -360 1580 {lab=b}
C {lab_pin.sym} -360 1580 0 0 {name=l137 sig_type=std_logic lab=b}
N -280 1550 -200 1550 {lab=vdd}
C {lab_pin.sym} -200 1550 2 0 {name=l138 sig_type=std_logic lab=vdd}
N -280 1580 -200 1580 {lab=vdd}
C {lab_pin.sym} -200 1580 2 0 {name=l139 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} -100 1580 0 0 {name=MP17
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N -80 1610 0 1610 {lab=sel5}
C {lab_pin.sym} 0 1610 2 0 {name=l140 sig_type=std_logic lab=sel5}
N -120 1580 -160 1580 {lab=c}
C {lab_pin.sym} -160 1580 0 0 {name=l141 sig_type=std_logic lab=c}
N -80 1550 0 1550 {lab=vdd}
C {lab_pin.sym} 0 1550 2 0 {name=l142 sig_type=std_logic lab=vdd}
N -80 1580 0 1580 {lab=vdd}
C {lab_pin.sym} 0 1580 2 0 {name=l143 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 1700 0 0 {name=MN16
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 1670 -200 1670 {lab=sel5}
C {lab_pin.sym} -200 1670 2 0 {name=l144 sig_type=std_logic lab=sel5}
N -320 1700 -360 1700 {lab=b}
C {lab_pin.sym} -360 1700 0 0 {name=l145 sig_type=std_logic lab=b}
N -280 1730 -200 1730 {lab=x5}
C {lab_pin.sym} -200 1730 2 0 {name=l146 sig_type=std_logic lab=x5}
N -280 1700 -200 1700 {lab=gnd}
C {lab_pin.sym} -200 1700 2 0 {name=l147 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -300 1820 0 0 {name=MN17
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -280 1790 -200 1790 {lab=x5}
C {lab_pin.sym} -200 1790 2 0 {name=l148 sig_type=std_logic lab=x5}
N -320 1820 -360 1820 {lab=c}
C {lab_pin.sym} -360 1820 0 0 {name=l149 sig_type=std_logic lab=c}
N -280 1850 -200 1850 {lab=gnd}
C {lab_pin.sym} -200 1850 2 0 {name=l150 sig_type=std_logic lab=gnd}
N -280 1820 -200 1820 {lab=gnd}
C {lab_pin.sym} -200 1820 2 0 {name=l151 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_pmos.sym} 300 1580 0 0 {name=MP18
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
N 320 1610 400 1610 {lab=sel6}
C {lab_pin.sym} 400 1610 2 0 {name=l152 sig_type=std_logic lab=sel6}
N 280 1580 240 1580 {lab=sel5}
C {lab_pin.sym} 240 1580 0 0 {name=l153 sig_type=std_logic lab=sel5}
N 320 1550 400 1550 {lab=vdd}
C {lab_pin.sym} 400 1550 2 0 {name=l154 sig_type=std_logic lab=vdd}
N 320 1580 400 1580 {lab=vdd}
C {lab_pin.sym} 400 1580 2 0 {name=l155 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 300 1700 0 0 {name=MN18
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 320 1670 400 1670 {lab=sel6}
C {lab_pin.sym} 400 1670 2 0 {name=l156 sig_type=std_logic lab=sel6}
N 280 1700 240 1700 {lab=sel5}
C {lab_pin.sym} 240 1700 0 0 {name=l157 sig_type=std_logic lab=sel5}
N 320 1730 400 1730 {lab=gnd}
C {lab_pin.sym} 400 1730 2 0 {name=l158 sig_type=std_logic lab=gnd}
N 320 1700 400 1700 {lab=gnd}
C {lab_pin.sym} 400 1700 2 0 {name=l159 sig_type=std_logic lab=gnd}
T {Codigo A B C -> modo:
000 potenciostato (sel0: G_MT2 = S_Mpmos; Rref, C1)
001 Vin / pH       (sel2: G_MT2 = S_MTR1; Rref, C1)
010 R sensor NTC   (sel1: G_MT2 = Vbias; sel4: Rsens_ext; C1)
011 C sensor       (sel1: G_MT2 = Vbias; Rref; sel6: Csens_ext)
100 calibracion    (sel1: G_MT2 = Vbias; Rref; C1)
101 PROHIBIDO: sel1 y sel2 a la vez (Vbias en corto con S_MTR1). 110 = 010, 111 = 011.
u = /sel0, t = /sel1, v = /sel2 (gates PMOS de las llaves de paso).
Todos los transistores 1u/0.13u.} 700 -400 0 0 0.25 0.25 {layer=8}
