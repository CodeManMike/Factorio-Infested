# The Ichor Engine
## Sound Design Bible — Version 0.1

## 1. Purpose

This document defines the sound direction for The Ichor Engine.

The sound should make Ichor feel like:

```text
an industrial system made from organs, nerves, pressure, wet membranes, bone, heat, signal, hunger, and failing control
```

The horror should be useful. The player should hear when something is working, hungry, unstable, mutating, feral, sterile, or forbidden.

## 2. Recommended Audio Software

| Purpose | Tool | Notes |
|---|---|---|
| DAW / sound design | REAPER | best long-term workflow |
| quick editing | Audacity | trimming, fades, simple exports |
| synthesis | Vital or Surge XT | drones, pulses, nerves |
| batch conversion | FFmpeg | WAV → OGG |
| cleanup | iZotope RX optional | later, not required |

Start with:

```text
REAPER
Audacity
FFmpeg
Vital or Surge XT
```

## 3. Folder Structure

Source audio outside mod:

```text
E:\The Ichor Engine\audio-source\
  raw-recordings\
  reaper-projects\
  rendered-wav\
  exported-ogg\
  reference\
  notes\
```

Game-ready sounds inside mod:

```text
E:\The Ichor Engine\mod\the-ichor-engine\sound\
  machine\
  alert\
  event\
  ui\
  ambient\
  story\
  weapon\
  enemy\
  planet\
```

## 4. File Format Standards

Source format:

```text
WAV
48 kHz
24-bit or 32-bit float
```

Game export:

```text
OGG Vorbis
44.1 kHz or 48 kHz
mono for positional machine sounds
stereo for ambience/UI/story
```

Use WAV during design. Export OGG for release.

## 5. Core Sound Palette

| Material | Sound Sources |
|---|---|
| Flesh | wet leather, damp cloth, rubber stretch |
| Ichor | thick liquid, syrup, mud, suction |
| Bone | ceramic taps, dry wood knocks, shell impacts |
| Chitin | hard plastic ticks, seed pods, shell clicks |
| Tendon | rope tension, rubber bands, bowstring creaks |
| Nerve | electrical buzz, hum, crackle |
| Heat | furnace rumble, steam, pressure hiss |
| Hunger | stomach groan, breath, sub pulse |
| Mutation | swelling, tearing cloth, pitch-bent creaks |
| Feral | distortion, irregular clicks, predatory breath |
| Sterile | clean fans, filtered air, medical beeps |
| Alpha | drones, territory calls, psychic pressure |

## 6. Tonal Palette

Controlled biology:

```text
warm
wet
rhythmic
breathing
low-frequency pulse
```

Feral biology:

```text
irregular
distorted
predatory
asymmetric rhythm
sudden clicks
```

Sterile industry:

```text
clean
thin
filtered
mechanical
emotionally cold
```

Rootmind:

```text
sub-bass pressure
breath
distant organic resonance
almost voice-like, not speech at first
```

## 7. MVP Sound List

Required:

```text
ichor-machine-growth-chamber-1-working.ogg
ichor-machine-hive-core-idle.ogg
ichor-machine-neural-pylon-1-working.ogg
ichor-substrate-spread.ogg
ichor-alert-cargo-locked.ogg
ichor-alert-cargo-pod-blocked.ogg
ichor-alert-low-loyalty.ogg
ichor-alert-mutation-warning.ogg
ichor-event-feralization.ogg
```

Optional MVP:

```text
ichor-machine-growth-chamber-1-idle.ogg
ichor-feral-growth-chamber-idle.ogg
ichor-hive-fed.ogg
ichor-ui-panel-open.ogg
ichor-ui-panel-close.ogg
```

## 8. Sound Naming

Pattern:

```text
ichor-<family>-<object>-<state-or-action>
```

Examples:

```text
ichor-machine-growth-chamber-1-working
ichor-machine-hive-core-idle
ichor-alert-low-loyalty
ichor-alert-mutation-warning
ichor-event-feralization
ichor-ui-panel-open
ichor-ambient-ichor-wind-loop
```

## 9. Machine Sound Direction

### Growth Chamber I

```text
slow wet membrane breathing
soft internal pulse
subtle fluid movement
occasional tendon creak
```

Loop: 4–8 seconds. It should feel alive, not disgusting every second.

### Hive Core

```text
large distant organism
heart-like pressure
low breath
deep internal movement
```

States: dormant, fed, hungry, critical, hostile.

### Neural Pylon I

```text
nerve signal
electric whisper
organic pulse
subtle blue-white tone
```

Keep subtle. A base may have many pylons.

### Feral Growth Chamber

```text
same DNA as Growth Chamber, but broken
irregular twitching
dry bone clicks
wet tearing
blackened distortion
```

The player should hear: “That used to be mine.”

## 10. Alerts

| Alert | Design |
|---|---|
| Cargo Locked | muted thud, sterile denial beep, low Rootmind pulse |
| Cargo Pod Blocked | entry burn, pressure distortion, atmospheric collapse |
| No Neural Signal | broken nerve pulse, electrical collapse |
| Low Loyalty | uneasy ganglion pulse, cracked organic click |
| Mutation Warning | swelling rise, wet tissue strain, bent tone |
| Feralization | membrane tear, deep thud, black ichor swell, hostile clicks |

## 11. Hive / Rootmind Voice

Early Rootmind should not speak clearly. Use pulse, pressure, hunger, resonance. Later eras can become more voice-like.

Voice processing chain:

```text
low human whisper or synthetic vocal
pitch down
layer with breath
layer with sub pulse
convolution/reverb
formant shift
subtle distortion
low-pass or band-pass
sidechain to heartbeat pulse
```

## 12. Sterile Industry Audio

Sterile systems should feel like relief at first:

```text
clean fan
sealed door
filtered air
precise mechanical motion
soft medical beep
```

When contamination rises:

```text
clean hum becomes unstable
filter clogs
warning beep detunes
wet intrusion layer appears
```

## 13. Alpha Territory Audio

Each Alpha should change the soundscape.

Examples:

```text
Shellmother: deep shell resonance, stone/bone pressure
Acid Matriarch: acid hiss, bubbling, corrosive steam
Storm Leviathan: electrical crackle, thunder, charged air
Frost Warden: ice creaks, frozen wind, cracking membranes
Glowback Sovereign: Geiger ticks, radioactive shimmer, sick drone
```

## 14. Severance Audio

Severance should use silence as a weapon.

Activation layers:

```text
hard neural cut
deep organism scream/pressure
sterile electrical surge
sub-bass silence drop
distant machines changing allegiance
```

The strongest moment may be a loud cut into sudden silence, then hostile systems waking up.

## 15. Cargo-Lock Audio

### Cargo Landing Pad Blocked

```text
short denial tone
atmospheric pressure thump
low Rootmind pulse
```

Meaning: “Not yet. You are trapped.”

### Cargo Pod Blocked

```text
distant pod entry burn
pressure distortion
wet atmospheric collapse
cargo impact denied
```

Meaning: “The planet ate the attempt.”

### Cargo Unlocked

```text
sterile signal clears
orbital ping
quiet relief chord
```

Meaning: “The sky is open again.”

## 16. First Sound Exercise

Make a 6-second Growth Chamber loop.

Source material:

```text
your breath
wet cloth squeeze
rubber band stretch
low synth sine/sub pulse
small ceramic/bone-like tap
```

Processing:

```text
pitch breath down 6–12 semitones
low-pass wet cloth
keep rubber stretch quiet
add very quiet sub pulse
add rare soft bone tap
EQ harsh highs out
compress lightly
crossfade loop
```

Export:

```text
Source WAV:
E:\The Ichor Engine\audio-source\rendered-wav\machine\growth-chamber-1\ichor-machine-growth-chamber-1-working.wav

Game OGG:
E:\The Ichor Engine\mod\the-ichor-engine\sound\machine\growth-chamber-1\ichor-machine-growth-chamber-1-working.ogg
```

## 17. Testing Checklist

```text
[ ] file loads in Factorio
[ ] path correct
[ ] format correct
[ ] volume not too loud
[ ] no harsh repeat
[ ] no start/end clicks
[ ] loop works
[ ] useful at gameplay zoom
[ ] does not mask alerts
[ ] fits Ichor palette
[ ] source file saved
[ ] exported file named correctly
```

## 18. Final Sound Mantra

> Quiet machines. Clear warnings. Useful horror. Organic rhythm. Feral irregularity. Sterile silence. One breathing machine first.
