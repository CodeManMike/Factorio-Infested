<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Balance and Difficulty Document — Consolidated Version 0.2

## Balance Philosophy

The mod should be dangerous, readable, scalable, and recoverable. The player should lose because they understand why.

```text
warning → inefficiency → malfunction → local crisis → recoverable disaster → major loss if ignored
```

## Cargo Isolation Balance Rule

Pre-escape cargo delivery must be disabled because external cargo would destroy the intended balance curve.

If the player can import mature Space Age supplies early, they can bypass:

- biological ore processing,
- hunger logistics,
- sterile local production,
- colony recovery,
- cure-chain bottlenecks,
- local escape construction.

Therefore:

```text
Before escape:
  no Cargo Landing Pad use on Ichor.

After escape:
  cargo delivery can unlock as a post-campaign reward.
```

This makes the first campaign a sealed local economy while preserving future megabase and Space Age integration.

## Difficulty Presets

| System | Symbiotic | Hostile | Apex | Feral World | Engineer’s Nightmare |
|---|---:|---:|---:|---:|---:|
| Hunger Growth | 0.60 | 1.00 | 1.35 | 1.20 | 1.75 |
| Nutrient Demand | 0.75 | 1.00 | 1.25 | 1.15 | 1.50 |
| Mutation Pressure | 0.60 | 1.00 | 1.35 | 1.70 | 2.00 |
| Loyalty Decay | 0.50 | 1.00 | 1.30 | 1.60 | 2.00 |
| Feral Spread | 0.40 | 1.00 | 1.30 | 2.00 | 2.50 |
| Alpha Field Strength | 0.70 | 1.00 | 1.35 | 1.20 | 1.75 |
| Sterile Awareness | 0.60 | 1.00 | 1.35 | 1.00 | 1.75 |
| Enemy Pressure | 0.70 | 1.00 | 1.30 | 1.40 | 1.70 |
| Severance Severity | 0.60 | 1.00 | 1.35 | 1.50 | 2.00 |

Default: Hostile.

## Campaign Pacing

| Stage | Target Time |
|---|---:|
| Era 0–1 | 1–3 hours |
| Era 2–3 | 4–10 hours |
| Era 4–5 | 10–25 hours |
| Era 6–8 | 25–60 hours |
| Era 9–10 | 60–90 hours |
| Era 11–12 | 90–120+ hours |

## Research Cost Ranges

Survival 5–20, Biomass 10–75, Neural 30–150, Genome 100–500, Mutation 150–750, Expansion 250–1,000, Alpha 300–1,500 plus boss, Hive Command 500–2,500, Industrial Recovery 500–2,500, Nuclear 750–3,500, Sterile 1,000–5,000, Cure 1,500–8,000, Severance 2,000–10,000, Escape 3,000–20,000.

## Recipe Time Targets

Basic intermediates 0.5–2s; early buildings 2–8s; organs/tissue 4–20s; trains 10–30s; Alpha components 15–60s; reactor organs 30–120s; cure materials 30–180s; escape components 30–300s.

## Hunger

Initial constants:

```lua
base_growth_per_minute = 0.006
building_factor = 0.00004
dense_substrate_chunk_factor = 0.0008
brood_hive_factor = 0.001
reactor_heart_factor = 0.002
```

Thresholds: Sated 0–25%, Hungry 25–50%, Strained 50–70%, Starving 70–85%, Critical 85–95%, Violent Hunger 95–100%.

## Substrate Spread

Hive Core 20–60 tiles/min, Substrate Node I 8–20, Node II 20–50, Dense Cultivator 5–15 upgrades, Feral Node 10–30, Sterile Projector 5–20 conversions.

## Neural Signal

Pylon I 16–18 tiles, Pylon II 24–28, Pylon III 36–48, Synapse Relay 64–96, Loyalist Anchor 24–36.

Disconnection grace: early base 5–10 min, mid outpost 3–7 min, Alpha territory 1–4 min.

## Loyalty

Decay per minute: no signal 0.03–0.08, no substrate 0.04–0.10, high hunger 0.01–0.05, mutation 0.01–0.04, Alpha field 0.02–0.08, feral neighbor 0.01–0.06, overheated 0.02–0.06.

States: Bound, Loyal, Strained, Unstable, Rebellious, Breaking, Feral/defect/dead.

## Mutation

Pressure thresholds: 0.25 minor warning, 0.50 visible warning, 0.75 malfunction/trait possible, 1.00 event.

Default Hostile distribution: cosmetic 20%, minor beneficial 20%, minor harmful 25%, mixed 20%, dangerous 10%, feral precursor 5%.

## Feralization

Conditions:

```text
loyalty <= 0 AND mutation_pressure >= 0.5
OR severe disconnection
OR forced by Severance
```

Times if ignored: early unsupported building 15–30 min, disconnected outpost 10–20, Alpha-corrupted 5–15, reactor 3–10, post-Severance immediate–5.

## Alpha Balance

Inside Alpha territory: Neural -10% to -50%, loyalty -0.01 to -0.05/min, mutation +10% to +100%, substrate spread -25% to -75%, enemy strength +20% to +100%.

## Sterile and Awareness

Sterile premium: belts/inserters 2x–4x, clean assembler 3x–6x, sterile circuit 4x–8x, clean processor 6x–12x, cure materials 10x+ chain complexity.

Awareness thresholds: curiosity 20%, hunger spikes 40%, interference 60%, sabotage 80%, forced crisis warning 95%, forced Severance/rebellion 100%.

## Severance

Prepared Hostile retention targets: main base 60–85%, loyalist sectors 80–95%, neglected outposts 0–40%, high-mutation sectors 10–50%, sterile sectors 80–100%, drones 40–70%, trains 50–80%.

## MVP Targets

Hive serious hunger after 20–30 min if unfed; one biomass line stabilizes it; Substrate Node covers starter area in 5–10 min; Growth Chamber without signal takes 10–20 min to become feral; first mutation warning before feralization.

## Final Balance Mantra

> Slow warnings. Real consequences. Automatable control. Recoverable disasters. Brutal endgame. No invisible dice deciding the fate of a megabase.
