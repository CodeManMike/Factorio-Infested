-- Zerg Factorio Space Age
-- Zerg Hatchery Building

local sounds = require("__base__.prototypes.entity.sounds")

-- Hatchery entity
local hatchery = {
    type = "assembling-machine",
    name = "zerg-hatchery",
    icon = "__zerg_factorio_space_age__/graphics/icons/hatchery.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "zerg-hatchery"},
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances = {
        {
            type = "physical",
            percent = 30
        },
        {
            type = "fire",
            percent = 50
        },
        {
            type = "impact",
            percent = 30
        }
    },
    collision_box = {{-4.2, -4.2}, {4.2, 4.2}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    alert_icon_shift = {0, -0.2},
    animation = {
        layers = {
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/hatchery/hatchery.png",
                priority = "high",
                width = 320,
                height = 320,
                frame_count = 8,
                line_length = 4,
                animation_speed = 0.2,
                shift = {0, 0},
                scale = 1
            },
            {
                filename = "__zerg_factorio_space_age__/graphics/entities/hatchery/hatchery-shadow.png",
                priority = "high",
                width = 320,
                height = 320,
                frame_count = 8,
                line_length = 4,
                animation_speed = 0.2,
                shift = {0.5, 0.5},
                scale = 1,
                draw_as_shadow = true
            }
        }
    },
    crafting_categories = {"zerg-spawning", "zerg-morphing"},
    crafting_speed = 1,
    energy_source = {
        type = "void",
        emissions_per_minute = -10, -- Produces creep which absorbs pollution
        render_no_power_icon = false
    },
    energy_usage = "100kW",
    ingredient_count = 6,
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"speed", "productivity", "consumption", "pollution"},
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
        sound = {
            {
                filename = "__zerg_factorio_space_age__/sounds/hatchery-working.ogg",
                volume = 0.8
            }
        },
        idle_sound = {
            filename = "__zerg_factorio_space_age__/sounds/hatchery-idle.ogg",
            volume = 0.6
        },
        apparent_volume = 1.5
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_covers = nil,
            base_area = 10,
            base_level = -1,
            pipe_connections = {},
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "output",
            pipe_covers = nil,
            base_area = 10,
            base_level = 1,
            pipe_connections = {},
            secondary_draw_orders = { north = -1 }
        },
        off_when_no_fluid_recipe = false
    }
}

-- Hatchery item
local hatchery_item = {
    type = "item",
    name = "zerg-hatchery",
    icon = "__zerg_factorio_space_age__/graphics/icons/hatchery.png",
    icon_size = 64,
    subgroup = "zerg-production",
    order = "a[zerg]-a[hatchery]",
    place_result = "zerg-hatchery",
    stack_size = 10
}

-- Hatchery recipe
local hatchery_recipe = {
    type = "recipe",
    name = "zerg-hatchery",
    energy_required = 30,
    enabled = true,
    ingredients = {
        {"iron-plate", 100},
        {"copper-plate", 50},
        {"electronic-circuit", 20}
    },
    result = "zerg-hatchery"
}

data:extend({
    hatchery,
    hatchery_item,
    hatchery_recipe
})
