# The Ichor Engine
## Coding-Agent MVP Implementation Pack — Version 0.1

> Canonical repo root: `E:\The Ichor Engine`  
> Canonical docs folder: `E:\The Ichor Engine\ichor_engine_core_docs_markdown`  
> Canonical mod folder: `E:\The Ichor Engine\mod\the-ichor-engine`

## 1. Purpose

This document is the practical build-start pack for a coding agent. It converts the design bible into concrete, ordered development work. The agent’s job is **not** to build the whole overhaul at once. The first job is to build the smallest playable technical MVP:

```text
A Factorio 2.x + Space Age mod that adds Ichor as an isolated story planet, blocks pre-escape cargo delivery, grows Living Substrate, supports one biological machine, tracks neural signal, tracks Hive Hunger, tracks loyalty, raises mutation pressure, and converts a neglected machine into a feral hostile entity.
```

The MVP must prove this loop:

```text
Living Substrate spreads
→ Growth Chamber depends on substrate
→ Neural Pylon provides control
→ Hive Hunger affects stability
→ unsupported machine loses loyalty
→ mutation pressure rises
→ machine becomes feral
→ player receives warnings and can inspect/debug the cause
```

## 2. Non-Negotiable Technical Rules

- Target **Factorio 2.x + Space Age**.
- Ichor is an **added planet/surface**, not a Nauvis reskin.
- Runtime state uses `storage`, never legacy `global`.
- `control.lua` remains a thin loader.
- `data.lua` remains a thin prototype loader.
- Do not script belts, inserters, pipes, trains, or crafting where vanilla prototypes already do it.
- Use vanilla prototypes as placeholders.
- Every milestone must load in Factorio before moving on.
- Cargo deliveries must be locked before escape.
- Lock must cover both `cargo-landing-pad` placement and cargo pod delivery/landing events.

## 3. Target Folder Layout

```text
E:\The Ichor Engine\
  ichor_engine_core_docs_markdown\
  mod\
    the-ichor-engine\
      info.json
      changelog.txt
      thumbnail.png
      settings.lua
      data.lua
      data-updates.lua
      data-final-fixes.lua
      control.lua
      prototypes\
        lib\
        categories\
        items\
        fluids\
        tiles\
        entities\
        logistics\
        recipes\
        technologies\
        planets\
      scripts\
        bootstrap\
        registry\
        substrate\
        neural\
        hunger\
        loyalty\
        mutation\
        feral\
        space-age\
        gui\
        alerts\
        story\
        debug\
        util\
      graphics\
        icons\
        tiles\
        entities\
        technology\
        gui\
      sound\
      locale\
        en\
          locale.cfg
      migrations\
  tools\
    link-mod.ps1
    package-mod.ps1
    clean-mod.ps1
  saves\
    test\
```

## 4. `info.json` Target

```json
{
  "name": "the-ichor-engine",
  "version": "0.0.1",
  "title": "The Ichor Engine",
  "author": "CodeManMike",
  "factorio_version": "2.0",
  "dependencies": [
    "base >= 2.0.0",
    "space-age >= 2.0.0"
  ],
  "description": "A Space Age planet overhaul about biological industry, neural control, mutation, sterile betrayal, and escape from a living factory."
}
```

## 5. Initial Settings

Create `settings.lua`:

```lua
data:extend({
  {
    type = "bool-setting",
    name = "ichor-debug-mode",
    setting_type = "runtime-global",
    default_value = false,
    order = "a"
  },
  {
    type = "string-setting",
    name = "ichor-difficulty",
    setting_type = "startup",
    default_value = "hostile",
    allowed_values = {"symbiotic", "hostile", "apex", "feral-world"},
    order = "b"
  },
  {
    type = "double-setting",
    name = "ichor-substrate-spread-multiplier",
    setting_type = "startup",
    default_value = 1.0,
    minimum_value = 0.1,
    maximum_value = 10.0,
    order = "c"
  },
  {
    type = "bool-setting",
    name = "ichor-lock-cargo-before-escape",
    setting_type = "startup",
    default_value = true,
    order = "d"
  }
})
```

## 6. Milestones

### Milestone 0 — Scaffold Loads

Create a mod that starts with no gameplay content.

Required files:

```text
info.json
changelog.txt
settings.lua
data.lua
control.lua
locale/en/locale.cfg
scripts/bootstrap/bootstrap.lua
scripts/bootstrap/events.lua
scripts/bootstrap/storage-factory.lua
scripts/bootstrap/force-setup.lua
scripts/debug/commands.lua
```

Acceptance:

```text
[ ] Mod appears in mod list
[ ] New game starts
[ ] No runtime error
[ ] /ichor-status works
[ ] Save/load works
```

### Milestone 1 — Ichor Planet Shell and Cargo Lock

Goal: establish Ichor as the Space Age planet/surface assumption and prevent pre-escape cargo.

Files:

```text
prototypes/planets/ichor-planet.lua
scripts/space-age/cargo-lock.lua
```

Cargo lock must block:

```text
cargo-landing-pad placement
on_cargo_pod_finished_descending
on_cargo_pod_delivered_cargo
```

Pre-escape behavior:

```text
Cargo Landing Pad: destroy/refund/warn
Cargo Pod: destroy or neutralize
Cargo container: destroy before usable cargo persists where possible
```

Post-escape behavior:

```text
storage.ichor.campaign.escape_complete = true
storage.ichor.campaign.cargo_unlocked = true
Cargo Landing Pad allowed
Cargo pods allowed
```

### Milestone 2 — Core Prototypes

Required prototypes:

```text
Tiles:
  ichor-living-substrate
  ichor-feral-substrate

Items:
  ichor-raw-biomass
  ichor-bio-forged-iron-plate
  ichor-science-biomass

Fluids:
  ichor-nutrient-slurry
  ichor-crude-ichor

Entities:
  ichor-hive-core
  ichor-substrate-node
  ichor-neural-pylon-1
  ichor-growth-chamber-1
  ichor-feral-growth-chamber
```

Use vanilla-copied placeholder graphics and behavior until the custom art pipeline exists.

### Milestone 3 — Runtime Debug Commands

Required commands:

```text
/ichor-status
/ichor-feed
/ichor-starve
/ichor-complete-escape
/ichor-reset-escape
/ichor-spread-substrate
/ichor-dump-selected
/ichor-feralize-selected
/ichor-balance-report
```

### Milestone 4 — Entity Registry

Track only important Ichor entities. Do not store `LuaEntity` directly in persistent state. Store primitive values and resolve entities by `unit_number`.

Tracked definitions:

```lua
return {
  ["ichor-hive-core"] = { kind = "hive-core", is_biological = true },
  ["ichor-substrate-node"] = { kind = "substrate-source", is_biological = true },
  ["ichor-neural-pylon-1"] = { kind = "neural", is_biological = true, radius = 18 },
  ["ichor-growth-chamber-1"] = {
    kind = "bio-building",
    is_biological = true,
    requires_substrate = true,
    requires_neural = true,
    can_mutate = true,
    can_feralize = true,
    feral_variant = "ichor-feral-growth-chamber"
  },
  ["ichor-feral-growth-chamber"] = { kind = "feral-building", is_feral = true }
}
```

### Milestone 5 — Living Substrate Spread

Every 60 ticks, process a small batch of substrate sources. Set nearby valid tiles to `ichor-living-substrate`.

MVP values:

```text
Substrate Node radius: 8
Tiles per spread event: 3
Spread interval: 60 ticks
```

### Milestone 6 — Growth Chamber Support Validation

Every 300 ticks:

```text
If Growth Chamber center tile is Living Substrate:
  active = true
  substrate_state = controlled
else:
  active = false
  substrate_state = unsupported
```

### Milestone 7 — Neural Pylon Signal

MVP neural rule:

```text
Growth Chamber inside radius 18 of Neural Pylon I = neural_signal 1.0
Growth Chamber outside radius = neural_signal 0.0
```

### Milestone 8 — Hive Hunger and Feeding

Every 300 ticks:

```text
hunger += 0.005
if Hive Core has ichor-raw-biomass:
  consume 1
  hunger -= 0.03
clamp 0..1
```

### Milestone 9 — Loyalty and Mutation

Loyalty every 300 ticks:

```text
no substrate: -0.04
no neural: -0.03
hunger >= 0.70: -0.02
fully supported and hunger < 0.50: +0.01
```

Mutation every 900 ticks:

```text
loyalty < 0.50: +0.04
hunger > 0.80: +0.02
warning at 0.50
```

### Milestone 10 — Feral Conversion

Convert `ichor-growth-chamber-1` into `ichor-feral-growth-chamber` if:

```text
loyalty <= 0.0
mutation_pressure >= 0.50
can_feralize == true
```

### Milestone 11 — Basic UI and Alerts

Required UI:

```text
top Ichor button
Hive Panel
Selected Entity Panel
```

Required alerts:

```text
cargo locked
cargo pod blocked
no substrate
no neural signal
low loyalty
mutation warning
feralized
```

### Milestone 12 — Early Research Unlocks

Technologies:

```text
ichor-tech-first-feeding
ichor-tech-basic-bio-production
ichor-tech-basic-neural-control
ichor-tech-feral-detection
```

## 7. Final MVP Acceptance Scenario

```text
1. Start Factorio with mod enabled.
2. Start new save.
3. Confirm storage.ichor initializes.
4. Confirm Ichor planet/surface assumption exists.
5. Confirm cargo is locked pre-escape.
6. Attempt Cargo Landing Pad placement on Ichor; it is blocked/refunded.
7. Attempt or simulate cargo pod delivery; cargo is blocked.
8. Place Hive Core.
9. Place Substrate Node.
10. Living Substrate spreads.
11. Place Growth Chamber on Living Substrate.
12. Place Neural Pylon nearby.
13. Growth Chamber works and remains loyal.
14. Starve Hive or remove Neural Pylon.
15. Growth Chamber loses loyalty.
16. Mutation pressure rises.
17. Warning appears before failure.
18. Growth Chamber becomes feral if ignored.
19. Feral entity is hostile.
20. Player can inspect cause.
21. Save/load preserves state.
22. Run /ichor-complete-escape.
23. Cargo Landing Pad and cargo pods are now allowed on Ichor.
```

## 8. Master Prompt for Codex

```text
You are implementing the first MVP of The Ichor Engine, a Factorio 2.x + Space Age mod in E:\The Ichor Engine.

Core assumptions:
- The mod targets Factorio 2.x.
- The mod depends on base and space-age.
- Ichor is an added Space Age planet/surface.
- Cargo deliveries on Ichor must be disabled until escape_complete is true.
- Pre-escape, Cargo Landing Pad placement and cargo pod delivery on Ichor must be blocked.
- Runtime state must use storage, not global.
- Do not mutate storage in on_load.
- control.lua and data.lua must remain thin loaders.
- Use vanilla prototypes as placeholders where possible.
- Do not script belts, inserters, pipes, crafting, or trains.

Build only the MVP loop: Living Substrate, Hive Core, Growth Chamber, Neural Pylon, Hunger, Loyalty, Mutation, Feralization, UI/alerts, debug commands, and cargo lock.
```

## 9. Final Agent Instruction

Build the smallest useful nightmare.

The first success is:

```text
A player lands on Ichor.
They cannot import cargo yet.
They grow living ground.
They build one living machine.
They feed the hive.
They control it with a pylon.
They neglect it.
It warns them.
It mutates.
It turns against them.
They understand exactly why.
```
