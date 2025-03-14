-- Zerg Factorio Space Age
-- Infested Furnace (Stage 1 of Spawning Pool evolution)

local sounds = require("__base__.prototypes.entity.sounds")

-- Infested Furnace entity
local infested_furnace = {
    type = "furnace",
    name = "infested-furnace",
    icon = "__zerg_factorio_space_age__/graphics/icons/infested-furnace.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "infested-furnace"},
    max_health = 250,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = "110kW",
    crafting_speed = 1.1, -- Slightly faster than steel furnace
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 2 -- Less pollution than steel furnace
    },
    animation = {
        layers = {
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-furnace/infested-furnace.png",
                priority = "high",
                width = 85,
                height = 87,
                frame_count = 12,
                animation_speed = 0.5,
                shift = util.by_pixel(-1.5, 1.5),
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-furnace/hr-infested-furnace.png",
                    priority = "high",
                    width = 171,
                    height = 174,
                    frame_count = 12,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-1.25, 2),
                    scale = 0.5
                }
            },
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-furnace/infested-furnace-shadow.png",
                priority = "high",
                width = 139,
                height = 43,
                frame_count = 1,
                line_length = 1,
                repeat_count = 12,
                animation_speed = 0.5,
                shift = util.by_pixel(39.5, 11.5),
                draw_as_shadow = true,
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-furnace/hr-infested-furnace-shadow.png",
                    priority = "high",
                    width = 277,
                    height = 85,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 12,
                    animation_speed = 0.5,
                    shift = util.by_pixel(39.25, 11.25),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            },
            -- Organic pulsing overlay
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-furnace/infested-furnace-glow.png",
                priority = "high",
                width = 85,
                height = 87,
                frame_count = 12,
                animation_speed = 0.5,
                shift = util.by_pixel(-1.5, 1.5),
                blend_mode = "additive",
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-furnace/hr-infested-furnace-glow.png",
                    priority = "high",
                    width = 171,
                    height = 174,
                    frame_count = 12,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-1.25, 2),
                    blend_mode = "additive",
                    scale = 0.5
                }
            }
        }
    },
    working_visualisations = {
        {
            north_position = {0.0, 0.0},
            east_position = {0.0, 0.0},
            south_position = {0.0, 0.0},
            west_position = {0.0, 0.0},
            animation = {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-furnace/infested-furnace-fire.png",
                priority = "high",
                line_length = 8,
                width = 20,
                height = 49,
                frame_count = 48,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -10),
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-furnace/hr-infested-furnace-fire.png",
                    priority = "high",
                    line_length = 8,
                    width = 41,
                    height = 100,
                    frame_count = 48,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.75, -10.5),
                    scale = 0.5
                }
            },
            light = {intensity = 0.6, size = 6, color = {r = 0.5, g = 0.1, b = 0.5}}
        }
    },
    working_sound = {
        sound = {
            {
                filename = "__zerg_factorio_space_age__/sounds/infested-furnace-1.ogg",
                volume = 0.6
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/infested-furnace-2.ogg",
                volume = 0.6
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/infested-furnace-3.ogg",
                volume = 0.6
            }
        },
        idle_sound = {
            filename = "__zerg_factorio_space_age__/sounds/infested-idle.ogg",
            volume = 0.4
        },
        apparent_volume = 1.5
    },
    fast_replaceable_group = "furnace",
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
}

-- Infested Furnace item
local infested_furnace_item = {
    type = "item",
    name = "infested-furnace",
    icon = "__zerg_factorio_space_age__/graphics/icons/infested-furnace.png",
    icon_size = 64,
    subgroup = "zerg-production",
    order = "a[infested]-d[furnace]",
    place_result = "infested-furnace",
    stack_size = 50
}

-- Infested Furnace recipe
local infested_furnace_recipe = {
    type = "recipe",
    name = "infested-furnace",
    energy_required = 5,
    enabled = true,
    ingredients = {
        {"steel-furnace", 1},
        {"biomass", 15}
    },
    result = "infested-furnace"
}

-- Upgrade recipe from standard furnace to infested version
local infested_furnace_upgrade = {
    type = "recipe",
    name = "infest-furnace",
    energy_required = 3,
    enabled = true,
    category = "crafting",
    ingredients = {
        {"steel-furnace", 1},
        {"biomass", 8}
    },
    result = "infested-furnace",
    allow_intermediates = false,
    allow_as_intermediate = false,
    hidden = true
}

data:extend({
    infested_furnace,
    infested_furnace_item,
    infested_furnace_recipe,
    infested_furnace_upgrade
})
