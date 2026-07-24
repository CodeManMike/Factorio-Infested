<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Modding Implementation Guide — Consolidated Version 0.2

## Ground Rules

1. Target one Factorio major version at a time.
2. Use `storage`, not legacy `global`.
3. Keep `control.lua` thin.
4. Keep `data.lua` as a loader.
5. Use vanilla prototypes first.
6. Add debug commands early.
7. Test save/load constantly.
8. Do not implement all content before MVP loop works.

## Recommended Repo Structure

```text
the-ichor-engine/
  DESIGN/
  mod/the-ichor-engine/
    info.json
    changelog.txt
    settings.lua
    data.lua
    control.lua
    prototypes/
    scripts/
    graphics/
    locale/en/locale.cfg
    migrations/
  tools/
  test-saves/
```

## `info.json`

```json
{
  "name": "the-ichor-engine",
  "version": "0.0.1",
  "title": "The Ichor Engine",
  "author": "CodeManMike",
  "factorio_version": "2.0",
  "dependencies": ["base >= 2.0.0", "space-age >= 2.0.0"],
  "description": "A Space Age planet overhaul about biological industry, neural control, mutation, sterile betrayal, Severance, and escape from an isolated living world."
}
```


## Space Age Planet and Cargo Lock Implementation

Canonical dependency:

```json
"dependencies": ["base >= 2.0.0", "space-age >= 2.0.0"]
```

The mod should define an added Ichor planet in the Space Age planetary framework.

Initial modules to add:

```text
prototypes/space-age/ichor-planet.lua
prototypes/space-age/space-connections.lua
scripts/space-age/planet-state.lua
scripts/space-age/cargo-lock.lua
```

Runtime state:

```lua
storage.ichor.space_age = {
  ichor_planet_name = "ichor",
  ichor_surface_name = "ichor",
  escaped = false,
  cargo_locked = true
}
```

Cargo lock behavior:

```text
Before escape:
  if a Cargo Landing Pad is built on the Ichor surface, refund/destroy it and alert the player.
  also handle robot-built and script-raised builds.

After escape:
  set escaped = true and cargo_locked = false.
  allow Cargo Landing Pad placement and future orbital logistics.
```

MVP implementation should use runtime enforcement rather than invasive global prototype changes. This avoids breaking Space Age cargo pads on Nauvis, Vulcanus, Fulgora, Gleba, Aquilo, or other modded planets.

Suggested debug commands:

```text
/ichor-space-status
/ichor-unlock-cargo
/ichor-lock-cargo
/ichor-mark-escaped
```

Acceptance check:

```text
Cargo Landing Pad works normally elsewhere.
Cargo Landing Pad cannot be used on Ichor before escape.
Cargo Landing Pad becomes allowed on Ichor after escape flag is set.
```


## Runtime Bootstrap

`control.lua`:

```lua
local bootstrap = require("scripts.bootstrap.bootstrap")
local events = require("scripts.bootstrap.events")
local commands = require("scripts.debug.commands")

script.on_init(bootstrap.on_init)
script.on_configuration_changed(bootstrap.on_configuration_changed)
script.on_load(bootstrap.on_load)

events.register()
commands.register()
```

`bootstrap.lua`:

```lua
local bootstrap = {}

function bootstrap.on_init()
  storage.ichor = {
    version = "0.0.1",
    hive = { hunger = 0.0, awareness = 0.0, core_unit_number = nil },
    entities = {},
    substrate = { sources = {}, dirty_chunks = {}, spread_queue = {} },
    scheduler = { cursors = {} },
    story = { flags = {} },
    gui = { players = {} }
  }
end

function bootstrap.on_configuration_changed(event)
  storage.ichor = storage.ichor or {}
  storage.ichor.entities = storage.ichor.entities or {}
end

function bootstrap.on_load()
  -- Rebuild local caches only. Do not write to storage here.
end

return bootstrap
```

## Prototype Loader Pattern

`data.lua` should only require modules: categories, items, fluids, tiles, entities, recipes, technologies.

## Use Placeholder Copies First

| Vanilla Prototype | Ichor Prototype |
|---|---|
| assembling-machine-1 | Growth Chamber I |
| stone-furnace | Digestive Smelter I |
| small-electric-pole | Neural Pylon I |
| transport-belt | Tendon Track |
| inserter | Basic Tendril |
| pipe | Crude Vein |
| storage-tank | Bladder Tank |
| gun-turret | Spike Spitter |
| stone-wall | Chitin Wall |

## Event Registration

Centralize all `script.on_event` and `script.on_nth_tick` registrations in `scripts/bootstrap/events.lua`.

## Required MVP Modules

```text
scripts/bootstrap/bootstrap.lua
scripts/bootstrap/events.lua
scripts/registry/entity-registry.lua
scripts/registry/tracked-entities.lua
scripts/substrate/substrate.lua
scripts/hunger/hunger.lua
scripts/neural/neural.lua
scripts/loyalty/loyalty.lua
scripts/mutation/mutation.lua
scripts/feral/feral.lua
scripts/gui/hive-panel.lua
scripts/debug/commands.lua
```

## First Development Order

1. Empty mod loads.
2. Add item group and Raw Biomass.
3. Add Hive Core placeholder.
4. Initialize `storage.ichor`.
5. Add `/ichor-status`.
6. Add Living/Feral Substrate.
7. Add Substrate Node spread.
8. Add Growth Chamber and substrate validation.
9. Add Neural Pylon signal.
10. Add Hunger.
11. Add Loyalty.
12. Add Mutation Pressure.
13. Add Feral Conversion.
14. Add Hive Panel.
15. Add first science chain.

## Debug Commands

`/ichor-status`, `/ichor-feed`, `/ichor-starve`, `/ichor-spread-substrate`, `/ichor-feralize-selected`, `/ichor-dump-selected`, `/ichor-rebuild-registry`, `/ichor-reset`.

## MVP Acceptance Criteria

The first MVP is complete when the mod loads, new game starts, substrate spreads, Growth Chamber requires substrate, Neural Pylon provides signal, hunger rises/feeding lowers it, loyalty changes, mutation pressure rises, feral conversion works, save/load preserves state, and debug commands work.

## Implementation Mantra

> First make the factory breathe. Then make it disobey. Then make it beautiful. Then make it huge.
