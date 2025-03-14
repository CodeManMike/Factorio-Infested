-- Factorio Infested
-- Mod Settings

data:extend({
    -- Startup settings (require game restart)
    {
        type = "bool-setting",
        name = "infested-replace-player-character",
        setting_type = "startup",
        default_value = true,
        order = "a"
    },
    {
        type = "bool-setting",
        name = "infested-enable-creep-mechanics",
        setting_type = "startup",
        default_value = true,
        order = "b"
    },
    {
        type = "double-setting",
        name = "infested-creep-spread-rate",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 5.0,
        order = "c"
    },
    {
        type = "bool-setting",
        name = "infested-enable-biter-assimilation",
        setting_type = "startup",
        default_value = true,
        order = "d"
    },
    {
        type = "bool-setting",
        name = "infested-enable-biomass-economy",
        setting_type = "startup",
        default_value = true,
        order = "e"
    },
    {
        type = "bool-setting",
        name = "infested-enable-building-progression",
        setting_type = "startup",
        default_value = true,
        order = "f"
    },

    -- Runtime settings (can be changed during gameplay)
    {
        type = "bool-setting",
        name = "infested-auto-spread-creep",
        setting_type = "runtime-global",
        default_value = true,
        order = "a"
    },
    {
        type = "int-setting",
        name = "infested-max-creep-distance",
        setting_type = "runtime-global",
        default_value = 50,
        minimum_value = 10,
        maximum_value = 200,
        order = "b"
    },
    {
        type = "bool-setting",
        name = "infested-buildings-require-creep",
        setting_type = "runtime-global",
        default_value = true,
        order = "c"
    },
    {
        type = "double-setting",
        name = "infested-evolution-rate",
        setting_type = "runtime-global",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 5.0,
        order = "d"
    },
    {
        type = "int-setting",
        name = "infested-genetic-data-multiplier",
        setting_type = "runtime-global",
        default_value = 1,
        minimum_value = 1,
        maximum_value = 10,
        order = "e"
    },
    {
        type = "bool-setting",
        name = "infested-pollution-to-biomass",
        setting_type = "runtime-global",
        default_value = true,
        order = "f"
    },
    {
        type = "double-setting",
        name = "infested-pollution-conversion-rate",
        setting_type = "runtime-global",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 5.0,
        order = "g"
    },

    -- Per-player settings
    {
        type = "bool-setting",
        name = "infested-show-creep-overlay",
        setting_type = "runtime-per-user",
        default_value = true,
        order = "a"
    },
    {
        type = "bool-setting",
        name = "infested-enable-sound-effects",
        setting_type = "runtime-per-user",
        default_value = true,
        order = "b"
    },
    {
        type = "string-setting",
        name = "infested-color-theme",
        setting_type = "runtime-per-user",
        default_value = "purple",
        allowed_values = {"purple", "red", "brown", "green"},
        order = "c"
    },
    {
        type = "bool-setting",
        name = "infested-show-genetic-data-gui",
        setting_type = "runtime-per-user",
        default_value = true,
        order = "d"
    },
    {
        type = "bool-setting",
        name = "infested-show-biomass-gui",
        setting_type = "runtime-per-user",
        default_value = true,
        order = "e"
    }
})
