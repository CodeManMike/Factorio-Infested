<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Consistency Audit — Core 14 Documents

## Audit Result

Overall consistency is strong. The core concept, progression spine, mechanical pillars, and implementation plan align across all 14 documents.

No major contradiction blocks development.

The most important consistency correction is technical:

> All Factorio 2.x runtime state examples must use `storage`, not legacy `global`.

This consolidated package applies that correction everywhere.

## Canonical Terms

| Concept | Canonical Term | Notes |
|---|---|---|
| Mod title | The Ichor Engine | consistent |
| Starting organism entity | Hive Core | physical entity |
| Hive intelligence | Rootmind | narrative name |
| Human failed settlement | Asterion Colony | canonical placeholder |
| Biological build surface | Living Substrate | primary term |
| Hostile player-grown surface | Feral Substrate | primary term |
| Clean build surface | Sterile Ground | primary term |
| Long-distance control | Neural Vein | primary term |
| Control tower | Neural Pylon | primary term |
| Late-game clean industry | Sterile Industry | primary term |
| Endgame bond cut | Severance | primary term |
| Enemy regional bosses | Alphas | primary term |
| Larger psychic minds | Sovereign Nodes | distinct from Alphas |
| Pollution equivalent | Spore Pressure | may map to pollution in implementation |

## Premise Consistency

All docs agree on this arc:

```text
Crash → infection → living substrate → biological automation → capture/genomes/mutation → trains/outposts → Alpha territory war → hive command scale → old colony ruins → nuclear flesh → sterile industry → cure/suppression → Severance → post-Severance civil war → escape vessel
```

## Mechanics Consistency

### Substrate

Consistent: Living Substrate is infrastructure, biological buildings require it, Feral Substrate is hostile, Sterile Ground blocks/rejects biological growth. Implementation refinement: use tile prototypes plus chunk-level runtime state.

### Hunger

Consistent: global early, scales with factory, feeding lowers it, high hunger affects loyalty/mutation/hive mood, overfeeding strengthens future hive claim.

### Loyalty

Consistent: per-entity or regional obedience; low loyalty creates warnings, malfunctions, mutation, feralization; track only major entities at first.

### Mutation

Consistent: both power and danger; pressure comes from heat, loyalty, hunger, radiation, Alpha fields, age, mutagen; visible before dangerous.

### Trains

Consistent: real trains; loyalty exists but disobedience is rare and telegraphed; never randomly ignore signals.

### Sterile Industry

Consistent: late-game reversal requiring clean ground, clean inputs, contamination control, suppression, and causes Hive Awareness.

### Severance

Consistent: point of no return; forecast, confirmed, staged, and state-based.

## Technical Drift Fixed

- `global` examples normalized to `storage.ichor`.
- `on_load` documented as read-only for storage mutation.
- Internal prefix standardized as `ichor-`.
- `factorio_version = "2.0"` used as starting target, with open decision for current/latest major target.

## Narrative Drift Fixed

- Hive Core = physical entity.
- Rootmind = intelligence/personality.
- Asterion Colony = canonical placeholder for failed colony.
- Alphas = regional bosses.
- Sovereign Nodes = larger psychic minds.

## Open Decisions Before Coding

1. Exact Factorio target: 2.0-compatible or current latest.
2. Base-only or Space Age dependency.
3. Hive Core prototype style.
4. Digestive Smelter as furnace or assembling-machine.
5. Neural Vein MVP form.
6. First Alpha implementation form.
7. Clean/bio pipe boundary enforcement.
8. Capture capsule mechanics.
9. Pollution vs custom Spore Pressure.
10. Art pipeline and sprite tooling.

## Verdict

| Area | Status |
|---|---|
| Premise | consistent |
| Era progression | consistent |
| Production chains | consistent |
| Research chain | consistent |
| Entity catalogue | consistent |
| Art direction | consistent |
| Story/narrative | consistent |
| Factorio mapping | consistent after `storage` normalization |
| Runtime architecture | consistent |
| Balance | consistent |
| UX/diagnostics | consistent |
| Roadmap | consistent |

> The design bible is internally aligned and ready for a Codex-ready MVP implementation pack.


## Space Age / Planet Integration Audit Update

New canonical decision:

```text
The Ichor Engine targets Factorio 2.x with Space Age enabled.
The Ichor world is an added planet in the Space Age planetary framework.
The campaign remains isolated until escape.
Cargo deliveries to the Ichor planet are disabled until the player completes escape.
```

Consistency impact:

| Area | Audit Result |
|---|---|
| Story | strengthens the stranded/no-help premise |
| Progression | prevents imports from bypassing biological/sterile progression |
| Production | all critical-path chains must be locally solvable pre-escape |
| Research | no mandatory off-planet science/resources before escape |
| Technical mapping | requires Space Age planet/location prototype work |
| Implementation | `info.json` should depend on `space-age` for canonical build |
| UX | cargo lock needs clear warning and post-escape unlock message |
| Roadmap | add Phase 0A before deep content work |

No conflict with the core 14 docs after updates. This is a clarification of platform/campaign structure, not a change to the main fantasy.
