local Constants = require("scripts.util.constants")

local times = Constants.RECIPES.TIMES

data:extend({
  {
    type = "recipe",
    name = "ichor-recipe-raw-biomass",
    category = "ichor-category-nutrient-processing",
    subgroup = "ichor-subgroup-raw",
    enabled = false,
    energy_required = times.RAW_BIOMASS,
    ingredients = {
      {type = "item", name = "wood", amount = 2}
    },
    results = {
      {type = "item", name = "ichor-raw-biomass", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-nutrient-slurry",
    category = "ichor-category-nutrient-processing",
    subgroup = "ichor-subgroup-fluids",
    enabled = false,
    energy_required = times.NUTRIENT_SLURRY,
    ingredients = {
      {type = "item", name = "ichor-raw-biomass", amount = 2},
      {type = "fluid", name = "water", amount = 20}
    },
    results = {
      {type = "fluid", name = "ichor-nutrient-slurry", amount = 20}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-bio-forged-iron-plate",
    category = "ichor-category-digestion",
    subgroup = "ichor-subgroup-biomass",
    enabled = false,
    energy_required = times.BIO_FORGED_IRON_PLATE,
    ingredients = {
      {type = "item", name = "iron-ore", amount = 2},
      {type = "item", name = "ichor-raw-biomass", amount = 1}
    },
    results = {
      {type = "item", name = "ichor-bio-forged-iron-plate", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-bio-forged-copper-plate",
    category = "ichor-category-digestion",
    subgroup = "ichor-subgroup-biomass",
    enabled = false,
    energy_required = times.BIO_FORGED_COPPER_PLATE,
    ingredients = {
      {type = "item", name = "copper-ore", amount = 2},
      {type = "item", name = "ichor-raw-biomass", amount = 1}
    },
    results = {
      {type = "item", name = "ichor-bio-forged-copper-plate", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-growth-chamber-1",
    category = "crafting",
    subgroup = "ichor-subgroup-production",
    enabled = false,
    energy_required = times.GROWTH_CHAMBER_1,
    ingredients = {
      {type = "item", name = "ichor-bio-forged-iron-plate", amount = 4},
      {type = "item", name = "ichor-raw-biomass", amount = 4}
    },
    results = {
      {type = "item", name = "ichor-growth-chamber-1", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-substrate-node",
    category = "crafting",
    subgroup = "ichor-subgroup-production",
    enabled = false,
    energy_required = times.SUBSTRATE_NODE,
    ingredients = {
      {type = "item", name = "ichor-raw-biomass", amount = 6},
      {type = "item", name = "stone", amount = 4}
    },
    results = {
      {type = "item", name = "ichor-substrate-node", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-neural-pylon-1",
    category = "crafting",
    subgroup = "ichor-subgroup-neural",
    enabled = false,
    energy_required = times.NEURAL_PYLON_1,
    ingredients = {
      {type = "item", name = "ichor-bio-forged-iron-plate", amount = 2},
      {type = "item", name = "copper-cable", amount = 4}
    },
    results = {
      {type = "item", name = "ichor-neural-pylon-1", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-science-biomass",
    category = "ichor-category-growth",
    subgroup = "ichor-subgroup-research",
    enabled = false,
    energy_required = times.SCIENCE_BIOMASS,
    ingredients = {
      {type = "item", name = "ichor-raw-biomass", amount = 4},
      {type = "fluid", name = "ichor-nutrient-slurry", amount = 10}
    },
    results = {
      {type = "item", name = "ichor-science-biomass", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-hive-core",
    category = "crafting",
    subgroup = "ichor-subgroup-production",
    enabled = true,
    energy_required = times.HIVE_CORE,
    ingredients = {
      {type = "item", name = "ichor-raw-biomass", amount = 10},
      {type = "item", name = "stone-furnace", amount = 1}
    },
    results = {
      {type = "item", name = "ichor-hive-core", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-nutrient-vat-1",
    category = "crafting",
    subgroup = "ichor-subgroup-production",
    enabled = false,
    energy_required = times.NUTRIENT_VAT_1,
    ingredients = {
      {type = "item", name = "ichor-bio-forged-iron-plate", amount = 4},
      {type = "item", name = "ichor-raw-biomass", amount = 6},
      {type = "item", name = "pipe", amount = 2}
    },
    results = {
      {type = "item", name = "ichor-nutrient-vat-1", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-digestive-smelter-1",
    category = "crafting",
    subgroup = "ichor-subgroup-production",
    enabled = false,
    energy_required = times.DIGESTIVE_SMELTER_1,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 6},
      {type = "item", name = "ichor-raw-biomass", amount = 4},
      {type = "item", name = "stone-furnace", amount = 1}
    },
    results = {
      {type = "item", name = "ichor-digestive-smelter-1", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-tendril-1",
    category = "crafting",
    subgroup = "ichor-subgroup-logistics",
    enabled = false,
    energy_required = times.TENDRIL_1,
    ingredients = {
      {type = "item", name = "ichor-raw-biomass", amount = 2},
      {type = "item", name = "iron-gear-wheel", amount = 1}
    },
    results = {
      {type = "item", name = "ichor-tendril-1", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-tendon-track-1",
    category = "crafting",
    subgroup = "ichor-subgroup-logistics",
    enabled = false,
    energy_required = times.TENDON_TRACK_1,
    ingredients = {
      {type = "item", name = "ichor-raw-biomass", amount = 1},
      {type = "item", name = "iron-plate", amount = 1}
    },
    results = {
      {type = "item", name = "ichor-tendon-track-1", amount = 2}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-crude-vein",
    category = "crafting",
    subgroup = "ichor-subgroup-logistics",
    enabled = false,
    energy_required = times.CRUDE_VEIN,
    ingredients = {
      {type = "item", name = "ichor-raw-biomass", amount = 1},
      {type = "item", name = "pipe", amount = 1}
    },
    results = {
      {type = "item", name = "ichor-crude-vein", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "ichor-recipe-bladder-tank-1",
    category = "crafting",
    subgroup = "ichor-subgroup-logistics",
    enabled = false,
    energy_required = times.BLADDER_TANK_1,
    ingredients = {
      {type = "item", name = "ichor-bio-forged-iron-plate", amount = 4},
      {type = "item", name = "ichor-raw-biomass", amount = 4},
      {type = "item", name = "storage-tank", amount = 1}
    },
    results = {
      {type = "item", name = "ichor-bladder-tank-1", amount = 1}
    }
  }
})
