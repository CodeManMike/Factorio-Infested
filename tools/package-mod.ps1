$ErrorActionPreference = "Stop"

$Version = "0.2.0"
$ModName = "the-ichor-engine"
$ModSource = Resolve-Path (Join-Path $PSScriptRoot "..\mod\$ModName")
$OutZip = Join-Path (Resolve-Path (Join-Path $PSScriptRoot "..")) "$ModName`_$Version.zip"

if (-not (Test-Path $ModSource)) {
  throw "Mod source not found: $ModSource"
}

if (Test-Path $OutZip) {
  Remove-Item $OutZip -Force
}

Compress-Archive -Path $ModSource -DestinationPath $OutZip -Force
Write-Host "Packaged $OutZip"
