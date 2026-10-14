v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -630 -220 -630 -150 {
lab=A}
N -570 -220 -570 -150 {
lab=B}
N -600 -280 -600 -250 {
lab=VDD}
N -600 -250 -490 -250 {
lab=VDD}
N -600 -190 -600 -150 {
lab=0}
N -600 -190 -490 -190 {
lab=0}
N -600 -110 -600 -80 {
lab=S}
N -570 -220 -470 -220 {
lab=B}
N -570 -280 -570 -220 {
lab=B}
N -600 -350 -600 -320 {
lab=Sn}
N -710 -220 -630 -220 {
lab=A}
N -630 -280 -630 -220 {
lab=A}
C {sg13g2_pr/sg13_lv_nmos.sym} -600 -130 3 0 {name=M101
l=0.130u
w=0.13u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -600 -300 3 1 {name=M100
l=0.130u
w=0.3u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {gnd.sym} -490 -190 0 0 {name=l8 lab=0
}
C {vdd.sym} -490 -250 0 0 {name=l9 lab=VDD}
C {iopin.sym} -470 -220 0 0 {name=p1 lab=B}
C {ipin.sym} -600 -350 1 0 {name=p2 lab=Sn}
C {ipin.sym} -600 -80 3 0 {name=p3 lab=S}
C {iopin.sym} -710 -220 2 0 {name=p4 lab=A}
