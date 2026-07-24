# The Ichor Engine

![The Ichor Engine](thumbnail.png)

**The Ichor Engine** is a Factorio total conversion where a crash-landed engineer survives by turning an alien infection into a living factory, then secretly rebuilds sterile industry, severs the hive bond, survives the resulting civil war, and launches an escape vessel.

> This repository is named **Factorio Infested** for historical reasons. The mod itself is **The Ichor Engine** (`the-ichor-engine`).

## What We Are Building

- A **Factorio 2.x + Space Age** mod that adds **Ichor** as its own story planet
- A living biological factory loop: substrate spread, hive hunger, neural control, loyalty, mutation, and feralization
- **Orbital quarantine** on Ichor until the player completes the escape arc — no rescue cargo mall imports
- A long-form campaign arc toward sterile betrayal, Severance, and escape

## Current Status

Early scaffold / MVP in progress (`0.0.1`):

- Mod loads with bootstrap runtime and `storage.ichor`
- Ichor planet shell on the Space Age starmap
- Pre-escape cargo landing pad and cargo pod lock on Ichor
- Debug commands: `/ichor-status`, `/ichor-complete-escape`, `/ichor-reset-escape`

Gameplay systems (substrate spread, growth chambers, neural pylons, feral conversion, UI) are next.

## Requirements

- Factorio **2.0**
- **Space Age** expansion

## Design Documentation

Full design bible and implementation specs live in [`instructions/`](instructions/). Start with [`instructions/00_README_INDEX.md`](instructions/00_README_INDEX.md).

## Development

Mod source: [`mod/the-ichor-engine/`](mod/the-ichor-engine/)

```powershell
# Link mod into Factorio mods folder
.\tools\link-mod.ps1

# Package release zip
.\tools\package-mod.ps1
```
