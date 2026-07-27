local Copy = require("prototypes.lib.copy")
local Graphics = require("prototypes.lib.graphics")

local hive_core = Copy.prototype("container", "steel-chest", "ichor-hive-core", {
  minable = {mining_time = 0.5, result = "ichor-hive-core"},
  max_health = 400,
  inventory_size = 10,
  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
  selection_box = {{-1, -1}, {1, 1}}
})
Graphics.apply_container_picture(hive_core, "hive-core")
Graphics.apply_entity_icon(hive_core, "ichor-hive-core")

local substrate_node = Copy.prototype("lab", "lab", "ichor-substrate-node", {
  minable = {mining_time = 0.3, result = "ichor-substrate-node"},
  max_health = 200,
  energy_source = {type = "void"},
  energy_usage = "1W",
  researching_speed = 0,
  inputs = {}
})
Graphics.apply_lab_animation(substrate_node, "substrate-node")
Graphics.apply_entity_icon(substrate_node, "ichor-substrate-node")

local neural_pylon = Copy.prototype("electric-pole", "small-electric-pole", "ichor-neural-pylon-1", {
  minable = {mining_time = 0.2, result = "ichor-neural-pylon-1"},
  max_health = 150,
  supply_area_distance = 0.5,
  maximum_wire_distance = 0
})
Graphics.apply_pole_pictures(neural_pylon, "neural-pylon-1")
Graphics.apply_entity_icon(neural_pylon, "ichor-neural-pylon-1")

local growth_chamber = Copy.prototype("assembling-machine", "assembling-machine-1", "ichor-growth-chamber-1", {
  minable = {mining_time = 0.4, result = "ichor-growth-chamber-1"},
  max_health = 300,
  crafting_categories = {"ichor-category-growth", "crafting"},
  crafting_speed = 0.5,
  energy_source = {type = "void"},
  energy_usage = "1W"
})
Graphics.apply_assembler_animation(growth_chamber, "growth-chamber-1")
Graphics.apply_entity_icon(growth_chamber, "ichor-growth-chamber-1")

local feral_growth_chamber = Copy.prototype("assembling-machine", "assembling-machine-2", "ichor-feral-growth-chamber", {
  minable = {mining_time = 0.4, result = "ichor-feral-growth-chamber"},
  max_health = 350,
  crafting_categories = {"ichor-category-growth"},
  crafting_speed = 0.75,
  energy_source = {type = "void"},
  energy_usage = "1W",
  flags = {"placeable-player", "placeable-neutral", "player-creation"}
})
Graphics.apply_assembler_animation(feral_growth_chamber, "feral-growth-chamber")
Graphics.apply_entity_icon(feral_growth_chamber, "ichor-feral-growth-chamber")

local nutrient_vat = Copy.prototype("assembling-machine", "chemical-plant", "ichor-nutrient-vat-1", {
  minable = {mining_time = 0.4, result = "ichor-nutrient-vat-1"},
  max_health = 300,
  crafting_categories = {"ichor-category-nutrient-processing"},
  crafting_speed = 0.75,
  energy_source = {type = "void"},
  energy_usage = "1W"
})
Graphics.apply_chemical_plant_graphics(nutrient_vat, "nutrient-vat-1")
Graphics.apply_entity_icon(nutrient_vat, "ichor-nutrient-vat-1")

local digestive_smelter = Copy.prototype("furnace", "stone-furnace", "ichor-digestive-smelter-1", {
  minable = {mining_time = 0.4, result = "ichor-digestive-smelter-1"},
  max_health = 300,
  crafting_categories = {"ichor-category-digestion"},
  crafting_speed = 1.0,
  energy_source = {type = "void"},
  energy_usage = "1W",
  result_inventory_size = 1
})
Graphics.apply_furnace_graphics(digestive_smelter, "digestive-smelter-1")
Graphics.apply_entity_icon(digestive_smelter, "ichor-digestive-smelter-1")

local tendril = Copy.prototype("inserter", "burner-inserter", "ichor-tendril-1", {
  minable = {mining_time = 0.1, result = "ichor-tendril-1"},
  max_health = 100,
  energy_source = {type = "void"},
  energy_per_movement = "0J",
  energy_per_rotation = "0J",
  extension_speed = 0.05,
  rotation_speed = 0.01
})
Graphics.apply_entity_icon(tendril, "ichor-tendril-1")

local tendon_track = Copy.prototype("transport-belt", "transport-belt", "ichor-tendon-track-1", {
  minable = {mining_time = 0.2, result = "ichor-tendon-track-1"},
  max_health = 100,
  speed = 0.03125
})
Graphics.apply_entity_icon(tendon_track, "ichor-tendon-track-1")

local crude_vein = Copy.prototype("pipe", "pipe", "ichor-crude-vein", {
  minable = {mining_time = 0.1, result = "ichor-crude-vein"},
  max_health = 100
})
Graphics.apply_entity_icon(crude_vein, "ichor-crude-vein")

local bladder_tank = Copy.prototype("storage-tank", "storage-tank", "ichor-bladder-tank-1", {
  minable = {mining_time = 0.3, result = "ichor-bladder-tank-1"},
  max_health = 300
})
Graphics.apply_entity_icon(bladder_tank, "ichor-bladder-tank-1")

data:extend({
  hive_core,
  substrate_node,
  neural_pylon,
  growth_chamber,
  feral_growth_chamber,
  nutrient_vat,
  digestive_smelter,
  tendril,
  tendon_track,
  crude_vein,
  bladder_tank
})
