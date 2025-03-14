-- Zerg Factorio Space Age
-- Recipe Prototypes

data:extend({
    -- Basic Zerg Buildings
    {
        type = "recipe",
        name = "zerg-hatchery",
        enabled = true, -- Available from the start
        energy_required = 10,
        ingredients = {
            {"iron-plate", 20},
            {"copper-plate", 10},
            {"electronic-circuit", 5}
        },
        result = "zerg-hatchery"
    },
    {
        type = "recipe",
        name = "zerg-spawning-pool",
        enabled = false, -- Unlocked by technology
        energy_required = 15,
        ingredients = {
            {"zerg-hatchery", 1},
            {"biomass", 50},
            {"electronic-circuit", 10}
        },
        result = "zerg-spawning-pool"
    },
    {
        type = "recipe",
        name = "zerg-evolution-chamber",
        enabled = false, -- Unlocked by technology
        energy_required = 20,
        ingredients = {
            {"biomass", 100},
            {"zerg-carapace", 20},
            {"advanced-circuit", 5}
        },
        result = "zerg-evolution-chamber"
    },

    -- Defensive Structures
    {
        type = "recipe",
        name = "zerg-spine-crawler",
        enabled = false, -- Unlocked by technology
        energy_required = 10,
        ingredients = {
            {"biomass", 30},
            {"zerg-acid", 10},
            {"iron-plate", 5}
        },
        result = "zerg-spine-crawler"
    },
    {
        type = "recipe",
        name = "zerg-spore-crawler",
        enabled = false, -- Unlocked by technology
        energy_required = 10,
        ingredients = {
            {"biomass", 30},
            {"zerg-acid", 10},
            {"copper-plate", 5}
        },
        result = "zerg-spore-crawler"
    },
    {
        type = "recipe",
        name = "creep-tumor",
        enabled = true, -- Available once you have a hatchery
        energy_required = 5,
        ingredients = {
            {"biomass", 20}
        },
        result = "creep-tumor"
    },

    -- Advanced Zerg Buildings
    {
        type = "recipe",
        name = "zerg-hydralisk-den",
        enabled = false, -- Unlocked by technology
        energy_required = 30,
        ingredients = {
            {"biomass", 150},
            {"zerg-carapace", 50},
            {"zerg-acid", 30},
            {"advanced-circuit", 10}
        },
        result = "zerg-hydralisk-den"
    },
    {
        type = "recipe",
        name = "zerg-nydus-network",
        enabled = false, -- Unlocked by technology
        energy_required = 45,
        ingredients = {
            {"biomass", 200},
            {"zerg-carapace", 100},
            {"advanced-circuit", 20},
            {"steel-plate", 50}
        },
        result = "zerg-nydus-network"
    },
    {
        type = "recipe",
        name = "zerg-infestation-pit",
        enabled = false, -- Unlocked by technology
        energy_required = 60,
        ingredients = {
            {"biomass", 300},
            {"zerg-toxin", 50},
            {"zerg-enzyme", 50},
            {"processing-unit", 10}
        },
        result = "zerg-infestation-pit"
    },
    {
        type = "recipe",
        name = "zerg-spire",
        enabled = false, -- Unlocked by technology
        energy_required = 60,
        ingredients = {
            {"biomass", 250},
            {"zerg-carapace", 100},
            {"zerg-acid", 50},
            {"processing-unit", 15}
        },
        result = "zerg-spire"
    },

    -- End-game Zerg Buildings
    {
        type = "recipe",
        name = "zerg-greater-spire",
        enabled = false, -- Unlocked by technology
        energy_required = 90,
        ingredients = {
            {"zerg-spire", 1},
            {"biomass", 500},
            {"zerg-toxin", 100},
            {"processing-unit", 30}
        },
        result = "zerg-greater-spire"
    },
    {
        type = "recipe",
        name = "zerg-ultralisk-cavern",
        enabled = false, -- Unlocked by technology
        energy_required = 90,
        ingredients = {
            {"biomass", 600},
            {"zerg-carapace", 200},
            {"zerg-acid", 100},
            {"processing-unit", 25}
        },
        result = "zerg-ultralisk-cavern"
    },
    {
        type = "recipe",
        name = "zerg-leviathan-chrysalis",
        enabled = false, -- Unlocked by technology
        energy_required = 120,
        ingredients = {
            {"biomass", 1000},
            {"zerg-carapace", 500},
            {"zerg-toxin", 200},
            {"zerg-enzyme", 200},
            {"processing-unit", 100},
            {"low-density-structure", 50}
        },
        result = "zerg-leviathan-chrysalis"
    },

    -- Biomaterials
    {
        type = "recipe",
        name = "biomass",
        enabled = true, -- Available from the start
        category = "crafting",
        energy_required = 1,
        ingredients = {
            {"raw-wood", 5}
        },
        result = "biomass",
        result_count = 1
    },
    {
        type = "recipe",
        name = "biomass-advanced",
        enabled = true, -- Available from the start
        category = "crafting",
        energy_required = 3,
        ingredients = {
            {"raw-wood", 2},
            {"coal", 1}
        },
        result = "biomass",
        result_count = 3
    },
    {
        type = "recipe",
        name = "zerg-carapace",
        enabled = false, -- Unlocked by technology
        category = "crafting",
        energy_required = 5,
        ingredients = {
            {"biomass", 10},
            {"iron-plate", 2}
        },
        result = "zerg-carapace",
        result_count = 1
    },
    {
        type = "recipe",
        name = "zerg-acid",
        enabled = false, -- Unlocked by technology
        category = "chemistry",
        energy_required = 5,
        ingredients = {
            {"biomass", 10},
            {type="fluid", name="sulfuric-acid", amount=20}
        },
        result = "zerg-acid",
        result_count = 1
    },
    {
        type = "recipe",
        name = "zerg-toxin",
        enabled = false, -- Unlocked by technology
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {"zerg-acid", 5},
            {"zerg-carapace", 2},
            {type="fluid", name="venom", amount=20}
        },
        result = "zerg-toxin",
        result_count = 1
    },
    {
        type = "recipe",
        name = "zerg-enzyme",
        enabled = false, -- Unlocked by technology
        category = "chemistry",
        energy_required = 8,
        ingredients = {
            {"biomass", 20},
            {type="fluid", name="water", amount=50}
        },
        result = "zerg-enzyme",
        result_count = 1
    },

    -- Fluid recipes
    {
        type = "recipe",
        name = "creep-production",
        category = "chemistry",
        enabled = true,
        energy_required = 5,
        ingredients = {
            {"biomass", 5},
            {type="fluid", name="water", amount=100}
        },
        results = {
            {type="fluid", name="creep", amount=100}
        }
    },
    {
        type = "recipe",
        name = "venom-production",
        category = "chemistry",
        enabled = false, -- Unlocked by technology
        energy_required = 10,
        ingredients = {
            {"zerg-acid", 2},
            {type="fluid", name="sulfuric-acid", amount=50}
        },
        results = {
            {type="fluid", name="venom", amount=50}
        }
    },
    {
        type = "recipe",
        name = "bio-fuel-production",
        category = "chemistry",
        enabled = false, -- Unlocked by technology
        energy_required = 15,
        ingredients = {
            {"biomass", 10},
            {"zerg-enzyme", 1},
            {type="fluid", name="crude-oil", amount=100}
        },
        results = {
            {type="fluid", name="bio-fuel", amount=100}
        }
    }
})

-- Define recipe categories
data:extend({
    {
        type = "recipe-category",
        name = "zerg-morphing"
    },
    {
        type = "recipe-category",
        name = "zerg-evolution"
    }
})

-- Resource-Infused Materials
data:extend({
    -- Carapace Plating (Iron-infused biomass)
    {
        type = "recipe",
        name = "carapace-plating",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        category = "crafting",
        ingredients = {
            {"biomass", 10},
            {"iron-plate", 5}
        },
        result = "carapace-plating",
        result_count = 2
    },
    -- Neural Conduits (Copper-infused biomass)
    {
        type = "recipe",
        name = "neural-conduits",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        category = "crafting",
        ingredients = {
            {"biomass", 10},
            {"copper-plate", 5}
        },
        result = "neural-conduits",
        result_count = 2
    },
    -- Enzymatic Catalyst (Coal-infused biomass)
    {
        type = "recipe",
        name = "enzymatic-catalyst",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        category = "crafting",
        ingredients = {
            {"biomass", 10},
            {"coal", 5}
        },
        result = "enzymatic-catalyst",
        result_count = 2
    },
    -- Organic Fluids (Oil-infused biomass)
    {
        type = "recipe",
        name = "organic-fluids",
        energy_required = 10,
        enabled = false, -- Unlocked by technology
        category = "chemistry",
        ingredients = {
            {"biomass", 20},
            {type="fluid", name="crude-oil", amount=50}
        },
        results = {
            {type="fluid", name="organic-fluids", amount=50}
        }
    },
    -- Hyper-Evolutionary DNA (Uranium-infused biomass)
    {
        type = "recipe",
        name = "hyper-evolutionary-dna",
        energy_required = 20,
        enabled = false, -- Unlocked by technology
        category = "crafting",
        ingredients = {
            {"biomass", 50},
            {"uranium-235", 1},
            {"uranium-238", 5}
        },
        result = "hyper-evolutionary-dna",
        result_count = 1
    }
})

-- Creep Tumor recipe
data:extend({
    {
        type = "recipe",
        name = "creep-tumor",
        energy_required = 5,
        enabled = true,
        ingredients = {
            {"biomass", 10}
        },
        result = "creep-tumor"
    }
})

-- Biomass processing recipes
data:extend({
    {
        type = "recipe",
        name = "process-biomass",
        energy_required = 2,
        enabled = true,
        category = "crafting",
        ingredients = {
            {"raw-wood", 5},
            {"coal", 1}
        },
        result = "biomass",
        result_count = 3
    },
    {
        type = "recipe",
        name = "process-biter-flesh",
        energy_required = 3,
        enabled = true,
        category = "crafting",
        ingredients = {
            {"biter-flesh", 1}
        },
        result = "biomass",
        result_count = 5
    },
    {
        type = "recipe",
        name = "extract-genetic-data",
        energy_required = 5,
        enabled = true,
        category = "zerg-evolution",
        ingredients = {
            {"biter-flesh", 5},
            {"biomass", 10}
        },
        result = "genetic-data",
        result_count = 1
    }
})

-- Updated Zerg materials recipes using the new resource-infused materials
data:extend({
    {
        type = "recipe",
        name = "zerg-carapace",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        category = "zerg-morphing",
        ingredients = {
            {"carapace-plating", 2},
            {"enzymatic-catalyst", 1}
        },
        result = "zerg-carapace",
        result_count = 1
    },
    {
        type = "recipe",
        name = "zerg-acid",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        category = "zerg-morphing",
        ingredients = {
            {"enzymatic-catalyst", 1},
            {type="fluid", name="organic-fluids", amount=10},
            {"sulfur", 2}
        },
        result = "zerg-acid",
        result_count = 1
    },
    {
        type = "recipe",
        name = "zerg-toxin",
        energy_required = 8,
        enabled = false, -- Unlocked by technology
        category = "zerg-morphing",
        ingredients = {
            {"zerg-acid", 2},
            {"hyper-evolutionary-dna", 1},
            {"biomass", 10}
        },
        result = "zerg-toxin",
        result_count = 1
    },
    {
        type = "recipe",
        name = "zerg-enzyme",
        energy_required = 3,
        enabled = false, -- Unlocked by technology
        category = "zerg-morphing",
        ingredients = {
            {"enzymatic-catalyst", 2},
            {"biomass", 5}
        },
        result = "zerg-enzyme",
        result_count = 1
    }
})

-- Fluid recipes
data:extend({
    {
        type = "recipe",
        name = "creep-production",
        energy_required = 1,
        enabled = true,
        category = "zerg-morphing",
        ingredients = {
            {"biomass", 1}
        },
        results = {
            {type = "fluid", name = "creep", amount = 20}
        }
    },
    {
        type = "recipe",
        name = "venom-production",
        energy_required = 3,
        enabled = false, -- Unlocked by technology
        category = "zerg-morphing",
        ingredients = {
            {"zerg-acid", 1},
            {type="fluid", name="organic-fluids", amount=10}
        },
        results = {
            {type = "fluid", name = "venom", amount = 20}
        }
    },
    {
        type = "recipe",
        name = "bio-fuel-production",
        energy_required = 2,
        enabled = false, -- Unlocked by technology
        category = "zerg-morphing",
        ingredients = {
            {"enzymatic-catalyst", 1},
            {type="fluid", name="organic-fluids", amount=20}
        },
        results = {
            {type = "fluid", name = "bio-fuel", amount = 30}
        }
    }
})

-- Infested building recipes
data:extend({
    -- Infested Assembling Machine
    {
        type = "recipe",
        name = "infested-assembling-machine",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        ingredients = {
            {"assembling-machine-2", 1},
            {"biomass", 15},
            {"carapace-plating", 5}
        },
        result = "infested-assembling-machine"
    },
    -- Infested Mining Drill
    {
        type = "recipe",
        name = "infested-mining-drill",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        ingredients = {
            {"electric-mining-drill", 1},
            {"biomass", 10},
            {"enzymatic-catalyst", 5}
        },
        result = "infested-mining-drill"
    },
    -- Infested Furnace
    {
        type = "recipe",
        name = "infested-furnace",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        ingredients = {
            {"steel-furnace", 1},
            {"biomass", 10},
            {type="fluid", name="organic-fluids", amount=20}
        },
        result = "infested-furnace"
    },
    -- Infested Lab
    {
        type = "recipe",
        name = "infested-lab",
        energy_required = 5,
        enabled = false, -- Unlocked by technology
        ingredients = {
            {"lab", 1},
            {"biomass", 15},
            {"neural-conduits", 10}
        },
        result = "infested-lab"
    }
})

-- Zerg Drone recipe
data:extend({
    {
        type = "recipe",
        name = "zerg-drone",
        energy_required = 10,
        enabled = false, -- Unlocked by technology
        category = "zerg-morphing",
        ingredients = {
            {"biomass", 20},
            {"carapace-plating", 5},
            {"neural-conduits", 5}
        },
        result = "zerg-drone"
    }
})
