v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {ASIC_TOP - Conversor multisensor a frecuencia (v2, circuito validado)} -1000 -800 0 0 0.4 0.4 {}
T {VDD siempre encendido; todo el circuito (incluido el decodificador) cuelga de VVDD via x_pwr (EN=1 enciende).
Modo A B C: 000 potenciostato | 001 Vin (pH) | 010 R sensor NTC | 011 C sensor | 100 calibracion (Rref + C1 + Vbias).
Vbias = 0.372 V sale de x_ref (ref_vbias), ya no es un pin externo.
101 prohibido (sel1 y sel2 a la vez). Rref 100k, R_sensor y C_sensor son externos a GND.} -1000 -760 0 0 0.25 0.25 {layer=8}
C {ipin.sym} -1000 -500 0 0 {name=p1 lab=en}
C {ipin.sym} -1000 -460 0 0 {name=p2 lab=a}
C {ipin.sym} -1000 -420 0 0 {name=p3 lab=b}
C {ipin.sym} -1000 -380 0 0 {name=p4 lab=c}
C {iopin.sym} -1000 -340 0 0 {name=p5 lab=ipoto_in}
C {ipin.sym} -1000 -300 0 0 {name=p6 lab=vin_ph}
C {iopin.sym} -1000 -260 0 0 {name=p7 lab=rref_ext}
C {iopin.sym} -1000 -220 0 0 {name=p8 lab=rsens_ext}
C {iopin.sym} -1000 -180 0 0 {name=p9 lab=csens_ext}
C {opin.sym} -1000 -140 0 0 {name=p10 lab=vrst}
C {iopin.sym} -1000 -100 0 0 {name=p11 lab=vdd}
C {iopin.sym} -1000 -60 0 0 {name=p12 lab=gnd}
C {Enfoque_B/xschem/celdas/pwr_sw.sym} -600 -500 0 0 {name=x_pwr}
N -720 -500 -750 -500 {lab=en}
C {lab_pin.sym} -750 -500 0 0 {name=l13 sig_type=std_logic lab=en}
N -480 -500 -450 -500 {lab=vvdd}
C {lab_pin.sym} -450 -500 2 0 {name=l14 sig_type=std_logic lab=vvdd}
N -600 -580 -600 -600 {lab=vdd}
C {lab_pin.sym} -600 -600 0 0 {name=l15 sig_type=std_logic lab=vdd}
N -600 -420 -600 -400 {lab=gnd}
C {lab_pin.sym} -600 -400 0 0 {name=l16 sig_type=std_logic lab=gnd}
C {Enfoque_B/xschem/celdas/deco_3b.sym} -600 0 0 0 {name=x_deco}
N -720 -20 -750 -20 {lab=a}
C {lab_pin.sym} -750 -20 0 0 {name=l17 sig_type=std_logic lab=a}
N -720 0 -750 0 {lab=b}
C {lab_pin.sym} -750 0 0 0 {name=l18 sig_type=std_logic lab=b}
N -720 20 -750 20 {lab=c}
C {lab_pin.sym} -750 20 0 0 {name=l19 sig_type=std_logic lab=c}
N -480 -90 -450 -90 {lab=sel0}
C {lab_pin.sym} -450 -90 2 0 {name=l20 sig_type=std_logic lab=sel0}
N -480 -70 -450 -70 {lab=u}
C {lab_pin.sym} -450 -70 2 0 {name=l21 sig_type=std_logic lab=u}
N -480 -50 -450 -50 {lab=sel1}
C {lab_pin.sym} -450 -50 2 0 {name=l22 sig_type=std_logic lab=sel1}
N -480 -30 -450 -30 {lab=t}
C {lab_pin.sym} -450 -30 2 0 {name=l23 sig_type=std_logic lab=t}
N -480 -10 -450 -10 {lab=sel2}
C {lab_pin.sym} -450 -10 2 0 {name=l24 sig_type=std_logic lab=sel2}
N -480 10 -450 10 {lab=v}
C {lab_pin.sym} -450 10 2 0 {name=l25 sig_type=std_logic lab=v}
N -480 30 -450 30 {lab=sel3}
C {lab_pin.sym} -450 30 2 0 {name=l26 sig_type=std_logic lab=sel3}
N -480 50 -450 50 {lab=sel4}
C {lab_pin.sym} -450 50 2 0 {name=l27 sig_type=std_logic lab=sel4}
N -480 70 -450 70 {lab=sel5}
C {lab_pin.sym} -450 70 2 0 {name=l28 sig_type=std_logic lab=sel5}
N -480 90 -450 90 {lab=sel6}
C {lab_pin.sym} -450 90 2 0 {name=l29 sig_type=std_logic lab=sel6}
N -600 -160 -600 -180 {lab=vvdd}
C {lab_pin.sym} -600 -180 0 0 {name=l30 sig_type=std_logic lab=vvdd}
N -600 160 -600 180 {lab=gnd}
C {lab_pin.sym} -600 180 0 0 {name=l31 sig_type=std_logic lab=gnd}
C {Enfoque_B/xschem/celdas/espejo_poto.sym} -100 -500 0 0 {name=x_poto}
N -220 -500 -250 -500 {lab=ipoto_in}
C {lab_pin.sym} -250 -500 0 0 {name=l32 sig_type=std_logic lab=ipoto_in}
N 20 -500 50 -500 {lab=s_mpmos}
C {lab_pin.sym} 50 -500 2 0 {name=l33 sig_type=std_logic lab=s_mpmos}
N -100 -580 -100 -600 {lab=vvdd}
C {lab_pin.sym} -100 -600 0 0 {name=l34 sig_type=std_logic lab=vvdd}
N -100 -420 -100 -400 {lab=gnd}
C {lab_pin.sym} -100 -400 0 0 {name=l35 sig_type=std_logic lab=gnd}
C {Enfoque_B/xschem/celdas/vi_ph.sym} -100 -250 0 0 {name=x_ph}
N -220 -250 -250 -250 {lab=vin_ph}
C {lab_pin.sym} -250 -250 0 0 {name=l36 sig_type=std_logic lab=vin_ph}
N 20 -250 50 -250 {lab=s_mtr1}
C {lab_pin.sym} 50 -250 2 0 {name=l37 sig_type=std_logic lab=s_mtr1}
N -100 -330 -100 -350 {lab=vvdd}
C {lab_pin.sym} -100 -350 0 0 {name=l38 sig_type=std_logic lab=vvdd}
N -100 -170 -100 -150 {lab=gnd}
C {lab_pin.sym} -100 -150 0 0 {name=l39 sig_type=std_logic lab=gnd}
C {Enfoque_B/xschem/celdas/llaves_gmt2.sym} -100 100 0 0 {name=x_tg}
N -220 20 -250 20 {lab=s_mpmos}
C {lab_pin.sym} -250 20 0 0 {name=l40 sig_type=std_logic lab=s_mpmos}
N -220 40 -250 40 {lab=vbias}
C {lab_pin.sym} -250 40 0 0 {name=l41 sig_type=std_logic lab=vbias}
N -220 60 -250 60 {lab=s_mtr1}
C {lab_pin.sym} -250 60 0 0 {name=l42 sig_type=std_logic lab=s_mtr1}
N -220 80 -250 80 {lab=sel0}
C {lab_pin.sym} -250 80 0 0 {name=l43 sig_type=std_logic lab=sel0}
N -220 100 -250 100 {lab=u}
C {lab_pin.sym} -250 100 0 0 {name=l44 sig_type=std_logic lab=u}
N -220 120 -250 120 {lab=sel1}
C {lab_pin.sym} -250 120 0 0 {name=l45 sig_type=std_logic lab=sel1}
N -220 140 -250 140 {lab=t}
C {lab_pin.sym} -250 140 0 0 {name=l46 sig_type=std_logic lab=t}
N -220 160 -250 160 {lab=sel2}
C {lab_pin.sym} -250 160 0 0 {name=l47 sig_type=std_logic lab=sel2}
N -220 180 -250 180 {lab=v}
C {lab_pin.sym} -250 180 0 0 {name=l48 sig_type=std_logic lab=v}
N 20 100 50 100 {lab=g_mt2}
C {lab_pin.sym} 50 100 2 0 {name=l49 sig_type=std_logic lab=g_mt2}
N -100 -50 -100 -70 {lab=vvdd}
C {lab_pin.sym} -100 -70 0 0 {name=l50 sig_type=std_logic lab=vvdd}
N -100 250 -100 270 {lab=gnd}
C {lab_pin.sym} -100 270 0 0 {name=l51 sig_type=std_logic lab=gnd}
C {Enfoque_B/xschem/celdas/ref_vbias.sym} 450 -620 0 0 {name=x_ref}
N 570 -620 600 -620 {lab=vbias}
C {lab_pin.sym} 600 -620 2 0 {name=l52 sig_type=std_logic lab=vbias}
N 450 -700 450 -720 {lab=vvdd}
C {lab_pin.sym} 450 -720 0 0 {name=l53 sig_type=std_logic lab=vvdd}
N 450 -540 450 -520 {lab=gnd}
C {lab_pin.sym} 450 -520 0 0 {name=l54 sig_type=std_logic lab=gnd}
C {Enfoque_B/xschem/celdas/osc_relax.sym} 450 -300 0 0 {name=x_osc}
N 330 -330 300 -330 {lab=vbias}
C {lab_pin.sym} 300 -330 0 0 {name=l55 sig_type=std_logic lab=vbias}
N 330 -310 300 -310 {lab=g_mt2}
C {lab_pin.sym} 300 -310 0 0 {name=l56 sig_type=std_logic lab=g_mt2}
N 330 -290 300 -290 {lab=s_m0}
C {lab_pin.sym} 300 -290 0 0 {name=l57 sig_type=std_logic lab=s_m0}
N 330 -270 300 -270 {lab=s_m1}
C {lab_pin.sym} 300 -270 0 0 {name=l58 sig_type=std_logic lab=s_m1}
N 570 -300 600 -300 {lab=vrst}
C {lab_pin.sym} 600 -300 2 0 {name=l59 sig_type=std_logic lab=vrst}
N 450 -400 450 -420 {lab=vvdd}
C {lab_pin.sym} 450 -420 0 0 {name=l60 sig_type=std_logic lab=vvdd}
N 450 -200 450 -180 {lab=gnd}
C {lab_pin.sym} 450 -180 0 0 {name=l61 sig_type=std_logic lab=gnd}
C {Enfoque_B/xschem/celdas/llaves_rc.sym} 450 100 0 0 {name=x_rc}
N 330 50 300 50 {lab=s_m0}
C {lab_pin.sym} 300 50 0 0 {name=l62 sig_type=std_logic lab=s_m0}
N 330 70 300 70 {lab=s_m1}
C {lab_pin.sym} 300 70 0 0 {name=l63 sig_type=std_logic lab=s_m1}
N 330 90 300 90 {lab=sel3}
C {lab_pin.sym} 300 90 0 0 {name=l64 sig_type=std_logic lab=sel3}
N 330 110 300 110 {lab=sel4}
C {lab_pin.sym} 300 110 0 0 {name=l65 sig_type=std_logic lab=sel4}
N 330 130 300 130 {lab=sel5}
C {lab_pin.sym} 300 130 0 0 {name=l66 sig_type=std_logic lab=sel5}
N 330 150 300 150 {lab=sel6}
C {lab_pin.sym} 300 150 0 0 {name=l67 sig_type=std_logic lab=sel6}
N 570 80 600 80 {lab=rref_ext}
C {lab_pin.sym} 600 80 2 0 {name=l68 sig_type=std_logic lab=rref_ext}
N 570 100 600 100 {lab=rsens_ext}
C {lab_pin.sym} 600 100 2 0 {name=l69 sig_type=std_logic lab=rsens_ext}
N 570 120 600 120 {lab=csens_ext}
C {lab_pin.sym} 600 120 2 0 {name=l70 sig_type=std_logic lab=csens_ext}
N 450 220 450 240 {lab=gnd}
C {lab_pin.sym} 450 240 0 0 {name=l71 sig_type=std_logic lab=gnd}
