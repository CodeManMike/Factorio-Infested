<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Full Mechanics Bible — Consolidated Version 0.2

## Core Loop

```text
Spread Living Substrate → connect Neural Pylons/Veins → place biological machines → feed Hive Core → process ore and biomass → capture organisms → unlock genomes/mutations → expand by train/outpost → fight Alphas → manage hunger, loyalty, temperature, mutation, and feralization → recover colony technology → build sterile industry → hide cure research → sever the hive → survive factory civil war → launch escape vessel
```

## Space Age Planet Isolation Mechanic

The Ichor planet is canonically added to the Space Age planetary system, but its campaign loop must remain isolated until escape.

Pre-escape rules:

- no orbital cargo deliveries to Ichor,
- no Cargo Landing Pad function on the Ichor planet,
- no importing a full external mall to bypass the biological progression,
- no trivial delivery of sterile industry, nuclear materials, or Space Age intermediates,
- the player must solve the Ichor arc using local crash salvage, local ore, local biology, colony ruins, and eventual sterile production.

Post-escape rules:

- the campaign sets an `escaped` flag,
- cargo deliveries can be enabled,
- the planet can become part of a wider Space Age economy,
- optional future technologies can integrate Ichor biology with other planet resources.

Core mechanic:

```text
Before escape, Ichor is a sealed story planet.
After escape, Ichor can become an integrated Space Age planet.
```

## Living Substrate

Living Substrate is the biological foundation of the factory.

| Tile | Role |
|---|---|
| Barren Ground | default terrain |
| Young Living Substrate | early fragile growth |
| Mature Living Substrate | standard bio build surface |
| Dense Living Substrate | high-tier support |
| Neural Substrate | control-optimized substrate |
| Feral Substrate | hostile/self-directed growth |
| Contaminated Substrate | unstable, radioactive, sterile-damaged, or corrupted |
| Quarantine Ground | buffer between bio and sterile |
| Sterile Ground | clean late-game build surface |

Substrate is simulated by chunk/region state, not per-tile every tick. Tracked values: substrate health, density, control strength, nutrient saturation, contamination, feral pressure, and temperature.

## Neural Network

The neural network gives biological infrastructure control and identity.

Core entities: Hive Core, Neural Pylons, Neural Veins, Synapse Relays, Pheromone Glands, Train Synapse Anchors, Brood Hives, Loyalist Anchors.

Neural Signal ranges from `0.00` to `1.00`. It is influenced by pylon tier, distance, connectivity, redundancy, Alpha interference, feral pressure, hunger, damage, temperature, and suppression.

Severed Vein sequence:

```text
0–60 sec: warning
1–5 min: speed/control penalty
5–15 min: hunger stress, loyalty loss, mutation pressure
15–30 min: malfunction, train/outpost problems
30+ min: feralization checks
```

## Hive Core and Hunger

The Hive Core is substrate source, hunger sink, control anchor, narrative presence, and future antagonist.

| Hunger | State |
|---:|---|
| 0.00–0.25 | sated |
| 0.25–0.50 | hungry |
| 0.50–0.70 | strained |
| 0.70–0.85 | starving |
| 0.85–0.95 | critical |
| 0.95–1.00 | violent hunger |

Feeding tiers: Raw Biomass, Nutrient Slurry, organs/tissue, neural tissue/ichor, specimens/Alpha fragments, mutagenic compounds, memory tissue, radioactive catalysts, false hunger/deception compounds.

Underfeeding causes loyalty decay, mutation pressure, substrate stress, and internal events. Overfeeding grants growth and repair but increases future demand, hive memory, and Severance resistance.

## Neural Coherence

```text
coherence =
  hive stability
+ average neural signal
+ pheromone coverage
+ nutrient satisfaction
+ substrate health
+ control tech bonuses
- hive hunger
- Alpha interference
- feral pressure
- mutation burden
- severed-zone penalty
- temperature stress
- radiation stress
- sterile suspicion
```

| Coherence | Meaning |
|---:|---|
| 90–100% | optimal |
| 70–89% | normal |
| 50–69% | warnings |
| 30–49% | malfunctions |
| 10–29% | outbreaks and demands |
| 0–9% | cascading rebellion |

## Building Loyalty

```text
loyalty =
  neural signal
+ local coherence
+ pheromone coverage
+ recent feeding
+ stabilizing mutations
- hunger stress
- heat/cold stress
- mutation pressure
- neural complexity
- disconnection time
- Alpha interference
- feral neighbor pressure
- sterile contamination
```

| Loyalty | State |
|---:|---|
| 0.90–1.00 | bound |
| 0.70–0.90 | loyal |
| 0.50–0.70 | strained |
| 0.30–0.50 | unstable |
| 0.10–0.30 | rebellious |
| 0.00–0.10 | breaking |
| 0.00 | feral / reclaimed / dead |

Zero loyalty can produce feral conversion, hive reclamation, necrotic death, dormancy, cannibal metabolism, or brood-mother transformation.

## Mutation

Mutation is both upgrade path and risk. Sources include age, production load, heat, radiation, mutagen input, contaminated biomass, low loyalty, Alpha fields, sterile exposure, and hunger stress.

Categories: productivity, metabolic, defensive, neural, thermal, feral, and sterile-resistant.

Suppression tools: Genetic Stabilizer, Neural Governor, Cooling Gland, Clean Nutrient Feed, Pheromone Regulation, Mutation Scrubber, Sterile Enzyme Wash, Controlled Rebirth.

## Building Age and Self-Awareness

Old buildings gain neural complexity. Benefits include efficiency, speed, self-repair, specialization. Costs include loyalty penalty, mutation pressure, self-directed behavior, replacement resistance, and feral leader chance.

Player choices: keep, reset, harvest, stabilize, clone, sterilize, use as bait, or breed legendary organs.

## Feralization

Feralization occurs when player infrastructure becomes independent hostile life. Causes: severed neural connection, zero loyalty, starvation, high mutation, Alpha interference, reactor incident, sterile backlash, Severance.

Stages:

```text
Stable → Strained → Unstable → Rebellious → Breaking → Feral → Organized Feral
```

Feral bases use simplified growth points, not a full enemy factory simulation.

## Temperature

| Band | Effect |
|---|---|
| Frozen | shutdown/slow, brittle tissue |
| Cold | slower but stable |
| Stable | normal |
| Warm | faster, hungrier |
| Fevered | speed boost, mutation risk |
| Overheated | damage, loyalty loss |
| Necrotic | death/feral risk |

## Psychic Fields and Alphas

Alphas project regional psychic fields that lower neural signal, slow substrate spread, increase mutation, corrupt drones, weaken outposts, buff native enemies, and gate technology.

## Capture and Assimilation

```text
Find organism → weaken → capture/infect → transport/process → sequence genome → unlock trait → industrialize trait
```

Outputs: Captured Specimen, Genome Sample, Stabilized Organ, Trait Genome, Alpha Fragment, Failed Conversion.

## Biological Logistics

| Vanilla | Ichor |
|---|---|
| belts | Tendon Tracks / Muscle Ducts / Arterial Ducts / Neural Ducts |
| inserters | Basic Tendril / Fast Tendril / Filter Tendril / Stack Tendril / Neural Grasper |
| pipes | Crude Vein / Ichor Channel / Arterial Vein / Reinforced Vein |
| chests/tanks | Bone Chest / Cyst Chest / Bladder Tank / Cryo-Sac |
| bots | Larval Carrier / Spore Courier / Construction Broodling / Wing Drone |
| roboport | Brood Hive |

## Biological Trains

Trains remain real trains. Types: Bio-Locomotive, Cargo Carapace Wagon, Fluid Bladder Wagon, Armored Brood Train, Reactor-Heart Locomotive, Sterile Locomotive. Train failures must be rare, telegraphed, and dramatic.

## Sterile Industry and Awareness

Sterile industry requires Sterile Ground, clean power, clean inputs, contamination control, and suppression. It raises Hive Awareness because it creates silence inside the hive’s body.

## Severance

Severance cuts the player’s psychic bond. Outcomes: loyal, hive-reclaimed, feral, dormant, dead, contested.

## MVP Mechanics

```text
controlled substrate spreads → biological machine requires substrate → neural pylon provides control → connection loss lowers loyalty → mutation pressure rises → machine becomes feral → player can purge or reconnect
```

## Final Mechanics Promise

> Build the living factory. Feed it. Expand it. Teach it. Restrain it. Hide from it. Betray it. Survive what it becomes.
