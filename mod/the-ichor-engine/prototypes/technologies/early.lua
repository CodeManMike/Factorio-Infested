local Graphics = require("prototypes.lib.graphics")

local function tech(name, order, count, time, prerequisites, effects, ingredients)
  return {
    type = "technology",
    name = name,
    icon = Graphics.tech(name),
    icon_size = 256,
    order = order,
    unit = {
      count = count,
      ingredients = ingredients or {
        {type = "item", name = "ichor-science-biomass", amount = 1}
      },
      time = time
    },
    prerequisites = prerequisites or {},
    effects = effects
  }
end

data:extend({
  tech("ichor-tech-first-feeding", "a[ichor-tech-first-feeding]", 5, 5, {}, {
    {type = "unlock-recipe", recipe = "ichor-recipe-raw-biomass"},
    {type = "unlock-recipe", recipe = "ichor-recipe-substrate-node"}
  }, {
    {type = "item", name = "wood", amount = 1}
  }),
  tech("ichor-tech-basic-bio-production", "b[ichor-tech-basic-bio-production]", 25, 15, {"ichor-tech-first-feeding"}, {
    {type = "unlock-recipe", recipe = "ichor-recipe-nutrient-slurry"},
    {type = "unlock-recipe", recipe = "ichor-recipe-digestive-smelter-1"},
    {type = "unlock-recipe", recipe = "ichor-recipe-bio-forged-iron-plate"},
    {type = "unlock-recipe", recipe = "ichor-recipe-growth-chamber-1"},
    {type = "unlock-recipe", recipe = "ichor-recipe-science-biomass"}
  }),
  tech("ichor-tech-basic-neural-control", "c[ichor-tech-basic-neural-control]", 40, 20, {"ichor-tech-basic-bio-production"}, {
    {type = "unlock-recipe", recipe = "ichor-recipe-neural-pylon-1"}
  }),
  tech("ichor-tech-feral-detection", "d[ichor-tech-feral-detection]", 50, 20, {"ichor-tech-basic-neural-control"}, {})
})
