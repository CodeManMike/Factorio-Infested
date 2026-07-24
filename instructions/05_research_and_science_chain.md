<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Research and Science Chain Document — Consolidated Version 0.2

## Research Philosophy

Research in **The Ichor Engine** is salvage analysis, hive feeding, specimen dissection, genome theft, psychic warfare, industrial archaeology, sterile medicine, and rebellion.

Principles: research must be automated; first-time field unlocks are allowed but permanent manual farming is not; every era has a new science problem; research reflects the player’s relationship with the hive.

## Research Isolation Rule

The main Ichor research arc must be completable without cargo deliveries from other Space Age planets.

Before escape:

- all science packs required for the Ichor critical path are produced locally,
- Space Age interplanetary logistics cannot shortcut cure, sterile science, Severance, or escape,
- any external-space or orbital research appears only as recovered colony data, not active cargo support.

After escape:

- optional postgame research may unlock cargo delivery, Ichor export products, and cross-planet biological/sterile technologies.

## Research Infrastructure

| Era | Lab Equivalent | Purpose |
|---|---|---|
| 0 | Manual Analysis Bench | survival/salvage |
| 1 | Primitive Synapse Cluster | biomass research |
| 2 | Synapse Cluster | early/mid bio science |
| 3 | Genome Analyzer | specimen and trait research |
| 5 | Alpha Dissection Chamber | Alpha organ science |
| 6 | Neural Archive Cluster | hive-scale command |
| 7 | Archive Decoder | colony data recovery |
| 8 | Isotope Analysis Vat | nuclear biology |
| 9 | Sterile Lab | clean industry |
| 10 | Cure Lab | cure and Severance |
| 11 | Post-Severance Research Core | purge and loyalist science |
| 12 | Orbital Design Computer | escape science |

## Science Families

| Science Family | Era | Purpose |
|---|---|---|
| Survival Analysis | 0 | crash survival and basic tools |
| Biomass Science | 1 | feeding, substrate, basic bio-production |
| Neural Science | 2 | control, loyalty, pylons, signals |
| Genome Science | 3 | captured traits and organism tech |
| Mutation Science | 3 | grafts, controlled upgrades, instability control |
| Expansion Science | 4 | trains, outposts, long-distance infrastructure |
| Alpha Science | 5 | boss organs and psychic dominance |
| Hive Command Science | 6 | megabase-scale control, drones, beacons |
| Industrial Recovery Science | 7 | old machines and colony salvage |
| Nuclear Tissue Science | 8 | uranium biology and reactor organs |
| Sterile Science | 9 | clean industry and purification |
| Suppression Science | 9/10 | hiding sterile work from the hive |
| Cure Science | 10 | host separation and cure |
| Severance Science | 10/11 | cutting the hive link |
| Purge Science | 11 | anti-substrate and anti-hive systems |
| Escape Science | 12 | final rocket/escape vessel |

## Science Chain

```text
Survival Analysis → Biomass Science → Neural Science → Genome Science + Mutation Science → Expansion Science → Alpha Science → Hive Command Science → Industrial Recovery Science → Nuclear Tissue Science → Sterile Science → Suppression Science → Cure Science → Severance Science → Purge Science → Escape Science
```

## Key Science Recipes and Unlocks

### Survival Analysis

```text
Crash Scrap + Stone + Raw Biomass Sample → Survival Analysis Data
```

Unlocks tool repair, Wreckage Recycler, first substrate seed, primitive biomass, Hive Core scan.

### Biomass Science

```text
Raw Biomass + Water → Crude Nutrient Slurry
Crude Nutrient Slurry + Substrate Sample + Bio-Forged Iron → Biomass Science Sample
```

Unlocks Nutrient Slurry, Substrate Node, Growth Chamber I, Digestive Smelter I, Basic Tendril, Tendon Track, Neural Pylon I.

### Neural Science

```text
Neural Fiber + Conductive Bio-Copper + Nutrient Slurry → Neural Science Bundle
```

Unlocks Neural Pylon II, Loyalty Monitoring, Neural Coherence, Fast/Filter Tendrils, Sensory Eye, Pheromone Gland, early mutation detection.

### Genome Science

First unlock requires specimen capture.

```text
Captured Specimen → Genome Sample + Tissue Sample
Genome Sample + Nutrient Medium + Neural Science Bundle → Genome Science Sample
Trait Genome + Cultured Biomass + Mutagen Gel + Neural Science Bundle → Genome Science Sample
```

Unlock branches: Acid, Chitin, Wing, Burrow, Electric, Thermal, Frost, Venom, Sensory, Regeneration, Pack Cortex, Radiation Tolerance.

### Mutation Science

```text
Genome Sample + Refined Ichor + Enzyme Culture → Mutagen Gel
Mutagen Gel + Neural Science Bundle + Stabilizing Enzyme → Mutation Science Gel
```

Unlocks Mutation Vat, Speed/Efficiency/Productivity/Stability Grafts, Genetic Stabilizer, Mutation Scrubber, Controlled Rebirth.

### Expansion Science

```text
Reinforced Bone Frame + Biofuel + Neural Cable + Muscle Bundle → Expansion Science Node
```

Unlocks Bio-Locomotive, wagons, Neural Train Station, Train Synapse Anchor, Neural Vein, Outpost Brood Governor, Stack Tendril, Arterial Duct.

### Alpha Science

First unlock requires an Alpha organ.

```text
Alpha Organ + Stabilization Chamber → Stabilized Alpha Organ
Stabilized Alpha Organ + Mutation Science Gel + Neural Science Bundle → Alpha Science Organ
```

Unlocks Psychic Dampener, Dominance Spire, Alpha Organ Stabilization, Apex Chitin, advanced trait tech, Sovereign Node detection.

### Hive Command Science

```text
Living Processor + Memory Tissue + Endocrine Fluid + Conductive Ichor → Hive Command Matrix
```

Unlocks Neural Pylon III, Synapse Relay, Brood Hive, drones, Endocrine Tower, dense/neural substrate, self-awareness suppression.

### Industrial Recovery Science

```text
Archive Data Core + Industrial Salvage + Old-World Circuit → Industrial Recovery Data
```

Unlocks Archive Decoder, Refurbished Circuit, restored machines, Clean-Room Theory, Failed Cure Records, launch reconstruction data.

### Nuclear Tissue Science

```text
Acid-Washed Uranium + Isotope-Seeking Tissue + Cooling Gland → Nuclear Tissue Sample
```

Unlocks Uranium Digestor, Radioactive Slurry, Reactor Heart Seed, Living Reactor Heart, Radiation Scrubber, Reactor-Heart Locomotive.

### Sterile Science

```text
Purified Iron Plate + Purified Copper Plate + Sterile Circuit + Clean Coolant → Sterile Science Cartridge
```

Unlocks Sterile Ground, Clean-Room Assembler, sterile logistics, Purification Chamber, Contamination Scrubber, Clean Steel, Sterile Lab.

### Suppression Science

```text
Suppression Compound + Memory Tissue + Endocrine Fluid + Sterile Science Cartridge → Suppression Science Loop
```

Unlocks Psychic Dampener, False Signal Node, Pheromone Masker, Memory Loop Organ, False Hunger Chamber, Suppression Tower, Awareness Monitor.

### Cure Science

```text
Cure Precursor + Retroviral Agent + Neural Antagonist + Clean Processor → Cure Research Dose
```

Unlocks Cure Lab, Retroviral Template, Host Tissue Sampling, Host Stabilizer, Final Cure Dose, Cure Stabilization.

### Severance Science

```text
Neural Antagonist + Memory Loop Tissue + Independent Control Unit + Cure Research Dose → Severance Science Core
```

Unlocks Severance Spire, Loyalist Anchor, faction prediction, independent power, clean military, emergency sterile shelter.

### Purge Science

```text
Purge Catalyst + Sterile Fuel Cell + Hive Remnant + Clean Processor → Purge Science Charge
```

Unlocks Purge Tower, Anti-Substrate Artillery, Substrate Firewall, Hive Reclamation Jammer, Purge Fuel.

### Escape Science

```text
Clean Rocket Control Unit + Hybrid Launch Organ + Stabilized Cure + Navigation Data → Escape Science Package
```

Unlocks Escape Vessel Silo, Orbital Assembly Frame, Navigation Core, Hybrid Fuel Chamber, Life-Support Capsule, Final Escape Vessel.

## Capture-Based Unlock Examples

| Captured Organism | Unlocks |
|---|---|
| Acidback Spitter | Acid Trait, acid smelting, Acid Gland Turret |
| Shell Grazer | Chitin Trait, chitin walls, armor, train shells |
| Winged Harrier | Wing Trait, drones, spore couriers |
| Electric Eel Organism | Bioelectric Organ, Bioelectric Generator, Bioelectric Lance |
| Burrowing Jaw | Reinforced Neural Vein, tunnel detection |
| Frost-Cyst Beast | Cooling Gland, Cryo-Sac, Clean Coolant prerequisites |

## Alpha-Gated Unlock Examples

| Alpha | Unlocks |
|---|---|
| Shellmother | Apex Chitin, Heavy Chitin Wall, armored trains |
| Acid Matriarch | Concentrated Acid, advanced ore leaching, acid artillery |
| Storm Leviathan | Bioelectric Grid, electric weapons, high-capacity pylons |
| Ember Maw | Heat surge production, flame weapons, thermal power |
| Frost Warden | cryogenic stabilization, Clean Coolant, reactor containment |
| Glowback Sovereign | radiation tissue, Reactor Hearts, radioactive mutation control |

## Hive Awareness and Research

| Family | Awareness Risk |
|---|---|
| Biomass / Neural | low or none |
| Genome / Mutation | low-medium |
| Alpha | medium-high |
| Industrial Recovery | medium |
| Nuclear | medium-high |
| Sterile | high |
| Cure | very high |
| Severance | extreme |
| Purge / Escape | post-Severance/open hostility |

## Repeatables

Biological Crafting Productivity, Neural Coherence Optimization, Hive Metabolic Efficiency, Brood Logistics Capacity, Genetic Stability, Sterile Manufacturing Productivity, Purge Weapon Damage, Escape Component Productivity.

## Research UI Requirements

Technology tooltips must state science required, first-time specimen requirement, Alpha organ requirement, sterile lab requirement, Hive Awareness risk, suppression requirement, and post-Severance status.

## Final Research Identity

> Research in The Ichor Engine is autopsy, digestion, memory theft, psychic warfare, industrial archaeology, medical rebellion, and finally engineering.
