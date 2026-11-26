"""Build llaves_gmt2 with aligned CMOS rows and a shared well and taps."""
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from sg13_routing import Layout


def build():
    layout = Layout("llaves_gmt2")
    left, right = 0.85, 18.0
    yn, yp = 4.0, 10.0
    common_y = 7.25
    pairs = [
        (4.0, "sel0", "u", "s_mpmos", 1.45, 11.60, 5.75),
        (8.0, "sel1", "t", "vbias", 2.20, 12.35, 6.65),
        (12.0, "sel2", "v", "s_mtr1", 3.00, 13.10, 8.10),
    ]
    for x, n_gate, p_gate, analog, n_lane, p_lane, analog_lane in pairs:
        layout.mos("nmos", x, yn, "0.15u", "0.13u")
        layout.mos("pmos", x, yp, "0.15u", "0.13u")
        gx = x + 0.435
        for gate_name, access_y, lane in ((n_gate, yn - 0.35, n_lane), (p_gate, yp + 0.80, p_lane)):
            if gate_name == n_gate:
                layout.box("GatPoly", gx - 0.15, yn - 0.52, gx + 0.15, yn - 0.14)
                layout.box("GatPoly", gx - 0.065, yn - 0.18, gx + 0.065, yn + 0.41)
            else:
                layout.box("GatPoly", gx - 0.15, yp + 0.38, gx + 0.15, yp + 1.00)
                layout.box("GatPoly", gx - 0.065, yp - 0.12, gx + 0.065, yp + 1.00)
            layout.via("GatPoly", "Metal3", gx, access_y)
            layout.box("Metal1", gx - 0.15, access_y - 0.16, gx + 0.15, access_y + 0.16)
            layout.landing("Metal2", gx, access_y, 0.40)
            layout.track("Metal3", (gx, access_y), (gx, lane), 0.22)
            layout.via("Metal3", "Metal4", gx, lane)
            layout.landing("Metal3", gx, lane, 0.40)
            layout.track("Metal4", (left, lane), (gx, lane), 0.22)
            layout.via("Metal2", "Metal4", left, lane)
            layout.landing("Metal3", left, lane, 0.40)
            layout.pin("Metal2", gate_name, left, lane)

        sx, dx = x - 0.30, x + 1.20
        for y in (yn + 0.15, yp + 0.15):
            layout.track("Metal1", (sx, y), (x + 0.15, y), 0.18)
            layout.track("Metal1", (x + 0.72, y), (dx, y), 0.18)
            for terminal in (sx, dx):
                layout.via("Metal1", "Metal3", terminal, y)
                layout.landing("Metal2", terminal, y, 0.40)
        layout.track("Metal3", (sx, yn + 0.15), (sx, yp + 0.15), 0.22)
        layout.via("Metal2", "Metal3", sx, common_y)
        layout.track("Metal3", (dx, yn + 0.15), (dx, yp + 0.15), 0.22)
        layout.via("Metal3", "Metal4", dx, analog_lane)
        layout.track("Metal4", (left, analog_lane), (dx, analog_lane), 0.22)
        layout.via("Metal2", "Metal4", left, analog_lane)
        layout.landing("Metal3", left, analog_lane, 0.40)
        layout.pin("Metal2", analog, left, analog_lane)

    pin_x = right - 0.25
    layout.track("Metal2", (3.70, common_y), (pin_x, common_y), 0.24)
    layout.pin("Metal2", "g_mt2", pin_x, common_y)

    # One well for all three PMOS and their common N+ well contact.
    tap_x = 9.5
    n_tap_y, p_tap_y = 5.10, 9.10
    layout.tap("Psd", tap_x, n_tap_y, columns=33)
    layout.tap("Nsd", tap_x, p_tap_y, columns=33)
    layout.box("NWell", 3.55, 8.48, 15.55, 10.75)

    for net, tap_y, rail_y, access in (("gnd", n_tap_y, -0.30, 14.5),
                                       ("vdd", p_tap_y, 15.35, 14.5)):
        layout.via("Metal1", "TopMetal1", access, tap_y, columns=2, top_columns=2)
        for metal in ("Metal2", "Metal3", "Metal4"):
            layout.box(metal, access - 0.40, tap_y - 0.20, access + 0.40, tap_y + 0.20)
        layout.track("TopMetal1", (access, tap_y), (access, rail_y), 1.8)
        layout.via("TopMetal1", "TopMetal2", access, rail_y, top_columns=2)
        rail_pin_x = right - 1.2
        layout.track("TopMetal2", (left, rail_y), (rail_pin_x, rail_y), 2.4)
        layout.pin("TopMetal2", net, rail_pin_x, rail_y, size=2.4)
    layout.save()


build()
