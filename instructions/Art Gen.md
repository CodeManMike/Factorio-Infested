# The Ichor Engine  
## Generative Art Prompt Pack for First Sprite Frames — Version 0.1

---

## 1. Purpose

This document provides generative-art-model instructions for creating the **first frame** of each initial Ichor art asset.

These prompts are designed for:

```text
concept-to-sprite generation
first-frame animation references
Blender modelling references
Aseprite/Krita paintover references
Factorio-compatible sprite production
```

The goal is not to create finished plug-and-play sprites directly.

The goal is to create clear, consistent first-frame source images that can be:

```text
cleaned up
modelled in Blender
painted over
converted into animation frames
exported into Factorio-ready sprite sheets
```

---

# 2. Universal Prompt Prefix

Use this at the start of every asset prompt.

```text
Create a Factorio-compatible isometric industrial game sprite concept, three-quarter top-down orthographic view, transparent background, readable at gameplay zoom, strong silhouette, high contrast, grounded industrial lighting, hand-painted rendered sprite look, no text, no UI, no characters, no background scene, no camera perspective distortion.

The asset belongs to a biological-industrial factory mod called The Ichor Engine. The visual language combines wet organic machinery, bone frames, chitin plates, tendon cables, membrane sacs, neural glow, ichor fluids, and grimy industrial construction. It should feel alive, useful, unstable, and capable of becoming hostile, but it must remain mechanically readable as a factory-game asset.
```

---

# 3. Universal Negative Prompt

Use this with every asset.

```text
Do not create a direct copy of Factorio assets, StarCraft/Zerg assets, creep tumors, Hydralisk-like creatures, Overmind-like forms, copyrighted silhouettes, text labels, logos, UI panels, humans, weapons held by characters, full scenes, cinematic backgrounds, low-detail blobs, muddy unreadable shapes, excessive gore, horror monster faces unless specified, photorealistic gore, first-person perspective, side view, flat icon-only view unless the asset is an icon, or assets with black backgrounds.
```

---

# 4. Universal Sprite Requirements

Apply to all entity prompts.

```text
transparent PNG style
isometric three-quarter top-down view
consistent light from upper-left
soft contact shadow under the object
clear footprint
centered asset
visible top silhouette
readable edge shapes
limited palette
no frame cropping
first animation frame only
neutral/idle pose unless otherwise specified
```

---

# 5. Palette Reference

Use this material palette throughout.

```text
controlled biology:
deep reds, dark maroons, wet browns, bone beige, chitin bronze, subtle blue-white neural glow

feral biology:
black ichor, dark red, bruised purple, sickly yellow-green, jagged bone, aggressive spikes

sterile technology:
off-white ceramic, grey steel, sealed panels, blue/green indicator lights, black rubber seals

old colony:
rusted steel, cracked concrete, faded yellow hazard paint, emergency red lights, infected purple-red tissue

dead/necrotic:
grey collapsed tissue, ash, dark fluid leaks, chemical burns
```

---

# 6. Camera and Framing Instruction

Add this to all **entity** prompts.

```text
Frame the object as a single isolated game entity sprite, orthographic isometric view, approximately 45 degrees horizontal rotation and elevated top-down angle, centered on transparent background. The whole object must fit within the frame with padding for animation. The first frame should look stable and usable as frame 1 of an idle or working animation.
```

For icons, use:

```text
Frame as a centered 64x64 game icon concept, readable at 32px and 64px, high contrast, no text, transparent background, strong silhouette.
```

For tiles, use:

```text
Create a seamless square ground tile texture, top-down/isometric-compatible, no hard border, repeatable edges, organic texture readable at small size.
```

---

# 7. Entity Prompt: Hive Core

## Internal ID

```text
ichor-hive-core
```

## Intended Footprint

```text
5x5
```

## First Frame Prompt

```text
Create the first idle frame for ichor-hive-core, a massive biological-industrial heart structure for a Factorio-compatible isometric factory sprite.

It should look like the central living industrial heart of an alien factory: a huge ribbed organ core held inside a partial bone-and-chitin frame, with thick feeder veins entering the ground, membrane sacs around the base, subtle blue-white neural glow in recessed nerve channels, and wet dark red ichor visible in cracks and tubes.

The silhouette must clearly read as a large central base structure, not a monster. It should have a broad 5x5 footprint, low heavy base, raised central pulsing organ, bone support ribs, embedded industrial sockets, and several grounded root anchors. The first frame should be calm but alive: slightly inflated membranes, stable glow, symmetrical controlled posture.

Style: Factorio-compatible isometric industrial sprite, grimy hand-painted rendered game asset, orthographic three-quarter top-down view, transparent background, strong readable silhouette, soft contact shadow, upper-left lighting.

Avoid: eyes, humanoid face, generic monster mouth, copied Zerg/Overmind forms, loose gore pile, unreadable blob, text, background.
```

## Useful First-Frame Notes

```text
Frame 1 should be the “resting breath” state.
Do not show violent contraction yet.
The core should be readable as the player’s main biological hub.
```

---

# 8. Entity Prompt: Substrate Node

## Internal ID

```text
ichor-substrate-node
```

## Intended Footprint

```text
2x2
```

## First Frame Prompt

```text
Create the first idle frame for ichor-substrate-node, a small biological ground-spreading structure for a Factorio-compatible isometric factory sprite.

It should look like a compact root-node that grows Living Substrate into nearby terrain: a low mound of layered red tissue, bone nodules, short feeder tendrils, and small pulsing ichor sacs partly embedded in the ground. It should be visibly functional as a spreading node, with tendrils touching the floor and thin organic filaments extending outward.

The silhouette must be low, compact, and readable at gameplay zoom. The asset should look controlled, useful, and stable, not hostile. Include subtle neural-blue pinpoints or faint glowing seams to show it is under control.

Style: Factorio-compatible isometric industrial sprite, orthographic three-quarter top-down view, transparent background, strong silhouette, soft contact shadow, upper-left lighting, wet red flesh, bone beige nodules, dark maroon roots.

Avoid: creep tumor copy, giant flower, monster egg, face, excessive tentacles, unreadable red blob, background.
```

## Useful First-Frame Notes

```text
Frame 1 should show tendrils resting close to the ground.
Later animation can show tendrils pulsing outward.
```

---

# 9. Entity Prompt: Neural Pylon I

## Internal ID

```text
ichor-neural-pylon-1
```

## Intended Footprint

```text
1x2 or 2x2
```

## First Frame Prompt

```text
Create the first idle frame for ichor-neural-pylon-1, a vertical nerve-spine control tower for a Factorio-compatible isometric factory sprite.

It should look like a biological signal pylon: a tall twisted bone-and-nerve spine rising from a fleshy base, with chitin clamps, tendon cables, and a small luminous neural crown at the top. The structure should read as a control/signal emitter, not a weapon. Add faint blue-white glow traveling through nerve channels, but keep the first frame stable and calm.

The silhouette should be vertical and distinct from production buildings. The base should be organic and anchored into Living Substrate, with small feeder veins and bone supports. It must be readable as a 1x2 or compact 2x2 entity.

Style: Factorio-compatible isometric industrial sprite, orthographic three-quarter top-down view, transparent background, strong silhouette, soft contact shadow, upper-left lighting, bone beige, dark red tissue, subtle neural glow.

Avoid: radio antenna copy, sci-fi metal tower, magic crystal, lightning storm, weapon turret, face, background.
```

## Useful First-Frame Notes

```text
Frame 1 should show the pylon before the upward pulse.
The top glow should be visible but not overbright.
```

---

# 10. Entity Prompt: Growth Chamber I

## Internal ID

```text
ichor-growth-chamber-1
```

## Intended Footprint

```text
3x3
```

## First Frame Prompt

```text
Create the first idle or working frame for ichor-growth-chamber-1, a biological assembler building for a Factorio-compatible isometric factory sprite.

It should look like a womb-like industrial growth machine: a central translucent red membrane chamber held by a curved bone frame, with feeder tendrils, small ichor sacs, chitin braces, and pipe-like organic ducts connected into the base. The building should clearly read as a production assembler, not a creature. Include a visible central chamber cavity where materials would be processed or grown.

The silhouette should be broad and mechanically readable for a 3x3 factory building. The first frame should be controlled and stable: membrane relaxed, tendrils resting, inner glow faint but present, no violent motion yet. Make the central cavity the most readable feature.

Style: Factorio-compatible isometric industrial sprite, orthographic three-quarter top-down view, transparent background, strong silhouette, upper-left lighting, soft contact shadow, wet red membrane, bone beige frame, dark maroon tissue, subtle neural glow.

Avoid: generic egg sac, monster mouth, copied Zerg building, excessive gore, unreadable fleshy blob, humanoid anatomy, background.
```

## Useful First-Frame Notes

```text
This is the most important first asset.
It should be ugly but readable.
Create the normal controlled version before the feral version.
```

---

# 11. Entity Prompt: Feral Growth Chamber

## Internal ID

```text
ichor-feral-growth-chamber
```

## Intended Footprint

```text
3x3
```

## First Frame Prompt

```text
Create the first idle frame for ichor-feral-growth-chamber, a hostile corrupted version of the Growth Chamber I for a Factorio-compatible isometric factory sprite.

It should clearly look like the same basic building as ichor-growth-chamber-1, but broken out of control. Preserve the central chamber, bone frame, feeder tendrils, and 3x3 footprint, but corrupt them with asymmetry, jagged bone spikes, black ichor leaks, bruised purple tissue, torn membranes, sickly yellow-green glow, and aggressive twitching shapes.

The asset must read as “formerly yours, now feral.” It should not become an entirely new monster. It should look like production infrastructure that has mutated into hostile infrastructure.

Style: Factorio-compatible isometric industrial sprite, orthographic three-quarter top-down view, transparent background, strong silhouette, upper-left lighting, soft contact shadow, black ichor, dark red tissue, bruised purple, jagged bone, sickly glow.

Avoid: unrelated alien monster, copied Zerg building, creature with face, full horror scene, gore pile, unreadable blob, background.
```

## Useful First-Frame Notes

```text
Frame 1 should be the corrupted resting pose.
Later frames can twitch irregularly.
Keep enough matching shape language that players understand it used to be a Growth Chamber.
```

---

# 12. Entity Prompt: Nutrient Vat I

## Internal ID

```text
ichor-nutrient-vat-1
```

## Intended Footprint

```text
2x2 or 3x3
```

## First Frame Prompt

```text
Create the first idle frame for ichor-nutrient-vat-1, a biological fluid-processing vat for a Factorio-compatible isometric factory sprite.

It should look like a translucent slurry sac held inside a crude bone-and-chitin industrial frame, with organic pipe sockets, bubbling nutrient fluid, membrane folds, and feeder veins entering the base. The vat should read as a fluid machine, similar in role to a chemical plant or tank, but grown from living tissue.

The silhouette should show a clear container shape with visible fluid inside. Use pale yellow-brown nutrient slurry, red membrane, bone supports, and dark organic ducts. The first frame should show the vat at rest with a few visible bubbles suspended inside.

Style: Factorio-compatible isometric industrial sprite, orthographic three-quarter top-down view, transparent background, strong silhouette, upper-left lighting, soft contact shadow, translucent membrane, wet organic surfaces, industrial readability.

Avoid: ordinary metal tank, glass laboratory beaker, potion bottle, monster egg, unreadable blob, background.
```

---

# 13. Entity Prompt: Digestive Smelter I

## Internal ID

```text
ichor-digestive-smelter-1
```

## Intended Footprint

```text
3x3
```

## First Frame Prompt

```text
Create the first idle/working frame for ichor-digestive-smelter-1, a stomach-like biological furnace for a Factorio-compatible isometric factory sprite.

It should look like an organic smelter that digests ore and reshapes metal: a heavy stomach chamber inside a bone furnace frame, with acid sacs, heat glow, chitin heat shields, exhaust vents, and organic input/output sockets. The building should clearly read as a furnace/smelter, not a creature.

The silhouette should be dense and industrial, with a hot central digestion chamber, orange-red internal glow, acid bubbles visible through membrane windows, and dark exhaust staining. First frame should show stable churning heat, not an explosion.

Style: Factorio-compatible isometric industrial sprite, orthographic three-quarter top-down view, transparent background, strong silhouette, upper-left lighting, soft contact shadow, red flesh, bone frame, acid yellow-green highlights, furnace heat glow.

Avoid: normal steel furnace clone, dragon mouth, monster stomach with face, copied alien building, background.
```

---

# 14. Entity Prompt: Basic Tendril

## Internal ID

```text
ichor-basic-tendril
```

## Intended Footprint

```text
1x1
```

## First Frame Prompt

```text
Create the first idle frame for ichor-basic-tendril, a biological inserter-equivalent for a Factorio-compatible isometric factory sprite.

It should look like a small articulated organic arm rooted into the ground: tendon fibers, bone knuckle joints, a small gripping claw or cilia pad at the tip, and a fleshy base socket embedded in Living Substrate. It must read as a factory manipulation arm, not a monster tentacle.

The silhouette should clearly show base, arm, joint, and gripper. The first frame should be in a neutral retracted pose, ready to extend and grab.

Style: Factorio-compatible isometric industrial sprite, orthographic three-quarter top-down view, transparent background, strong silhouette, upper-left lighting, soft contact shadow, tendon beige, red muscle, small chitin claw.

Avoid: octopus tentacle, monster limb, humanoid hand, copied inserter, weapon claw, background.
```

---

# 15. Entity Prompt: Tendon Track

## Internal ID

```text
ichor-tendon-track
```

## Intended Role

```text
biological belt / early logistics
```

## First Frame Prompt

```text
Create the first frame for ichor-tendon-track, a biological conveyor-belt-equivalent for a Factorio-compatible isometric factory sprite.

It should look like a short section of moving tendon strip set into Living Substrate: layered muscle bands, sinew rails, small bone rollers, and wet dark-red surface grooves that imply directional transport. It must remain clearly readable as a belt/logistics tile, with an obvious direction of movement.

The first frame should be a clean straight belt segment, not an animated smear. Use one directional strip with strong edge contrast, subtle organic texture, and mechanical regularity.

Style: Factorio-compatible isometric logistics sprite, transparent background, high readability, top-down/isometric-compatible, dark red tendon, bone rail edges, wet highlights.

Avoid: random floor texture, intestine tunnel, ordinary metal belt clone, unreadable organic stripe, background.
```

---

# 16. Entity Prompt: Crude Vein

## Internal ID

```text
ichor-crude-vein
```

## Intended Role

```text
biological pipe / early fluid line
```

## First Frame Prompt

```text
Create the first frame for ichor-crude-vein, a biological pipe-equivalent for a Factorio-compatible isometric factory sprite.

It should look like a short pipe segment made from thick vein tissue and chitin clamps, carrying dark red ichor or nutrient fluid. The form should be mechanically readable as a fluid conduit with clear openings/connectors at both ends.

Use a strong tubular silhouette, wet highlights, slight swelling at joints, bone/chitin reinforcement rings, and subtle fluid glow. The first frame should be stable and unruptured.

Style: Factorio-compatible isometric logistics sprite, transparent background, readable at gameplay zoom, dark red vein, chitin rings, wet fluid highlights.

Avoid: loose worm, snake, random root, ordinary metal pipe clone, face, background.
```

---

# 17. Entity Prompt: Spike Spitter

## Internal ID

```text
ichor-spike-spitter
```

## Intended Role

```text
early biological turret
```

## First Frame Prompt

```text
Create the first idle frame for ichor-spike-spitter, a biological defensive turret for a Factorio-compatible isometric factory sprite.

It should look like a rooted defensive organ grown from chitin, bone, and muscle: a squat base embedded in Living Substrate, a rotating or aimable upper gland, several bone spikes or quills, and a muscular pressure sac. It should read as a turret, not an enemy creature.

The silhouette should show a clear base and firing head. First frame should be neutral, aimed slightly forward/up-left, with spikes loaded but not firing. Use controlled biology colors with subtle neural glow to show ownership.

Style: Factorio-compatible isometric combat sprite, transparent background, strong silhouette, upper-left lighting, soft contact shadow, bone spikes, chitin armor, red muscle, dark ichor.

Avoid: Hydralisk-like body, creature face, copied worm turret, humanoid gun, background.
```

---

# 18. Entity Prompt: Chitin Wall

## Internal ID

```text
ichor-chitin-wall
```

## Intended Role

```text
biological wall
```

## First Frame Prompt

```text
Create the first frame for ichor-chitin-wall, a biological wall segment for a Factorio-compatible isometric factory sprite.

It should look like a defensive wall made of layered chitin plates, bone ridges, and hardened organic resin. The segment must be modular and tileable with other wall pieces, readable as a barrier, and visually distinct from normal stone or concrete walls.

The silhouette should be compact and block-like, with jagged but controlled plate edges. Use chitin bronze, bone beige, dark red seams, and small organic anchor points.

Style: Factorio-compatible isometric wall sprite, transparent background, readable at gameplay zoom, strong silhouette, upper-left lighting, soft contact shadow.

Avoid: random teeth pile, monster jaw, copied biter nest, ordinary stone wall clone, background.
```

---

# 19. Tile Prompt: Living Substrate

## Internal ID

```text
ichor-living-substrate
```

## First Frame / Static Tile Prompt

```text
Create a seamless square tile texture for ichor-living-substrate, controlled biological ground for a Factorio-compatible factory game.

It should look like a thin living film over terrain: dark red and maroon tissue, subtle wet highlights, fine vein lines, small bone flecks, and faint blue-white neural filaments. The tile must be readable as controlled buildable ground, not enemy corruption. It should support machines visually without overpowering them.

Make it seamless, repeatable, top-down/isometric-compatible, no hard border, no large unique features, no text, transparent or tile-ready square texture.

Style: Factorio-compatible ground tile, organic industrial texture, readable at gameplay zoom, controlled stable biology.

Avoid: StarCraft creep look, giant veins that break tiling, faces, eyes, random gore, high-frequency noise, background scene.
```

## Variant Notes

Create four variants later:

```text
thin film
veined film
slightly denser membrane
subtle neural filament variant
```

---

# 20. Tile Prompt: Feral Substrate

## Internal ID

```text
ichor-feral-substrate
```

## First Frame / Static Tile Prompt

```text
Create a seamless square tile texture for ichor-feral-substrate, hostile uncontrolled biological ground for a Factorio-compatible factory game.

It should look like Living Substrate that has ruptured and turned feral: black ichor cracks, jagged dark red tissue, bruised purple membranes, sickly yellow-green lesions, small bone splinters, and aggressive broken vein patterns. It must still tile cleanly and remain readable as ground.

Make it seamless, repeatable, top-down/isometric-compatible, no hard border, no large unique features, no text.

Style: Factorio-compatible ground tile, hostile organic industrial texture, dark and readable, feral but not visually noisy.

Avoid: copied creep texture, giant monster faces, piles of gore, non-tileable cracks, high-frequency noise, background scene.
```

---

# 21. Icon Prompt: Raw Biomass

## Internal ID

```text
ichor-raw-biomass
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-raw-biomass.

Show a compact lump of fresh biological matter: dark red tissue, small tendon strands, wet highlights, and a few bone flecks. It should read as raw organic resource material, not a creature or food item.

Style: Factorio-compatible inventory icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: heart organ, steak, gore pile, face, monster egg, background.
```

---

# 22. Icon Prompt: Bio-Forged Iron Plate

## Internal ID

```text
ichor-bio-forged-iron-plate
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-bio-forged-iron-plate.

Show an iron plate reshaped by biological processing: a dark metal slab with organic red seams, acid-etched edges, small bone-like reinforcement ridges, and subtle wet ichor stains. It should still read clearly as a metal plate.

Style: Factorio-compatible inventory icon, transparent background, high contrast, readable at 32px and 64px, industrial-organic hybrid.

Avoid: ordinary iron plate clone, shield icon, random scrap pile, unreadable dark square, background.
```

---

# 23. Icon Prompt: Biomass Science Sample

## Internal ID

```text
ichor-science-biomass
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-science-biomass.

Show a preserved biomass research sample: a small sealed biological sample pod or cartridge containing red tissue and nutrient fluid, with bone or ceramic clamps and a faint neural glow. It should read as a science pack equivalent, not a potion bottle.

Style: Factorio-compatible science icon, transparent background, high contrast, readable at 32px and 64px, biological research material.

Avoid: vanilla science pack clone, glass potion, medical syringe, text, background.
```

---

# 24. Icon Prompt: Nutrient Slurry

## Internal ID

```text
ichor-nutrient-slurry
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-nutrient-slurry.

Show a rounded fluid droplet or small membrane sac filled with thick yellow-brown nutrient slurry, with red organic film and a few bubbles. It should clearly read as a biological fluid resource.

Style: Factorio-compatible fluid icon, transparent background, high contrast, readable at 32px and 64px.

Avoid: potion bottle, soup bowl, glass jar, text, background.
```

---

# 25. Icon Prompt: Crude Ichor

## Internal ID

```text
ichor-crude-ichor
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-crude-ichor.

Show a dark red-black glossy fluid droplet with subtle inner glow and vein-like highlights. It should feel alive and unstable, but remain a clean fluid icon.

Style: Factorio-compatible fluid icon, transparent background, high contrast, readable at 32px and 64px.

Avoid: blood splatter, horror gore, oil barrel, potion bottle, text, background.
```

---

# 26. Icon Prompt: Hive Core

## Internal ID

```text
ichor-hive-core
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-hive-core.

Show a simplified ribbed biological heart-core inside a bone frame, with dark red membrane and faint blue-white neural glow. It should read as the central hub structure.

Style: Factorio-compatible entity icon, transparent background, high contrast, readable at 32px and 64px.

Avoid: literal human heart, monster face, eye, copied Overmind-like form, text, background.
```

---

# 27. Icon Prompt: Substrate Node

## Internal ID

```text
ichor-substrate-node
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-substrate-node.

Show a small root-node mound with red tissue, bone nodules, and thin spreading tendrils around the base. It should read as a biological spreading structure.

Style: Factorio-compatible entity icon, transparent background, high contrast, readable at 32px and 64px.

Avoid: creep tumor copy, flower bulb, egg, face, text, background.
```

---

# 28. Icon Prompt: Neural Pylon I

## Internal ID

```text
ichor-neural-pylon-1
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-neural-pylon-1.

Show a vertical bone-and-nerve spine with a small blue-white glowing neural crown. It should read as a signal/control tower.

Style: Factorio-compatible entity icon, transparent background, high contrast, readable at 32px and 64px.

Avoid: radio tower clone, magic crystal, lightning bolt only, text, background.
```

---

# 29. Icon Prompt: Growth Chamber I

## Internal ID

```text
ichor-growth-chamber-1
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-growth-chamber-1.

Show a simplified womb-like growth chamber with a red membrane sac inside a bone frame, with small feeder tendrils. It should read as a biological assembler.

Style: Factorio-compatible entity icon, transparent background, high contrast, readable at 32px and 64px.

Avoid: generic egg, monster mouth, copied alien building, text, background.
```

---

# 30. Icon Prompt: Feral Growth Chamber

## Internal ID

```text
ichor-feral-growth-chamber
```

## Icon Prompt

```text
Create a centered 64x64 game icon concept for ichor-feral-growth-chamber.

Show the Growth Chamber icon corrupted: torn membrane, jagged bone spikes, black ichor leaks, bruised purple tissue, and sickly yellow-green glow. It should still be recognizable as the Growth Chamber, but hostile.

Style: Factorio-compatible entity icon, transparent background, high contrast, readable at 32px and 64px.

Avoid: unrelated monster, face, gore pile, copied alien building, text, background.
```

---

# 31. Alert Icon Prompt: Cargo Locked

## Internal Name

```text
cargo locked
```

## Icon Prompt

```text
Create a centered 64x64 alert icon for cargo locked on Ichor.

Show a small cargo pod or landing crate blocked by an organic red-black barrier or crossed neural-vein lock symbol. It should clearly communicate “outside cargo unavailable.”

Style: Factorio-compatible alert icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: padlock text, UI panel, huge scene, background.
```

---

# 32. Alert Icon Prompt: Cargo Pod Blocked

## Internal Name

```text
cargo pod blocked
```

## Icon Prompt

```text
Create a centered 64x64 alert icon for cargo pod blocked.

Show a small descending cargo pod burning or being dissolved by red atmospheric ichor tendrils, with a warning silhouette. It should communicate that incoming delivery was destroyed before landing.

Style: Factorio-compatible alert icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: full explosion scene, text, realistic rocket, background.
```

---

# 33. Alert Icon Prompt: No Substrate

## Internal Name

```text
no substrate
```

## Icon Prompt

```text
Create a centered 64x64 alert icon for no Living Substrate.

Show a biological machine footprint over bare cracked ground, with a missing red substrate patch or broken root symbol. It should clearly communicate “required ground missing.”

Style: Factorio-compatible alert icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: generic X only, text, full scene, background.
```

---

# 34. Alert Icon Prompt: No Neural Signal

## Internal Name

```text
no neural signal
```

## Icon Prompt

```text
Create a centered 64x64 alert icon for no Neural Signal.

Show a small neural pylon signal line broken into fragments, with dim blue-white glow fading out. It should clearly communicate disconnected control signal.

Style: Factorio-compatible alert icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: Wi-Fi icon clone, text, lightning storm, background.
```

---

# 35. Alert Icon Prompt: Low Loyalty

## Internal Name

```text
low loyalty
```

## Icon Prompt

```text
Create a centered 64x64 alert icon for low loyalty.

Show a biological structure silhouette with one dark vein splitting away from a blue neural control line. It should communicate that the structure is drifting out of control.

Style: Factorio-compatible alert icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: heart symbol, smile/frown face, text, background.
```

---

# 36. Alert Icon Prompt: Mutation Warning

## Internal Name

```text
mutation warning
```

## Icon Prompt

```text
Create a centered 64x64 alert icon for mutation warning.

Show a controlled red tissue sample sprouting one jagged black spike and a sickly yellow-green glow. It should communicate mutation pressure before full feralization.

Style: Factorio-compatible alert icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: biohazard symbol only, monster face, gore pile, text, background.
```

---

# 37. Alert Icon Prompt: Feralized

## Internal Name

```text
feralized
```

## Icon Prompt

```text
Create a centered 64x64 alert icon for feralized structure.

Show a small corrupted biological machine silhouette with black ichor, jagged bone spikes, and broken blue control glow. It should clearly communicate that a former player structure is now hostile.

Style: Factorio-compatible alert icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: unrelated monster head, skull icon only, copied alien creature, text, background.
```

---

# 38. Alert Icon Prompt: Hunger High

## Internal Name

```text
hunger high
```

## Icon Prompt

```text
Create a centered 64x64 alert icon for Hive Hunger high.

Show a small Hive Core organ silhouette with a hollow dark center, tightening red membranes, and a faint warning glow. It should communicate urgent hunger and biological stress.

Style: Factorio-compatible alert icon, transparent background, high contrast, readable at 32px and 64px, no text.

Avoid: stomach icon, fork/knife, human heart, face, text, background.
```

---

# 39. Optional State Variant Prompt: Starved Growth Chamber

## Internal Variant

```text
ichor-growth-chamber-1-starved
```

## First Frame Prompt

```text
Create the first idle frame for a starved variant of ichor-growth-chamber-1.

Use the same shape and footprint as the normal Growth Chamber I, but make it pale, sagging, dry, and weak. The membrane should hang slightly collapsed, the inner glow should be dim, feeder tendrils limp, and the bone frame more exposed. It must still be readable as the same player-owned building.

Style: Factorio-compatible isometric industrial sprite, transparent background, controlled but weakened biology.

Avoid: dead corpse pile, fully feral spikes, unrelated new design, background.
```

---

# 40. Optional State Variant Prompt: Mutating Growth Chamber

## Internal Variant

```text
ichor-growth-chamber-1-mutating
```

## First Frame Prompt

```text
Create the first idle frame for a mutating variant of ichor-growth-chamber-1.

Use the same shape and footprint as the normal Growth Chamber I, but add early instability: asymmetrical membrane bulges, twitching tendon shapes, flickering neural glow, dark veins creeping across the bone frame, and one or two small jagged growths. It should look recoverable but dangerous.

Style: Factorio-compatible isometric industrial sprite, transparent background, formerly controlled biology showing visible instability.

Avoid: fully feral transformation, unrelated monster, excessive gore, background.
```

---

# 41. Optional State Variant Prompt: Sterilized Growth Chamber Remnant

## Internal Variant

```text
ichor-growth-chamber-1-sterilized
```

## First Frame Prompt

```text
Create the first static frame for a sterilized remnant of ichor-growth-chamber-1.

Use the same rough footprint as the Growth Chamber I, but show pale ash tissue, chemical residue, burned-back membrane, exposed bone frame, and sterile off-white suppression stains. It should look neutralized and inert, not hostile.

Style: Factorio-compatible isometric industrial sprite, transparent background, readable destroyed/neutralized state.

Avoid: active glowing life, fresh gore, unrelated rubble, background.
```

---

# 42. Recommended Generation Settings

Use whichever options your image model supports.

```text
aspect ratio:
  square for entities/icons/tiles

background:
  transparent if supported
  otherwise plain neutral background for later removal

lighting:
  upper-left key light
  soft contact shadow

camera:
  orthographic
  three-quarter top-down isometric

detail:
  medium-high for entities
  simplified for icons
  seamless texture detail for tiles

style strength:
  game sprite concept
  hand-painted rendered industrial asset
  readable at small size
```

---

# 43. Batch Generation Strategy

Recommended generation order:

```text
1. Growth Chamber I
2. Feral Growth Chamber
3. Neural Pylon I
4. Living Substrate
5. Substrate Node
6. Basic Tendril
7. Crude Vein
8. Nutrient Vat I
9. Digestive Smelter I
10. Hive Core
11. Icons
12. Alert Icons
13. State variants
```

Reason:

```text
Growth Chamber defines the core visual language.
Feral Growth Chamber proves “formerly yours.”
Neural Pylon proves control language.
Living Substrate proves ground readability.
Hive Core is important, but should not be first because it is too central and too easy to overdesign.
```

---

# 44. One-Line Prompt Template

For quick batches:

```text
Create the first idle frame for [ASSET_ID], [SHORT FUNCTION], in a Factorio-compatible isometric industrial sprite style, transparent background, orthographic three-quarter top-down view, strong readable silhouette, upper-left lighting, soft contact shadow, biological-industrial materials: wet red flesh, bone frame, chitin, tendon cables, membrane sacs, dark ichor, subtle neural-blue glow; make it mechanically readable as [ENTITY ROLE], not a monster; no text, no UI, no background, no copied Factorio or StarCraft/Zerg assets.
```

---

# 45. Final Prompting Mantra

The first frame should answer three questions:

```text
What is it?
What does it do?
Is it controlled, unstable, feral, sterile, or dead?
```

If the image looks amazing but the player cannot identify the asset at gameplay zoom, it failed.

If the image is disgusting but readable, it is on the right path.

The final art-generation mantra is:

> Generate for silhouette.  
> Paint for readability.  
> Animate for life.  
> Test in Factorio.  
> Pretty is optional. Clear is mandatory.