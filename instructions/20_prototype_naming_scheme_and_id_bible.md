# The Ichor Engine
## Prototype Naming Scheme and ID Bible — Version 0.1

## 1. Purpose

This document defines the canonical naming and ID rules for The Ichor Engine. Internal names should be boring, stable, searchable, and migration-friendly. Display names can be evocative and lore-rich through locale.

## 2. Canonical Paths

```text
Repo root:   E:\The Ichor Engine
Docs:        E:\The Ichor Engine\ichor_engine_core_docs_markdown
Mod:         E:\The Ichor Engine\mod\the-ichor-engine
```

## 3. Mod Identity

```text
Internal mod name: the-ichor-engine
Display title:     The Ichor Engine
Zip package:       the-ichor-engine_0.0.1.zip
```

## 4. Global Prefix Rule

Every Ichor-owned prototype uses:

```text
ichor-
```

Exception:

```text
planet/surface = ichor
```

Bad:

```text
growth-chamber
living-substrate
biomass-science
```

Good:

```text
ichor-growth-chamber-1
ichor-living-substrate
ichor-science-biomass
```

## 5. Character and Style Rules

Use lowercase kebab case:

```text
ichor-growth-chamber-1
ichor-tech-basic-neural-control
ichor-recipe-science-biomass
```

Do not use spaces, dots, PascalCase, camelCase, or underscores in prototype IDs.

## 6. Public ID Stability Rule

Before first public release, IDs may change if all docs and code are updated immediately.

After first public release, IDs are stable. Renames require:

```text
JSON migration for prototype names
Lua migration for storage references
locale updates
doc updates
test save migration
```

## 7. High-Level Pattern

```text
ichor-<family>-<name>-<tier-or-variant>
```

Use numeric suffixes for linear tiers:

```text
ichor-growth-chamber-1
ichor-growth-chamber-2
ichor-neural-pylon-1
ichor-neural-pylon-2
```

Use named variants for branches:

```text
ichor-growth-chamber-sterile-interface
ichor-feral-growth-chamber
```

## 8. Canonical MVP ID Set

### Planet

```text
ichor
```

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

### Recipe Categories

```text
ichor-category-growth
ichor-category-digestion
ichor-category-nutrient-processing
```

### Item Group/Subgroups

```text
ichor-group
ichor-subgroup-raw
ichor-subgroup-biomass
ichor-subgroup-fluids
ichor-subgroup-production
ichor-subgroup-neural
ichor-subgroup-research
```

### Force

```text
ichor-feral
```

### Settings

```text
ichor-debug-mode
ichor-difficulty
ichor-substrate-spread-multiplier
ichor-lock-cargo-before-escape
```

## 9. Science Naming

Canonical science pattern:

```text
ichor-science-<family>
```

Full science family list:

```text
ichor-science-survival
ichor-science-biomass
ichor-science-neural
ichor-science-genome
ichor-science-mutation
ichor-science-expansion
ichor-science-alpha
ichor-science-hive-command
ichor-science-industrial-recovery
ichor-science-nuclear-tissue
ichor-science-sterile
ichor-science-suppression
ichor-science-cure
ichor-science-severance
ichor-science-purge
ichor-science-escape
```

Earlier rough name superseded:

```text
ichor-biomass-science-sample -> ichor-science-biomass
```

Display name can remain **Biomass Science Sample**.

## 10. Recipe Naming

Pattern:

```text
ichor-recipe-<output>
ichor-recipe-<process>-<output>
```

Examples:

```text
ichor-recipe-growth-chamber-1
ichor-recipe-bio-forged-iron-plate
ichor-recipe-science-biomass
```

## 11. Technology Naming

Pattern:

```text
ichor-tech-<technology-name>
```

Examples:

```text
ichor-tech-first-feeding
ichor-tech-basic-bio-production
ichor-tech-basic-neural-control
```

## 12. Tile Naming

Canonical future tiles:

```text
ichor-barren-ground
ichor-young-substrate
ichor-living-substrate
ichor-dense-substrate
ichor-neural-substrate
ichor-feral-substrate
ichor-contaminated-substrate
ichor-quarantine-ground
ichor-sterile-ground
ichor-necrotic-ground
```

## 13. Runtime State Names

### Substrate State

```text
unknown
controlled
unsupported
feral
sterile
contaminated
dead
```

### Faction State

```text
loyal
strained
unstable
rebellious
breaking
feral
hive-reclaimed
dormant
dead
```

### Hive Mood

```text
dormant
cooperative
hungry
strained
suspicious
hostile
severed
```

### Severance State

```text
not-started
ready
charging
snapshotting
resolving-regions
resolving-entities
reporting
post-severance
complete
```

## 14. GUI Element Naming

Use underscores for Lua GUI names:

```text
ichor_gui_top_button
ichor_gui_hive_panel
ichor_gui_entity_panel
ichor_gui_region_panel
ichor_gui_logbook
ichor_gui_overlay_controls
ichor_gui_severance_report
```

## 15. Alert Keys

Locale category:

```ini
[ichor-alert]
```

Keys:

```text
cargo-locked
cargo-pod-blocked
cargo-unlocked
no-substrate
no-neural-signal
low-loyalty
mutation-warning
feralized
hive-hunger-high
hive-hunger-critical
sterile-contamination
severance-ready
severance-started
severance-complete
```

## 16. Debug Commands

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

## 17. Legal Distinctness Rules

Avoid direct franchise-adjacent names:

```text
creep
hive mind
overmind
infested marine
zerg
spawning pool
creep tumor
hydralisk
ultralisk
```

Use canonical terms:

```text
Living Substrate
Ichor Mat
Neural Vein
Synaptic Vein
Rootmind
Wound-Hive
Sovereign Node
Converted Host
Grafted Host
Ichor Strain
Host Strain
Alpha
Psychic Apex
Dominant Native
```

## 18. Final Naming Mantra

> Stable IDs. Clear prefixes. Boring internals. Vivid locale. No clever abbreviations. No accidental franchise drift. No future migration traps.
