-- Zerg Factorio Space Age
-- Player Character Modifications (Zerg Overlord)

-- Override player character with Zerg Overlord
if data.raw["character"]["character"] then
    local character = data.raw["character"]["character"]

    -- Modify character properties to be more Zerg-like
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

    -- Modify crafting speed
    character.crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", "zerg-evolution"}
    character.mining_categories = {"basic-solid"}
    character.crafting_speed = 1.5  -- Faster crafting with multiple tentacles

    -- Add light for better visibility
    character.light = {
        {
            type = "basic",
            intensity = 0.8,
            size = 25,
            color = {r = 0.8, g = 0.6, b = 0.8}
        }
    }

    -- TODO: Replace character animations with Overlord sprites
    -- This will require custom graphics work
end

-- Add custom damage type for Zerg attacks
data:extend({
    {
        type = "damage-type",
        name = "zerg-bio"
    }
})

-- Add custom equipment grid for Zerg evolution upgrades
data:extend({
    {
        type = "equipment-grid",
        name = "zerg-evolution-grid",
        width = 6,
        height = 6,
        equipment_categories = {"armor", "zerg-evolution"}
    }
})

-- Add custom equipment category
data:extend({
    {
        type = "equipment-category",
        name = "zerg-evolution"
    }
})

-- Add custom equipment items
data:extend({
    -- Metabolic Boost (movement speed)
    {
        type = "movement-bonus-equipment",
        name = "zerg-metabolic-boost",
        sprite = {
            filename = "__zerg_factorio_space_age__/graphics/equipment/zerg-metabolic-boost.png",
            width = 64,
            height = 64,
            priority = "medium"
        },
        shape = {
            width = 2,
            height = 2,
            type = "full"
        },
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input"
        },
        energy_consumption = "100kW",
        movement_bonus = 0.3,
        categories = {"armor", "zerg-evolution"},
        take_result = "zerg-metabolic-boost"
    },

    -- Adrenal Glands (mining speed)
    {
        type = "battery-equipment",
        name = "zerg-adrenal-glands",
        sprite = {
            filename = "__zerg_factorio_space_age__/graphics/equipment/zerg-adrenal-glands.png",
            width = 64,
            height = 64,
            priority = "medium"
        },
        shape = {
            width = 2,
            height = 2,
            type = "full"
        },
        energy_source = {
            type = "electric",
            usage_priority = "tertiary",
            buffer_capacity = "20MJ"
        },
        categories = {"armor", "zerg-evolution"},
        take_result = "zerg-adrenal-glands"
    },

    -- Chitinous Plating (armor)
    {
        type = "energy-shield-equipment",
        name = "zerg-chitinous-plating",
        sprite = {
            filename = "__zerg_factorio_space_age__/graphics/equipment/zerg-chitinous-plating.png",
            width = 64,
            height = 64,
            priority = "medium"
        },
        shape = {
            width = 2,
            height = 2,
            type = "full"
        },
        max_shield_value = 100,
        energy_source = {
            type = "electric",
            buffer_capacity = "120kJ",
            input_flow_limit = "240kW",
            usage_priority = "primary-input"
        },
        energy_per_shield = "20kJ",
        categories = {"armor", "zerg-evolution"},
        take_result = "zerg-chitinous-plating"
    }
})
