<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Development Roadmap — Consolidated Version 0.2

## Roadmap Purpose

This roadmap turns design into implementation and prevents scope collapse.

Start with:

```text
one tile
one hive core
one substrate node
one biological machine
one neural pylon
one hunger value
one loyalty value
one mutation warning
one feral conversion
one recovery/debug tool
```

## Version Structure

| Version | Meaning |
|---|---|
| 0.0.x | scaffold and technical experiments |
| 0.1.x | living substrate MVP |
| 0.2.x | biological production MVP |
| 0.3.x | loyalty/mutation/feralization MVP |
| 0.4.x | capture/genome MVP |
| 0.5.x | trains/outposts MVP |
| 0.6.x | Alpha territory MVP |
| 0.7.x | sterile industry MVP |
| 0.8.x | Severance prototype |
| 0.9.x | full vertical slice |
| 1.0.0 | complete public campaign release |

## Phase Overview

| Phase | Name | Core Outcome |
|---|---|---|
| 0 | Project Scaffold | mod loads, repo sane |
| 0A | Space Age Planet Foundation | Ichor exists as a Space Age planet and cargo is locked |
| 1 | Living Substrate MVP | substrate spreads and supports buildings |
| 2 | Biological Production MVP | basic bio factory loop works |
| 3 | Neural Control MVP | pylon signal controls loyalty |
| 4 | Hunger and Feeding MVP | Hive Hunger matters and is feedable |
| 5 | Mutation and Feralization MVP | machine can become feral |
| 6 | UX/Diagnostics MVP | player understands failures |
| 7 | Early Science MVP | unlocks through research |
| 8 | Capture and Genome MVP | first creature trait unlock |
| 9 | Trains and Outposts MVP | biological rail expansion |
| 10 | Feral Zones MVP | lost infrastructure grows locally |
| 11 | Alpha Territory MVP | first regional psychic boss |
| 12 | Hive Command Expansion | drones, beacons, large-scale control |
| 13 | Colony Ruins MVP | recovered human tech and logs |
| 14 | Nuclear Flesh MVP | reactor heart and radiation mutation |
| 15 | Sterile Industry MVP | clean rooms and contamination |
| 16 | Suppression and Cure MVP | awareness, deception, cure chain |
| 17 | Severance Prototype | faction split and crisis |
| 18 | Escape Prototype | final launch chain |
| 19 | Vertical Slice | full mini-arc |
| 20 | Content Expansion | more systems/content |
| 21 | Art and Audio Pass | replace placeholders |
| 22 | Balance Pass | tune campaign |
| 23 | Compatibility and Performance | optimization/migrations |
| 24 | Release Candidate | public-ready package |

## Phase 0A — Space Age Planet Foundation

## Goal

Define Ichor as an added Space Age planet and enforce story isolation.

## Deliverables

```text
Ichor PlanetPrototype / planet definition
Ichor surface/planet state
Space Age dependency
cargo delivery lock state
Cargo Landing Pad runtime block on Ichor
post-escape cargo unlock flag
```

## Acceptance Criteria

```text
Ichor appears/exists as a Space Age planet target.
The main campaign runs on the Ichor planet/surface.
Cargo Landing Pad cannot be used on Ichor before escape.
Cargo Landing Pad remains unaffected on other planets.
Setting escaped=true allows cargo pad use on Ichor.
```

## Rule

Do this early, before production balancing, because cargo isolation defines the whole economy.

## Phase 0 — Project Scaffold

Deliverables: `info.json`, `changelog.txt`, `settings.lua`, `data.lua`, `control.lua`, locale, folder structure, debug setting, `/ichor-status`.

## Phase 1 — Living Substrate MVP

Deliverables: `ichor-living-substrate`, `ichor-feral-substrate`, `ichor-substrate-node`, spread system, debug spread command.

## Phase 2 — Biological Production MVP

Deliverables: Raw Biomass, Nutrient Slurry, Bio-Forged Iron/Copper, Growth Chamber I, Nutrient Vat I, Digestive Smelter I, Basic Tendril, Tendon Track, Crude Vein, Bladder Tank.

## Phase 3 — Neural Control MVP

Deliverables: Neural Pylon I, entity registry, signal radius, substrate validation, selected diagnostics.

## Phase 4 — Hunger and Feeding MVP

Deliverables: Hive Core, hunger state, feeding inventory/recipe, hunger effects, Hive Panel.

## Phase 5 — Mutation and Feralization MVP

Deliverables: loyalty, mutation pressure, Feral Growth Chamber, `ichor-feral` force, alerts, purge/debug tools.

## Phase 6 — UX and Diagnostics MVP

Deliverables: top Ichor button, Hive Panel, selected diagnostics, alerts, substrate/neural overlays, `/ichor-balance-report`.

## Phase 7 — Early Science MVP

Deliverables: Biomass Science, Neural Science, Primitive Synapse Cluster, early technologies, recipe unlocks, tech descriptions.

## Phase 8 — Capture and Genome MVP

Deliverables: Acidback Spitter, Spore Capture Capsule, Captured Specimen, Genome Analyzer, Acid Trait Genome, acid unlocks.

## Phase 9 — Trains and Outposts MVP

Deliverables: Bio-Locomotive, wagons, Neural Train Station, Train Synapse Anchor, train loyalty, outpost isolation warnings.

## Phase 10 — Feral Zones MVP

Deliverables: Feral Zone registry, growth points, Resource Gnawer, Scavenger Mouth, purge/reclaim flow, Feral Overlay.

## Phase 11 — Alpha Territory MVP

Recommended first Alpha: Shellmother. Deliverables: Alpha boss, territory zone, psychic penalty, Alpha organ reward, Psychic Dampener, Alpha overlay, Alpha lore.

## Phases 12–18

Hive Command Expansion, Colony Ruins MVP, Nuclear Flesh MVP, Sterile Industry MVP, Suppression and Cure MVP, Severance Prototype, Escape Prototype.

## Phase 19 — Full Vertical Slice

A tester can play from new game to mini-Severance and mini-launch. All core systems appear at least once.

## Later Phases

Content Expansion, Art and Audio Pass, Balance Pass, Compatibility and Performance, Release Candidate.

## What Not to Build Yet

All Alphas, all science packs, all endings, full sterile industry, full train disobedience, drone corruption, all mutation variants, full temperature simulation, giant lore archive, full custom art, full post-escape Space Age export/import economy.

## Final Roadmap Mantra

> Build the smallest living factory first. Make it useful. Make it dependent. Make it fail fairly. Make it turn against the player. Make the player understand why. Then scale the nightmare.
