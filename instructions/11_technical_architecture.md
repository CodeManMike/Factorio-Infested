<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Technical Architecture Document — Consolidated Version 0.2

## Architecture Principles

Factorio-native first; runtime state in `storage.ichor`; thin `control.lua`; event-driven first, scheduled second; no full-world scans; save/load safety; per-player GUI; staged Severance.

## Lifecycle Hooks

```lua
script.on_init(bootstrap.on_init)
script.on_configuration_changed(bootstrap.on_configuration_changed)
script.on_load(bootstrap.on_load)
```

`on_load` must not mutate `storage`.

## Top-Level State

```lua
storage.ichor = {
  version = "0.0.1",
  schema_version = 1,
  hive = {},
  forces = {},
  entities = {},
  entity_indexes = {},
  surfaces = {},
  chunks = {},
  regions = {},
  substrate = {},
  neural = {},
  hunger = {},
  loyalty = {},
  mutation = {},
  feral = {},
  temperature = {},
  psychic = {},
  sterile = {},
  awareness = {},
  severance = {},
  gui = {},
  rendering = {},
  story = {},
  scheduler = {},
  debug = {}
}
```

## Entity State Schema

```lua
{
  unit_number = 12345,
  name = "ichor-growth-chamber-1",
  kind = "bio-building",
  surface_index = 1,
  position = {x = 10.5, y = -42.5},
  force_name = "player",
  chunk_key = "0:-2",
  region_id = nil,
  substrate_state = "controlled",
  neural_signal = 1.0,
  loyalty = 1.0,
  hunger_stress = 0.0,
  mutation_pressure = 0.0,
  neural_complexity = 0.0,
  temperature_band = "stable",
  contamination = 0.0,
  feral_pressure = 0.0,
  alpha_interference = 0.0,
  disconnected_ticks = 0,
  faction_state = "loyal",
  mutations = {},
  flags = {}
}
```

## Chunk and Region State

Chunks cache substrate, pressure, temperature, and entity indexes. Regions represent connected factory areas with coherence, signal, redundancy, hunger stress, feral pressure, Alpha interference, and state.

## Runtime Modules

`scripts/bootstrap`, `registry`, `surface`, `substrate`, `neural`, `hunger`, `loyalty`, `mutation`, `feral`, `temperature`, `psychic`, `sterile`, `awareness`, `severance`, `trains`, `drones`, `gui`, `rendering`, `story`, `debug`, `remote`, `util`.

## Event Architecture

Only `scripts/bootstrap/events.lua` calls `script.on_event`. Build/remove events feed the registry. `script.on_nth_tick` drives scheduled systems.

| Cadence | Systems |
|---|---|
| 60 ticks | UI/overlay refresh, substrate source batch |
| 300 ticks | hunger, loyalty, neural batch |
| 900 ticks | mutation, temperature, contamination |
| 1800 ticks | feral zones, Alpha pressure, awareness |
| 3600 ticks | cleanup, registry validation |

## Scheduler

Use cursor-based batches and dirty queues. Do not process every entity every scheduled tick.

## Entity Registry

Registers tracked entities, removes invalid entities, updates indexes, marks dirty chunks/regions, and triggers first-time story flags.

Indexes: by kind, surface, chunk, region.

## Systems

- **Substrate**: tile spread, tile cache, source registration, support validation, controlled/feral pressure.
- **Neural**: pylon radius MVP; later regions, Neural Veins, graph recalculation.
- **Hunger**: growth, feeding, tiers, mood thresholds, effects.
- **Loyalty**: per-entity obedience and warnings.
- **Mutation**: pressure, events, grafts, dangerous transformations.
- **Feral**: conversion, zones, growth points, reclaim/purge.
- **Sterile/Awareness**: clean zones, contamination, suppression, awareness leak.
- **Severance**: staged state machine and report.

## Severance State Machine

```text
not_started → ready → charging → snapshotting → resolving_regions → resolving_entities → reporting → post_severance → complete
```

## GUI / Rendering

GUI state is per-player. Rendering objects are centralized and should be limited by overlay mode.

## Force Architecture

MVP: `player`, `enemy`, `ichor-feral`. Later: `ichor-hive`, `ichor-colony-remnant`, `ichor-native-alpha`, `ichor-loyalist`.

## Formula Architecture

Balance formulas are isolated modules: loyalty, mutation, hunger, awareness, Severance.

## MVP Cut

Implement bootstrap, registry, substrate, hunger, neural radius, loyalty, mutation pressure, feral conversion, basic GUI, debug commands, story flags.

## Final Architecture Mantra

> No giant control file. No full-world scans. No hidden random punishment. Track only what matters. Update only what changed. Warn before failure. Stage every crisis.


## Space Age Planet / Cargo Lock State

Add a dedicated Space Age integration branch to runtime state:

```lua
storage.ichor.space_age = {
  ichor_planet_name = "ichor",
  ichor_surface_name = "ichor",
  escaped = false,
  cargo_locked = true,
  cargo_unlock_tick = nil
}
```

Responsibilities:

- identify the Ichor planet/surface,
- preserve the single-planet story arc before escape,
- block Cargo Landing Pad placement/function on Ichor while `cargo_locked = true`,
- unlock cargo delivery after the escape event,
- provide future hooks for Space Age integration.

Module additions:

```text
scripts/space-age/planet-state.lua
scripts/space-age/cargo-lock.lua
scripts/space-age/post-escape-unlock.lua
```

Events to handle:

```text
on_built_entity
on_robot_built_entity
script_raised_built
script_raised_revive
```

If a locked cargo pad is detected on Ichor, the script should refund/destroy it and show a clear alert.
