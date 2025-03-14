-- Zerg Factorio Space Age
-- Sound Prototypes

-- Define sound effects for Zerg entities and actions
data:extend({
    -- Zerg building placement sound
    {
        type = "sound",
        name = "zerg-building-place",
        filename = "__zerg_factorio_space_age__/sounds/zerg-building-place.ogg",
        volume = 0.8
    },

    -- Zerg building working sound
    {
        type = "sound",
        name = "zerg-building-working",
        filename = "__zerg_factorio_space_age__/sounds/zerg-building-working.ogg",
        volume = 0.6
    },

    -- Zerg drone sound
    {
        type = "sound",
        name = "zerg-drone",
        filename = "__zerg_factorio_space_age__/sounds/zerg-drone.ogg",
        volume = 0.7
    },

    -- Zerg attack sound
    {
        type = "sound",
        name = "zerg-attack",
        filename = "__zerg_factorio_space_age__/sounds/zerg-attack.ogg",
        volume = 0.8
    },

    -- Zerg death sound
    {
        type = "sound",
        name = "zerg-death",
        filename = "__zerg_factorio_space_age__/sounds/zerg-death.ogg",
        volume = 0.7
    },

    -- Creep spread sound
    {
        type = "sound",
        name = "creep-spread",
        filename = "__zerg_factorio_space_age__/sounds/creep-spread.ogg",
        volume = 0.5
    },

    -- Biomass collection sound
    {
        type = "sound",
        name = "biomass-collection",
        filename = "__zerg_factorio_space_age__/sounds/biomass-collection.ogg",
        volume = 0.6
    },

    -- Evolution complete sound
    {
        type = "sound",
        name = "evolution-complete",
        filename = "__zerg_factorio_space_age__/sounds/evolution-complete.ogg",
        volume = 0.9
    },

    -- Zerg alert sound
    {
        type = "sound",
        name = "zerg-alert",
        filename = "__zerg_factorio_space_age__/sounds/zerg-alert.ogg",
        volume = 0.8
    }
})

-- Define sound groups for entities
data:extend({
    -- Zerg building sounds
    {
        type = "sound",
        name = "zerg-building-sounds",
        variations = {
            {
                filename = "__zerg_factorio_space_age__/sounds/zerg-building-1.ogg",
                volume = 0.5
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/zerg-building-2.ogg",
                volume = 0.5
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/zerg-building-3.ogg",
                volume = 0.5
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/zerg-building-4.ogg",
                volume = 0.5
            }
        }
    },

    -- Zerg unit sounds
    {
        type = "sound",
        name = "zerg-unit-sounds",
        variations = {
            {
                filename = "__zerg_factorio_space_age__/sounds/zerg-unit-1.ogg",
                volume = 0.6
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/zerg-unit-2.ogg",
                volume = 0.6
            },
            {
                filename = "__zerg_factorio_space_age__/sounds/zerg-unit-3.ogg",
                volume = 0.6
            }
        }
    }
})
