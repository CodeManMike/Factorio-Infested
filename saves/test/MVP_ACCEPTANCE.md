# MVP Acceptance Checklist

Validated: **2026-07-24** (repo/static)
Factorio session: **pending manual run**

Reference: [18 — MVP implementation pack](../instructions/18_coding_agent_mvp_implementation_pack.md) §7, [19 — MVP technical spec](../instructions/19_mvp_technical_spec.md) §12.

## Static / Repo Checks

| # | Check | Result | Notes |
|---|---|---|---|
| S1 | Mod `info.json` loads (`the-ichor-engine` 0.2.0) | PASS | |
| S2 | `data.lua` requires all prototype modules | PASS | includes bio-production tech + gui sprites |
| S3 | Graphics paths under `mod/the-ichor-engine/graphics/` | PASS | `tools/validate-graphics.ps1` |
| S4 | Bio-production prototypes present | PASS | 6 entities, 7 recipes, 2 techs |
| S5 | Nutrient Vat + Digestive Smelter in registry | PASS | `definitions.lua` bio-building |
| S6 | Tendril/Tendon/Vein/Tank not in loyalty registry | PASS | vanilla logistics only |
| S7 | `art-source/` scaffold + gitignore rules | PASS | binaries ignored, structure tracked |
| S8 | Package script excludes `art-source/` | PASS | zips `mod/the-ichor-engine/` only |

## In-Game Checks (manual)

| # | Scenario | Result | Notes |
|---|---|---|---|
| 1 | New game on Ichor loads without errors | PENDING | |
| 2 | Save and reload preserves `storage.ichor` | PENDING | |
| 3 | Cargo landing pad blocked pre-escape | PENDING | |
| 4 | `/ichor-complete-escape` unlocks cargo | PENDING | |
| 5 | Place Hive Core, feed raw biomass | PENDING | |
| 6 | Substrate Node spreads living substrate | PENDING | |
| 7 | Growth Chamber + Pylon → loyal bio-building | PENDING | |
| 8 | Remove pylon / `/ichor-starve` → warnings → feral chamber | PENDING | |
| 9 | `/ichor-status`, `/ichor-dump-selected`, GUI panels | PENDING | |
| 10 | Research bio-logistics → craft tendril, tendon, vein, tank | PENDING | |
| 11 | Research bio-metallurgy → Digestive Smelter → copper plate | PENDING | |
| 12 | Nutrient Vat processes nutrient slurry recipe | PENDING | |
| 13 | Custom tile/entity/icon sprites visible (placeholders OK) | PENDING | |
| 14 | MVP loop unchanged on Nutrient Vat / Digestive Smelter | PENDING | loyalty/substrate/neural |

## Blockers Found

None from static validation. Update this file after an in-game pass.

## Commands Used During Test

```
/ichor-status
/ichor-feed
/ichor-starve
/ichor-spread-substrate
/ichor-complete-escape
/ichor-balance-report
```
