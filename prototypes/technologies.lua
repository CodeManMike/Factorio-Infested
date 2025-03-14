-- Factorio Infested Space Age
-- Technology Prototypes

data:extend({
    -- Infestation (initial technology)
    {
        type = "technology",
        name = "infestation",
        icon = "__infested_factorio_space_age__/graphics/technology/infestation.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "process-biomass"
            },
            {
                type = "unlock-recipe",
                recipe = "creep-tumor"
            },
            {
                type = "unlock-recipe",
                recipe = "creep-production"
            }
        },
        unit = {
            count = 30,
            ingredients = {
                {"automation-science-pack", 1}
            },
            time = 30
        },
        order = "z-a"
    },

    -- Resource Infusion (basic resource integration)
    {
        type = "technology",
        name = "resource-infusion",
        icon = "__infested_factorio_space_age__/graphics/technology/resource-infusion.png",
        icon_size = 256,
        prerequisites = {"infestation"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "carapace-plating"
            },
            {
                type = "unlock-recipe",
                recipe = "neural-conduits"
            },
            {
                type = "unlock-recipe",
                recipe = "enzymatic-catalyst"
            }
        },
        unit = {
            count = 40,
            ingredients = {
                {"automation-science-pack", 1}
            },
            time = 30
        },
        order = "z-b"
    },

    -- Building Infestation (Infested buildings)
    {
        type = "technology",
        name = "building-infestation",
        icon = "__infested_factorio_space_age__/graphics/technology/building-infestation.png",
        icon_size = 256,
        prerequisites = {"resource-infusion"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "infested-assembling-machine"
            },
            {
                type = "unlock-recipe",
                recipe = "infested-mining-drill"
            },
            {
                type = "unlock-recipe",
                recipe = "infested-furnace"
            },
            {
                type = "unlock-recipe",
                recipe = "infested-lab"
            }
        },
        unit = {
            count = 50,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 30
        },
        order = "z-c"
    },

    -- Advanced Resource Processing (oil and fluid integration)
    {
        type = "technology",
        name = "advanced-resource-processing",
        icon = "__infested_factorio_space_age__/graphics/technology/advanced-resource-processing.png",
        icon_size = 256,
        prerequisites = {"building-infestation", "oil-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "organic-fluids"
            },
            {
                type = "unlock-recipe",
                recipe = "carapace"
            },
            {
                type = "unlock-recipe",
                recipe = "bio-acid"
            },
            {
                type = "unlock-recipe",
                recipe = "bio-enzyme"
            }
        },
        unit = {
            count = 75,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 45
        },
        order = "z-d"
    },

    -- Evolution 1 (Basic)
    {
        type = "technology",
        name = "evolution-1",
        icon = "__infested_factorio_space_age__/graphics/technology/evolution-1.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "evolution-chamber"
            },
            {
                type = "unlock-recipe",
                recipe = "spine-crawler"
            },
            {
                type = "unlock-recipe",
                recipe = "spore-crawler"
            }
        },
        prerequisites = {"advanced-resource-processing"},
        unit = {
            count = 75,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 30
        },
        order = "z-e"
    },

    -- Genetic Analysis (Biter processing)
    {
        type = "technology",
        name = "genetic-analysis",
        icon = "__infested_factorio_space_age__/graphics/technology/genetic-analysis.png",
        icon_size = 256,
        prerequisites = {"evolution-1", "military-science-pack"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "extract-genetic-data"
            },
            {
                type = "unlock-recipe",
                recipe = "process-biter-flesh"
            },
            {
                type = "unlock-recipe",
                recipe = "swarm-drone"
            }
        },
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 45
        },
        order = "z-f"
    },

    -- Evolution 2 (Advanced)
    {
        type = "technology",
        name = "evolution-2",
        icon = "__infested_factorio_space_age__/graphics/technology/evolution-2.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "hunter-den"
            },
            {
                type = "unlock-recipe",
                recipe = "nydus-network"
            }
        },
        prerequisites = {"evolution-1", "logistics-2"},
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 45
        },
        order = "z-g"
    },

    -- Adaptation (Environmental adaptations)
    {
        type = "technology",
        name = "adaptation",
        icon = "__infested_factorio_space_age__/graphics/technology/adaptation.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "venom-production"
            },
            {
                type = "unlock-recipe",
                recipe = "bio-fuel-production"
            }
        },
        prerequisites = {"evolution-1", "genetic-analysis"},
        unit = {
            count = 50,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 30
        },
        order = "z-h"
    },

    -- Evolution 3 (Superior)
    {
        type = "technology",
        name = "evolution-3",
        icon = "__infested_factorio_space_age__/graphics/technology/evolution-3.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "infestation-pit"
            },
            {
                type = "unlock-recipe",
                recipe = "flyer-spire"
            }
        },
        prerequisites = {"evolution-2", "chemical-science-pack"},
        unit = {
            count = 150,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            },
            time = 60
        },
        order = "z-i"
    },

    -- Mutation (Specialized adaptations)
    {
        type = "technology",
        name = "mutation",
        icon = "__infested_factorio_space_age__/graphics/technology/mutation.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "bio-toxin"
            }
        },
        prerequisites = {"adaptation", "evolution-3", "chemical-science-pack"},
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            },
            time = 45
        },
        order = "z-j"
    },

    -- Hyper Evolution (Uranium integration)
    {
        type = "technology",
        name = "hyper-evolution",
        icon = "__infested_factorio_space_age__/graphics/technology/hyper-evolution.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "hyper-evolutionary-dna"
            }
        },
        prerequisites = {"mutation", "uranium-processing", "production-science-pack"},
        unit = {
            count = 150,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1}
            },
            time = 60
        },
        order = "z-k"
    },

    -- Assimilation (Biter genetic assimilation)
    {
        type = "technology",
        name = "assimilation",
        icon = "__infested_factorio_space_age__/graphics/technology/assimilation.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "greater-spire"
            },
            {
                type = "unlock-recipe",
                recipe = "behemoth-cavern"
            }
        },
        prerequisites = {"evolution-3", "hyper-evolution", "genetic-analysis"},
        unit = {
            count = 200,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1}
            },
            time = 60
        },
        order = "z-l"
    },

    -- Space Adaptation (Space Age integration)
    {
        type = "technology",
        name = "space-adaptation",
        icon = "__infested_factorio_space_age__/graphics/technology/space-adaptation.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "leviathan-chrysalis"
            }
        },
        prerequisites = {"assimilation", "space-science-pack"},
        unit = {
            count = 500,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1}
            },
            time = 60
        },
        order = "z-m"
    }
})
