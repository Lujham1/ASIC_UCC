v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {bandgap - referencia con capacitores conmutados (ISSCC 2015, 5.4)} -900 -640 0 0 0.4 0.4 {}
T {VREF = vctat + 3*dVBE   (vctat = VBE1*CA1/(CA1+CA2))
vdd = 1.1 V (entrada de las sc_bias) - vdd2x = 2.2 V (fases, TG y bulks PMOS)
Nodos del plano: vctat=3, p1t=2, p1b=1, p2t=5, p2b=6, p3t=7, p3b=8} -900 -600 0 0 0.25 0.25 {layer=8}
C {ipin.sym} -900 -400 0 0 {name=p1 lab=vdd}
C {ipin.sym} -900 -360 0 0 {name=p2 lab=vp1}
C {ipin.sym} -900 -320 0 0 {name=p3 lab=vp2}
C {opin.sym} -900 -280 0 0 {name=p4 lab=vref}
C {iopin.sym} -900 -240 0 0 {name=p5 lab=vdd2x}
C {iopin.sym} -900 -200 0 0 {name=p6 lab=gnd}
C {Enfoque_A/xschem/celdas/fase_gen.sym} -500 -400 0 0 {name=x_fase}
C {lab_pin.sym} -620 -410 0 0 {name=l7 sig_type=std_logic lab=vp1}
C {lab_pin.sym} -620 -390 0 0 {name=l8 sig_type=std_logic lab=vp2}
C {lab_pin.sym} -380 -410 2 0 {name=l9 sig_type=std_logic lab=vp1b}
C {lab_pin.sym} -380 -390 2 0 {name=l10 sig_type=std_logic lab=vp2b}
C {lab_pin.sym} -500 -480 0 0 {name=l11 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} -500 -320 0 0 {name=l12 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/sc_bias.sym} -500 -100 0 0 {name=x_bias1}
C {lab_pin.sym} -620 -140 0 0 {name=l13 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -620 -120 0 0 {name=l14 sig_type=std_logic lab=vp1}
C {lab_pin.sym} -620 -100 0 0 {name=l15 sig_type=std_logic lab=vp1b}
C {lab_pin.sym} -620 -80 0 0 {name=l16 sig_type=std_logic lab=vp2}
C {lab_pin.sym} -620 -60 0 0 {name=l17 sig_type=std_logic lab=vp2b}
C {lab_pin.sym} -380 -100 2 0 {name=l18 sig_type=std_logic lab=vbe1}
C {lab_pin.sym} -500 -210 0 0 {name=l19 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} -500 10 0 0 {name=l20 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/sc_bias.sym} -500 200 0 0 {name=x_bias2}
C {lab_pin.sym} -620 160 0 0 {name=l21 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -620 180 0 0 {name=l22 sig_type=std_logic lab=vp1}
C {lab_pin.sym} -620 200 0 0 {name=l23 sig_type=std_logic lab=vp1b}
C {lab_pin.sym} -620 220 0 0 {name=l24 sig_type=std_logic lab=vp2}
C {lab_pin.sym} -620 240 0 0 {name=l25 sig_type=std_logic lab=vp2b}
C {lab_pin.sym} -380 200 2 0 {name=l26 sig_type=std_logic lab=vbe2}
C {lab_pin.sym} -500 90 0 0 {name=l27 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} -500 310 0 0 {name=l28 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/bjt_pair.sym} -500 480 0 0 {name=x_bjt}
C {lab_pin.sym} -380 470 2 0 {name=l29 sig_type=std_logic lab=vbe1}
C {lab_pin.sym} -380 490 2 0 {name=l30 sig_type=std_logic lab=vbe2}
C {lab_pin.sym} -500 560 0 0 {name=l31 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/ctat_div.sym} -60 -400 0 0 {name=x_ctat}
C {lab_pin.sym} -180 -440 0 0 {name=l32 sig_type=std_logic lab=vbe1}
C {lab_pin.sym} -180 -420 0 0 {name=l33 sig_type=std_logic lab=vp1}
C {lab_pin.sym} -180 -400 0 0 {name=l34 sig_type=std_logic lab=vp1b}
C {lab_pin.sym} -180 -380 0 0 {name=l35 sig_type=std_logic lab=vp2}
C {lab_pin.sym} -180 -360 0 0 {name=l36 sig_type=std_logic lab=vp2b}
C {lab_pin.sym} 60 -400 2 0 {name=l37 sig_type=std_logic lab=vctat}
C {lab_pin.sym} -60 -510 0 0 {name=l38 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} -60 -290 0 0 {name=l39 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/ptat_stage.sym} -60 -100 0 0 {name=x_ptat1}
C {lab_pin.sym} -180 -150 0 0 {name=l40 sig_type=std_logic lab=vctat}
C {lab_pin.sym} -180 -130 0 0 {name=l41 sig_type=std_logic lab=vbe2}
C {lab_pin.sym} -180 -110 0 0 {name=l42 sig_type=std_logic lab=vp1}
C {lab_pin.sym} -180 -90 0 0 {name=l43 sig_type=std_logic lab=vp1b}
C {lab_pin.sym} -180 -70 0 0 {name=l44 sig_type=std_logic lab=vp2}
C {lab_pin.sym} -180 -50 0 0 {name=l45 sig_type=std_logic lab=vp2b}
C {lab_pin.sym} 60 -110 2 0 {name=l46 sig_type=std_logic lab=p1t}
C {lab_pin.sym} 60 -90 2 0 {name=l47 sig_type=std_logic lab=p1b}
C {lab_pin.sym} -60 -220 0 0 {name=l48 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} -60 20 0 0 {name=l49 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/ptat_stage.sym} -60 200 0 0 {name=x_ptat2}
C {lab_pin.sym} -180 150 0 0 {name=l50 sig_type=std_logic lab=p1t}
C {lab_pin.sym} -180 170 0 0 {name=l51 sig_type=std_logic lab=p1b}
C {lab_pin.sym} -180 190 0 0 {name=l52 sig_type=std_logic lab=vp1}
C {lab_pin.sym} -180 210 0 0 {name=l53 sig_type=std_logic lab=vp1b}
C {lab_pin.sym} -180 230 0 0 {name=l54 sig_type=std_logic lab=vp2}
C {lab_pin.sym} -180 250 0 0 {name=l55 sig_type=std_logic lab=vp2b}
C {lab_pin.sym} 60 190 2 0 {name=l56 sig_type=std_logic lab=p2t}
C {lab_pin.sym} 60 210 2 0 {name=l57 sig_type=std_logic lab=p2b}
C {lab_pin.sym} -60 80 0 0 {name=l58 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} -60 320 0 0 {name=l59 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/ptat_stage.sym} -60 500 0 0 {name=x_ptat3}
C {lab_pin.sym} -180 450 0 0 {name=l60 sig_type=std_logic lab=p2t}
C {lab_pin.sym} -180 470 0 0 {name=l61 sig_type=std_logic lab=p2b}
C {lab_pin.sym} -180 490 0 0 {name=l62 sig_type=std_logic lab=vp1}
C {lab_pin.sym} -180 510 0 0 {name=l63 sig_type=std_logic lab=vp1b}
C {lab_pin.sym} -180 530 0 0 {name=l64 sig_type=std_logic lab=vp2}
C {lab_pin.sym} -180 550 0 0 {name=l65 sig_type=std_logic lab=vp2b}
C {lab_pin.sym} 60 490 2 0 {name=l66 sig_type=std_logic lab=p3t}
C {lab_pin.sym} 60 510 2 0 {name=l67 sig_type=std_logic lab=p3b}
C {lab_pin.sym} -60 380 0 0 {name=l68 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} -60 620 0 0 {name=l69 sig_type=std_logic lab=gnd}
C {Enfoque_A/xschem/celdas/vref_hold.sym} 380 -100 0 0 {name=x_out}
C {lab_pin.sym} 260 -120 0 0 {name=l70 sig_type=std_logic lab=p3t}
C {lab_pin.sym} 260 -100 0 0 {name=l71 sig_type=std_logic lab=vp1}
C {lab_pin.sym} 260 -80 0 0 {name=l72 sig_type=std_logic lab=vp1b}
C {lab_pin.sym} 500 -100 2 0 {name=l73 sig_type=std_logic lab=vref}
C {lab_pin.sym} 380 -190 0 0 {name=l74 sig_type=std_logic lab=vdd2x}
C {lab_pin.sym} 380 -10 0 0 {name=l75 sig_type=std_logic lab=gnd}
