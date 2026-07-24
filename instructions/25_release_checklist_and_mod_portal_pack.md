# The Ichor Engine
## Release Checklist and Mod Portal Pack — Version 0.1

## 1. Purpose

This document defines the release process for The Ichor Engine: packaging, metadata, changelog, thumbnail, README, screenshots, license, QA, private builds, public alpha, beta, 1.0, and hotfixes.

Release mantra:

> Package what Factorio expects. Tell players what the mod is. Tell them what it is not yet. Test the zip, not the source folder. Never ship source junk by accident.

## 2. Current Project Paths

```text
Repo root:      E:\The Ichor Engine
Docs folder:    E:\The Ichor Engine\ichor_engine_core_docs_markdown
Mod source:     E:\The Ichor Engine\mod\the-ichor-engine
Dist folder:    E:\The Ichor Engine\dist
Tools folder:   E:\The Ichor Engine\tools
Test saves:     E:\The Ichor Engine\saves\test
```

## 3. Release Zip Structure

Expected zip:

```text
the-ichor-engine_0.0.1.zip
  the-ichor-engine/
    info.json
    changelog.txt
    thumbnail.png
    settings.lua
    data.lua
    control.lua
    locale/
    graphics/
    sound/
    prototypes/
    scripts/
    migrations/
```

The zip must contain the mod folder. It must not contain loose mod files at the zip root.

## 4. Release Stages

### Developer Build

Audience: you only. Can include debug commands, placeholder art, fast balance, ugly UI. Do not upload.

### Private Test Build

Audience: trusted testers. Needs packaged zip, basic README, known issues, save/load pass.

### Public Alpha

Audience: curious Factorio players. Needs stable install, honest scope, known limitations, first 1–3 hours playable, core loop functional.

### Public Beta

Needs migration discipline, compatibility notes, screenshots, custom art, stable save/load, broader testing.

### Version 1.0

Needs complete campaign arc through escape and post-escape cargo unlock.

## 5. Versioning

Use:

```text
MAJOR.MINOR.PATCH
```

Meaning:

| Version | Meaning |
|---|---|
| 0.0.x | scaffolding/internal prototypes |
| 0.1.x | MVP core loop |
| 0.2.x | early production/science |
| 0.3.x | capture/genome |
| 0.4.x | trains/outposts |
| 0.5.x | Alpha territory |
| 0.6.x | colony ruins |
| 0.7.x | sterile industry |
| 0.8.x | Severance prototype |
| 0.9.x | beta/vertical slice |
| 1.0.0 | complete campaign |

## 6. Required Root Files

### `info.json`

```json
{
  "name": "the-ichor-engine",
  "version": "0.0.1",
  "title": "The Ichor Engine",
  "author": "CodeManMike",
  "factorio_version": "2.0",
  "dependencies": [
    "base >= 2.0.0",
    "space-age >= 2.0.0"
  ],
  "description": "A Space Age planet overhaul about biological industry, neural control, mutation, sterile betrayal, and escape from a living factory."
}
```

### `changelog.txt`

Initial template:

```text
---------------------------------------------------------------------------------------------------
Version: 0.0.1
Date: 2026-07-24
  Features:
    - Added initial mod scaffold.
    - Added Space Age dependency.
    - Added Ichor campaign assumptions.
    - Added pre-escape cargo delivery lock design.
    - Added MVP runtime storage structure.
  Internal:
    - Added initial modular file layout.
    - Added debug command planning.
---------------------------------------------------------------------------------------------------
```

### `thumbnail.png`

Square PNG, readable at small size, no tiny text.

Good concepts:

```text
Neural Pylon rising from red Living Substrate
Growth Chamber half-controlled / half-feral
Ichor planet silhouette with red neural veins
Hive Core eye/organ framed by pipes and belts
```

### `README.md`

Root README should include:

```text
status
core idea
requirements
current features
planned features
compatibility
known issues
credits/license
```

### `LICENSE` and `CREDITS.md`

Do not public-release without a license decision and credits file.

## 7. Files That Must Not Ship

```text
art-source/
audio-source/
test saves
raw recordings
Blender files unless intentionally included
Aseprite source files
Krita source files
REAPER projects
debug logs
backup folders
.git
node_modules
large unused assets
```

## 8. Packaging Script

Create:

```text
E:\The Ichor Engine\tools\package-mod.ps1
```

```powershell
$Repo = "E:\The Ichor Engine"
$Name = "the-ichor-engine"
$Version = "0.0.1"

$ModRoot = "$Repo\mod\$Name"
$Dist = "$Repo\dist"
$Staging = "$Repo\.release-staging"
$StagingMod = "$Staging\$Name"
$Zip = "$Dist\$Name`_$Version.zip"

New-Item -ItemType Directory -Force -Path $Dist | Out-Null

if (Test-Path $Staging) {
    Remove-Item $Staging -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $Staging | Out-Null
Copy-Item -Path $ModRoot -Destination $StagingMod -Recurse -Force

$JunkPatterns = @("*.blend1", "*.blend2", "*.kra~", "*.bak", "*.tmp", "*.log", "Thumbs.db", ".DS_Store")
foreach ($Pattern in $JunkPatterns) {
    Get-ChildItem -Path $StagingMod -Recurse -Force -Filter $Pattern -ErrorAction SilentlyContinue |
        Remove-Item -Force -ErrorAction SilentlyContinue
}

if (Test-Path $Zip) {
    Remove-Item $Zip -Force
}

Compress-Archive -Path $StagingMod -DestinationPath $Zip -Force
Remove-Item $Staging -Recurse -Force

Write-Host "Created release zip:"
Write-Host $Zip
```

## 9. Install Test From Zip

1. Close Factorio.
2. Remove dev junction if present.
3. Copy release zip to `%APPDATA%\Factorio\mods`.
4. Start Factorio.
5. Enable mod.
6. Start new game.
7. Run MVP acceptance scenario.

## 10. Mod Portal Copy

### Short Summary

```text
A Space Age planet overhaul where you survive on Ichor by building a living factory that can hunger, mutate, obey, rebel, and eventually be severed from you.
```

### Long Description

```text
The Ichor Engine is a Factorio 2.x + Space Age planet overhaul about biological industry, neural control, mutation, and escape.

You arrive on Ichor cut off from normal orbital supply. Cargo deliveries are disabled until you complete the story arc. To survive, you grow Living Substrate, feed the Hive Core, build biological machines, maintain neural control, and prevent your own factory from mutating into feral hostile growth.

The long-term campaign arc moves from survival, symbiosis, and biological automation into capture, genome research, Alpha territories, ruined colony technology, sterile industry, Severance, and eventual escape.
```

### Feature Bullets

```text
- Adds Ichor as a Space Age-era story planet.
- Disables cargo delivery on Ichor until escape/post-campaign unlock.
- Introduces Living Substrate as biological infrastructure.
- Adds Hive Hunger and feeding pressure.
- Adds Neural Signal and biological control.
- Adds machine loyalty, mutation pressure, and feralization.
- Turns neglected biological machines into hostile former infrastructure.
- Plans a full campaign arc through sterile industry, Severance, and escape.
```

### Early Alpha Warning

```text
This mod is under active development. Systems, balance, art, recipes, and save compatibility may change before 1.0. Do not start a long-term megabase save unless the release notes say the version is migration-safe.
```

## 11. Screenshot Pack

Public alpha screenshots:

```text
1. Ichor planet / landing area
2. Living Substrate spreading
3. Growth Chamber on substrate
4. Neural Pylon coverage
5. Hive Core panel
6. Low loyalty / mutation warning
7. Feral Growth Chamber
8. Cargo lock warning
```

## 12. License Strategy

Recommended split:

```text
Code: MIT or GPL-3.0 depending preference
Assets: CC BY-NC 4.0 or All Rights Reserved until decided
Docs: CC BY-NC or All Rights Reserved
```

Track all sample/art/tool credits in `CREDITS.md`.

## 13. Pre-Release QA Checklist

```text
[ ] Factorio launches
[ ] mod appears in mod list
[ ] dependencies resolve
[ ] no startup/prototype errors
[ ] new game starts
[ ] no first-tick runtime error
[ ] /ichor-status works
[ ] storage initializes
[ ] save/load works
[ ] no global usage
[ ] on_load does not mutate storage
[ ] Ichor planet/surface available
[ ] cargo lock active pre-escape
[ ] Cargo Landing Pad blocked/refunded pre-escape
[ ] cargo pod delivery blocked pre-escape
[ ] cargo unlock works post-escape
[ ] Hive Core registers
[ ] Substrate Node registers
[ ] Living Substrate spreads
[ ] Growth Chamber validates substrate
[ ] Neural Pylon provides signal
[ ] Hunger rises
[ ] feeding lowers hunger
[ ] loyalty falls when unsupported
[ ] mutation pressure rises
[ ] feral conversion works
[ ] feral force is hostile
[ ] Ichor UI works
[ ] alerts work and are not spammy
[ ] zip name matches info.json version
[ ] zip contains mod folder
[ ] no source junk
[ ] README/changelog/known issues updated
```

## 14. First Public Alpha Minimum

Do not publish public alpha until:

```text
[ ] Ichor planet/surface exists
[ ] cargo lock works
[ ] Hive Core works
[ ] substrate spreads
[ ] Growth Chamber works
[ ] Neural Pylon works
[ ] hunger works
[ ] loyalty works
[ ] mutation warning works
[ ] feral conversion works
[ ] basic UI works
[ ] save/load works
[ ] README exists
[ ] changelog exists
[ ] thumbnail exists
[ ] zip install tested
```

## 15. Hotfix Process

Hotfix immediately for:

```text
mod fails to load
new game crash
save/load crash
cargo lock bypass
fatal runtime error
migration error
```

Versioning:

```text
0.1.0 public alpha
0.1.1 hotfix
0.1.2 hotfix
0.2.0 next feature release
```

## 16. Legal / Franchise Safety

Before public release:

```text
[ ] no Zerg/StarCraft names
[ ] no direct visual copies
[ ] no borrowed copyrighted icons
[ ] no unlicensed audio samples
[ ] no unlicensed fonts
[ ] no obvious third-party trademark resemblance
```

## 17. Final Release Mantra

> Version it. Package it. Test the zip. Explain the scope. Warn about instability. Credit everything. Upload only what works. Then listen to players.
