local Constants = require("scripts.util.constants")
local Difficulty = require("scripts.util.difficulty")
local EntityUtil = require("scripts.util.entity-util")
local Registry = require("scripts.registry.registry")

local Hunger = {}

function Hunger.clamp(value)
  return EntityUtil.clamp(value, Constants.HUNGER.MIN, Constants.HUNGER.MAX)
end

function Hunger.set_hunger(value)
  storage.ichor.hive.hunger = Hunger.clamp(value)
end

function Hunger.get_hunger()
  return storage.ichor.hive.hunger or 0
end

function Hunger.update_mood()
  local hunger = Hunger.get_hunger()

  if hunger >= Constants.HUNGER.HUNGER_VIOLENT then
    storage.ichor.hive.mood = "hostile"
  elseif hunger >= Constants.HUNGER.HUNGER_CRITICAL then
    storage.ichor.hive.mood = "strained"
  elseif hunger >= Constants.HUNGER.HUNGER_HIGH then
    storage.ichor.hive.mood = "hungry"
  elseif hunger <= Constants.HUNGER.HUNGER_SATED then
    storage.ichor.hive.mood = "cooperative"
  else
    storage.ichor.hive.mood = "dormant"
  end
end

function Hunger.try_feed_from_core()
  local core = Registry.get_hive_core_entity()
  if not core or not core.valid then
    return false
  end

  local inventory = core.get_inventory(defines.inventory.chest)
  if not inventory or not inventory.valid then
    return false
  end

  local item_name = Constants.HUNGER.RAW_BIOMASS_ITEM
  local count = inventory.get_item_count(item_name)
  if count <= 0 then
    return false
  end

  inventory.remove{name = item_name, count = 1}
  local reduction = Constants.FEEDING[item_name] or Constants.HUNGER.RAW_BIOMASS_REDUCTION
  Hunger.set_hunger(Hunger.get_hunger() - reduction)
  storage.ichor.hive.last_fed_tick = game.tick
  return true
end

function Hunger.on_tick()
  local profile = Difficulty.get_profile()
  local growth = Constants.HUNGER.BASE_GROWTH_PER_300_TICKS * profile.hunger

  if settings.global["ichor-debug-mode"].value and Constants.DEBUG.ENABLE_FAST_FAILURE_MODE then
    growth = growth * Constants.DEBUG.FAST_HUNGER_MULTIPLIER
  end

  Hunger.set_hunger(Hunger.get_hunger() + growth)
  Hunger.try_feed_from_core()
  Hunger.update_mood()
end

return Hunger
