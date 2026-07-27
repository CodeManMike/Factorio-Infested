local Constants = require("scripts.util.constants")
local Difficulty = require("scripts.util.difficulty")
local EntityUtil = require("scripts.util.entity-util")
local Hunger = require("scripts.hunger.hunger")
local Registry = require("scripts.registry.registry")
local Alerts = require("scripts.alerts.alerts")
local FeralConversion = require("scripts.feral.conversion")

local Mutation = {}

function Mutation.clamp(value)
  return EntityUtil.clamp(value, Constants.MUTATION.MIN, Constants.MUTATION.MAX)
end

function Mutation.on_tick()
  local profile = Difficulty.get_profile()
  local mutation_multiplier = profile.mutation
  local hunger = Hunger.get_hunger()
  local buildings = Registry.iterate_bio_buildings()
  local processed = 0

  for _, state in pairs(buildings) do
    if processed >= Constants.BATCH.BIO_ENTITIES_PER_MUTATION_TICK then
      break
    end

    processed = processed + 1
    local definition = Registry.get_definition(state.name)
    if definition and definition.can_mutate then
      local delta = 0

      if state.loyalty < Constants.MUTATION.LOW_LOYALTY_THRESHOLD then
        delta = delta + Constants.MUTATION.GAIN_LOW_LOYALTY_PER_900_TICKS
      end

      if hunger > Constants.MUTATION.HIGH_HUNGER_THRESHOLD then
        delta = delta + Constants.MUTATION.GAIN_HIGH_HUNGER_PER_900_TICKS
      end

      if settings.global["ichor-debug-mode"].value and Constants.DEBUG.ENABLE_FAST_FAILURE_MODE then
        delta = delta * Constants.DEBUG.FAST_MUTATION_MULTIPLIER
      end

      state.mutation_pressure = Mutation.clamp(state.mutation_pressure + (delta * mutation_multiplier))

      if state.mutation_pressure >= Constants.MUTATION.WARNING_THRESHOLD and not state.flags.warned_mutation then
        Alerts.try_alert_nearby_players(state, "mutation-warning", Constants.ALERTS.COOLDOWN_MUTATION_WARNING)
        state.flags.warned_mutation = true
      end

      if definition.can_feralize then
        FeralConversion.try_convert(state)
      end

      state.last_update_tick = game.tick
    end
  end
end

return Mutation
