# Generates MVP placeholder PNGs for mod/the-ichor-engine/graphics/.
# We use distinct hues per asset family so wireup is easy to spot in-game.

param(
    [string]$ModRoot = (Join-Path $PSScriptRoot "..\mod\the-ichor-engine")
)

Add-Type -AssemblyName System.Drawing

function New-PlaceholderPng {
    param(
        [string]$Path,
        [int]$Width,
        [int]$Height,
        [int]$R,
        [int]$G,
        [int]$B,
        [string]$Label = ""
    )

    $dir = Split-Path $Path -Parent
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }

    $bmp = New-Object System.Drawing.Bitmap($Width, $Height)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::FromArgb(255, $R, $G, $B))

    if ($Label -ne "") {
        $font = New-Object System.Drawing.Font("Arial", 8)
        $brush = [System.Drawing.Brushes]::White
        $g.DrawString($Label, $font, $brush, 4, 4) | Out-Null
        $font.Dispose()
    }

    $g.Dispose()
    $bmp.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
}

$gfx = Join-Path $ModRoot "graphics"

# Tiles (64x64)
New-PlaceholderPng (Join-Path $gfx "tile\living-substrate\living-substrate.png") 64 64 120 30 40 "living"
New-PlaceholderPng (Join-Path $gfx "tile\feral-substrate\feral-substrate.png") 64 64 40 10 20 "feral"

# Entity sprites (128x128 idle frame)
$entities = @(
    @{ folder = "hive-core"; color = @(180, 50, 60) },
    @{ folder = "substrate-node"; color = @(90, 140, 70) },
    @{ folder = "neural-pylon-1"; color = @(70, 120, 200) },
    @{ folder = "growth-chamber-1"; color = @(140, 90, 160) },
    @{ folder = "feral-growth-chamber"; color = @(100, 40, 50) },
    @{ folder = "nutrient-vat-1"; color = @(60, 160, 120) },
    @{ folder = "digestive-smelter-1"; color = @(160, 100, 50) },
    @{ folder = "tendril-1"; color = @(80, 180, 80) },
    @{ folder = "tendon-track-1"; color = @(120, 80, 60) },
    @{ folder = "crude-vein"; color = @(50, 130, 130) },
    @{ folder = "bladder-tank-1"; color = @(90, 70, 150) }
)

foreach ($e in $entities) {
    $name = $e.folder
    New-PlaceholderPng (Join-Path $gfx "entity\$name\$name.png") 128 128 $e.color[0] $e.color[1] $e.color[2] $name
}

# Icons (64x64)
$iconItems = @(
    "ichor-hive-core", "ichor-substrate-node", "ichor-neural-pylon-1",
    "ichor-growth-chamber-1", "ichor-feral-growth-chamber",
    "ichor-raw-biomass", "ichor-bio-forged-iron-plate", "ichor-bio-forged-copper-plate",
    "ichor-science-biomass", "ichor-nutrient-vat-1", "ichor-digestive-smelter-1",
    "ichor-tendril-1", "ichor-tendon-track-1", "ichor-crude-vein", "ichor-bladder-tank-1"
)
foreach ($icon in $iconItems) {
    New-PlaceholderPng (Join-Path $gfx "icon\$icon.png") 64 64 100 60 80 $icon.Substring(6, [Math]::Min(8, $icon.Length - 6))
}

# Fluids
New-PlaceholderPng (Join-Path $gfx "icon\ichor-nutrient-slurry.png") 64 64 40 150 90 "slurry"
New-PlaceholderPng (Join-Path $gfx "icon\ichor-ichor-fluid.png") 64 64 120 20 30 "ichor"

# GUI
New-PlaceholderPng (Join-Path $gfx "gui\ichor-top-button.png") 64 64 80 40 50 "ichor"
New-PlaceholderPng (Join-Path $gfx "gui\ichor-alert-hunger.png") 64 64 200 80 40 "hunger"
New-PlaceholderPng (Join-Path $gfx "gui\ichor-alert-loyalty.png") 64 64 200 120 40 "loyalty"

# Technology
New-PlaceholderPng (Join-Path $gfx "technology\ichor-tech-first-feeding.png") 256 256 100 50 70 "feed"
New-PlaceholderPng (Join-Path $gfx "technology\ichor-tech-basic-bio-production.png") 256 256 60 120 80 "bio"

Write-Host "Placeholder graphics written under $gfx"
