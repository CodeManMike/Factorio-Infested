local Constants = require("scripts.util.constants")
local Registry = require("scripts.registry.registry")
local EntityUtil = require("scripts.util.entity-util")

local NeuralSignal = {}

function NeuralSignal.has_signal_at(position, surface_index)
  local pylons = Registry.iterate_by_kind("neural")

  for _, state in pairs(pylons) do
    if state.surface_index == surface_index then
      local distance = EntityUtil.distance(position, state.position)
      if distance <= Constants.NEURAL.PYLON_1_RADIUS then
        return true
      end
    end
  end

  return false
end

function NeuralSignal.on_tick()
  local buildings = Registry.iterate_bio_buildings()

  for _, state in pairs(buildings) do
    local had_signal = state.neural_signal >= Constants.NEURAL.SIGNAL_FULL
    local has_signal = NeuralSignal.has_signal_at(state.position, state.surface_index)

    if has_signal then
      state.neural_signal = Constants.NEURAL.SIGNAL_FULL
      state.disconnected_ticks = 0
    else
      state.neural_signal = Constants.NEURAL.SIGNAL_NONE
      state.disconnected_ticks = (state.disconnected_ticks or 0) + Constants.SCHEDULE.NEURAL_TICK
    end

    state.last_update_tick = game.tick
  end
end

return NeuralSignal
