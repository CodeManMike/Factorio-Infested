# The Ichor Engine
## Compatibility and Dependency Strategy — Version 0.1

## 1. Purpose

This document defines the compatibility and dependency strategy for The Ichor Engine.

The strategy is:

```text
Depend on Factorio 2.x + Space Age.
Isolate Ichor as a self-contained story planet first.
Lock cargo delivery until escape.
Expose clean integration points later.
Do not promise major overhaul compatibility during MVP.
```

## 2. Compatibility Philosophy

- The MVP should be self-contained.
- Required dependencies only at first.
- Compatibility is a layer, not the foundation.
- Explicit support is better than accidental support.
- Unsupported is better than silently broken.

## 3. Required Dependencies

Initial `info.json`:

```json
"dependencies": [
  "base >= 2.0.0",
  "space-age >= 2.0.0"
]
```

Reason:

```text
Ichor is a Space Age-era planet, not a base-only Nauvis overhaul.
```

## 4. Optional Dependency Policy

Do not add optional dependencies until there is actual code using them.

A mod becomes optional only if:

```text
Ichor checks for it in data stage or runtime
Ichor modifies behavior based on it
compatibility is tested
behavior is documented
```

Optional examples for later:

```json
"? quality >= 2.0.0"
"? elevated-rails >= 2.0.0"
```

## 5. Incompatibility Policy

Use explicit incompatibility only when a mod truly cannot work with Ichor.

Reasons to mark incompatible:

```text
breaks planet generation
bypasses pre-escape cargo lock
replaces Space Age cargo systems incompatibly
deletes required prototypes
breaks runtime event assumptions
causes unrecoverable startup errors
```

Do not mark mods incompatible merely because they change balance.

## 6. Compatibility Tiers

### Tier 0 — Required

```text
base
space-age
```

### Tier 1 — Likely Safe QoL

```text
factory planners
rate calculators
blueprint helpers
map markers
UI helpers
bottleneck indicators
```

### Tier 2 — Balance-Affecting QoL

```text
long reach
early bots
infinite resources
faster start mods
larger inventory
```

Policy: do not block, but note they may affect campaign balance.

### Tier 3 — Content Expansion Mods

```text
new ores
new enemies
new planets
new sciences
new power/logistics/weapons
```

Requires testing.

### Tier 4 — Major Overhauls

```text
Krastorio-style
Bob’s/Angel’s-style
Space Exploration-style
Industrial Revolution-style
Pyanodons-style
```

Policy: unsupported for MVP.

### Tier 5 — Dangerous Integration Mods

```text
mods that alter cargo pods
mods that alter Cargo Landing Pad
mods that create cross-planet logistics shortcuts
mods that change player starting planet/surface
mods that auto-deliver items to planets
mods that alter space platform delivery rules
```

High risk; explicit testing required.

## 7. Space Age Planet Integration

Canonical planet/surface name:

```text
ichor
```

Runtime check:

```lua
surface.name == "ichor"
```

Ichor is:

```text
a new Space Age planet
a self-contained story arc
a future postgame Space Age integration point
```

Ichor is not:

```text
a normal cargo-supported planet from the start
a replacement for all Space Age planets
```

## 8. Cargo Delivery Lock Strategy

Pre-escape:

```text
Cargo Landing Pad blocked.
Cargo pods blocked.
Spawned cargo containers destroyed where possible.
```

Post-escape:

```text
Cargo Landing Pad allowed.
Cargo pods allowed.
Future interplanetary chains can begin.
```

Storage flags:

```lua
storage.ichor.campaign.escape_complete
storage.ichor.campaign.cargo_unlocked
```

Events:

```text
on_built_entity
on_robot_built_entity
script_raised_built
script_raised_revive
on_cargo_pod_finished_descending
on_cargo_pod_delivered_cargo
```

## 9. Cargo Compatibility Risks

| Risk | MVP Policy |
|---|---|
| direct item spawning by other mods | not blocked; documented bypass |
| custom cargo entities | unsupported until adapter exists |
| renamed cargo landing pad | vanilla `cargo-landing-pad` only first |
| changed starting surface | controlled start assumed |

Future solution:

```text
remote interface so other mods can query whether Ichor cargo is unlocked
compatibility adapters for known cargo mods
strict-mode setting if needed
```

## 10. Compatibility Architecture

Future folder:

```text
scripts/compat/
  compat.lua
  mod-detection.lua
  space-age.lua
  quality.lua
  elevated-rails.lua
  cargo-systems.lua
  qol.lua
```

MVP only needs:

```text
scripts/space-age/cargo-lock.lua
```

## 11. Remote Interface Strategy

Future interface name:

```text
the-ichor-engine
```

Initial functions when needed:

```lua
remote.add_interface("the-ichor-engine", {
  get_version = function()
    return storage.ichor.version
  end,

  is_ichor_surface = function(surface_name)
    return surface_name == "ichor"
  end,

  is_cargo_unlocked = function()
    return storage.ichor
      and storage.ichor.campaign
      and storage.ichor.campaign.cargo_unlocked == true
  end
})
```

Rules:

```text
never expose mutable storage
return copied/simple values
validate arguments
keep stable once public
```

## 12. Prototype Compatibility Rules

Never mutate another mod’s prototypes without checks.

Bad:

```lua
data.raw.item["some-mod-item"].stack_size = 1
```

Good:

```lua
if data.raw.item["some-mod-item"] then
  data.raw.item["some-mod-item"].stack_size = 1
end
```

Do not delete Space Age cargo systems globally. Use local Ichor runtime locks.

## 13. Multiplayer Compatibility

Shared state:

```text
hive hunger
cargo lock
escape complete
substrate
tracked entities
loyalty
mutation
feralization
```

Per-player state:

```text
open GUI panels
selected overlay
alert verbosity
story verbosity
last selected entity
```

## 14. Test Matrix

Baseline:

```text
[ ] base + space-age only
[ ] new game
[ ] save/load
[ ] Ichor surface/planet
[ ] Cargo Landing Pad lock
[ ] cargo pod lock
[ ] escape unlock
[ ] MVP loop
```

Cargo stress:

```text
[ ] player-built landing pad pre-escape
[ ] robot-built landing pad pre-escape
[ ] script-built landing pad pre-escape
[ ] cargo pod lands pre-escape
[ ] cargo pod delivers to ground pre-escape
[ ] cargo pod delivers after escape
[ ] landing pad works after escape
```

## 15. README Compatibility Note

```text
Requires Factorio 2.x and Space Age. Major overhaul compatibility is not supported in early versions. QoL mods may work, but mods that alter cargo pods, Cargo Landing Pad behavior, planet generation, or Space Age progression may conflict.
```

## 16. Final Compatibility Mantra

> Required dependencies only. Optional support only when tested. No accidental cargo bypass. No global Space Age vandalism. Isolate the story first. Integrate the galaxy later.
