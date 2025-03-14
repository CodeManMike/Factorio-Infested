-- Zerg Factorio Space Age
-- Mod Settings

data:extend({
    -- Startup settings (require game restart)
    {
        type = "bool-setting",
        name = "zerg-replace-player-character",
        setting_type = "startup",
        default_value = true,
        order = "a"
    },
    {
        type = "bool-setting",
        name = "zerg-enable-creep-mechanics",
        setting_type = "startup",
        default_value = true,
        order = "b"
    },
    {
        type = "double-setting",
        name = "zerg-creep-spread-rate",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 5.0,
        order = "c"
    },
    {
        type = "bool-setting",
        name = "zerg-enable-biter-assimilation",
        setting_type = "startup",
        default_value = true,
        order = "d"
    },

    -- Runtime settings (can be changed during gameplay)
    {
        type = "bool-setting",
        name = "zerg-auto-spread-creep",
        setting_type = "runtime-global",
        default_value = true,
        order = "a"
    },
    {
        type = "int-setting",
        name = "zerg-max-creep-distance",
        setting_type = "runtime-global",
        default_value = 50,
        minimum_value = 10,
        maximum_value = 200,
        order = "b"
    },
    {
        type = "bool-setting",
        name = "zerg-buildings-require-creep",
        setting_type = "runtime-global",
        default_value = true,
        order = "c"
    },
    {
        type = "double-setting",
        name = "zerg-evolution-rate",
        setting_type = "runtime-global",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 5.0,
        order = "d"
    },

    -- Per-player settings
    {
        type = "bool-setting",
        name = "zerg-show-creep-overlay",
        setting_type = "runtime-per-user",
        default_value = true,
        order = "a"
    },
    {
        type = "bool-setting",
        name = "zerg-enable-sound-effects",
        setting_type = "runtime-per-user",
        default_value = true,
        order = "b"
    },
    {
        type = "string-setting",
        name = "zerg-color-theme",
        setting_type = "runtime-per-user",
        default_value = "purple",
        allowed_values = {"purple", "red", "green", "blue"},
        order = "c"
    }
})
