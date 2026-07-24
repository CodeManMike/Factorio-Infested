<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Note: This package normalizes terminology and updates Factorio 2.x runtime examples to use `storage` rather than legacy `global`.
-->


# The Ichor Engine
## UX, UI, and Telemetry Document — Consolidated Version 0.2

## UX Goal

The player must always be able to answer:

```text
What is wrong?
Where is it wrong?
Why is it happening?
How urgent is it?
What can I do about it?
What happens if I ignore it?
```

## UI Layers

Visual state art → alerts/icons → selected entity inspection → overlays → dashboards → debug/telemetry.

## Main UI Surfaces

Hive Status Button, Hive Core Panel, Selected Entity Panel, Region/Outpost Dashboard, Overlay Controls, Logbook/Archive, Sterile Operations Panel, Severance Readiness Report, Post-Severance Report, Telemetry Panel.

## Cargo Lock UX

The player must understand why cargo delivery is disabled.

UI requirements:

- show Ichor planet orbital status as **Quarantined / Cargo Locked** before escape,
- if the player tries to place a Cargo Landing Pad before escape, refund it and show a clear alert,
- explain that cargo deliveries unlock after escape/post-campaign reintegration,
- after escape, show **Orbital Cargo Delivery Authorized**.

Alert example:

```text
Cargo Landing Pad blocked.
The Ichor planet remains under orbital quarantine until escape is complete.
Build the escape vessel to unlock cargo deliveries.
```

Post-escape message:

```text
Orbital reintegration complete.
Cargo deliveries to Ichor are now authorized.
```

## Hive Core Panel

Shows Hive Hunger, Neural Coherence, Hive Awareness, Feral Pressure, Sterile Suppression Health, top critical alerts, unstable regions, and production demand trends.

Example:

```text
Hive Hunger: 64% — Starving in 11 min
Food trend: -0.8% / min
Global Neural Coherence: 78%
Hive Awareness: 38%
Unstable Regions: 1
```

## Selected Entity Panel

For biological buildings:

```text
Growth Chamber II
State: Unstable
Living Substrate: yes
Neural Signal: 0%
Loyalty: 38% and falling
Mutation Pressure: 58%
Primary Cause: no neural signal
Secondary Cause: Hive Hunger 79%
Risk: feralization in 8–12 min
Action: restore pylon/vein, feed Hive Core, apply stabilizer, or purge.
```

For sterile buildings, show contamination, clean power, suppression, awareness leak, dirty input cause, and recommended fix.

For feral entities, show former identity, zone, behavior, reclaim chance, weakness.

## Region Dashboard

Shows connected status, safe time remaining, neural signal, coherence, average/lowest loyalty, mutation, feral pressure, nutrient buffer, train service, main causes, recommended fixes.

## Overlays

Substrate, Neural, Loyalty, Mutation, Feral, Temperature, Alpha Fields, Sterile, Hive Awareness, Train Control, Severance Forecast.

Overlay rules: toggleable, low object count, one concept at a time by default, chunk/region summaries, problem entities highlighted, healthy systems quiet.

## Alert System

Severity: Info, Warning, Danger, Critical, Crisis.

Template:

```text
[Severity] [Region/System]
Problem: what happened.
Cause: primary cause.
Risk: what happens if ignored.
Action: most direct fix.
```

Group by region/cause/severity. No alert spam.

## Logbook

Sections: Hive Contact, Asterion Colony, Native Alphas, Feral Incidents, Sterile Research, Cure and Severance, System Tutorials, Reports.

## Tooltips and Tags

Requires Living Substrate, Requires Neural Signal, Consumes Nutrients, Can Mutate, Can Become Feral, Raises Hive Awareness, Requires Sterile Ground, Contamination Sensitive, Post-Severance Safe.

## Severance Readiness Report

Before activation: projected biological retention, hive-reclaimed percentage, feral percentage, dormant/dead percentage, sterile sector survival, cure stability, Hive Awareness, regional forecast, train/drone forecast, recommended preparations.

Severance activation must require explicit confirmation.

## Post-Severance Report

After activation: host link severed, cure stability, Hive Core state, region outcomes, biological train outcomes, drone losses, immediate priorities.

## Telemetry

Track hunger, food consumed, average/lowest loyalty, mutation events, feral conversions, active feral zones, sterile contamination, awareness trend, Severance outcomes.

Command: `/ichor-balance-report`.

## MVP UX Scope

Top Ichor button, Hive Panel, selected entity diagnostics, basic alerts, Substrate Overlay, Neural Overlay, Low Loyalty warning icon, Feralization alert, debug balance report.

## UX Non-Negotiables

No invisible feralization; no hidden Hive Awareness; no sterile contamination without cause/location; no train defection without severe warning; no Severance without forecast and confirmation; no alert spam; no debug-only information required for normal play.

## Final UX Mantra

> Do not hide the monster. Instrument it. Trend it. Map it. Warn the player before it bites. Then let the consequences be real.
