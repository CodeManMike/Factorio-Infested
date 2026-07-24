<!--
The Ichor Engine — consolidated core build bible
Assembled: 2026-07-02
Format: Markdown
Update: Space Age planet integration and cargo-delivery lock added.
-->

# The Ichor Engine
## Space Age Planet Integration Note — Version 0.1

## Canonical Decision

**The Ichor Engine is a Factorio 2.x + Space Age planet mod.**

The Ichor world should be added to the existing Space Age planetary framework as its own planet/location. The main campaign should occur on this planet as a sealed story arc.

## Campaign Cargo Rule

```text
Before escape:
  cargo deliveries to Ichor are disabled.

After escape:
  cargo deliveries to Ichor can be enabled.
```

This prevents the player from importing a mature off-world mall, sterile materials, nuclear parts, or other Space Age resources that would bypass the intended Ichor progression.

## Technical Rationale

Factorio exposes planet/location prototype support through `PlanetPrototype`, including starmap icons, travel/location fields, and `surface_properties`. Surface properties are represented through `SurfacePropertyPrototype`/`SurfacePropertyID` and can be used by planet/surface definitions.

In Space Age, the Cargo Landing Pad is the hub for orbital deliveries: it acts as a requester chest for orbiting platforms, and platforms stopped over a planet can drop cargo to satisfy landing-pad requests.

Therefore, the MVP lock should focus on the Cargo Landing Pad.

## MVP Implementation Rule

Do **not** globally remove or nerf the Cargo Landing Pad.

Instead:

```text
If a Cargo Landing Pad is built on Ichor before escape:
  refund it,
  destroy/remove it,
  show an alert explaining orbital quarantine.
```

This preserves normal Space Age behavior on all other planets.

## Runtime State

```lua
storage.ichor.space_age = {
  ichor_planet_name = "ichor",
  ichor_surface_name = "ichor",
  escaped = false,
  cargo_locked = true,
  cargo_unlock_tick = nil
}
```

## Event Coverage

Handle:

```text
on_built_entity
on_robot_built_entity
script_raised_built
script_raised_revive
```

Watch for:

```text
cargo-landing-pad
```

Optionally also monitor cargo-related entities if future testing reveals bypasses.

## Player Alert

```text
Cargo Landing Pad blocked.
The Ichor planet remains under orbital quarantine until escape is complete.
Build the escape vessel to unlock cargo deliveries.
```

## Post-Escape Unlock

When the escape vessel launches or the story victory condition completes:

```lua
storage.ichor.space_age.escaped = true
storage.ichor.space_age.cargo_locked = false
storage.ichor.space_age.cargo_unlock_tick = game.tick
```

Then show:

```text
Orbital reintegration complete.
Cargo deliveries to Ichor are now authorized.
```

## Future Integration Hooks

Post-escape systems can add:

- Ichor export products,
- biological/sterile hybrid recipes using other planet resources,
- optional cargo delivery requests,
- interplanetary Ichor science,
- Space Age compatibility balancing,
- postgame megabase scaling.

## Non-Negotiable

The pre-escape Ichor campaign must remain locally solvable and isolated.

The player must escape because they solved Ichor, not because they imported the rest of the solar system.
