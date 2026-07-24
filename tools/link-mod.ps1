$ErrorActionPreference = "Stop"

$ModSource = Resolve-Path (Join-Path $PSScriptRoot "..\mod\the-ichor-engine")
$ModTarget = Join-Path $env:APPDATA "Factorio\mods\the-ichor-engine"

if (-not (Test-Path $ModSource)) {
  throw "Mod source not found: $ModSource"
}

$modsDir = Split-Path $ModTarget -Parent
if (-not (Test-Path $modsDir)) {
  New-Item -ItemType Directory -Path $modsDir -Force | Out-Null
}

if (Test-Path $ModTarget) {
  $item = Get-Item $ModTarget -Force
  if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
    Remove-Item $ModTarget -Force
  }
  else {
    throw "Target exists and is not a link: $ModTarget"
  }
}

New-Item -ItemType Junction -Path $ModTarget -Target $ModSource | Out-Null
Write-Host "Linked $ModTarget -> $ModSource"
