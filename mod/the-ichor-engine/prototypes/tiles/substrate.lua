local Copy = require("prototypes.lib.copy")
local Graphics = require("prototypes.lib.graphics")

local living = Copy.prototype("tile", "concrete", "ichor-living-substrate", {
  order = "a[ichor-living-substrate]",
  map_color = {r = 120, g = 30, b = 40},
  walking_speed_modifier = 1.1,
  decorative_removal_probability = 1.0,
  layer = 59,
  layer_group = "ground-artificial",
  variants = Graphics.tile_variants("living-substrate", "living-substrate.png")
})

local feral = Copy.prototype("tile", "refined-concrete", "ichor-feral-substrate", {
  order = "b[ichor-feral-substrate]",
  map_color = {r = 40, g = 10, b = 20},
  walking_speed_modifier = 0.9,
  decorative_removal_probability = 1.0,
  layer = 59,
  layer_group = "ground-artificial",
  variants = Graphics.tile_variants("feral-substrate", "feral-substrate.png")
})

data:extend({living, feral})
