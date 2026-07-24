# The Ichor Engine
## MVP Technical Spec — Version 0.1

## 1. Purpose

This document defines the exact first playable MVP for **The Ichor Engine**. It is the tight technical companion to the Coding-Agent MVP Implementation Pack.

It specifies paths, prototype IDs, runtime schemas, event hooks, balance constants, cargo lock behavior, debug commands, and the acceptance scenario.

## 2. Canonical Paths

```text
Repo root:       E:\The Ichor Engine
Docs folder:     E:\The Ichor Engine\ichor_engine_core_docs_markdown
Mod folder:      E:\The Ichor Engine\mod\the-ichor-engine
Tools folder:    E:\The Ichor Engine\tools
Test saves:      E:\The Ichor Engine\saves\test
```

## 3. Factorio Target

```text
Factorio 2.x
Space Age required
Ichor is its own added planet/surface
```

Runtime state must use `storage`, not `global`.

## 4. MVP Scope

Included:

```text
Ichor planet assumption
pre-escape cargo lock
Hive Core
Living Substrate
Feral Substrate
Substrate Node
Growth Chamber I
Neural Pylon I
Hive Hunger
Entity registry
Substrate validation
Simple neural radius
Loyalty
Mutation pressure
Feral conversion
Basic UI
Basic alerts
Debug commands
Basic research unlocks
```

Excluded until later:

```text
full planet terrain generation
full biome system
full production chains
capture/genome system
trains
drones
Alphas
colony ruins
nuclear flesh
sterile industry
Hive Awareness
Severance
escape vessel
full art
full sound
full balance
```

## 5. Space Age Cargo Lock Spec

The story arc requires the player to be isolated on Ichor. Cargo delivery must be disabled until escape.

Blocking only `cargo-landing-pad` is not enough, because cargo pods can still land without a pad. The lock needs two layers:

```text
Layer 1: Block Cargo Landing Pad placement on Ichor before escape.
Layer 2: Block/neutralize cargo pods and spawned cargo containers on Ichor before escape.
```

Runtime cargo events to handle:

```text
on_cargo_pod_finished_descending
on_cargo_pod_delivered_cargo
```

Cargo state:

```lua
storage.ichor.campaign = {
  planet_name = "ichor",
  escape_complete = false,
  cargo_unlocked = false
}
```

Cargo is unlocked only when:

```lua
storage.ichor.campaign.escape_complete == true
```

## 6. Cargo Lock Module Contract

File:

```text
scripts/space-age/cargo-lock.lua
```

Functions:

```lua
CargoLock.is_ichor_surface(surface)
CargoLock.is_cargo_unlocked()
CargoLock.on_built_entity(event)
CargoLock.on_cargo_pod_finished_descending(event)
CargoLock.on_cargo_pod_delivered_cargo(event)
```

Pseudocode:

```lua
local CargoLock = {}

local LOCKED_ENTITY_NAMES = {
  ["cargo-landing-pad"] = true
}

function CargoLock.is_ichor_surface(surface)
  return surface and surface.valid and surface.name == "ichor"
end

function CargoLock.is_cargo_unlocked()
  return storage.ichor
    and storage.ichor.campaign
    and storage.ichor.campaign.escape_complete == true
end

function CargoLock.on_built_entity(event)
  local entity = event.entity or event.created_entity
  if not entity or not entity.valid then return end
  if not LOCKED_ENTITY_NAMES[entity.name] then return end
  if not CargoLock.is_ichor_surface(entity.surface) then return end
  if CargoLock.is_cargo_unlocked() then return end

  local player = event.player_index and game.get_player(event.player_index) or nil
  local position = entity.position
  local surface = entity.surface
  local force = entity.force
  local item_name = entity.name

  entity.destroy{raise_destroy = true}

  if player and player.valid then
    player.insert{name = item_name, count = 1}
    player.print({"ichor-alert.cargo-locked"})
  else
    surface.spill_item_stack{
      position = position,
      stack = {name = item_name, count = 1},
      enable_looted = true,
      force = force
    }
  end
end

function CargoLock.on_cargo_pod_finished_descending(event)
  local pod = event.cargo_pod
  if not pod or not pod.valid then return end
  if not CargoLock.is_ichor_surface(pod.surface) then return end
  if CargoLock.is_cargo_unlocked() then return end
  pod.destroy{raise_destroy = true}
end

function CargoLock.on_cargo_pod_delivered_cargo(event)
  local pod = event.cargo_pod
  local container = event.spawned_container
  local surface = nil

  if pod and pod.valid then surface = pod.surface end
  if not surface and container and container.valid then surface = container.surface end
  if not CargoLock.is_ichor_surface(surface) then return end
  if CargoLock.is_cargo_unlocked() then return end

  if container and container.valid then container.destroy{raise_destroy = true} end
  if pod and pod.valid then pod.destroy{raise_destroy = true} end
end

return CargoLock
```

## 7. Exact Prototype IDs

### Tiles

```text
ichor-living-substrate
ichor-feral-substrate
```

### Items

```text
ichor-raw-biomass
ichor-bio-forged-iron-plate
ichor-science-biomass
```

### Fluids

```text
ichor-nutrient-slurry
ichor-crude-ichor
```

### Entities

```text
ichor-hive-core
ichor-substrate-node
ichor-neural-pylon-1
ichor-growth-chamber-1
ichor-feral-growth-chamber
```

### Recipes

```text
ichor-recipe-raw-biomass
ichor-recipe-nutrient-slurry
ichor-recipe-bio-forged-iron-plate
ichor-recipe-growth-chamber-1
ichor-recipe-substrate-node
ichor-recipe-neural-pylon-1
ichor-recipe-science-biomass
```

### Technologies

```text
ichor-tech-first-feeding
ichor-tech-basic-bio-production
ichor-tech-basic-neural-control
ichor-tech-feral-detection
```

### Forces

```text
ichor-feral
```

### Planet / Surface

```text
ichor
```

## 8. Runtime Storage Schema

```lua
storage.ichor = {
  version = "0.0.1",
  schema_version = 1,

  campaign = {
    planet_name = "ichor",
    escape_complete = false,
    cargo_unlocked = false
  },

  hive = {
    core_unit_number = nil,
    hunger = 0.0,
    last_fed_tick = 0,
    mood = "dormant"
  },

  entities = {},

  entity_indexes = {
    by_kind = {},
    by_surface = {},
    by_chunk = {}
  },

  substrate = {
    sources = {},
    spread_cursor = 1,
    dirty_chunks = {}
  },

  gui = { players = {} },
  alerts = { cooldowns = {} },
  debug = { last_balance_report_tick = 0 }
}
```

Entity state:

```lua
{
  unit_number = 12345,
  name = "ichor-growth-chamber-1",
  kind = "bio-building",
  surface_index = 1,
  surface_name = "ichor",
  position = {x = 10.5, y = -4.5},
  force_name = "player",
  loyalty = 1.0,
  neural_signal = 0.0,
  hunger_stress = 0.0,
  mutation_pressure = 0.0,
  substrate_state = "unknown",
  disconnected_ticks = 0,
  faction_state = "loyal",
  last_update_tick = 0,
  flags = {
    warned_no_substrate = false,
    warned_no_neural = false,
    warned_low_loyalty = false,
    warned_mutation = false
  }
}
```

## 9. Lifecycle Rules

`on_init`:

```text
create storage.ichor
create ichor-feral force
initialize campaign flags
initialize indexes
```

`on_configuration_changed`:

```text
repair missing schema fields
ensure ichor-feral force exists
rebuild indexes if needed
```

`on_load`:

```text
do not write to storage
only recreate local references if needed
```

## 10. Event Registration

Central dispatcher in `scripts/bootstrap/events.lua`:

```lua
script.on_event(defines.events.on_built_entity, Events.on_built_entity)
script.on_event(defines.events.on_robot_built_entity, Events.on_built_entity)
script.on_event(defines.events.script_raised_built, Events.on_built_entity)
script.on_event(defines.events.script_raised_revive, Events.on_built_entity)

script.on_event(defines.events.on_player_mined_entity, Events.on_removed_entity)
script.on_event(defines.events.on_robot_mined_entity, Events.on_removed_entity)
script.on_event(defines.events.on_entity_died, Events.on_removed_entity)
script.on_event(defines.events.script_raised_destroy, Events.on_removed_entity)

script.on_event(defines.events.on_cargo_pod_finished_descending, CargoLock.on_cargo_pod_finished_descending)
script.on_event(defines.events.on_cargo_pod_delivered_cargo, CargoLock.on_cargo_pod_delivered_cargo)

script.on_nth_tick(60, Events.on_tick_60)
script.on_nth_tick(300, Events.on_tick_300)
script.on_nth_tick(900, Events.on_tick_900)
```

## 11. Exact MVP Constants

```lua
SUBSTRATE_NODE_RADIUS = 8
SUBSTRATE_TILES_PER_SPREAD = 3
NEURAL_PYLON_1_RADIUS = 18
HUNGER_BASE_GROWTH_PER_300 = 0.005
RAW_BIOMASS_HUNGER_REDUCTION = 0.03
LOYALTY_DECAY_NO_SUBSTRATE = 0.04
LOYALTY_DECAY_NO_NEURAL = 0.03
LOYALTY_DECAY_HIGH_HUNGER = 0.02
LOYALTY_RECOVERY_SUPPORTED = 0.01
MUTATION_GAIN_LOW_LOYALTY = 0.04
MUTATION_GAIN_HIGH_HUNGER = 0.02
MUTATION_WARNING_THRESHOLD = 0.50
FERAL_MUTATION_REQUIRED = 0.50
```

## 12. Do-Not-Proceed Checklist

Do not move to capture, trains, Alphas, sterile tech, or Severance until:

```text
[ ] Mod loads
[ ] New save starts
[ ] Save/load works
[ ] No global usage exists
[ ] Cargo Landing Pad is blocked pre-escape
[ ] Cargo pod delivery is blocked pre-escape
[ ] Cargo is allowed post-escape
[ ] Hive Core registers
[ ] Substrate Node registers
[ ] Living Substrate spreads
[ ] Growth Chamber validates substrate
[ ] Neural Pylon provides signal
[ ] Hunger rises
[ ] Raw Biomass feeding lowers hunger
[ ] Loyalty falls when unsupported
[ ] Mutation pressure rises before failure
[ ] Feral conversion works
[ ] Feral force is hostile
[ ] Player gets warnings
[ ] Player can inspect cause
[ ] Debug commands work
[ ] Basic UI works
```

## 13. Final MVP Definition

> On Ichor, the player is isolated. The planet will not accept rescue cargo yet. The ground grows. The hive gets hungry. One machine obeys while fed and connected. The same machine decays when neglected. It warns the player. It mutates. It becomes feral. The player can see exactly why.
