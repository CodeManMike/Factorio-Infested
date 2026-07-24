<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Factorio Systems Mapping Document — Consolidated Version 0.2

## Purpose

This document maps **The Ichor Engine** onto Factorio’s modding architecture: prototypes, runtime scripts, forces, tiles, events, overlays, and where vanilla systems should be reused instead of reimplemented.

## Factorio Modding Reality

Factorio modding is split into prototype/data stages and runtime/control stage. Prototype files define what exists; runtime scripts decide what happens in a save.

Key official docs:

- Mod structure: https://lua-api.factorio.com/latest/auxiliary/mod-structure.html
- Data lifecycle: https://lua-api.factorio.com/latest/auxiliary/data-lifecycle.html
- Runtime API: https://lua-api.factorio.com/latest/index-runtime.html
- Storage: https://lua-api.factorio.com/latest/auxiliary/storage.html

Runtime persistence in Factorio 2.x must use `storage`, not old `global`.

## Space Age Planet Mapping

Canonical technical target:

```text
Factorio major line: 2.x
Expansion framework: Space Age
Ichor world type: added planet / planetary surface
Dependency direction: require Space Age for the canonical campaign
```

The Ichor planet should be implemented as a Space Age planet/location rather than as a generic hidden surface. Factorio exposes `PlanetPrototype` for planet definitions, including starmap-related fields, space-location parameters, and `surface_properties`; Space Age-specific starmap icon fields are explicitly marked as requiring Space Age in the official docs.

The planet must also define or inherit surface properties such as gravity, pressure, magnetic field, or custom properties where useful. The official docs show `PlanetPrototype::surface_properties`, `SurfacePrototype::surface_properties`, `SurfacePropertyPrototype`, and `SurfacePropertyID` as part of this framework.

### Cargo Delivery Lock

Space Age cargo deliveries revolve around the Cargo Landing Pad. The Factorio wiki describes the Cargo Landing Pad as the orbital delivery hub in Space Age: it acts as a requester chest for space platforms stopped over the current planet, and cargo can be dropped to satisfy its requests.

Therefore, the cleanest story-preserving implementation is:

```text
Before escape:
  block Cargo Landing Pad placement/function on the Ichor planet.

After escape:
  allow Cargo Landing Pad placement/function on the Ichor planet.
```

Implementation options:

| Option | Recommendation |
|---|---|
| Remove global cargo pad recipe | no; affects all planets and Space Age progression |
| Make cargo pad globally unavailable | no; too invasive |
| Runtime-destroy/refund pads placed on Ichor before escape | yes for MVP |
| Use surface conditions to block placement on Ichor | possible later, but avoid fragile global edits until tested |
| Clear landing pad requests on Ichor pre-escape | useful safety fallback |
| Unlock pad placement after escape flag | canonical final behavior |

Runtime rule:

```lua
if entity.name == "cargo-landing-pad"
   and entity.surface.name == storage.ichor.space_age.ichor_surface_name
   and not storage.ichor.space_age.escaped then
  -- refund, destroy, alert player
end
```

Also watch for script/robot construction so blueprints or other mods cannot bypass the lock.

## Core Mapping Principle

> Use vanilla Factorio mechanics wherever they already solve the problem. Script only what the engine does not naturally support.

Use vanilla for belts, inserters, pipes, trains, roboports, labs, recipes, fluids, turrets, power, and technologies.

Script substrate meaning, neural control, hunger, loyalty, mutation, feralization, psychic fields, sterile contamination, Hive Awareness, Severance, and story events.

## High-Level Mapping Table

| Ichor System | Factorio Mapping | Type |
|---|---|---|
| Living/Feral/Sterile Substrate | tile prototypes | prototype + runtime tile changes |
| Growth Chamber | assembling-machine | prototype + runtime state |
| Digestive Smelter | furnace or assembling-machine | prototype |
| Nutrient Vat | assembling-machine/chemical-plant style | prototype |
| Neural Pylon | electric-pole/custom support | prototype + runtime aura |
| Neural Vein | electric-pole/pipe/custom connector | prototype + runtime graph |
| Pheromone Gland | beacon/custom support | prototype + runtime loyalty |
| Muscle Duct | transport-belt | prototype |
| Tendril | inserter | prototype |
| Vein/Pipe | pipe | prototype |
| Bladder Tank | storage-tank | prototype |
| Brood Hive | roboport | prototype + runtime loyalty |
| Bio-Locomotive | locomotive | prototype + runtime loyalty |
| Spike Spitter | ammo-turret | prototype |
| Acid/Flame Gland | fluid-turret | prototype |
| Bioelectric Lance | electric-turret | prototype |
| Bone-Lance Artillery | artillery-turret | prototype |
| Alpha Boss | unit / segmented-unit / scripted cluster | prototype + runtime zone |
| Spore Pressure | pollution/airborne pollutant | prototype + runtime tuning |
| Hunger/Loyalty/Mutation/Awareness | `storage` runtime state | runtime |

## Prototype Stage Responsibilities

Define items, fluids, recipes, recipe categories, technologies, entities, tiles, enemies, sounds, particles, GUI styles, ammo/projectiles, and shortcuts.

## Runtime Stage Responsibilities

Handle entity registration, substrate spread, substrate validation, neural signal, hunger, loyalty, mutation, feral conversion, Alpha fields, sterile contamination, Hive Awareness, Severance processing, GUI, rendering overlays, story flags, and debug commands.

## Force Strategy

MVP forces: `player`, `enemy`, `ichor-feral`. Later: `ichor-hive`, `ichor-colony-remnant`, `ichor-native-alpha`, `ichor-loyalist`.

## Substrate Mapping

Use tile prototypes and runtime `surface.set_tiles()` in small batches. Cache tile counts by chunk. Do not scan all tiles constantly.

## Neural Mapping

MVP: entity inside Neural Pylon radius has signal 1.0; outside radius has 0.0. Later: region graph, Neural Veins, redundancy, Alpha interference, Severance forecast.

## Runtime Entity State

```lua
storage.ichor.entities[unit_number] = {
  unit_number = unit_number,
  name = entity.name,
  kind = "bio-building",
  surface_index = entity.surface.index,
  position = {x = entity.position.x, y = entity.position.y},
  loyalty = 1.0,
  neural_signal = 1.0,
  hunger_stress = 0.0,
  mutation_pressure = 0.0,
  substrate_state = "controlled",
  disconnected_ticks = 0,
  faction_state = "loyal",
  mutations = {}
}
```

Track major entities only. Do not track every belt segment.

## Scheduled Processing

Use `script.on_nth_tick`.

| System | Cadence |
|---|---:|
| substrate spread | 60–300 ticks |
| hunger | 300 ticks |
| loyalty | 120–600 ticks, batched |
| mutation | 600–1800 ticks |
| temperature | 300–900 ticks |
| Alpha fields | 300–1800 ticks |
| GUI refresh | 30–120 ticks when open |
| Severance | staged multi-tick batch |

## Pollution / Spore Pressure

MVP: retheme vanilla pollution as Spore Pressure. Later consider custom airborne pollutants, but treat enemy evolution effects carefully.

## GUI and Rendering

Use `LuaGui` for panels and `rendering` for overlays. Avoid thousands of persistent render objects.

## MVP Mapping

MVP prototypes: Hive Core, Living/Feral Substrate, Substrate Node, Neural Pylon I, Growth Chamber I, Nutrient Vat I, Digestive Smelter I, Tendon Track, Basic Tendril, Crude Vein, Bladder Tank, Spike Spitter, Chitin Wall, Feral Growth Chamber.

MVP runtime: entity registry, substrate spread, substrate validation, hive hunger, neural radius, loyalty, mutation pressure, feral conversion, alerts/GUI.

## Final Mapping Statement

> Let Factorio move the items. Let Factorio run the trains. Let Factorio craft the recipes. Then use Lua to decide whether the factory still belongs to the player.
