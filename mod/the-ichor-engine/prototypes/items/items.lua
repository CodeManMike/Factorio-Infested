local Copy = require("prototypes.lib.copy")
local Graphics = require("prototypes.lib.graphics")

local function icon_item(name, subgroup, order, stack_size, place_result, weight_kg)
  return {
    type = "item",
    name = name,
    icon = Graphics.icon(name),
    icon_size = 64,
    subgroup = subgroup,
    order = order,
    stack_size = stack_size,
    place_result = place_result,
    weight = weight_kg * kg
  }
end

data:extend({
  {
    type = "item",
    name = "ichor-raw-biomass",
    icon = Graphics.icon("ichor-raw-biomass"),
    icon_size = 64,
    subgroup = "ichor-subgroup-raw",
    order = "a[ichor-raw-biomass]",
    stack_size = 100,
    weight = 1 * kg
  },
  {
    type = "item",
    name = "ichor-bio-forged-iron-plate",
    icon = Graphics.icon("ichor-bio-forged-iron-plate"),
    icon_size = 64,
    subgroup = "ichor-subgroup-biomass",
    order = "a[ichor-bio-forged-iron-plate]",
    stack_size = 100,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "ichor-bio-forged-copper-plate",
    icon = Graphics.icon("ichor-bio-forged-copper-plate"),
    icon_size = 64,
    subgroup = "ichor-subgroup-biomass",
    order = "b[ichor-bio-forged-copper-plate]",
    stack_size = 100,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "ichor-science-biomass",
    icon = Graphics.icon("ichor-science-biomass"),
    icon_size = 64,
    subgroup = "ichor-subgroup-research",
    order = "a[ichor-science-biomass]",
    stack_size = 200,
    weight = 1 * kg
  },
  icon_item("ichor-hive-core", "ichor-subgroup-production", "a[ichor-hive-core]", 10, "ichor-hive-core", 100),
  icon_item("ichor-substrate-node", "ichor-subgroup-production", "b[ichor-substrate-node]", 20, "ichor-substrate-node", 50),
  icon_item("ichor-neural-pylon-1", "ichor-subgroup-neural", "a[ichor-neural-pylon-1]", 50, "ichor-neural-pylon-1", 20),
  icon_item("ichor-growth-chamber-1", "ichor-subgroup-production", "c[ichor-growth-chamber-1]", 10, "ichor-growth-chamber-1", 80),
  icon_item("ichor-feral-growth-chamber", "ichor-subgroup-production", "d[ichor-feral-growth-chamber]", 10, "ichor-feral-growth-chamber", 80),
  icon_item("ichor-nutrient-vat-1", "ichor-subgroup-production", "e[ichor-nutrient-vat-1]", 10, "ichor-nutrient-vat-1", 80),
  icon_item("ichor-digestive-smelter-1", "ichor-subgroup-production", "f[ichor-digestive-smelter-1]", 10, "ichor-digestive-smelter-1", 80),
  icon_item("ichor-tendril-1", "ichor-subgroup-logistics", "a[ichor-tendril-1]", 50, "ichor-tendril-1", 10),
  icon_item("ichor-tendon-track-1", "ichor-subgroup-logistics", "b[ichor-tendon-track-1]", 100, "ichor-tendon-track-1", 5),
  icon_item("ichor-crude-vein", "ichor-subgroup-logistics", "c[ichor-crude-vein]", 50, "ichor-crude-vein", 10),
  icon_item("ichor-bladder-tank-1", "ichor-subgroup-logistics", "d[ichor-bladder-tank-1]", 10, "ichor-bladder-tank-1", 60)
})
