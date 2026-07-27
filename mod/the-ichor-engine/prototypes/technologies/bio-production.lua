local Graphics = require("prototypes.lib.graphics")

local function tech(name, order, count, time, prerequisites, effects)
  return {
    type = "technology",
    name = name,
    icon = Graphics.tech(name),
    icon_size = 256,
    order = order,
    unit = {
      count = count,
      ingredients = {
        {type = "item", name = "ichor-science-biomass", amount = 1}
      },
      time = time
    },
    prerequisites = prerequisites,
    effects = effects
  }
end

data:extend({
  tech("ichor-tech-bio-logistics", "e[ichor-tech-bio-logistics]", 30, 15, {"ichor-tech-basic-bio-production"}, {
    {type = "unlock-recipe", recipe = "ichor-recipe-nutrient-vat-1"},
    {type = "unlock-recipe", recipe = "ichor-recipe-tendril-1"},
    {type = "unlock-recipe", recipe = "ichor-recipe-tendon-track-1"},
    {type = "unlock-recipe", recipe = "ichor-recipe-crude-vein"},
    {type = "unlock-recipe", recipe = "ichor-recipe-bladder-tank-1"}
  }),
  tech("ichor-tech-bio-metallurgy", "f[ichor-tech-bio-metallurgy]", 35, 15, {"ichor-tech-bio-logistics"}, {
    {type = "unlock-recipe", recipe = "ichor-recipe-bio-forged-copper-plate"}
  })
})
