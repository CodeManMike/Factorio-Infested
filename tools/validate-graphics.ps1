$ErrorActionPreference = "Stop"

$GfxRoot = Resolve-Path (Join-Path $PSScriptRoot "..\mod\the-ichor-engine\graphics")

$expected = @(
    "tile\living-substrate\living-substrate.png",
    "tile\feral-substrate\feral-substrate.png",
    "entity\hive-core\hive-core.png",
    "entity\substrate-node\substrate-node.png",
    "entity\neural-pylon-1\neural-pylon-1.png",
    "entity\growth-chamber-1\growth-chamber-1.png",
    "entity\feral-growth-chamber\feral-growth-chamber.png",
    "entity\nutrient-vat-1\nutrient-vat-1.png",
    "entity\digestive-smelter-1\digestive-smelter-1.png",
    "icon\ichor-hive-core.png",
    "icon\ichor-raw-biomass.png",
    "icon\ichor-bio-forged-copper-plate.png",
    "gui\ichor-top-button.png",
    "technology\ichor-tech-first-feeding.png",
    "technology\ichor-tech-bio-logistics.png"
)

$missing = @()
foreach ($rel in $expected) {
    $path = Join-Path $GfxRoot $rel
    if (-not (Test-Path $path)) {
        $missing += $rel
    }
}

if ($missing.Count -gt 0) {
    Write-Error ("Missing graphics:`n" + ($missing -join "`n"))
}

Write-Host "Graphics validation passed ($($expected.Count) files)."
