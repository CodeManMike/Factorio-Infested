-- Zerg Factorio Space Age
-- Infested Mining Drill (Stage 1 of Bio-Extractor evolution)

local sounds = require("__base__.prototypes.entity.sounds")

-- Infested Mining Drill entity
local infested_drill = {
    type = "mining-drill",
    name = "infested-mining-drill",
    icon = "__zerg_factorio_space_age__/graphics/icons/infested-mining-drill.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.3, result = "infested-mining-drill"},
    max_health = 350, -- Slightly more than standard drill
    resource_categories = {"basic-solid"},
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{ -1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    input_fluid_box = {
        production_type = "input-output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 1,
        height = 2,
        base_level = -1,
        pipe_connections = {
            { position = {-2, 0} },
            { position = {2, 0} },
            { position = {0, 2} }
        }
    },
    working_sound = {
        sound = {
            {
                filename = "__zerg_factorio_space_age__/sounds/infested-mining-drill-1.ogg",
                volume = 0.5
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/infested-mining-drill-2.ogg",
                volume = 0.5
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/infested-mining-drill-3.ogg",
                volume = 0.5
            }
        },
        idle_sound = { filename = "__zerg_factorio_space_age__/sounds/infested-idle.ogg", volume = 0.3 },
        apparent_volume = 1.0
    },
    animations = {
        north = {
            layers = {
                {
                    priority = "high",
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-N.png",
                    line_length = 8,
                    width = 98,
                    height = 113,
                    frame_count = 64,
                    animation_speed = 0.5,
                    direction_count = 1,
                    shift = util.by_pixel(0, -8.5),
                    hr_version = {
                        priority = "high",
                        filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-N.png",
                        line_length = 8,
                        width = 196,
                        height = 226,
                        frame_count = 64,
                        animation_speed = 0.5,
                        direction_count = 1,
                        shift = util.by_pixel(0, -8),
                        scale = 0.5
                    }
                },
                {
                    priority = "high",
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-N-shadow.png",
                    line_length = 8,
                    width = 138,
                    height = 96,
                    frame_count = 64,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    direction_count = 1,
                    shift = util.by_pixel(20, -2),
                    hr_version = {
                        priority = "high",
                        filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-N-shadow.png",
                        line_length = 8,
                        width = 276,
                        height = 192,
                        frame_count = 64,
                        animation_speed = 0.5,
                        draw_as_shadow = true,
                        direction_count = 1,
                        shift = util.by_pixel(20, -2),
                        scale = 0.5
                    }
                }
            }
        },
        east = {
            layers = {
                {
                    priority = "high",
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-E.png",
                    line_length = 8,
                    width = 105,
                    height = 98,
                    frame_count = 64,
                    animation_speed = 0.5,
                    direction_count = 1,
                    shift = util.by_pixel(3.5, -1),
                    hr_version = {
                        priority = "high",
                        filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-E.png",
                        line_length = 8,
                        width = 211,
                        height = 197,
                        frame_count = 64,
                        animation_speed = 0.5,
                        direction_count = 1,
                        shift = util.by_pixel(3.75, -1.25),
                        scale = 0.5
                    }
                },
                {
                    priority = "high",
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-E-shadow.png",
                    line_length = 8,
                    width = 113,
                    height = 66,
                    frame_count = 64,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    direction_count = 1,
                    shift = util.by_pixel(28.5, 6),
                    hr_version = {
                        priority = "high",
                        filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-E-shadow.png",
                        line_length = 8,
                        width = 226,
                        height = 132,
                        frame_count = 64,
                        animation_speed = 0.5,
                        draw_as_shadow = true,
                        direction_count = 1,
                        shift = util.by_pixel(28.5, 6),
                        scale = 0.5
                    }
                }
            }
        },
        south = {
            layers = {
                {
                    priority = "high",
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-S.png",
                    line_length = 8,
                    width = 98,
                    height = 109,
                    frame_count = 64,
                    animation_speed = 0.5,
                    direction_count = 1,
                    shift = util.by_pixel(0, -1.5),
                    hr_version = {
                        priority = "high",
                        filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-S.png",
                        line_length = 8,
                        width = 196,
                        height = 219,
                        frame_count = 64,
                        animation_speed = 0.5,
                        direction_count = 1,
                        shift = util.by_pixel(0, -1.25),
                        scale = 0.5
                    }
                },
                {
                    priority = "high",
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-S-shadow.png",
                    line_length = 8,
                    width = 126,
                    height = 98,
                    frame_count = 64,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    direction_count = 1,
                    shift = util.by_pixel(28, 6),
                    hr_version = {
                        priority = "high",
                        filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-S-shadow.png",
                        line_length = 8,
                        width = 252,
                        height = 196,
                        frame_count = 64,
                        animation_speed = 0.5,
                        draw_as_shadow = true,
                        direction_count = 1,
                        shift = util.by_pixel(28, 6),
                        scale = 0.5
                    }
                }
            }
        },
        west = {
            layers = {
                {
                    priority = "high",
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-W.png",
                    line_length = 8,
                    width = 105,
                    height = 98,
                    frame_count = 64,
                    animation_speed = 0.5,
                    direction_count = 1,
                    shift = util.by_pixel(-3.5, -1),
                    hr_version = {
                        priority = "high",
                        filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-W.png",
                        line_length = 8,
                        width = 211,
                        height = 197,
                        frame_count = 64,
                        animation_speed = 0.5,
                        direction_count = 1,
                        shift = util.by_pixel(-3.75, -0.75),
                        scale = 0.5
                    }
                },
                {
                    priority = "high",
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-W-shadow.png",
                    line_length = 8,
                    width = 114,
                    height = 97,
                    frame_count = 64,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    direction_count = 1,
                    shift = util.by_pixel(14, 9.5),
                    hr_version = {
                        priority = "high",
                        filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-W-shadow.png",
                        line_length = 8,
                        width = 228,
                        height = 194,
                        frame_count = 64,
                        animation_speed = 0.5,
                        draw_as_shadow = true,
                        direction_count = 1,
                        shift = util.by_pixel(14, 9.5),
                        scale = 0.5
                    }
                }
            }
        }
    },
    -- Organic pulsing light
    working_visualisations = {
        {
            north_position = {0, 0},
            east_position = {0, 0},
            south_position = {0, 0},
            west_position = {0, 0},
            animation = {
                filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/infested-mining-drill-light.png",
                priority = "high",
                width = 83,
                height = 65,
                frame_count = 8,
                animation_speed = 0.5,
                blend_mode = "additive",
                shift = util.by_pixel(0, 0),
                hr_version = {
                    filename = "__zerg_factorio_space_age__/graphics/entities/infested-mining-drill/hr-infested-mining-drill-light.png",
                    priority = "high",
                    width = 166,
                    height = 130,
                    frame_count = 8,
                    animation_speed = 0.5,
                    blend_mode = "additive",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                }
            },
            light = {intensity = 0.4, size = 6, color = {r = 0.5, g = 0.1, b = 0.5}}
        }
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = { filename = "__zerg_factorio_space_age__/sounds/infested-machine-open.ogg", volume = 0.5 },
    close_sound = { filename = "__zerg_factorio_space_age__/sounds/infested-machine-close.ogg", volume = 0.5 },
    mining_speed = 0.55, -- Slightly faster than standard drill
    energy_source = {
        type = "electric",
        emissions_per_minute = 8, -- Slightly less pollution
        usage_priority = "secondary-input"
    },
    energy_usage = "110kW",
    resource_searching_radius = 2.49,
    vector_to_place_result = {0, -1.85},
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    radius_visualisation_picture = {
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
        width = 12,
        height = 12
    },
    monitor_visualization_tint = {r=0.5, g=0.1, b=0.5},
    fast_replaceable_group = "mining-drill",
    circuit_wire_connection_points = circuit_connector_definitions["electric-mining-drill"].points,
    circuit_connector_sprites = circuit_connector_definitions["electric-mining-drill"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
}

-- Infested Mining Drill item
local infested_drill_item = {
    type = "item",
    name = "infested-mining-drill",
    icon = "__zerg_factorio_space_age__/graphics/icons/infested-mining-drill.png",
    icon_size = 64,
    subgroup = "zerg-production",
    order = "a[infested]-b[mining-drill]",
    place_result = "infested-mining-drill",
    stack_size = 50
}

-- Infested Mining Drill recipe
local infested_drill_recipe = {
    type = "recipe",
    name = "infested-mining-drill",
    energy_required = 5,
    enabled = true,
    ingredients = {
        {"electric-mining-drill", 1},
        {"biomass", 15}
    },
    result = "infested-mining-drill"
}

-- Upgrade recipe from standard drill to infested version
local infested_drill_upgrade = {
    type = "recipe",
    name = "infest-mining-drill",
    energy_required = 3,
    enabled = true,
    category = "crafting",
    ingredients = {
        {"electric-mining-drill", 1},
        {"biomass", 8}
    },
    result = "infested-mining-drill",
    allow_intermediates = false,
    allow_as_intermediate = false,
    hidden = true
}

data:extend({
    infested_drill,
    infested_drill_item,
    infested_drill_recipe,
    infested_drill_upgrade
})
