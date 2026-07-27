# Art Source — The Ichor Engine

Working art files live here. **Do not** reference this folder from Factorio prototypes.

| Location | Purpose |
|---|---|
| `concept/` | Mood boards, sketches, AI concept passes |
| `blender/` | 3D entity models and render setups |
| `aseprite/` | Icons, GUI, 2D entity frames |
| `krita/` | Tile textures and painted surfaces |
| `exports/frames/` | Rendered frame sequences (local only) |
| `exports/sheets/` | Sprite sheets before slice (local only) |
| `reference/` | Style refs, palette, vanilla comparisons |

## Pipeline

1. Create or iterate in the tool folder above.
2. Export game-ready PNGs into `mod/the-ichor-engine/graphics/` (not here).
3. Update prototypes to point at `__the-ichor-engine__/graphics/...`.
4. Validate in Factorio; package with `tools/package-mod.ps1`.

## Docs

- [22 — Art asset list & workflow](../instructions/22_art_asset_production_list_and_sprite_creation_workflow.md)
- [Art Gen prompts](../instructions/Art%20Gen.md)
- [20 — Prototype naming](../instructions/20_prototype_naming_scheme_and_id_bible.md)

## Git

Large binaries under `art-source/` are **gitignored**. Only folder scaffolding, README files, and `.gitkeep` are tracked. Final PNGs ship from `mod/the-ichor-engine/graphics/`.
