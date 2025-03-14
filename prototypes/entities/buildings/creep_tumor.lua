-- Zerg Factorio Space Age
-- Zerg Creep Tumor Building

local sounds = require("__base__.prototypes.entity.sounds")

-- Creep Tumor entity
local creep_tumor = {
    type = "electric-pole",
    name = "zerg-creep-tumor",
    icon = "__zerg_factorio_space_age__/graphics/icons/creep-tumor.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "zerg-creep-tumor"},
    max_health = 150,
    corpse = "small-remnants",
    dying_explosion = "blood-explosion-small",
    resistances = {
        {
            type = "physical",
            percent = 20
        },
        {
            type = "fire",
            percent = 30
        }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.0}, {0.5, 0.5}},
    maximum_wire_distance = 8,
    supply_area_distance = 4,
    vehicle_impact_sound = sounds.generic_impact,
    pictures = {
        filename = "__zerg_factorio_space_age__/graphics/entities/creep-tumor/creep-tumor.png",
        priority = "high",
        width = 64,
        height = 128,
        direction_count = 4,
        shift = {0, -0.5}
    },
    connection_points = {
        {
            shadow = {
                copper = {0, 0},
                red = {0, 0},
                green = {0, 0}
            },
            wire = {
                copper = {0, -1.25},
                red = {0.375, -1.25},
                green = {-0.375, -1.25}
            }
        },
        {
            shadow = {
                copper = {0, 0},
                red = {0, 0},
                green = {0, 0}
            },
            wire = {
                copper = {0, -1.25},
                red = {0.375, -1.25},
                green = {-0.375, -1.25}
            }
        },
        {
            shadow = {
                copper = {0, 0},
                red = {0, 0},
                green = {0, 0}
            },
            wire = {
                copper = {0, -1.25},
                red = {0.375, -1.25},
                green = {-0.375, -1.25}
            }
        },
        {
            shadow = {
                copper = {0, 0},
                red = {0, 0},
                green = {0, 0}
            },
            wire = {
                copper = {0, -1.25},
                red = {0.375, -1.25},
                green = {-0.375, -1.25}
            }
        }
    },
    radius_visualisation_picture = {
        filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
        width = 12,
        height = 12,
        priority = "extra-high-no-scale"
    },
    water_reflection = {
        pictures = {
            filename = "__zerg_factorio_space_age__/graphics/entities/creep-tumor/creep-tumor-reflection.png",
            priority = "extra-high",
            width = 32,
            height = 32,
            shift = {0, 1.25},
            variation_count = 1,
            scale = 1
        },
        rotate = false,
        orientation_to_variation = false
    }
}

-- Creep Tumor item
local creep_tumor_item = {
    type = "item",
    name = "zerg-creep-tumor",
    icon = "__zerg_factorio_space_age__/graphics/icons/creep-tumor.png",
    icon_size = 64,
    subgroup = "zerg-production",
    order = "a[zerg]-c[creep-tumor]",
    place_result = "zerg-creep-tumor",
    stack_size = 50
}

-- Creep Tumor recipe
local creep_tumor_recipe = {
    type = "recipe",
    name = "zerg-creep-tumor",
    energy_required = 5,
    enabled = true,
    ingredients = {
        {"iron-plate", 5},
        {"copper-cable", 5}
    },
    result = "zerg-creep-tumor"
}

data:extend({
    creep_tumor,
    creep_tumor_item,
    creep_tumor_recipe
})
