# The Ichor Engine

![The Ichor Engine](thumbnail.png)

**The Ichor Engine** is a Factorio total conversion where a crash-landed engineer survives by turning an alien infection into a living factory, then secretly rebuilds sterile industry, severs the hive bond, survives the resulting civil war, and launches an escape vessel.

> This repository is named **Factorio Infested** for historical reasons. The mod itself is **The Ichor Engine** (`the-ichor-engine`).

## What We Are Building

- A **Factorio 2.x + Space Age** mod that adds **Ichor** as its own story planet
- A living biological factory loop: substrate spread, hive hunger, neural control, loyalty, mutation, and feralization
- **Orbital quarantine** on Ichor until the player completes the escape arc — no rescue cargo mall imports
- A long-form campaign arc toward sterile betrayal, Severance, and escape

## Current Status

**v0.2.0** — MVP loop plus Biological Production scaffold:

- Core MVP prototypes (substrate tiles, hive core, growth chamber, neural pylon, fluids, recipes)
- Entity registry with `storage.ichor.entities` tracking
- Living substrate spread, substrate support validation, neural radius signal
- Hive hunger, loyalty decay, mutation pressure, feral conversion
- Biological Production buildings: Nutrient Vat I, Digestive Smelter I, Tendril, Tendon Track, Crude Vein, Bladder Tank
- Bio-Forged Copper Plate and expanded research chain
- Placeholder MVP graphics in `mod/the-ichor-engine/graphics/` (replace via `art-source/` pipeline)
- Debug commands, Hive/Entity GUI panels, alerts
- Early research technologies and Biomass Science

## Art Pipeline

| Path | Role |
|---|---|
| [`art-source/`](art-source/) | Local working files (Blender, Aseprite, Krita). Large binaries are **gitignored**. |
| [`mod/the-ichor-engine/graphics/`](mod/the-ichor-engine/graphics/) | Game-ready PNGs shipped with the mod (`entity/`, `tile/`, `icon/`, `gui/`, `technology/`). |

Export finals from `art-source/exports/` into `mod/the-ichor-engine/graphics/`, then run `tools/validate-graphics.ps1` before packaging. `art-source/` is never included in the release zip.

```powershell
# Generate colored placeholder sprites for wireup testing
python .\tools\generate-placeholder-graphics.py

# Verify expected PNGs exist
.\tools\validate-graphics.ps1
```

## Requirements

- Factorio **2.0**
- **Space Age** expansion

## Design Documentation

Full design bible and implementation specs live in [`instructions/`](instructions/). Start with [`instructions/00_README_INDEX.md`](instructions/00_README_INDEX.md).

## Development

Mod source: [`mod/the-ichor-engine/`](mod/the-ichor-engine/)

```powershell
# Link mod into Factorio mods folder
.\tools\link-mod.ps1

# Package release zip
.\tools\package-mod.ps1
```
