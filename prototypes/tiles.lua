-- Zerg Factorio Space Age
-- Tile Prototypes

data:extend({
    -- Creep Tile
    {
        type = "tile",
        name = "zerg-creep",
        needs_correction = false,
        minable = {hardness = 0.2, mining_time = 0.5, result = "biomass"},
        mined_sound = {filename = "__zerg_factorio_space_age__/sounds/creep-mined.ogg", volume = 0.8},
        collision_mask = {"ground-tile"},
        walking_speed_modifier = 1.3, -- Move faster on creep
        vehicle_friction_modifier = 1.5, -- Vehicles move slower on creep
        decorative_removal_probability = 0.9,
        layer = 61,
        variants = {
            main = {
                {
                    picture = "__zerg_factorio_space_age__/graphics/terrain/creep/creep1.png",
                    count = 16,
                    size = 1
                },
                {
                    picture = "__zerg_factorio_space_age__/graphics/terrain/creep/creep2.png",
                    count = 16,
                    size = 2,
                    probability = 0.39
                },
                {
                    picture = "__zerg_factorio_space_age__/graphics/terrain/creep/creep4.png",
                    count = 16,
                    size = 4,
                    probability = 1
                }
            },
            inner_corner = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/creep/creep-inner-corner.png",
                count = 8
            },
            outer_corner = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/creep/creep-outer-corner.png",
                count = 8
            },
            side = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/creep/creep-side.png",
                count = 8
            },
            u_transition = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/creep/creep-u.png",
                count = 8
            },
            o_transition = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/creep/creep-o.png",
                count = 1
            }
        },
        map_color = {r = 0.5, g = 0.1, b = 0.5},
        ageing = 0.0006, -- Creep slowly decays if not maintained
        pollution_absorption_per_second = 0.001 -- Creep absorbs pollution
    },

    -- Mature Creep Tile (thicker, provides more benefits)
    {
        type = "tile",
        name = "zerg-mature-creep",
        needs_correction = false,
        minable = {hardness = 0.3, mining_time = 0.8, result = "biomass", count = 2},
        mined_sound = {filename = "__zerg_factorio_space_age__/sounds/creep-mined.ogg", volume = 0.8},
        collision_mask = {"ground-tile"},
        walking_speed_modifier = 1.5, -- Move even faster on mature creep
        vehicle_friction_modifier = 1.8, -- Vehicles move even slower on mature creep
        decorative_removal_probability = 1.0,
        layer = 61,
        variants = {
            main = {
                {
                    picture = "__zerg_factorio_space_age__/graphics/terrain/mature-creep/mature-creep1.png",
                    count = 16,
                    size = 1
                },
                {
                    picture = "__zerg_factorio_space_age__/graphics/terrain/mature-creep/mature-creep2.png",
                    count = 16,
                    size = 2,
                    probability = 0.39
                },
                {
                    picture = "__zerg_factorio_space_age__/graphics/terrain/mature-creep/mature-creep4.png",
                    count = 16,
                    size = 4,
                    probability = 1
                }
            },
            inner_corner = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/mature-creep/mature-creep-inner-corner.png",
                count = 8
            },
            outer_corner = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/mature-creep/mature-creep-outer-corner.png",
                count = 8
            },
            side = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/mature-creep/mature-creep-side.png",
                count = 8
            },
            u_transition = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/mature-creep/mature-creep-u.png",
                count = 8
            },
            o_transition = {
                picture = "__zerg_factorio_space_age__/graphics/terrain/mature-creep/mature-creep-o.png",
                count = 1
            }
        },
        map_color = {r = 0.6, g = 0.1, b = 0.6},
        ageing = 0.0003, -- Mature creep decays slower
        pollution_absorption_per_second = 0.002 -- Mature creep absorbs more pollution
    }
})

-- Add transition between creep and other tiles
local base_tiles = {"grass-1", "grass-2", "grass-3", "grass-4", "dirt-1", "dirt-2", "dirt-3", "dirt-4", "dirt-5", "dirt-6", "dirt-7", "sand-1", "sand-2", "sand-3", "dry-dirt", "concrete", "stone-path", "refined-concrete"}

for _, tile_name in pairs(base_tiles) do
    if data.raw.tile[tile_name] then
        -- Add transition from base tile to creep
        if not data.raw.tile[tile_name].transitions then
            data.raw.tile[tile_name].transitions = {}
        end

        table.insert(data.raw.tile[tile_name].transitions,
            {
                to_tiles = {"zerg-creep", "zerg-mature-creep"},
                transition_group = 0,
                transition_sprites = {
                    {
                        filename = "__zerg_factorio_space_age__/graphics/terrain/creep/creep-transition.png",
                        count = 8,
                        y = 0
                    }
                }
            }
        )
    end
end
