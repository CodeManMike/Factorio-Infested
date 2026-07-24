# The Ichor Engine
## Balance Constants Sheet — Version 0.1

## 1. Purpose

This document defines the first code-ready balance constants for the MVP. These values are for development and testing, not final campaign balance.

The first balancing goal is:

> Give the player enough time to see cause, warning, consequence, and recovery.

## 2. File Location

```text
E:\The Ichor Engine\mod\the-ichor-engine\scripts\util\constants.lua
```

## 3. Time Assumptions

```lua
TICKS_PER_SECOND = 60
TICKS_PER_MINUTE = 60 * 60
TICKS_PER_HOUR = 60 * 60 * 60
```

## 4. Complete Initial `constants.lua`

```lua
local Constants = {}

Constants.MOD = {
  NAME = "the-ichor-engine",
  VERSION = "0.0.1"
}

Constants.TIME = {
  TICKS_PER_SECOND = 60,
  TICKS_PER_MINUTE = 60 * 60,
  TICKS_PER_HOUR = 60 * 60 * 60
}

Constants.PLANET = {
  ICHOR_NAME = "ichor",
  DEFAULT_SURFACE_NAME = "ichor"
}

Constants.CARGO_LOCK = {
  ENABLED_BY_DEFAULT = true,
  LANDING_PAD_ENTITY = "cargo-landing-pad",
  BLOCK_CARGO_PODS_PRE_ESCAPE = true,
  BLOCK_LANDING_PAD_PRE_ESCAPE = true,
  DESTROY_BLOCKED_CARGO_PODS = true,
  DESTROY_BLOCKED_CARGO_CONTAINERS = true,
  REFUND_BLOCKED_LANDING_PAD = true,
  POST_ESCAPE_UNLOCKS_CARGO = true
}

Constants.SCHEDULE = {
  SUBSTRATE_TICK = 60,
  FAST_UI_TICK = 60,
  HUNGER_TICK = 300,
  NEURAL_TICK = 300,
  LOYALTY_TICK = 300,
  GUI_TICK = 300,
  MUTATION_TICK = 900,
  FERAL_TICK = 900,
  TELEMETRY_TICK = 900,
  CLEANUP_TICK = 3600
}

Constants.BATCH = {
  SUBSTRATE_SOURCES_PER_TICK = 8,
  BIO_ENTITIES_PER_LOYALTY_TICK = 50,
  BIO_ENTITIES_PER_MUTATION_TICK = 75,
  FERAL_ENTITIES_PER_TICK = 30,
  GUI_PLAYERS_PER_TICK = 4,
  CLEANUP_ENTITIES_PER_TICK = 100
}

Constants.SUBSTRATE = {
  LIVING_TILE = "ichor-living-substrate",
  FERAL_TILE = "ichor-feral-substrate",
  NODE_RADIUS = 8,
  NODE_STRENGTH = 1.0,
  TILES_PER_SPREAD_TICK = 3,
  SPREAD_RANDOM_ATTEMPTS = 12,
  MIN_DISTANCE_FROM_SOURCE = 0,
  MAX_DISTANCE_FROM_SOURCE = 8,
  ALLOW_SPREAD_ON_WATER = false,
  ALLOW_SPREAD_ON_RESOURCE_TILES = true,
  VALIDATION_CENTER_TILE_ONLY = true
}

Constants.NEURAL = {
  PYLON_1_ENTITY = "ichor-neural-pylon-1",
  PYLON_1_RADIUS = 18,
  SIGNAL_FULL = 1.0,
  SIGNAL_NONE = 0.0,
  USE_DISTANCE_FALLOFF = false,
  DISCONNECTED_WARNING_TICKS = 60 * 30,
  DISCONNECTED_DANGER_TICKS = 60 * 180,
  DISCONNECTED_CRITICAL_TICKS = 60 * 420
}

Constants.HUNGER = {
  MIN = 0.0,
  MAX = 1.0,
  BASE_GROWTH_PER_300_TICKS = 0.005,
  RAW_BIOMASS_ITEM = "ichor-raw-biomass",
  RAW_BIOMASS_REDUCTION = 0.03,
  HUNGER_SATED = 0.25,
  HUNGER_NORMAL = 0.50,
  HUNGER_HIGH = 0.70,
  HUNGER_CRITICAL = 0.90,
  HUNGER_VIOLENT = 0.97
}

Constants.FEEDING = {
  ["ichor-raw-biomass"] = 0.03
}

Constants.LOYALTY = {
  MIN = 0.0,
  MAX = 1.0,
  DECAY_NO_SUBSTRATE_PER_300_TICKS = 0.04,
  DECAY_NO_NEURAL_PER_300_TICKS = 0.03,
  DECAY_HIGH_HUNGER_PER_300_TICKS = 0.02,
  RECOVERY_FULL_SUPPORT_PER_300_TICKS = 0.01,
  STRAINED_THRESHOLD = 0.70,
  UNSTABLE_THRESHOLD = 0.40,
  BREAKING_THRESHOLD = 0.15,
  FERAL_THRESHOLD = 0.0
}

Constants.MUTATION = {
  MIN = 0.0,
  MAX = 1.0,
  GAIN_LOW_LOYALTY_PER_900_TICKS = 0.04,
  GAIN_HIGH_HUNGER_PER_900_TICKS = 0.02,
  LOW_LOYALTY_THRESHOLD = 0.50,
  HIGH_HUNGER_THRESHOLD = 0.80,
  WARNING_THRESHOLD = 0.50,
  EVENT_THRESHOLD = 1.0,
  FERAL_REQUIRED_PRESSURE = 0.50
}

Constants.FERAL = {
  FORCE_NAME = "ichor-feral",
  GROWTH_CHAMBER_SOURCE = "ichor-growth-chamber-1",
  GROWTH_CHAMBER_FERAL = "ichor-feral-growth-chamber",
  CONVERT_WHEN_LOYALTY_AT_OR_BELOW = 0.0,
  REQUIRE_MUTATION_PRESSURE = true,
  REQUIRED_MUTATION_PRESSURE = 0.50,
  PLACE_FERAL_SUBSTRATE_ON_CONVERSION = true,
  FERAL_SUBSTRATE_RADIUS = 1,
  ALERT_ON_CONVERSION = true
}

Constants.ALERTS = {
  COOLDOWN_CARGO_LOCKED = 60 * 5,
  COOLDOWN_CARGO_POD_BLOCKED = 60 * 5,
  COOLDOWN_NO_SUBSTRATE = 60 * 30,
  COOLDOWN_NO_NEURAL = 60 * 30,
  COOLDOWN_LOW_LOYALTY = 60 * 60,
  COOLDOWN_MUTATION_WARNING = 60 * 60,
  COOLDOWN_HUNGER_HIGH = 60 * 120,
  COOLDOWN_HUNGER_CRITICAL = 60 * 60,
  COOLDOWN_FERALIZED = 0
}

Constants.GUI = {
  REFRESH_TICKS = 300,
  FAST_REFRESH_TICKS = 60,
  TOP_BUTTON_NAME = "ichor_gui_top_button",
  HIVE_PANEL_NAME = "ichor_gui_hive_panel",
  ENTITY_PANEL_NAME = "ichor_gui_entity_panel",
  DEFAULT_PANEL_WIDTH = 420,
  COMPACT_PANEL_WIDTH = 320
}

Constants.DEBUG = {
  ENABLE_FAST_FAILURE_MODE = false,
  FAST_HUNGER_MULTIPLIER = 5.0,
  FAST_LOYALTY_DECAY_MULTIPLIER = 5.0,
  FAST_MUTATION_MULTIPLIER = 5.0,
  FAST_SUBSTRATE_MULTIPLIER = 5.0,
  PRINT_STORAGE_ON_STATUS = false,
  ENABLE_VERBOSE_LOGGING = false
}

Constants.DEBUG_COMMANDS = {
  FEED_SET_HUNGER = 0.0,
  STARVE_SET_HUNGER = 0.95,
  SPREAD_SUBSTRATE_RADIUS = 6,
  FERALIZE_SELECTED_FORCE_MUTATION = 1.0,
  FERALIZE_SELECTED_FORCE_LOYALTY = 0.0
}

Constants.DIFFICULTY = {
  DEFAULT = "hostile",
  MULTIPLIERS = {
    ["symbiotic"] = { hunger = 0.60, loyalty_decay = 0.50, mutation = 0.60, feral = 0.40, substrate = 1.20 },
    ["hostile"] = { hunger = 1.00, loyalty_decay = 1.00, mutation = 1.00, feral = 1.00, substrate = 1.00 },
    ["apex"] = { hunger = 1.35, loyalty_decay = 1.30, mutation = 1.35, feral = 1.30, substrate = 0.90 },
    ["feral-world"] = { hunger = 1.20, loyalty_decay = 1.60, mutation = 1.70, feral = 2.00, substrate = 1.00 }
  }
}

Constants.TECH = {
  SCIENCE_BIOMASS = "ichor-science-biomass",
  COSTS = {
    ["ichor-tech-first-feeding"] = { count = 10, time = 10 },
    ["ichor-tech-basic-bio-production"] = { count = 25, time = 15 },
    ["ichor-tech-basic-neural-control"] = { count = 40, time = 20 },
    ["ichor-tech-feral-detection"] = { count = 50, time = 20 }
  }
}

Constants.RECIPES = {
  TIMES = {
    RAW_BIOMASS = 1.0,
    NUTRIENT_SLURRY = 2.0,
    BIO_FORGED_IRON_PLATE = 3.5,
    GROWTH_CHAMBER_1 = 8.0,
    SUBSTRATE_NODE = 5.0,
    NEURAL_PYLON_1 = 5.0,
    SCIENCE_BIOMASS = 5.0
  }
}

Constants.TELEMETRY = {
  ENABLED = true,
  SAMPLE_TICKS = 900,
  KEEP_DETAILED_SAMPLES = 240,
  KEEP_HOURLY_SUMMARIES = 24,
  TRACK_HUNGER = true,
  TRACK_LOYALTY = true,
  TRACK_MUTATION = true,
  TRACK_FERAL = true,
  TRACK_CARGO_LOCK = true
}

return Constants
```

## 5. MVP Tuning Targets

| System | MVP Target |
|---|---|
| Substrate | visibly spreads within seconds |
| Hunger | reaches danger in roughly 10–15 minutes if unfed |
| Loyalty | fails quickly enough to test |
| Mutation | warning appears before feralization |
| Feralization | reproducible in a visible test loop |
| Cargo lock | immediate and unmistakable |
| UI | refreshes often enough to see values |
| Alerts | useful, not spammy |

## 6. Campaign Rebalance Note

The current constants are closer to `MVP_FAST_TEST` than final play balance. After MVP works, split into:

```text
MVP_FAST_TEST
CAMPAIGN_DEFAULT
```

Campaign values should slow hunger, loyalty decay, mutation, and feralization so failures take minutes with strong warnings.

## 7. Non-Negotiables

- No magic numbers scattered through systems.
- Cargo lock is not affected by difficulty.
- Mutation warning happens before feral conversion.
- Hunger danger is visible before crisis.
- Debug acceleration is opt-in.
- Prototype names use the naming bible IDs.

## 8. Final Constants Mantra

> No magic numbers in systems. Fast values for testing. Fair values for campaign. Centralize every threshold. Make warnings happen before pain. Make the first betrayal easy to reproduce.
