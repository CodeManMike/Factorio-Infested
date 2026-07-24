<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Game Design Pillars Document — Consolidated Version 0.2

## Core Identity

**The Ichor Engine** is a living-factory Factorio total conversion. The player is not merely building on alien ground; the player is building **with alien flesh**.

> I am commanding a living industrial organism that I do not fully control.

The player begins as a crash-landed engineer, becomes an unwilling host, grows a biological factory, conquers native ecosystems, recovers the ruins of a failed human colony, rebuilds sterile industry, cures/severs themselves from the hive, then survives the living factory turning against them.

## Canonical Pitch

A crash-landed engineer survives by bonding with a wounded alien hive and turning it into living factory infrastructure. Belts become muscle ducts, inserters become tendrils, pipes become veins, labs become synapse clusters, drones hatch from brood hives, trains breathe, reactors beat, and the ground itself becomes controllable substrate. But the organism must be fed, controlled, cooled, stabilized, and deceived. In the endgame, the player secretly rebuilds sterile industry, manufactures a cure, severs the hive bond, survives a factory civil war, and launches an escape vessel.

## Emotional Arc

```text
Fear → Relief → Fascination → Ambition → Unease → Domination → Horror → Paranoia → Betrayal → Defiance → Escape
```

## Core Pillars

### 1. Infection Is Infrastructure

Living Substrate is build surface, nervous system, repair tissue, nutrient support, control medium, expansion constraint, enemy surface, and late-game liability.

### 2. Preserve Factorio’s Core Loop

Keep mining, ore processing, belts, inserters, pipes, trains, drones, power, research, outposts, walls, turrets, artillery, nuclear-equivalent power, and rocket-equivalent victory.

| Factorio Role | Ichor Interpretation |
|---|---|
| Belts | Tendon Tracks / Muscle Ducts |
| Inserters | Tendrils / Cilia Clusters |
| Assemblers | Growth Chambers |
| Furnaces | Digestive Smelters |
| Pipes | Veins / Ichor Channels |
| Tanks | Bladders / Cysts |
| Labs | Synapse Clusters / Sterile Labs |
| Power Poles | Neural Pylons |
| Roboports | Brood Hives |
| Bots | Spore Couriers / Broodlings |
| Beacons | Pheromone Glands / Endocrine Towers |
| Walls | Chitin Walls / Bone Ramparts |
| Turrets | Spike Spitters / Acid Glands |
| Trains | Bio-Locomotives |
| Nuclear | Reactor Hearts / Radioactive Tissue |
| Rocket | Sterile/Hybrid Escape Vessel |

### 3. Control Is Gameplay

The factory is alive. It has loyalty, hunger stress, mutation pressure, neural coherence, temperature, and susceptibility to psychic fields. The enemy may be a starved machine, severed outpost, over-mutated reactor, train cut off from neural stations, sterile lab the hive notices, or former production block becoming feral.

### 4. Every Biological Power Has Biological Cost

| Power | Cost |
|---|---|
| Faster bio machines | heat, hunger, mutation |
| Stronger substrate | nutrient demand |
| Drones | neural load, brood hunger |
| Alpha organs | psychic instability |
| Reactor hearts | radiation mutation |
| Sterile industry | Hive Awareness |
| Long-distance outposts | severance risk |
| Endocrine beacons | hunger and mutation pressure |

### 5. The Hive Is Ally, Tool, Prison, and Enemy

The Hive Core saves the player. The player grows it into an industrial civilization. The hive then refuses to let the player leave. Its gratitude and possessiveness are both sincere.

### 6. Feralization Must Be Fair

Feralization must be visible before it happens, caused by understandable pressures, recoverable if caught early, dangerous if ignored, and memorable when it happens.

### 7. Bosses Are Regional Systems

Alphas and Sovereign Nodes are territory-scale psychic control systems: they suppress substrate, corrupt weak control networks, buff native life, gate major technologies, and shape terrain/resource access.

### 8. The Previous Colony Bridges Back to Humanity

Asterion Colony reveals that humanity already tried biological manufacturing, neural control, sterile containment, cure research, Severance, and launch. It failed.

### 9. Sterile Industry Is the Endgame Reversal

Sterile industry creates places the hive cannot hear. It requires Sterile Ground, clean power, contamination control, sealed logistics, suppression coverage, and separation from Living Substrate.

### 10. Severance Turns the Base Into the Battlefield

When the player cuts the hive bond, biological infrastructure resolves into loyalist, hive-reclaimed, feral, dormant, dead, or contested states.

## Canonical Space Age Planet Pillar

**The Ichor Engine is a Factorio 2.x / Space Age-era planet experience.**

The Ichor world is not merely a reskinned Nauvis start. It is a dedicated added planet in the Space Age planetary framework, designed as a self-contained story arc.

Design rules:

- the player is stranded on the Ichor planet for the main campaign arc,
- orbital cargo deliveries are disabled until escape,
- the planet can later integrate with the wider Space Age solar system,
- the first release should preserve the single-planet horror/survival arc,
- post-escape cargo logistics are a reward and future-expansion hook, not an early convenience.

This preserves the emotional arc:

```text
stranded host
→ living factory dependence
→ sterile betrayal
→ Severance
→ escape
→ optional reintegration with the wider Space Age economy
```

## Anti-Goals

The mod must not be a simple alien reskin, random-punishment simulator, combat mod with factory bits attached, micromanagement chore pile, or hidden-systems mod where the player cannot diagnose failure.

## Non-Negotiables

1. The factory is alive.
2. Factorio’s logistics loop remains central.
3. Ore remains important throughout the campaign.
4. Substrate is real infrastructure.
5. Neural control and loyalty are central.
6. Disconnected sections decay, malfunction, mutate, or feralize.
7. Buildings can evolve into useful or dangerous forms.
8. Alphas are regional psychic warfare.
9. The previous colony unlocks sterile recovery.
10. Sterile industry is required for cure and escape.
11. Severance turns the factory against the player based on preparation.
12. Victory requires cure, containment, defense, and launch.

## Final Design Compass

> The player is not building on alien ground.  
> The player is building with alien flesh.  
> The factory is not a tool.  
> It is a hungry civilization pretending to be infrastructure.  
> The game is won when the player can survive without it.
