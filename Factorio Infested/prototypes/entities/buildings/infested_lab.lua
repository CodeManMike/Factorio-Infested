-- Zerg Factorio Space Age
-- Infested Lab (Stage 1 of Evolution Chamber evolution)

local sounds = require("__base__.prototypes.entity.sounds")

-- Infested Lab entity
local infested_lab = {
    type = "lab",
    name = "infested-lab",
    icon = "__zerg_factorio_space_age__/graphics/icons/infested-lab.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "infested-lab"},
    max_health = 250,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 0.5, g = 0.1, b = 0.5}},
    on_animation = {
        layers = {
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/infested-lab.png",
                width = 98,
                height = 87,
                frame_count = 33,
                line_length = 11,
                animation_speed = 1 / 3,
                shift = util.by_pixel(0, 1.5),
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/hr-infested-lab.png",
                    width = 194,
                    height = 174,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    scale = 0.5
                }
            },
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/infested-lab-shadow.png",
                width = 122,
                height = 68,
                frame_count = 1,
                line_length = 1,
                repeat_count = 33,
                animation_speed = 1 / 3,
                shift = util.by_pixel(13, 11),
                draw_as_shadow = true,
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/hr-infested-lab-shadow.png",
                    width = 242,
                    height = 136,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 33,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(13, 11),
                    scale = 0.5,
                    draw_as_shadow = true
                }
            },
            -- Organic pulsing overlay
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/infested-lab-overlay.png",
                width = 98,
                height = 87,
                frame_count = 33,
                line_length = 11,
                animation_speed = 1 / 3,
                shift = util.by_pixel(0, 1.5),
                blend_mode = "additive",
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/hr-infested-lab-overlay.png",
                    width = 194,
                    height = 174,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    blend_mode = "additive",
                    scale = 0.5
                }
            }
        }
    },
    off_animation = {
        layers = {
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/infested-lab.png",
                width = 98,
                height = 87,
                frame_count = 1,
                shift = util.by_pixel(0, 1.5),
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/hr-infested-lab.png",
                    width = 194,
                    height = 174,
                    frame_count = 1,
                    shift = util.by_pixel(0, 1.5),
                    scale = 0.5
                }
            },
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/infested-lab-shadow.png",
                width = 122,
                height = 68,
                frame_count = 1,
                shift = util.by_pixel(13, 11),
                draw_as_shadow = true,
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-lab/hr-infested-lab-shadow.png",
                    width = 242,
                    height = 136,
                    frame_count = 1,
                    shift = util.by_pixel(13, 11),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            }
        }
    },
    working_sound = {
        sound = {
            filename = "__zerg_factorio_space_age__/sounds/infested-lab-working.ogg",
            volume = 0.7
        },
        idle_sound = {
            filename = "__zerg_factorio_space_age__/sounds/infested-idle.ogg",
            volume = 0.4
        },
        apparent_volume = 1.5
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input"
    },
    energy_usage = "60kW",
    researching_speed = 1.1, -- Slightly faster than standard lab
    inputs = {
        "automation-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "chemical-science-pack",
        "production-science-pack",
        "utility-science-pack",
        "space-science-pack",
        "genetic-data" -- Special Zerg science pack
    },
    module_specification = {
        module_slots = 2,
        module_info_icon_shift = {0, 0.5},
        module_info_multi_row_initial_height_modifier = -0.3
    },
    fast_replaceable_group = "lab"
}

-- Infested Lab item
local infested_lab_item = {
    type = "item",
    name = "infested-lab",
    icon = "__zerg_factorio_space_age__/graphics/icons/infested-lab.png",
    icon_size = 64,
    subgroup = "zerg-production",
    order = "a[infested]-c[lab]",
    place_result = "infested-lab",
    stack_size = 10
}

-- Infested Lab recipe
local infested_lab_recipe = {
    type = "recipe",
    name = "infested-lab",
    energy_required = 5,
    enabled = true,
    ingredients = {
        {"lab", 1},
        {"biomass", 20}
    },
    result = "infested-lab"
}

-- Upgrade recipe from standard lab to infested version
local infested_lab_upgrade = {
    type = "recipe",
    name = "infest-lab",
    energy_required = 3,
    enabled = true,
    category = "crafting",
    ingredients = {
        {"lab", 1},
        {"biomass", 10}
    },
    result = "infested-lab",
    allow_intermediates = false,
    allow_as_intermediate = false,
    hidden = true
}

data:extend({
    infested_lab,
    infested_lab_item,
    infested_lab_recipe,
    infested_lab_upgrade
})
