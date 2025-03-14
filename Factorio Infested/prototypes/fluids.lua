-- Factorio Infested Space Age
-- Fluid Prototypes

data:extend({
    -- Creep (biological terrain fluid)
    {
        type = "fluid",
        name = "creep",
        default_temperature = 25,
        max_temperature = 100,
        heat_capacity = "0.2KJ",
        base_color = {r=0.5, g=0.1, b=0.5},
        flow_color = {r=0.7, g=0.2, b=0.7},
        icon = "__infested_factorio_space_age__/graphics/icons/fluid/creep.png",
        icon_size = 64,
        order = "a[fluid]-a[creep]"
    },

    -- Organic Fluids (oil-infused biomass fluid)
    {
        type = "fluid",
        name = "organic-fluids",
        default_temperature = 25,
        max_temperature = 100,
        heat_capacity = "0.3KJ",
        base_color = {r=0.4, g=0.1, b=0.4},
        flow_color = {r=0.6, g=0.2, b=0.6},
        icon = "__infested_factorio_space_age__/graphics/icons/fluid/organic-fluids.png",
        icon_size = 64,
        order = "a[fluid]-b[organic-fluids]"
    },

    -- Venom (offensive fluid)
    {
        type = "fluid",
        name = "venom",
        default_temperature = 25,
        max_temperature = 100,
        heat_capacity = "0.1KJ",
        base_color = {r=0.2, g=0.8, b=0.2},
        flow_color = {r=0.3, g=0.9, b=0.3},
        icon = "__infested_factorio_space_age__/graphics/icons/fluid/venom.png",
        icon_size = 64,
        order = "a[fluid]-c[venom]"
    },

    -- Bio-Fuel (energy source)
    {
        type = "fluid",
        name = "bio-fuel",
        default_temperature = 25,
        max_temperature = 100,
        heat_capacity = "0.5KJ",
        base_color = {r=0.8, g=0.4, b=0.0},
        flow_color = {r=0.9, g=0.5, b=0.1},
        icon = "__infested_factorio_space_age__/graphics/icons/fluid/bio-fuel.png",
        icon_size = 64,
        fuel_value = "1.5MJ",
        order = "a[fluid]-d[bio-fuel]"
    }
})
