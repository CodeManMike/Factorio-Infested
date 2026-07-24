# The Ichor Engine
## Art Asset Production List and Sprite Creation Workflow — Version 0.1

## 1. Purpose

This document defines the art asset production plan and the practical workflow for turning concept art into Factorio-ready sprite frames.

It covers:

```text
MVP art requirements
placeholder policy
asset folder structure
tiles
entities
icons
UI graphics
state variants
animation priorities
sprite sheet rules
software needed
concept art → sprite frames → sprite sheet → Factorio prototype workflow
```

The goal is to build a repeatable pipeline:

```text
concept art
→ clean design sheet
→ Blender model or 2D paint source
→ rendered/painted frames
→ Aseprite/Krita cleanup
→ sprite sheet
→ Factorio prototype definition
→ in-game test
→ adjustment
```

## 2. Practical Reality

Concept art is not final game art. It answers mood, silhouette, materials, and shape language. Sprite production answers size, frame layout, origin, animation, scale, and readability.

The recommended workflow for Ichor:

```text
Buildings / trains / turrets / large machines:
  Blender → PNG frame sequence → Aseprite/Krita cleanup → sprite sheet → Factorio

Icons / UI / small items / tiles:
  Krita or Aseprite direct 2D workflow
```

## 3. Recommended Software

Minimum recommended stack:

| Purpose | Tool | Notes |
|---|---|---|
| 3D modeling/rendering | Blender | buildings, machines, trains, shadows |
| sprite sheet editing | Aseprite | best sprite workflow, sheet export |
| free sprite alternative | LibreSprite | free Aseprite-style option |
| painting/cleanup | Krita | strong free painting and animation tool |
| image cleanup | GIMP or Krita | transparency, levels, paintover |
| automation | PowerShell | repo/file operations |
| batch image scripts | Python + Pillow | frame stitching, validation |

Recommended first setup:

```text
Blender
Aseprite or LibreSprite
Krita
PowerShell
Python + Pillow later
```

## 4. Folder Structure

Source art should live outside the playable mod folder:

```text
E:\The Ichor Engine\art-source\
  concept\
  blender\
  aseprite\
  krita\
  exports\
    frames\
    sheets\
  reference\
```

Final exported graphics go inside the mod:

```text
E:\The Ichor Engine\mod\the-ichor-engine\graphics\
  entity\
  tile\
  icon\
  gui\
  technology\
```

Rule:

```text
Source files stay in art-source.
Final PNGs go in mod graphics.
```

## 5. MVP Asset List

### Tiles

```text
ichor-living-substrate
ichor-feral-substrate
```

Minimum: 1 texture each. Better: 4 variants each.

### Entities

```text
ichor-hive-core
ichor-substrate-node
ichor-neural-pylon-1
ichor-growth-chamber-1
ichor-feral-growth-chamber
```

### Icons

```text
ichor-raw-biomass
ichor-bio-forged-iron-plate
ichor-science-biomass
ichor-nutrient-slurry
ichor-crude-ichor
ichor-hive-core
ichor-substrate-node
ichor-neural-pylon-1
ichor-growth-chamber-1
ichor-feral-growth-chamber
```

### Alert Icons

```text
cargo locked
cargo pod blocked
no substrate
no neural signal
low loyalty
mutation warning
feralized
hunger high
```

## 6. Sprite Size Standards

Suggested source canvas sizes:

| Footprint | Canvas |
|---|---:|
| 1x1 | 96x96 or 128x128 |
| 2x2 | 160x160 or 192x192 |
| 3x3 | 224x224 or 256x256 |
| 4x4 | 320x320 |
| 5x5+ | 384x384+ |

MVP entity sizes:

| Entity | Footprint | Canvas |
|---|---:|---:|
| Hive Core | 5x5 | 384x384 |
| Substrate Node | 2x2 | 160x160 |
| Neural Pylon I | 1x2 or 2x2 | 160x192 |
| Growth Chamber I | 3x3 | 256x256 |
| Feral Growth Chamber | 3x3 | 256x256 |

Icons:

```text
Source: 128x128
Export: 64x64 PNG
```

## 7. Animation Standards

MVP frame counts:

| Entity | Idle Frames | Working Frames |
|---|---:|---:|
| Hive Core | 16 | 16 |
| Substrate Node | 8 | 16 |
| Neural Pylon I | 8 | 16 |
| Growth Chamber I | 8 | 16 |
| Feral Growth Chamber | 8 | 16 |

Recommended sheet layout:

```text
16 frames
8 columns
2 rows
frame size 256x256
sheet size 2048x512
```

## 8. Workflow A — 3D Concept-to-Sprite Pipeline

Use this for buildings, machines, turrets, trains, and large enemies.

### Step 1 — Prepare Concept

Create a design sheet with:

```text
isometric view
top silhouette
footprint
materials
moving parts
glow locations
state variants
```

For Growth Chamber I:

```text
Footprint: 3x3
Shape: womb-like assembler
Materials: bone frame, red membrane, ichor sacs
Motion: slow breathing, inner pulse
Danger variant: spikes, black ichor
Readable feature: central chamber cavity
```

### Step 2 — Blender Scale Reference

Use one tile as one Blender unit. Create footprint planes: 3x3 for Growth Chamber, 2x2 for pylon/node, 5x5 for Hive Core.

### Step 3 — Camera Rig

Create reusable template:

```text
orthographic camera
isometric/top-down view
locked camera angle
consistent lighting
transparent background
```

Save template:

```text
E:\The Ichor Engine\art-source\blender\_templates\factorio-camera-template.blend
```

### Step 4 — Block Out Model

Use simple shapes first:

```text
spheres for sacs
curves/tubes for veins
cones for spikes
beveled cubes for bone frames
metaballs/sculpt blobs for flesh
```

Check small-size readability before detail.

### Step 5 — Materials

Use a limited palette:

```text
wet red flesh
dark maroon muscle
bone beige
chitin bronze
black feral ichor
neural blue-white glow
sterile off-white/steel
```

### Step 6 — Animate

Growth Chamber loop:

```text
frame 1: normal
frame 4: membrane expands
frame 8: inner glow stronger
frame 12: membrane contracts
frame 16: return normal
```

Neural Pylon loop:

```text
pulse travels upward
top glows
root base twitches
```

Feral Growth Chamber:

```text
irregular twitch
black ichor pulse
spikes shift
glow flickers
```

### Step 7 — Render PNG Sequence

Example output:

```text
E:\The Ichor Engine\art-source\exports\frames\growth-chamber-1\working\
  growth-chamber-1-working-0001.png
  growth-chamber-1-working-0002.png
  ...
```

Requirements:

```text
PNG
RGBA / transparent alpha
same resolution every frame
same camera
same origin
same lighting
```

### Step 8 — Import to Aseprite/Krita

Clean frames:

```text
remove stray transparent pixels
increase silhouette contrast
paint over muddy details
strengthen edges
make glow readable
check no frame jumps
```

### Step 9 — Export Sprite Sheet

Aseprite settings:

```text
Export Sprite Sheet
Rows/Matrix
No per-frame trimming
16 frames
8 columns
2 rows
256x256 per frame
```

Export final to:

```text
E:\The Ichor Engine\mod\the-ichor-engine\graphics\entity\growth-chamber-1\growth-chamber-1-working.png
```

### Step 10 — Factorio Prototype Test

```lua
animation = {
  filename = "__the-ichor-engine__/graphics/entity/growth-chamber-1/growth-chamber-1-working.png",
  width = 256,
  height = 256,
  frame_count = 16,
  line_length = 8,
  animation_speed = 0.35,
  shift = {0, -0.25},
  scale = 0.5
}
```

## 9. Workflow B — 2D Sprite/Icon Pipeline

Use for icons, UI, tiles, effects, simple overlays.

Icon workflow:

```text
create 128x128 canvas
paint large silhouette
reduce/check at 64x64
increase contrast
simplify
export 64x64 PNG
```

Tile workflow:

```text
create 64x64 or 128x128 tile
paint organic texture
make edges tileable
create 4 variants
export to graphics/tile
```

## 10. Common Beginner Problems

| Problem | Cause | Fix |
|---|---|---|
| black background | no alpha | export PNG RGBA with transparency |
| cropped sprite | canvas too small / wrong width | add padding, fix prototype dimensions |
| jitter | frames trimmed/aligned differently | no trimming, lock camera/origin |
| too big/small | scale mismatch | adjust prototype `scale`, camera orthographic scale |
| unreadable blob | too much detail / weak silhouette | simplify and increase contrast |
| wrong footprint | shift/collision mismatch | adjust `shift`, `selection_box`, `collision_box` |

## 11. First Asset Order

1. **Breathing cube test** — prove Blender → sheet → Factorio.
2. **Growth Chamber I** — central asset and working animation.
3. **Feral Growth Chamber** — duplicate and corrupt Growth Chamber.
4. **Neural Pylon I** — simpler vertical animated asset.
5. **Living Substrate** — tile workflow.
6. **Hive Core** — important, but do not start here.

## 12. Four-Week Learning Plan

### Week 1 — Export Loop

Render a breathing cube from Blender, export sprite sheet, load in Factorio.

### Week 2 — Growth Chamber Blockout

Ugly but readable biological assembler.

### Week 3 — Paintover and Feral Variant

Make it feel like Ichor and create the hostile variant.

### Week 4 — Templates

Reusable Blender camera, lighting, Aseprite export preset, Lua prototype template.

## 13. Art Non-Negotiables

- Concept art is not final sprite art.
- Use Blender for buildings unless there is a strong reason not to.
- Use 2D tools for cleanup, icons, tiles, and overlays.
- Always use transparent PNGs.
- Do not trim entity animation frames individually.
- Keep camera, lighting, and origin consistent.
- Test at gameplay zoom.
- Make silhouette readable before detail.
- Create normal before feral.
- Do not start with the Hive Core.

## 14. Final Art Mantra

> Use concept art for imagination. Use Blender for consistency. Use Aseprite or Krita for cleanup. Use Factorio for truth. If it reads in-game, it works. If it only looks good in the source file, it is lying to you.
