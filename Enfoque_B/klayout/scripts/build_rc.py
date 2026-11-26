"""Build llaves_rc with an aligned switch bank and two parallel MIM PCells."""
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from sg13_routing import Layout


def build():
    layout = Layout("llaves_rc")
    devices = [
        (7.0, "sel3", "rref_ext", 0.8, 11.4, 10.6),
        (15.0, "sel4", "rsens_ext", 1.6, 12.2, 10.6),
        (23.0, "sel5", "c1_int", 2.4, 13.8, 13.0),
        (31.0, "sel6", "csens_ext", 3.2, 14.6, 13.0),
    ]
    left, right = 0.8, 63.8
    for x, gate, source, gate_track, source_track, drain_track in devices:
        layout.mos("nmos", x, 5.0, "5u", "0.34u")

        gx, gy = x + 0.51, 4.30
        layout.box("GatPoly", gx - 0.17, gy - 0.25, gx + 0.17, 4.90)
        layout.via("GatPoly", "Metal3", gx, gy)
        for metal in ("Metal1", "Metal2"):
            layout.landing(metal, gx, gy, 0.42)
        layout.track("Metal3", (gx, gy), (gx, gate_track), 0.24)
        layout.via("Metal2", "Metal3", gx, gate_track)
        layout.track("Metal2", (left, gate_track), (gx, gate_track), 0.22)
        layout.pin("Metal2", gate, left, gate_track)

        sx, dx, terminal_y = x + 0.15, x + 0.87, 7.5
        for terminal in (sx, dx):
            layout.landing("Metal1", terminal, terminal_y, 0.44)
            layout.via("Metal1", "Metal3", terminal, terminal_y)
            layout.landing("Metal2", terminal, terminal_y, 0.40)
        layout.track("Metal3", (sx, terminal_y), (sx, source_track), 0.24)
        if source == "c1_int":
            # Rise to the upper electrode before reaching the MIM bottom plate.
            layout.via("Metal3", "TopMetal1", sx, source_track)
            for metal in ("Metal3", "Metal4"):
                layout.landing(metal, sx, source_track, 0.44)
        else:
            layout.via("Metal2", "Metal3", sx, source_track)
            layout.track("Metal2", (left, source_track), (sx, source_track), 0.22)
            layout.pin("Metal2", source, left, source_track)
        layout.track("Metal3", (dx, terminal_y), (dx, drain_track), 0.24)
        layout.via("Metal2", "Metal3", dx, drain_track)

    for output, first_x, lane in (("s_m0", 7.87, 10.6), ("s_m1", 23.87, 13.0)):
        pin_x = right - 0.25
        layout.track("Metal2", (first_x, lane), (pin_x, lane), 0.24)
        layout.pin("Metal2", output, pin_x, lane)

    for y in (17.0, 76.2):
        layout.pcell("cmim", {
            "Calculate": "w&l", "C": "5p", "w": "57.67u", "l": "57.67u",
            "m": 1, "model": "cap_cmim", "guardRingType": "none",
        }, 4.0, y)

    cx = 23.15
    layout.track("TopMetal1", (cx, 13.8), (cx, 77.4), 1.8)
    layout.track("Metal5", (8.0, 73.9), (8.0, 75.9), 0.40)
    cap_ground = (8.0, 14.30)
    layout.track("Metal5", cap_ground, (8.0, 16.8), 0.70)
    layout.via("Metal5", "TopMetal1", *cap_ground)

    # The shared substrate contact is a single elongated row beside the switches.
    tap_x, tap_y, rail_y = 17.7, 3.25, -1.2
    layout.tap("Psd", tap_x, tap_y, columns=88)
    tap_access = (34.5, tap_y)
    layout.track("Metal1", (32.30, tap_y), tap_access, 0.20)
    layout.via("Metal1", "TopMetal1", *tap_access, columns=3, top_columns=2)
    for x, y in (tap_access, cap_ground):
        layout.track("TopMetal1", (x, y), (x, rail_y), 1.8)
        layout.via("TopMetal1", "TopMetal2", x, rail_y, top_columns=2)
    rail_pin_x = right - 1.2
    layout.track("TopMetal2", (left, rail_y), (rail_pin_x, rail_y), 2.4)
    layout.pin("TopMetal2", "gnd", rail_pin_x, rail_y, size=2.4)
    layout.save()


build()
