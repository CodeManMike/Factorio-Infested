<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine — Core Build Bible Index

This package contains the 14 core documents produced for **The Ichor Engine**, plus a consistency audit and a list of optional extra documents.

## Canonical Space Age / Planet Assumption

As of the Space Age integration update, **The Ichor Engine is canonically a Factorio 2.x + Space Age planet mod**. It should add its own planet to the existing Space Age planetary framework rather than replacing Nauvis or pretending to be a base-game-only surface.

Core rule:

```text
The Ichor planet is isolated for the story arc.
Cargo deliveries to the planet are disabled until the player completes escape.
After escape, cargo delivery and future Space Age integrations can be unlocked.
```

Implementation note:

```text
Pre-escape:
  prevent or neutralize Cargo Landing Pad placement on the Ichor planet.

Post-escape:
  set the campaign flag escaped = true,
  allow Cargo Landing Pad placement,
  enable future orbital logistics/integration hooks.
```

## Core Documents

1. `01_game_design_pillars.md`
2. `02_full_mechanics_bible.md`
3. `03_era_and_progression.md`
4. `04_production_chains_bible.md`
5. `05_research_and_science_chain.md`
6. `06_entity_building_enemy_item_catalogue.md`
7. `07_art_direction_and_animation_bible.md`
8. `08_story_and_campaign_bible.md`
9. `09_factorio_systems_mapping.md`
10. `10_modding_implementation_guide.md`
11. `11_technical_architecture.md`
12. `12_balance_and_difficulty.md`
13. `13_ux_ui_and_telemetry.md`
14. `14_development_roadmap.md`

## Supporting Files

- `15_consistency_audit.md`
- `16_remaining_optional_docs.md`
- `17_space_age_planet_integration_note.md`

## Canonical One-Sentence Pitch

**The Ichor Engine** is a Factorio total conversion where a crash-landed engineer survives by turning an alien infection into a living factory, then secretly rebuilds sterile industry, severs the hive bond, survives the resulting civil war, and launches an escape vessel.

---

## Implementation Support Documents Added in This Bundle

18. `18_coding_agent_mvp_implementation_pack.md` — Codex/coding-agent MVP build pack.
19. `19_mvp_technical_spec.md` — exact MVP prototype/runtime/cargo-lock spec.
20. `20_prototype_naming_scheme_and_id_bible.md` — canonical internal IDs and naming rules.
21. `21_balance_constants_sheet.md` — MVP constants and first tuning values.
22. `22_art_asset_production_list_and_sprite_creation_workflow.md` — assets plus concept-to-sprite workflow.
23. `23_sound_design_bible.md` — sound identity, software, MVP sounds, implementation notes.
24. `24_compatibility_and_dependency_strategy.md` — Space Age dependency, cargo-lock edge cases, compatibility plan.
25. `25_release_checklist_and_mod_portal_pack.md` — packaging, release, Mod Portal copy, QA.

Canonical working repo root: `E:\The Ichor Engine`  
Canonical docs folder: `E:\The Ichor Engine\ichor_engine_core_docs_markdown`  
Canonical mod target: Factorio 2.x + Space Age, with Ichor as its own added planet and pre-escape cargo delivery locked.

