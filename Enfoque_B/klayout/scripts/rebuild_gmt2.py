"""Build only llaves_gmt2 from SG13_dev PCells and its schematic connections."""
import os
import sys
import pya

PDK_KLAYOUT = os.path.join(os.environ["PDK_ROOT"], os.environ["PDK"], "libs.tech", "klayout")
sys.path.insert(0, os.path.join(PDK_KLAYOUT, "python"))
sys.path.insert(0, os.path.join(PDK_KLAYOUT, "python", "pycell4klayout-api", "source", "python"))
import sg13g2_pycell_lib  # Registers SG13_dev in this KLayout process.

DBU = 0.001
OUT = "/foss/designs/ASIC_UCC/Enfoque_B/klayout/llaves_gmt2.gds"


def u(value):
    return int(round(value / DBU))


def layer(layout, number, datatype=0):
    return layout.layer(pya.LayerInfo(number, datatype))


def add_box(cell, layer_index, x1, y1, x2, y2):
    cell.shapes(layer_index).insert(pya.Box(u(x1), u(y1), u(x2), u(y2)))


def add_path(cell, layer_index, points, width):
    points = [pya.Point(u(x), u(y)) for x, y in points]
    cell.shapes(layer_index).insert(pya.Path(points, u(width)))


def add_label(cell, layer_index, name, x, y):
    cell.shapes(layer_index).insert(pya.Text(name, pya.Trans(pya.Trans.R0, u(x), u(y))))


def place_pcell(layout, top, name, parameters, x, y):
    pcell = layout.create_cell(name, "SG13_dev", parameters)
    if pcell is None or pcell.is_empty():
        raise RuntimeError("PCell creation failed: %s %r" % (name, parameters))
    top.insert(pya.CellInstArray(pcell.cell_index(), pya.Trans(pya.Trans.R0, u(x), u(y))))
    return pcell


def via(layout, top, bottom, upper, x, y, columns=1, rows=1):
    cell = place_pcell(layout, top, "via_stack", {
        "b_layer": bottom, "t_layer": upper,
        "vn_columns": columns, "vn_rows": rows,
        "vt1_columns": 1, "vt1_rows": 1,
        "vt2_columns": 1, "vt2_rows": 1,
    }, x, y)
    metal_numbers = {"Metal1": 8, "Metal2": 10, "Metal3": 30, "Metal4": 50, "Metal5": 67, "TopMetal1": 126}
    order = list(metal_numbers)
    lo = order.index(bottom) if bottom in order else 0
    hi = order.index(upper) if upper in order else 0
    for metal in order[lo:hi+1]:
        if metal in ("Metal1", "TopMetal1"):
            continue
        size = 0.40 if metal not in ("TopMetal1",) else 1.20
        add_box(top, layer(layout, metal_numbers[metal]), x-size/2, y-size/2, x+size/2, y+size/2)
    return cell


def gate_access(layout, top, x, y, polarity, route_metal, poly_layer):
    # Keep the transistor geometry inside the MOS PCell; only extend its gate
    # poly outside active to form a legal via_stack landing.
    if polarity == "n":
        add_box(top, poly_layer, x - 0.15, y - 0.52, x + 0.15, y - 0.14)
        add_box(top, poly_layer, x - 0.065, y - 0.18, x + 0.065, y + 0.41)
        access_y = y - 0.35
    else:
        add_box(top, poly_layer, x - 0.15, y + 0.38, x + 0.15, y + 1.00)
        add_box(top, poly_layer, x - 0.065, y - 0.12, x + 0.065, y + 1.00)
        # Move the PMOS gate landing away from its neighboring source/drain M1.
        access_y = y + 0.80
    via(layout, top, "GatPoly", route_metal, x, access_y)
    # Merge the small PCell M1 landing into a legal-area local gate access.
    add_box(top, layer(layout, 8), x - 0.15, access_y - 0.16,
            x + 0.15, access_y + 0.16)
    return access_y


def terminal_access(layout, top, m1_layer, route_metal, terminal_x, y, via_x):
    # Short M1 escape to a via_stack landing outside the gate's poly footprint.
    if abs(via_x - terminal_x) > 0.001:
        add_path(top, m1_layer, [(terminal_x, y), (via_x, y)], 0.16)
    via(layout, top, "Metal1", route_metal if route_metal != "Metal2" else "Metal2", via_x, y)
    return via_x, y


def build():
    layout = pya.Layout()
    layout.dbu = DBU
    layout.technology_name = "sg13g2"
    top = layout.create_cell("llaves_gmt2")

    m1 = layer(layout, 8)
    m2 = layer(layout, 10)
    m3 = layer(layout, 30)
    m4 = layer(layout, 50)
    m5 = layer(layout, 67)
    tm1 = layer(layout, 126)
    poly = layer(layout, 5)
    text_m2 = layer(layout, 10, 25)

    nmos_params = {
        "w": "0.15u", "l": "0.13u", "ng": 1, "m": "1",
        "model": "sg13_lv_nmos", "guardRingType": "none",
    }
    pmos_params = {
        "w": "0.15u", "l": "0.13u", "ng": 1, "m": "1",
        "model": "sg13_lv_pmos", "guardRingType": "none",
    }

    # Each PMOS sits above its matched NMOS. The slight row staggering gives
    # each same-layer gate route its own horizontal track.
    pairs = [
        {"x": 5.0, "yn": 2.0, "yp": 8.0, "out": "s_mpmos", "gn": "sel0", "gp": "u"},
        {"x": 11.0, "yn": 4.0, "yp": 10.0, "out": "vbias", "gn": "sel1", "gp": "t"},
        {"x": 17.0, "yn": 6.0, "yp": 12.0, "out": "s_mtr1", "gn": "sel2", "gp": "v"},
    ]
    input_routes = []
    output_routes = []
    gmt2_sources = []
    n_taps = []
    p_taps = []

    output_layer = {"s_mpmos": ("Metal3", m3), "vbias": ("Metal4", m4), "s_mtr1": ("Metal5", m5)}
    for pair in pairs:
        x, yn, yp = pair["x"], pair["yn"], pair["yp"]
        place_pcell(layout, top, "nmos", nmos_params, x, yn)
        place_pcell(layout, top, "pmos", pmos_params, x, yp)

        gate_x = x + 0.435
        # All NMOS controls make an M3 antenna jump, then use M4 over the source bus.
        n_access = gate_access(layout, top, gate_x, yn, "n", "Metal3", poly)
        n_gate_metal = "Metal4"
        via(layout, top, "Metal3", n_gate_metal, gate_x, n_access)
        input_routes.append((pair["gn"], gate_x, n_access, n_gate_metal))
        p_access = gate_access(layout, top, gate_x, yp, "p", "Metal3", poly)
        input_routes.append((pair["gp"], gate_x, p_access, "Metal3"))

        # G_MT2 is the common source node. M1 stubs move the via_stack outside
        # the PCell gate and the shared source is routed on M3.
        gmt2_sources.append(terminal_access(layout, top, m1, "Metal2", x + 0.15, yn + 0.15, x - 0.30))
        gmt2_sources.append(terminal_access(layout, top, m1, "Metal2", x + 0.15, yp + 0.15, x - 0.30))

        net = pair["out"]
        metal_name, metal_layer = output_layer[net]
        n_drain = terminal_access(layout, top, m1, "Metal2", x + 0.72, yn + 0.15, x + 1.20)
        n_via_y = yn + 0.15 + (0.12 if net == "vbias" else 0.0)
        if abs(n_via_y - n_drain[1]) > 0.001:
            add_path(top, m2, [(x + 1.20, n_drain[1]), (x + 1.20, n_via_y)], 0.20)
        via(layout, top, "Metal2", metal_name, x + 1.20, n_via_y)
        p_drain = terminal_access(layout, top, m1, "Metal2", x + 0.72, yp + 0.15, x + 1.20)
        p_via_y = yp + 0.15 + (0.12 if net == "vbias" else 0.0)
        if abs(p_via_y - p_drain[1]) > 0.001:
            add_path(top, m2, [(x + 1.20, p_drain[1]), (x + 1.20, p_via_y)], 0.20)
        via(layout, top, "Metal2", metal_name, x + 1.20, p_via_y)
        output_routes.append((net, metal_name, metal_layer, x + 1.20, n_via_y, p_via_y))

        # Bulk contacts are individual Activ-to-M1 via_stack PCells. The local
        # implant/well shapes enclose only those tap instances; no guard ring.
        ntx, nty = x + 2.0, yn - 0.68
        via(layout, top, "Activ", "Metal1", ntx, nty, 2, 1)
        add_box(top, layer(layout, 14), ntx - 0.75, nty - 0.75, ntx + 0.75, nty + 0.75)
        via(layout, top, "Metal1", "Metal2", ntx, nty)
        n_taps.append((ntx, nty))

        ptx, pty = x + 2.0, yp + 0.95
        via(layout, top, "Activ", "Metal1", ptx, pty, 2, 1)
        add_box(top, layer(layout, 7), ptx - 0.75, pty - 0.75, ptx + 0.75, pty + 0.75)
        add_box(top, layer(layout, 31), x - 0.31, yp - 0.31, ptx + 0.65, pty + 0.45)
        via(layout, top, "Metal1", "Metal2", ptx, pty)
        p_taps.append((ptx, pty))

    # Decoder-facing inputs. sel2 uses a short M5 bridge over the M4 vbias pin bus.
    for name, gx, gy, metal in input_routes:
        pin_x = 0.65
        if metal == "Metal3":
            pin_y = max(gy, 2.95)
            via(layout, top, "Metal2", "Metal3", pin_x, pin_y)
            add_path(top, m3, [(pin_x, pin_y), (gx, pin_y), (gx, gy)], 0.20)
        elif metal == "Metal4":
            pin_y = {"sel0": 1.40, "sel1": 2.30, "sel2": 11.50}.get(name, gy)
            via(layout, top, "Metal2", "Metal4", pin_x, pin_y)
            if name == "sel2":
                add_path(top, m4, [(pin_x, pin_y), (gx, pin_y), (gx, 9.05)], 0.20)
                via(layout, top, "Metal4", "Metal5", gx, 9.05)
                via(layout, top, "Metal4", "Metal5", gx, 7.95)
                add_path(top, m5, [(gx, 9.05), (gx, 7.95)], 0.20)
                add_path(top, m4, [(gx, 7.95), (gx, gy)], 0.20)
            else:
                add_path(top, m4, [(pin_x, pin_y), (gx, pin_y), (gx, gy)], 0.20)
        if metal in ("Metal4", "Metal5"):
            add_box(top, m2, pin_x - 0.20, pin_y - 0.20, pin_x + 0.20, pin_y + 0.20)
            add_label(top, text_m2, name, pin_x, pin_y)
        else:
            add_box(top, m2, pin_x - 0.20, gy - 0.20, pin_x + 0.20, gy + 0.20)
            add_label(top, text_m2, name, pin_x, gy)

    # Keep the M2 source bus below the sel1 gate via landing at y=3.65.
    source_track_n = 2.72
    source_track_p = 7.45
    # Join all six source terminals to the oscillator-facing g_mt2 boundary pin.
    for x, y in gmt2_sources:
        source_track = source_track_n if y < 5.25 else source_track_p
        add_path(top, m2, [(x, y), (x, source_track)], 0.24)
    source_x = sorted(set(x for x, _ in gmt2_sources))
    add_path(top, m2, [(source_x[0], source_track_n), (20.30, source_track_n)], 0.24)
    for x in source_x:
        add_path(top, m2, [(x, source_track_p), (x, source_track_n)], 0.24)
    add_path(top, m2, [(20.30, source_track_n), (20.30, 3.70), (21.0, 3.70)], 0.24)
    # Fill the same-net orthogonal g_mt2 elbow so its legs overlap fully.
    add_box(top, m2, 20.18, 2.60, 20.42, 3.82)
    add_box(top, m2, 20.75, 3.45, 21.25, 3.95)
    add_label(top, text_m2, "g_mt2", 21.0, 3.7)

    # Analog outputs and status pins face the opposite side from the decoder.
    # Keep the s_mpmos M5 lane below the NMOS drain via landing of s_mtr1.
    output_y = {"s_mpmos": 2.5, "vbias": 8.5, "s_mtr1": 14.2}
    for name, metal_name, metal_layer, x, y_n, y_p in output_routes:
        pin_y = output_y[name]
        low_y, high_y = min(y_n, y_p, pin_y), max(y_n, y_p, pin_y)
        if metal_name == "Metal5":
            # Rectangular legs share a full-width overlap at the M5 elbow.
            add_box(top, metal_layer, x - 0.12, low_y, x + 0.12, high_y)
            add_box(top, metal_layer, x - 0.12, pin_y - 0.12, 21.0, pin_y + 0.12)
        else:
            add_path(top, metal_layer, [(x, low_y), (x, high_y)], 0.24)
            add_path(top, metal_layer, [(x, pin_y), (21.0, pin_y)], 0.20)
        if metal_name != "Metal2":
            via(layout, top, "Metal2", metal_name, 21.0, pin_y)
        add_box(top, m2, 20.75, pin_y - 0.25, 21.25, pin_y + 0.25)
        add_label(top, text_m2, name, 21.0, pin_y)

    # Bridge the same-net M3 output landing to its horizontal pin lane.
    add_box(top, m3, 6.00, 2.20, 6.50, 2.60)

    # Abuttable M2 power rails span the full cell width.
    add_box(top, m2, 0.0, 0.10, 22.0, 0.90)
    add_box(top, m2, 0.0, 16.8, 22.0, 17.6)
    for x, y in n_taps:
        via(layout, top, "Metal2", "Metal4", x, y)
        via(layout, top, "Metal2", "Metal4", x, 0.50)
        add_path(top, m4, [(x, y), (x, 0.50)], 0.24)
    for x, y in p_taps:
        add_path(top, m2, [(x, y), (x, 17.2)], 0.24)
    add_box(top, m2, 20.75, 16.95, 21.25, 17.45)
    add_label(top, text_m2, "vdd", 21.0, 17.2)
    add_box(top, m2, 20.75, 0.25, 21.25, 0.75)
    add_label(top, text_m2, "gnd", 21.0, 0.50)

    # Merge touching route pieces while keeping MOS and via PCells hierarchical.
    for metal in (m1, m2, m3, m4, m5, tm1):
        region = pya.Region(top.shapes(metal))
        region.merge()
        top.shapes(metal).clear()
        for polygon in region.each():
            top.shapes(metal).insert(polygon)

    save_options = pya.SaveLayoutOptions()
    save_options.write_context_info = True
    layout.write(OUT, save_options)
    print("WROTE", OUT)
    for cell in layout.each_cell():
        if cell.is_pcell_variant():
            print("PCELL", cell.pcell_name(), cell.pcell_parameters_by_name())


build()












































