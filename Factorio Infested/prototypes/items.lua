-- Factorio Infested Space Age
-- Item Prototypes

data:extend({
    -- Genetic Data (special item for evolution)
    {
        type = "item",
        name = "genetic-data",
        icon = "__infested_factorio_space_age__/graphics/icons/genetic-data.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "a[genetic-data]",
        stack_size = 1000,
        flags = {"hidden"}
    },

    -- Biomass (basic building material)
    {
        type = "item",
        name = "biomass",
        icon = "__infested_factorio_space_age__/graphics/icons/biomass.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "b[biomass]",
        stack_size = 200,
        fuel_category = "bio-fuel",
        fuel_value = "4MJ",
        burnt_result = "bio-enzyme"
    },

    -- Resource-Infused Materials

    -- Carapace Plating (iron-infused biomass)
    {
        type = "item",
        name = "carapace-plating",
        icon = "__infested_factorio_space_age__/graphics/icons/carapace-plating.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "c[carapace-plating]",
        stack_size = 100
    },

    -- Neural Conduits (copper-infused biomass)
    {
        type = "item",
        name = "neural-conduits",
        icon = "__infested_factorio_space_age__/graphics/icons/neural-conduits.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "d[neural-conduits]",
        stack_size = 100
    },

    -- Enzymatic Catalyst (coal-infused biomass)
    {
        type = "item",
        name = "enzymatic-catalyst",
        icon = "__infested_factorio_space_age__/graphics/icons/enzymatic-catalyst.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "e[enzymatic-catalyst]",
        stack_size = 100,
        fuel_category = "bio-fuel",
        fuel_value = "8MJ"
    },

    -- Hyper-Evolutionary DNA (uranium-infused biomass)
    {
        type = "item",
        name = "hyper-evolutionary-dna",
        icon = "__infested_factorio_space_age__/graphics/icons/hyper-evolutionary-dna.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "f[hyper-evolutionary-dna]",
        stack_size = 20
    },

    -- Advanced Hive Materials

    -- Carapace (defensive material)
    {
        type = "item",
        name = "carapace",
        icon = "__infested_factorio_space_age__/graphics/icons/carapace.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "g[carapace]",
        stack_size = 100
    },

    -- Acid (offensive material)
    {
        type = "item",
        name = "bio-acid",
        icon = "__infested_factorio_space_age__/graphics/icons/acid.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "h[acid]",
        stack_size = 100
    },

    -- Toxin (advanced compound)
    {
        type = "item",
        name = "bio-toxin",
        icon = "__infested_factorio_space_age__/graphics/icons/toxin.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "i[toxin]",
        stack_size = 50
    },

    -- Enzyme (catalytic material)
    {
        type = "item",
        name = "bio-enzyme",
        icon = "__infested_factorio_space_age__/graphics/icons/enzyme.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "j[enzyme]",
        stack_size = 100
    },

    -- Biter Flesh (raw material from biters)
    {
        type = "item",
        name = "biter-flesh",
        icon = "__infested_factorio_space_age__/graphics/icons/biter-flesh.png",
        icon_size = 64,
        subgroup = "hive-biomaterials",
        order = "k[biter-flesh]",
        stack_size = 100
    }
})
