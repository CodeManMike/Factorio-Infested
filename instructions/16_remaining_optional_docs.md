<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## Remaining Optional Documents

The 14 core docs are enough to begin implementation. The remaining documents are useful support docs to reduce ambiguity, speed up coding-agent work, and make production cleaner.

## Recommended Next Extras, In Order

### 1. Coding-Agent MVP Implementation Pack

Exact copy-paste task pack for Codex or another coding agent. Include repo/file tree, PowerShell-safe commands, Phase 0–5 tasks, acceptance tests, stop-and-wait verification points, `storage` schemas, prototype names, and minimal skeleton expectations.

### 2. MVP Technical Spec

Lock the first playable build: exact items, entities, recipes, techs, numbers, debug commands, save/load test procedure, exclusions.

### 3. Prototype Naming Scheme and ID Bible

Final internal names for every item, entity, fluid, recipe, technology, locale key, and migration name.

### 4. Balance Constants Sheet

Code-ready Lua constants for hunger, loyalty, mutation, feral, substrate, presets, Severance.

### 5. Art Asset Production List

Exact sprite/icon list by phase: MVP assets, sprite sizes/footprints, state variants, animations, icons, placeholder strategy.

### 6. Sound Design Bible

Substrate ambience, machine loops, alerts, hive communication effects, sterile hums, Alpha territory ambience, Severance audio, launch audio.

### 7. Compatibility and Dependency Strategy

Base-only vs Space Age, optional dependencies, QoL compatibility, incompatible overhauls, remote interface plan, migration/compat policy.

### 8. Release Checklist and Mod Portal Pack

`info.json`, changelog, thumbnail, screenshots, description, license, credits, packaging script, testing checklist.

### 9. QA and Test Plan

Startup tests, save/load, migrations, blueprints, multiplayer smoke, UPS/performance, regression saves.

### 10. Locale and Writing Style Pack

Entity descriptions, technology descriptions, alerts, Hive voice rules, colony archive style, tooltip tags.

### 11. Migration Strategy and Save Compatibility Playbook

JSON migrations, Lua migrations, schema versioning, prototype rename policy, registry rebuild tools.

### 12. Performance / UPS Profiling Playbook

Profiling scenarios, batch sizes, overlay limits, tile update limits, chunk cache validation, debug performance report.

### 13. Multiplayer and Roles Design

Co-op roles, shared vs per-player UI, team alerts, Severance confirmation in multiplayer, admin controls.

### 14. Enemy and Boss Encounter Design Sheets

Behavior, traits, drops, capture outputs, territory effects, attack patterns, rewards for each native and Alpha.

### 15. Technology Tree Diagram Document

Mermaid diagrams for science dependencies, era gates, Alpha gates, sterile/cure/Severance path.

### 16. Production Flow Diagram Document

Flow diagrams for early bio plates, nutrients/ichor, organs, train chain, sterile chain, cure chain, escape chain.

### 17. Contributor / Repo README

Developer onboarding, folder structure, running the mod, coding style, debug commands, testing workflow, packaging.

## Practical Recommendation

Do these next:

1. **Coding-Agent MVP Implementation Pack**
2. **MVP Technical Spec**
3. **Prototype Naming Scheme and ID Bible**
4. **Balance Constants Sheet**
5. **Art Asset Production List**

After those, implementation can start cleanly.
