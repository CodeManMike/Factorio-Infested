-- Zerg Factorio Space Age
-- Infested Assembling Machine (Stage 1 of Hatchery evolution)

local sounds = require("__base__.prototypes.entity.sounds")

-- Infested Assembling Machine entity
local infested_assembler = {
    type = "assembling-machine",
    name = "infested-assembling-machine",
    icon = "__zerg_factorio_space_age__/graphics/icons/infested-assembling-machine.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "infested-assembling-machine"},
    max_health = 350, -- Slightly more than standard assembler
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    resistances = {
        {
            type = "fire",
            percent = 70 -- More resistant to fire than standard assembler
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0, -2} }},
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = 1,
            pipe_connections = {{ type="output", position = {0, 2} }},
            secondary_draw_orders = { north = -1 }
        },
        off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    animation = {
        layers = {
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-assembling-machine/infested-assembling-machine.png",
                priority = "high",
                width = 108,
                height = 119,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, -0.5),
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-assembling-machine/hr-infested-assembling-machine.png",
                    priority = "high",
                    width = 214,
                    height = 237,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, -0.75),
                    scale = 0.5
                }
            },
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-assembling-machine/infested-assembling-machine-shadow.png",
                priority = "high",
                width = 130,
                height = 82,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(28, 4),
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-assembling-machine/hr-infested-assembling-machine-shadow.png",
                    priority = "high",
                    width = 260,
                    height = 162,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(28, 4),
                    scale = 0.5
                }
            }
        }
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 0.85, -- Slightly faster than standard assembler
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 2 -- Slightly less pollution
    },
    energy_usage = "150kW",
    open_sound = { filename = "__zerg_factorio_space_age__/sounds/infested-machine-open.ogg", volume = 0.5 },
    close_sound = { filename = "__zerg_factorio_space_age__/sounds/infested-machine-close.ogg", volume = 0.5 },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
        sound = {
            {
                filename = "__zerg_factorio_space_age__/sounds/infested-assembling-machine-1.ogg",
                volume = 0.5
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/infested-assembling-machine-2.ogg",
                volume = 0.5
            }
        },
        idle_sound = { filename = "__zerg_factorio_space_age__/sounds/infested-idle.ogg", volume = 0.3 },
        apparent_volume = 1.0
    },
    -- Organic pulsing light
    working_visualisations = {
        {
            animation = {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-assembling-machine/infested-assembling-machine-light.png",
                priority = "high",
                width = 108,
                height = 119,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, -0.5),
                blend_mode = "additive",
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-assembling-machine/hr-infested-assembling-machine-light.png",
                    priority = "high",
                    width = 214,
                    height = 237,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, -0.75),
                    blend_mode = "additive",
                    scale = 0.5
                }
            },
            light = {intensity = 0.4, size = 6, color = {r = 0.5, g = 0.1, b = 0.5}}
        }
    },
    water_reflection = {
        pictures = {
            filename = "__zerg_factorio_space_age__/graphics/entities/infested-assembling-machine/infested-assembling-machine-reflection.png",
            priority = "extra-high",
            width = 28,
            height = 32,
            shift = util.by_pixel(0, 40),
            variation_count = 1,
            scale = 5
        },
        rotate = false,
        orientation_to_variation = false
    }
}

-- Infested Assembling Machine item
local infested_assembler_item = {
    type = "item",
    name = "infested-assembling-machine",
    icon = "__zerg_factorio_space_age__/graphics/icons/infested-assembling-machine.png",
    icon_size = 64,
    subgroup = "zerg-production",
    order = "a[infested]-a[assembling-machine]",
    place_result = "infested-assembling-machine",
    stack_size = 50
}

-- Infested Assembling Machine recipe
local infested_assembler_recipe = {
    type = "recipe",
    name = "infested-assembling-machine",
    energy_required = 5,
    enabled = true,
    ingredients = {
        {"assembling-machine-2", 1},
        {"biomass", 20}
    },
    result = "infested-assembling-machine"
}

-- Upgrade recipe from standard assembler to infested version
local infested_assembler_upgrade = {
    type = "recipe",
    name = "infest-assembling-machine",
    energy_required = 3,
    enabled = true,
    category = "crafting",
    ingredients = {
        {"assembling-machine-2", 1},
        {"biomass", 10}
    },
    result = "infested-assembling-machine",
    allow_intermediates = false,
    allow_as_intermediate = false,
    hidden = true
}

data:extend({
    infested_assembler,
    infested_assembler_item,
    infested_assembler_recipe,
    infested_assembler_upgrade
})
