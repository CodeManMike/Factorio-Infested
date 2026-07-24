local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_gleba = require("__space-age__.prototypes.planet.procession-catalogue-gleba")
local planet_map_gen = require("__space-age__.prototypes.planet.planet-map-gen")

-- MVP placeholder: we borrow Gleba map generation, procession assets, and travel hazards until custom Ichor art and terrain exist.
data:extend({
  {
    type = "planet",
    name = "ichor",
    icon = "__the-ichor-engine__/thumbnail.png",
    icon_size = 144,
    starmap_icon = "__space-age__/graphics/icons/starmap-planet-gleba.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 22,
    orientation = 0.22,
    magnitude = 1.0,
    label_orientation = 0.2,
    order = "e[ichor]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.gleba(),
    pollutant_type = "spores",
    solar_power_in_space = 150,
    platform_procession_set = {
      arrival = {"planet-to-platform-b", "platform-to-platform-b"},
      departure = {"platform-to-planet-a", "platform-to-platform-a"}
    },
    planet_procession_set = {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_gleba,
    surface_properties = {
      ["day-night-cycle"] = 12 * minute,
      ["magnetic-field"] = 20,
      ["solar-power"] = 40,
      pressure = 1800,
      gravity = 18
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba, 0.9)
  },
  {
    type = "space-connection",
    name = "nauvis-ichor",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "ichor",
    order = "z[ichor]",
    length = 18000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
  }
})
