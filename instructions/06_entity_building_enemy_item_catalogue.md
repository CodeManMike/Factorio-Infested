<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Entity, Building, Enemy, and Item Catalogue — Consolidated Version 0.2

## Catalogue Philosophy

Every major object must answer: vanilla role, biological/sterile/feral/colony expression, production chain, risk, visual state needs, and era.

## Entity Families

Core Narrative Entities, Terrain and Tiles, Production Buildings, Logistics Entities, Power Entities, Control Entities, Research Entities, Combat Entities, Enemies, Bosses, Items, Fluids.

## Core Narrative Entities

| Entity | Era | Role |
|---|---:|---|
| Hive Core | 0 | hunger sink, substrate source, control anchor, narrative intelligence |
| Crash Wreckage | 0 | early salvage and story |
| Manual Analysis Bench | 0 | first survival research |
| Colony Archive Terminal | 7 | old logs, archive data, clean-room/cure clues |
| Severance Spire | 10/11 | point-of-no-return Severance trigger |
| Escape Vessel Silo | 12 | final rocket-equivalent victory structure |

## Space Age / Planetary Integration Entities

| Entity/System | Era | Role |
|---|---:|---|
| Ichor Planet Prototype | 0 | dedicated Space Age planet/surface for the campaign |
| Ichor Orbital Quarantine State | 0–12 | prevents cargo delivery before escape |
| Cargo Delivery Lock | 0–12 | runtime rule preventing Cargo Landing Pad use on Ichor |
| Post-Escape Cargo Unlock | 12+ | campaign flag/technology allowing cargo logistics after escape |
| Ichor Cargo Landing Authorization | 12+ | optional postgame tech/item that permits landing pad placement |

Pre-escape, the Cargo Landing Pad must not be buildable or functional on the Ichor planet. Post-escape, it becomes a reward and future Space Age integration hook.

## Terrain and Tiles

Barren Ground, Young Living Substrate, Mature Living Substrate, Dense Living Substrate, Neural Substrate, Feral Substrate, Contaminated Substrate, Quarantine Ground, Sterile Ground.

## Production Buildings

Wreckage Recycler, Primitive Biomass Pit, Nutrient Vats, High-Yield Nutrient Bioreactor, Growth Chambers, Digestive Smelters, Ore Leaching Vat, Organ Harvester, Mutation Vat, Stabilization Chamber, Genetic Stabilizer, Mutation Scrubber, Purification Chamber, Clean-Room Assembler, Sterile Furnace, Cure Lab, Retroviral Crucible, Post-Severance Research Core.

## Logistics Entities

### Belts / Ducts

Tendon Track, Muscle Duct, Arterial Duct, Neural Duct, Sterile Conveyor.

### Inserters / Tendrils

Basic Tendril, Fast Tendril, Filter Tendril, Stack Tendril, Neural Grasper, Sterile Inserter.

### Pipes / Storage

Crude Vein, Ichor Channel, Arterial Vein, Reinforced Vein, Clean Pipe, Bone Chest, Cyst Chest, Bladder Tank, Cryo-Sac, Sterile Vault.

## Trains

Bio-Locomotive I, Cargo Carapace Wagon, Fluid Bladder Wagon, Armored Brood Train, Reactor-Heart Locomotive, Sterile Locomotive, Neural Train Station, Train Synapse Anchor.

## Drones and Roboports

Larval Carrier, Spore Courier, Construction Broodling, Repair Leech, Wing Drone, Heavy Hauler Drone, Brood Hive I/II, Independent Roboport.

## Power and Control

Biomass Burner, Digestive Heat Engine, Bioelectric Generator, Neural Pylon I/II/III, Synapse Relay, Neural Vein, Reinforced Neural Vein, Pheromone Gland, Endocrine Tower, Living Reactor Heart, Contained Reactor Heart, Clean Generator, Sterile Reactor.

## Research Entities

Primitive Synapse Cluster, Synapse Cluster, Genome Analyzer, Alpha Dissection Chamber, Neural Archive Cluster, Archive Decoder, Isotope Analysis Vat, Sterile Lab, Cure Lab, Orbital Design Computer.

## Combat Buildings

Chitin Wall, Heavy Chitin Wall, Regenerative Wall, Bone Gate, Spike Spitter, Acid Gland Turret, Flame Gland Turret, Bioelectric Lance, Spore Mine, Bone-Lance Artillery, Spore Mortar, Psychic Dampener, Purge Tower, Anti-Substrate Artillery, Clean Turret, Sterile Artillery.

## Sterile and Suppression Entities

Sterile Ground Projector, Quarantine Barrier, Contamination Scrubber, False Signal Node, Memory Loop Organ, False Hunger Chamber, Suppression Tower, Hive Awareness Monitor, Loyalist Anchor, Substrate Firewall.

## Enemy Classes

| Class | Description |
|---|---|
| Native Fauna | original planetary life, capture traits |
| Feral Factory Entities | former player infrastructure gone independent |
| Hive-Reclaimed Entities | player/hive systems reclaimed after betrayal |
| Colony Remnants | infected/corrupted previous human colony |

Native fauna: Scavenger Mite, Carrion Skitterer, Pack Predator, Acidback Spitter, Shell Grazer, Needle Skitter, Winged Harrier, Burrowing Jaw, Electric Eel Organism, Fungal Spore Colony, Frost-Cyst Beast, Ember Mawling, Glowback Grazer.

Alpha bosses: Shellmother, Acid Matriarch, Sky Brood Apex, Burrow Crown, Ember Maw, Frost Warden, Storm Leviathan, Glowback Sovereign.

Sovereign Nodes: Rooted Sovereign Node, Mobile Sovereign, Final Rootmind Manifestation.

Feral enemies: Feral Growth Chamber, Feral Nutrient Vat, Feral Tendril, Feral Muscle Duct, Feral Brood Hive, Feral Reactor Heart, Feral Neural Knot, Resource Gnawer, Scavenger Mouth.

Hive-reclaimed: Reclaimed Tendril, Reclaimed Spitter, Reclaimed Brood Drone, Hive Reclamation Node, Hive Maw, Neural Reclaimer.

Colony remnants: Grafted Guard, Converted Miner, Archive Husk, Furnace-Warden, Corrupted Security Drone, Colony Defense Turret.

## Item Families

Minerals/metals, biological feedstock, structural biology, neural biology, organs, captured biology, mutation/grafts, colony/sterile industry, cure/Severance/escape.

## Fluid Families

Biological fluids: Nutrient Slurry, Ichor, Blood, Enzymes, Acid, Venom, Pheromone Extract, Endocrine Fluid, Brood Jelly.

Hazardous fluids: Toxic Sludge, Necrotic Sludge, Contaminated Ichor, Radioactive Slurry, Radioactive Bile, Feral Ichor.

Sterile fluids: Clean Water, Clean Coolant, Antiseptic Reagent, Clean Solvent, Suppression Compound, Retroviral Medium, Purge Catalyst Fluid.

## MVP Priority

Hive Core, Living/Feral Substrate, Substrate Node, Neural Pylon I, Growth Chamber I, Nutrient Vat I, Digestive Smelter I, Basic Tendril, Tendon Track, Crude Vein, Bladder Tank, Spike Spitter, Chitin Wall, Primitive Synapse Cluster, Feral Growth Chamber.

## Final Catalogue Identity

> The object world of The Ichor Engine is an industrial ecosystem: ore is digested, organs are grown, trains breathe, drones hatch, walls heal, labs dream, sterile machines hide, old ruins whisper, and abandoned factories become predators.
