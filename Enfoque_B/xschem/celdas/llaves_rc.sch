v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {llaves_rc - llaves NMOS a Rref / Rsensor (S_M0) y C1 / Csensor (S_M1)} -700 -420 0 0 0.4 0.4 {}
C {iopin.sym} -700 -300 0 0 {name=p1 lab=s_m0}
C {iopin.sym} -700 -260 0 0 {name=p2 lab=s_m1}
C {ipin.sym} -700 -220 0 0 {name=p3 lab=sel3}
C {ipin.sym} -700 -180 0 0 {name=p4 lab=sel4}
C {ipin.sym} -700 -140 0 0 {name=p5 lab=sel5}
C {ipin.sym} -700 -100 0 0 {name=p6 lab=sel6}
C {iopin.sym} -700 -60 0 0 {name=p7 lab=rref_ext}
C {iopin.sym} -700 -20 0 0 {name=p8 lab=rsens_ext}
C {iopin.sym} -700 20 0 0 {name=p9 lab=csens_ext}
C {iopin.sym} -700 60 0 0 {name=p10 lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -200 -200 0 0 {name=MN22
l=0.34u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -180 -230 -100 -230 {lab=s_m0}
C {lab_pin.sym} -100 -230 2 0 {name=l11 sig_type=std_logic lab=s_m0}
N -220 -200 -260 -200 {lab=sel3}
C {lab_pin.sym} -260 -200 0 0 {name=l12 sig_type=std_logic lab=sel3}
N -180 -170 -100 -170 {lab=rref_ext}
C {lab_pin.sym} -100 -170 2 0 {name=l13 sig_type=std_logic lab=rref_ext}
N -180 -200 -100 -200 {lab=gnd}
C {lab_pin.sym} -100 -200 2 0 {name=l14 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 100 -200 0 0 {name=MN23
l=0.34u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 120 -230 200 -230 {lab=s_m0}
C {lab_pin.sym} 200 -230 2 0 {name=l15 sig_type=std_logic lab=s_m0}
N 80 -200 40 -200 {lab=sel4}
C {lab_pin.sym} 40 -200 0 0 {name=l16 sig_type=std_logic lab=sel4}
N 120 -170 200 -170 {lab=rsens_ext}
C {lab_pin.sym} 200 -170 2 0 {name=l17 sig_type=std_logic lab=rsens_ext}
N 120 -200 200 -200 {lab=gnd}
C {lab_pin.sym} 200 -200 2 0 {name=l18 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} -200 100 0 0 {name=MN24
l=0.34u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N -180 70 -100 70 {lab=s_m1}
C {lab_pin.sym} -100 70 2 0 {name=l19 sig_type=std_logic lab=s_m1}
N -220 100 -260 100 {lab=sel5}
C {lab_pin.sym} -260 100 0 0 {name=l20 sig_type=std_logic lab=sel5}
N -180 130 -100 130 {lab=c1_int}
C {lab_pin.sym} -100 130 2 0 {name=l21 sig_type=std_logic lab=c1_int}
N -180 100 -100 100 {lab=gnd}
C {lab_pin.sym} -100 100 2 0 {name=l22 sig_type=std_logic lab=gnd}
C {sg13g2_pr/sg13_lv_nmos.sym} 100 100 0 0 {name=MN25
l=0.34u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
N 120 70 200 70 {lab=s_m1}
C {lab_pin.sym} 200 70 2 0 {name=l23 sig_type=std_logic lab=s_m1}
N 80 100 40 100 {lab=sel6}
C {lab_pin.sym} 40 100 0 0 {name=l24 sig_type=std_logic lab=sel6}
N 120 130 200 130 {lab=csens_ext}
C {lab_pin.sym} 200 130 2 0 {name=l25 sig_type=std_logic lab=csens_ext}
N 120 100 200 100 {lab=gnd}
C {lab_pin.sym} 200 100 2 0 {name=l26 sig_type=std_logic lab=gnd}
C {sg13g2_pr/cap_cmim.sym} 400 100 0 0 {name=C1
model=cap_cmim
w=57.67e-6
l=57.67e-6
m=2
spiceprefix=X}
N 400 70 400 50 {lab=c1_int}
C {lab_pin.sym} 400 50 0 0 {name=l27 sig_type=std_logic lab=c1_int}
N 400 130 400 150 {lab=gnd}
C {lab_pin.sym} 400 150 0 0 {name=l28 sig_type=std_logic lab=gnd}
T {Rref 100 k y R_sensor (NTC) son externos, a GND. C_sensor externo 20 - 200 pF a GND.
C1 = 10 pF integrado (2 MIM de 5 pF en paralelo).
PCell cmim SG13_dev: w=l=57,67 um; 2 x ~=4,99 pF ~= 10 pF.
sel3 = /sel4 y sel5 = /sel6: siempre hay una R en S_M0 y un C en S_M1.} -700 240 0 0 0.25 0.25 {layer=8}



