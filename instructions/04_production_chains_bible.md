<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Production Chains Bible — Consolidated Version 0.2

## Purpose

This document defines the production economy: raw resources, biological intermediates, machine equivalents, sterile late-game chains, nuclear-biological production, cure materials, and final escape components.

## Core Production Transformation

```text
Iron Ore → Acid-Leached Iron → Hemoferric Slurry → Bio-Forged Plate → Bone-Reinforced Frame → Basic Tendril
```

Late-game reversal:

```text
Bio-Forged Plate → Purified Plate → Clean Steel → Sterile Frame → Clean Assembly Rig → Escape Vessel Component
```

## Resource Families

| Family | Examples |
|---|---|
| Mineral Resources | iron, copper, stone, coal/carbon, oil, uranium |
| Biological Feedstock | biomass, nutrient slurry, cultured biomass |
| Structural Biology | bone, chitin, tendon, muscle, membrane |
| Fluid Biology | ichor, blood, enzymes, acid, bile, mutagen, coolant |
| Neural Biology | nerves, ganglia, cortex, memory tissue, synaptic cores |
| Organs | glands, sacs, hearts, eyes, stomachs, bladders |
| Captured Biology | specimens, genomes, Alpha organs, stabilized traits |
| Industrial Salvage | old circuits, machine frames, colony archive data |
| Nuclear Biology | uranium slurry, isotope tissue, reactor hearts |
| Sterile Industry | purified plates, clean circuits, sterile frames |
| Cure Materials | retroviral agents, neural antagonists, cure stabilizers |
| Escape Components | navigation, life support, launch organs, shields |

## Interplanetary Import Rule

All production chains in the main campaign must be locally solvable on the Ichor planet.

Before escape:

- no required ingredient may depend on cargo delivery from another planet,
- no Space Age planetary resource should be mandatory unless it is locally generated, salvaged, or substituted,
- sterile industry must be manufactured locally from colony recovery and Ichor-side purification,
- the escape vessel must be built without orbital resupply.

After escape:

- optional recipes can accept imports,
- advanced integrations can combine Ichor biology with other Space Age planet resources,
- cargo deliveries can support megabase/postgame play.

## Era Production Overview

| Era | Production Focus |
|---|---|
| 0 | scrap, raw biomass, manual ore |
| 1 | nutrient slurry, crude ichor, bio-forged plates |
| 2 | muscle/tendon logistics, chitin walls, neural control |
| 3 | genomes, organs, mutation materials |
| 4 | biofuel, train organs, outpost infrastructure |
| 5 | Alpha organs, dominance materials, advanced weapons |
| 6 | living processors, memory tissue, drones, pheromones |
| 7 | colony salvage, old-world circuits, restored machines |
| 8 | uranium biology, reactor hearts, radioactive mutagen |
| 9 | purified metals, sterile circuits, clean rooms |
| 10 | cure, suppression, clean military |
| 11 | loyalist cores, purge fuel, post-hive control |
| 12 | escape vessel systems |

## Mineral Chains

### Iron

```text
Iron Ore + Acid Enzyme → Acid-Leached Iron
Acid-Leached Iron + Nutrient Slurry → Hemoferric Slurry
Hemoferric Slurry → Bio-Forged Iron Plate + Bone Ash
Bio-Forged Iron + Antiseptic + Clean Water → Purified Iron Plate
Purified Iron → Clean Steel / Sterile Components
```

### Copper

```text
Copper Ore + Acid Enzyme → Copper-Rich Slurry
Copper-Rich Slurry + Ichor → Bio-Forged Copper Plate
Bio-Forged Copper + Neural Fiber → Conductive Bio-Copper
Bio-Forged Copper + Filter Membrane + Clean Water → Purified Copper
Purified Copper → Clean Wire → Sterile Circuit
```

### Uranium

```text
Uranium Ore + Acid Enzyme → Acid-Washed Uranium
Acid-Washed Uranium + Radioactive Solvent → Radioactive Slurry
Radioactive Slurry + Isotope-Seeking Tissue → Stabilized Isotope Tissue
Stabilized Isotope Tissue + Reactor Heart Seed → Living Reactor Heart
```

## Biomass and Nutrients

```text
Raw Biomass + Water → Crude Nutrient Slurry
Crude Nutrient Slurry + Enzyme Culture → Nutrient Slurry
Nutrient Slurry + Carbon Dust → Enriched Nutrient Slurry
Raw Biomass → Processed Biomass
Processed Biomass + Nutrient Slurry → Growth Medium
Feral Remnant → Contaminated Biomass
```

## Ichor and Biological Fluids

```text
Raw Biomass + Water + Hive Enzyme → Crude Ichor
Crude Ichor + Filter Membrane → Refined Ichor + Necrotic Sludge
Refined Ichor + Conductive Bio-Copper + Neural Fiber → Conductive Ichor
Refined Ichor + Mutagen Gel + Genome Sample → Mutagenic Ichor
Refined Ichor + Antiseptic + Suppression Compound → Stabilized Ichor Medium
```

## Structural Biology

```text
Raw Biomass + Mineral Dust → Bone Bud
Bone Bud + Nutrient Slurry → Bone Segment
Bone Segment → Bone Frame
Bone Frame + Bio-Forged Iron → Reinforced Bone Frame
Reinforced Bone Frame + Dense Chitin → Armored Bone Frame
Shell Trait + Growth Medium → Chitin Culture
Chitin Culture + Nutrient Slurry → Chitin Plate
Chitin Plate + Mineralized Bone → Dense Chitin
Dense Chitin + Alpha Shell Fragment → Apex Chitin
```

## Neural Components

```text
Raw Biomass + Conductive Ichor → Neural Fiber
Neural Fiber + Nutrient Slurry + Bio-Forged Copper → Ganglion Cluster
Ganglion Cluster + Conductive Ichor + Refined Neural Tissue → Synaptic Core
Synaptic Core + Conductive Bio-Copper + Memory Tissue → Living Processor
```

## Logistics Chains

```text
Tendon Fiber + Bone Segment → Tendon Track
Tendon Track + Muscle Bundle + Crude Ichor → Muscle Duct
Muscle Duct + Arterial Tissue + Refined Ichor + Chitin Plate → Arterial Duct
Arterial Duct + Neural Fiber + Conductive Ichor + Synaptic Core → Neural Duct
Purified Iron + Clean Motor + Sterile Circuit → Sterile Conveyor
```

```text
Tendon Fiber + Bone Frame + Crude Ichor → Basic Tendril
Basic Tendril + Muscle Bundle + Ganglion → Fast Tendril
Fast Tendril + Sensory Organ + Ganglion → Filter Tendril
Fast Tendril + Locomotor Assembly + Synaptic Core + Chitin → Stack Tendril
Stack Tendril + Living Processor + Conductive Ichor → Neural Grasper
Purified Iron + Clean Motor + Sterile Circuit → Sterile Inserter
```

## Production Machines

```text
Bone Frame + Nutrient Vat Component + Basic Tendril + Neural Fiber → Growth Chamber I
Growth Chamber I + Muscle + Ganglion + Chitin → Growth Chamber II
Growth Chamber II + Synaptic Core + Refined Ichor + Stabilized Organ → Growth Chamber III
Bone Frame + Acid Gland + Biomass Burner + Crude Ichor → Digestive Smelter I
Digestive Smelter I + Concentrated Acid Gland + Heat Organ + Chitin → Digestive Smelter II
Clean Steel + Sterile Circuit + Clean Motor + Purified Frame → Clean-Room Assembler
```

## Power

```text
Bone Frame + Combustion Sac + Crude Ichor → Biomass Burner
Biomass Burner + Digestive Stomach + Heat Organ → Digestive Heat Engine
Electric Trait + Conductive Ichor + Ganglion → Bioelectric Organ
Bioelectric Organ + Neural Pylon II + Pump Heart → Bioelectric Generator
Reactor Heart Seed + Stabilized Isotope Tissue + Shielded Bone + Conductive Ichor → Living Reactor Heart
Living Reactor Heart + Cooling Gland + Heat-Eater Organ + Radiation Scrubber → Contained Reactor Heart
```

## Trains and Drones

```text
Reinforced Bone Frame + Locomotor Muscle + Pump Heart + Biofuel Chamber + Control Ganglion → Bio-Locomotive I
Reinforced Bone Frame + Dense Chitin + Cargo Sac + Tendon Coupling → Cargo Carapace Wagon
Reinforced Bone Frame + Large Bladder Tank + Arterial Vein + Chitin Shell → Fluid Bladder Wagon
Bio-Locomotive I + Contained Reactor Heart + Shielded Bone + Living Processor → Reactor-Heart Locomotive
Clean Steel + Clean Engine Unit + Sterile Fuel Cell + Clean Processor → Sterile Locomotive
```

## Capture, Genome, and Mutation

```text
Spore Sac + Neurotoxin + Membrane → Spore Capture Capsule
Captured Specimen → Genome Sample + Tissue Sample
Genome Sample + Neural Science + Nutrient Medium → Trait Genome
Trait Genome + Alpha Organ Fragment + Mutagen Gel → Dominant Trait Genome
Genome Sample + Refined Ichor + Enzyme Culture → Mutagen Gel
Mutagen Gel + Cooling + Stabilizing Enzyme → Stabilized Mutagen
Stabilized Mutagen + Alpha Genome + Memory Tissue → Apex Mutagen
```

## Colony and Sterile Chains

```text
Ruined Machine → Industrial Salvage + Damaged Machine Frame + Old-World Circuit
Old-World Circuit + Clean Solvent + Purified Copper → Refurbished Circuit
Damaged Machine Frame + Clean Steel + Sterile Circuit → Purified Machine Frame
Clean Water + Chemical Precursor + Filter Membrane → Antiseptic Reagent
Bio-Forged Iron + Antiseptic + Clean Water → Purified Iron + Bio-Waste
Purified Iron + Carbon Substrate + Sterile Furnace → Clean Steel
Purified Copper + Clean Carbon Substrate + Filter Membrane → Sterile Circuit
Sterile Circuit + Refurbished Circuit + Clean Coolant → Clean Processor
```

## Cure and Severance

```text
Sterile Circuit + Stabilized Ichor Medium + Genome Sample + Clean Coolant → Cure Precursor
Cure Precursor + Retroviral Template + Antiseptic + Clean Processor → Retroviral Agent
Psychic Tissue + Suppression Compound + Clean Processor + Sterile Lab → Neural Antagonist
Retroviral Agent + Neural Antagonist + Clean Coolant + Host Tissue Sample → Host Stabilizer
Host Stabilizer + Cure Precursor + Alpha Genome + Memory Loop Tissue → Final Cure Dose
Sterile Frame + Independent Control Unit + Suppression Compound + Clean Steel → Severance Spire Foundation
Neural Antagonist + Clean Processor + Memory Loop Tissue + Psychic Tissue → Severance Core
Foundation + Core + Final Cure Dose + Sterile Fuel Cell → Severance Spire
```

## Escape Vessel

```text
Sterile Frame + Clean Steel + Purified Iron → Sterile Structural Frame
Clean Processor + Independent Control Unit + Navigation Data + Sterile Circuit → Clean Rocket Control Unit
Loyalist Core + Stabilized Ichor Medium + Reactor Heart Fragment + Clean Processor → Hybrid Launch Organ
Sterile Frame + Clean Coolant + Final Cure Stabilizer + Filter Membrane → Orbital Life-Support Capsule
Clean Steel + Quarantine Seal + Purge Catalyst + Shielded Bone → Anti-Contamination Shielding
Clean Rocket Control Unit + Archive Data Core + Clean Processor + Sterile Circuit → Navigation Core
Sterile Fuel Cell + Stabilized Isotope Tissue + Hybrid Launch Organ + Clean Steel → Hybrid Fuel Chamber
```

## Production Identity

> Mine ore. Feed flesh. Digest metal. Grow organs. Capture traits. Mutate machines. Build living logistics. Recover lost industry. Purify the infected. Manufacture betrayal. Launch through the corpse of your own factory.
