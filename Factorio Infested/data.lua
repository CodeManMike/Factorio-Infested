-- Factorio Infested Space Age
-- Main data file for prototypes

-- Load all prototype definitions
require("prototypes.categories")
require("prototypes.tiles")
require("prototypes.entities.buildings")
require("prototypes.entities.units")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.technologies")
require("prototypes.player")
require("prototypes.fluids")
require("prototypes.sounds")

-- Override player character with Hive Overlord
if data.raw["character"]["character"] then
    local character = data.raw["character"]["character"]

    -- Modify character properties to be more hive-like
    character.running_speed = 0.15  -- Slower movement (Overlords are slow)
    character.distance_per_frame = 0.13
    character.mining_speed = 1.5    -- Better mining (using tentacles)
    character.build_distance = 10   -- Longer build range with tentacles
    character.reach_distance = 10   -- Longer reach with tentacles
    character.reach_resource_distance = 5 -- Longer resource reach
    character.inventory_size = 80   -- Larger inventory (biological storage sacs)

    -- Add resistances
    character.resistances = character.resistances or {}
    table.insert(character.resistances, {type = "acid", percent = 70})
    table.insert(character.resistances, {type = "poison", percent = 100})
    table.insert(character.resistances, {type = "biological", percent = 100})

    -- TODO: Replace character animations with Overlord sprites
    -- This will require custom graphics work
end

-- Add custom damage type for bio attacks
data:extend({
    {
        type = "damage-type",
        name = "bio-damage"
    }
})
