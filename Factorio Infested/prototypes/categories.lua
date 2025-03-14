-- Factorio Infested Space Age
-- Categories for items, recipes, and entities

data:extend({
    -- Item Groups
    {
        type = "item-group",
        name = "hive",
        order = "z",
        icon = "__infested_factorio_space_age__/graphics/item-group/hive.png",
        icon_size = 128
    },

    -- Item Subgroups
    {
        type = "item-subgroup",
        name = "hive-buildings",
        group = "hive",
        order = "a"
    },
    {
        type = "item-subgroup",
        name = "hive-production",
        group = "hive",
        order = "b"
    },
    {
        type = "item-subgroup",
        name = "hive-defense",
        group = "hive",
        order = "c"
    },
    {
        type = "item-subgroup",
        name = "hive-units",
        group = "hive",
        order = "d"
    },
    {
        type = "item-subgroup",
        name = "hive-biomaterials",
        group = "hive",
        order = "e"
    },
    {
        type = "item-subgroup",
        name = "hive-fluids",
        group = "hive",
        order = "f"
    },
    {
        type = "item-subgroup",
        name = "hive-infused-materials",
        group = "hive",
        order = "g"
    },

    -- Recipe Categories
    {
        type = "recipe-category",
        name = "evolution"
    },
    {
        type = "recipe-category",
        name = "mutation"
    },
    {
        type = "recipe-category",
        name = "spawning"
    },
    {
        type = "recipe-category",
        name = "morphing"
    },

    -- Entity Categories
    {
        type = "resource-category",
        name = "bio-extraction"
    },

    -- Fuel Categories
    {
        type = "fuel-category",
        name = "bio-fuel"
    },

    -- Equipment Categories
    {
        type = "equipment-category",
        name = "bio-equipment"
    }
})
