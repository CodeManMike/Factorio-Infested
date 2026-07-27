local Constants = require("scripts.util.constants")
local Difficulty = require("scripts.util.difficulty")
local EntityUtil = require("scripts.util.entity-util")
local Hunger = require("scripts.hunger.hunger")
local Registry = require("scripts.registry.registry")
local Alerts = require("scripts.alerts.alerts")

local Loyalty = {}

function Loyalty.clamp(value)
  return EntityUtil.clamp(value, Constants.LOYALTY.MIN, Constants.LOYALTY.MAX)
end

function Loyalty.update_faction_state(state)
  if state.loyalty <= Constants.LOYALTY.FERAL_THRESHOLD then
    state.faction_state = "feral"
  elseif state.loyalty <= Constants.LOYALTY.BREAKING_THRESHOLD then
    state.faction_state = "breaking"
  elseif state.loyalty <= Constants.LOYALTY.UNSTABLE_THRESHOLD then
    state.faction_state = "unstable"
  elseif state.loyalty <= Constants.LOYALTY.STRAINED_THRESHOLD then
    state.faction_state = "strained"
  else
    state.faction_state = "loyal"
  end
end

function Loyalty.on_tick()
  local profile = Difficulty.get_profile()
  local decay_multiplier = profile.loyalty_decay
  local hunger = Hunger.get_hunger()
  local buildings = Registry.iterate_bio_buildings()
  local processed = 0

  for _, state in pairs(buildings) do
    if processed >= Constants.BATCH.BIO_ENTITIES_PER_LOYALTY_TICK then
      break
    end

    processed = processed + 1
    local delta = 0

    if state.substrate_state ~= "controlled" then
      delta = delta - Constants.LOYALTY.DECAY_NO_SUBSTRATE_PER_300_TICKS
      if not state.flags.warned_no_substrate then
        Alerts.try_alert_nearby_players(state, "no-substrate", Constants.ALERTS.COOLDOWN_NO_SUBSTRATE)
        state.flags.warned_no_substrate = true
      end
    else
      state.flags.warned_no_substrate = false
    end

    if state.neural_signal < Constants.NEURAL.SIGNAL_FULL then
      delta = delta - Constants.LOYALTY.DECAY_NO_NEURAL_PER_300_TICKS
      if not state.flags.warned_no_neural then
        Alerts.try_alert_nearby_players(state, "no-neural-signal", Constants.ALERTS.COOLDOWN_NO_NEURAL)
        state.flags.warned_no_neural = true
      end
    else
      state.flags.warned_no_neural = false
    end

    if hunger >= Constants.HUNGER.HUNGER_HIGH then
      delta = delta - Constants.LOYALTY.DECAY_HIGH_HUNGER_PER_300_TICKS
      state.hunger_stress = hunger
    else
      state.hunger_stress = hunger
    end

    local fully_supported = state.substrate_state == "controlled" and state.neural_signal >= Constants.NEURAL.SIGNAL_FULL
    if fully_supported and hunger < Constants.HUNGER.HUNGER_NORMAL then
      delta = delta + Constants.LOYALTY.RECOVERY_FULL_SUPPORT_PER_300_TICKS
    end

    state.loyalty = Loyalty.clamp(state.loyalty + (delta * decay_multiplier))
    Loyalty.update_faction_state(state)

    if state.loyalty <= Constants.LOYALTY.UNSTABLE_THRESHOLD and not state.flags.warned_low_loyalty then
      Alerts.try_alert_nearby_players(state, "low-loyalty", Constants.ALERTS.COOLDOWN_LOW_LOYALTY)
      state.flags.warned_low_loyalty = true
    elseif state.loyalty > Constants.LOYALTY.UNSTABLE_THRESHOLD then
      state.flags.warned_low_loyalty = false
    end

    state.last_update_tick = game.tick
  end
end

return Loyalty
