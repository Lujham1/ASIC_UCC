"""Geometry and PCell helpers for the ENFOQUE_B switch layouts."""
import os
from pathlib import Path
import sys

import pya


PDK_KLAYOUT = Path(os.environ["PDK_ROOT"]) / os.environ["PDK"] / "libs.tech/klayout"
sys.path[:0] = [
    str(PDK_KLAYOUT / "python"),
    str(PDK_KLAYOUT / "python/pycell4klayout-api/source/python"),
]
import sg13g2_pycell_lib  # Registers the editable SG13_dev PCells.

DBU = 0.001
LAYERS = {
    "GatPoly": 5, "Nsd": 7, "Metal1": 8, "Metal2": 10, "Psd": 14,
    "Metal3": 30, "NWell": 31, "Metal4": 50, "Metal5": 67,
    "TopMetal1": 126, "TopMetal2": 134,
}
DIRECTIONS = {
    "Metal2": "h", "Metal3": "v", "Metal4": "h",
    "Metal5": "v", "TopMetal1": "v", "TopMetal2": "h",
}


def units(value):
    return round(value / DBU)


class Layout:
    def __init__(self, name):
        self.layout = pya.Layout()
        self.layout.dbu = DBU
        self.layout.technology_name = "sg13g2"
        self.cell = self.layout.create_cell(name)

    def layer(self, name, datatype=0):
        return self.layout.layer(LAYERS[name], datatype)

    def box(self, layer, x1, y1, x2, y2, datatype=0):
        self.cell.shapes(self.layer(layer, datatype)).insert(
            pya.Box(*(units(value) for value in (x1, y1, x2, y2)))
        )

    def landing(self, layer, x, y, size, datatype=0):
        half = size / 2
        self.box(layer, x - half, y - half, x + half, y + half, datatype)

    def track(self, layer, start, end, width):
        x1, y1 = start
        x2, y2 = end
        if start == end:
            return
        direction = "h" if y1 == y2 else "v" if x1 == x2 else None
        if direction is None or direction != DIRECTIONS.get(layer, direction):
            raise ValueError(f"Invalid {layer} track from {start} to {end}")
        half = width / 2
        extension = min(half, 0.10)
        if direction == "h":
            self.box(layer, min(x1, x2) - extension, y1 - half,
                     max(x1, x2) + extension, y1 + half)
        else:
            self.box(layer, x1 - half, min(y1, y2) - extension,
                     x1 + half, max(y1, y2) + extension)

    def pin(self, layer, name, x, y, size=0.50):
        self.landing(layer, x, y, size)
        self.landing(layer, x, y, size, datatype=2)
        self.cell.shapes(self.layer(layer, 25)).insert(
            pya.Text(name, pya.Trans(units(x), units(y)))
        )

    def pcell(self, name, parameters, x, y):
        variant = self.layout.create_cell(name, "SG13_dev", parameters)
        if variant is None or variant.is_empty() or not variant.is_pcell_variant():
            raise RuntimeError(f"Cannot instantiate SG13_dev/{name}: {parameters}")
        self.cell.insert(pya.CellInstArray(variant.cell_index(), pya.Trans(units(x), units(y))))
        return variant

    def mos(self, kind, x, y, width, length):
        self.pcell(kind, {
            "w": width, "l": length, "ng": 1, "m": "1",
            "model": f"sg13_lv_{kind}", "guardRingType": "none",
        }, x, y)

    def via(self, bottom, top, x, y, columns=1, rows=1, top_columns=1):
        return self.pcell("via_stack", {
            "b_layer": bottom, "t_layer": top, "vn_columns": columns, "vn_rows": rows,
            "vt1_columns": top_columns, "vt1_rows": 1,
            "vt2_columns": top_columns, "vt2_rows": 1,
        }, x, y)

    def tap(self, implant, x, y, columns):
        variant = self.via("Activ", "Metal1", x, y, columns=columns)
        active = variant.bbox_per_layer(self.layout.layer(1, 0))
        self.box(implant, x + active.left * DBU - 0.24, y + active.bottom * DBU - 0.24,
                 x + active.right * DBU + 0.24, y + active.top * DBU + 0.24)

    def save(self):
        for layer in DIRECTIONS | {"Metal1": ""}:
            shapes = self.cell.shapes(self.layer(layer))
            merged = pya.Region(shapes).merged()
            shapes.clear()
            shapes.insert(merged)
        output_dir = Path(os.environ.get("ASIC_LAYOUT_OUTPUT", Path(__file__).resolve().parent.parent))
        output_dir.mkdir(parents=True, exist_ok=True)
        output = output_dir / f"{self.cell.name}.gds"
        options = pya.SaveLayoutOptions()
        options.write_context_info = True
        self.layout.write(str(output), options)
        print(f"{output} {self.cell.dbbox()}")
