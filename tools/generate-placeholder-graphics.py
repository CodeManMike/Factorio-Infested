#!/usr/bin/env python3
"""Generate MVP placeholder PNGs for mod/the-ichor-engine/graphics/."""

from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1]
GFX = ROOT / "mod" / "the-ichor-engine" / "graphics"


def write_png(path: Path, size: tuple[int, int], rgb: tuple[int, int, int], label: str = "") -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    img = Image.new("RGBA", size, (*rgb, 255))
    if label:
        draw = ImageDraw.Draw(img)
        try:
            font = ImageFont.truetype("arial.ttf", 10)
        except OSError:
            font = ImageFont.load_default()
        draw.text((4, 4), label[:24], fill=(255, 255, 255, 255), font=font)
    img.save(path, "PNG")


def main() -> None:
    write_png(GFX / "tile/living-substrate/living-substrate.png", (64, 64), (120, 30, 40), "living")
    write_png(GFX / "tile/feral-substrate/feral-substrate.png", (64, 64), (40, 10, 20), "feral")

    entities = {
        "hive-core": (180, 50, 60),
        "substrate-node": (90, 140, 70),
        "neural-pylon-1": (70, 120, 200),
        "growth-chamber-1": (140, 90, 160),
        "feral-growth-chamber": (100, 40, 50),
        "nutrient-vat-1": (60, 160, 120),
        "digestive-smelter-1": (160, 100, 50),
        "tendril-1": (80, 180, 80),
        "tendon-track-1": (120, 80, 60),
        "crude-vein": (50, 130, 130),
        "bladder-tank-1": (90, 70, 150),
    }
    for name, color in entities.items():
        write_png(GFX / f"entity/{name}/{name}.png", (128, 128), color, name)

    icons = [
        "ichor-hive-core", "ichor-substrate-node", "ichor-neural-pylon-1",
        "ichor-growth-chamber-1", "ichor-feral-growth-chamber",
        "ichor-raw-biomass", "ichor-bio-forged-iron-plate", "ichor-bio-forged-copper-plate",
        "ichor-science-biomass", "ichor-nutrient-vat-1", "ichor-digestive-smelter-1",
        "ichor-tendril-1", "ichor-tendon-track-1", "ichor-crude-vein", "ichor-bladder-tank-1",
        "ichor-nutrient-slurry", "ichor-crude-ichor",
    ]
    for icon in icons:
        write_png(GFX / f"icon/{icon}.png", (64, 64), (100, 60, 80), icon.replace("ichor-", ""))

    write_png(GFX / "gui/ichor-top-button.png", (64, 64), (80, 40, 50), "ichor")
    write_png(GFX / "gui/ichor-alert-hunger.png", (64, 64), (200, 80, 40), "hunger")
    write_png(GFX / "gui/ichor-alert-loyalty.png", (64, 64), (200, 120, 40), "loyalty")

    write_png(GFX / "technology/ichor-tech-first-feeding.png", (256, 256), (100, 50, 70), "feed")
    write_png(GFX / "technology/ichor-tech-basic-bio-production.png", (256, 256), (60, 120, 80), "bio")
    write_png(GFX / "technology/ichor-tech-bio-logistics.png", (256, 256), (80, 100, 60), "logistics")
    write_png(GFX / "technology/ichor-tech-bio-metallurgy.png", (256, 256), (120, 90, 50), "metal")

    print(f"Placeholder graphics written under {GFX}")


if __name__ == "__main__":
    main()
