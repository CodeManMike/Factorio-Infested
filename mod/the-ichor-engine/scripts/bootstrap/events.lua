local CargoLock = require("scripts.space-age.cargo-lock")
local Registry = require("scripts.registry.registry")
local Constants = require("scripts.util.constants")
local SubstrateSpread = require("scripts.substrate.spread")
local SubstrateSupport = require("scripts.substrate.support")
local NeuralSignal = require("scripts.neural.signal")
local Hunger = require("scripts.hunger.hunger")
local Loyalty = require("scripts.loyalty.loyalty")
local Mutation = require("scripts.mutation.mutation")
local Gui = require("scripts.gui.gui")

local Events = {}

function Events.on_built_entity(event)
  CargoLock.on_built_entity(event)

  local entity = event.entity or event.created_entity
  if entity and entity.valid then
    Registry.register_entity(entity)
  end
end

function Events.on_removed_entity(event)
  local entity = event.entity
  if entity and entity.unit_number then
    Registry.unregister_entity(entity)
  end
end

function Events.on_tick_60()
  SubstrateSpread.on_tick()
  Gui.on_tick()
end

function Events.on_tick_300()
  SubstrateSupport.on_tick()
  NeuralSignal.on_tick()
  Hunger.on_tick()
  Loyalty.on_tick()
end

function Events.on_tick_900()
  Mutation.on_tick()
end

function Events.register()
  script.on_event(defines.events.on_built_entity, Events.on_built_entity)
  script.on_event(defines.events.on_robot_built_entity, Events.on_built_entity)
  script.on_event(defines.events.script_raised_built, Events.on_built_entity)
  script.on_event(defines.events.script_raised_revive, Events.on_built_entity)

  script.on_event(defines.events.on_player_mined_entity, Events.on_removed_entity)
  script.on_event(defines.events.on_robot_mined_entity, Events.on_removed_entity)
  script.on_event(defines.events.on_entity_died, Events.on_removed_entity)
  script.on_event(defines.events.script_raised_destroy, Events.on_removed_entity)

  script.on_event(defines.events.on_cargo_pod_finished_descending, CargoLock.on_cargo_pod_finished_descending)
  script.on_event(defines.events.on_cargo_pod_delivered_cargo, CargoLock.on_cargo_pod_delivered_cargo)

  script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    if player then
      Gui.on_player_created(player)
    end
  end)

  script.on_event(defines.events.on_gui_click, Gui.on_gui_click)
  script.on_event(defines.events.on_selected_entity_changed, Gui.on_selected_entity_changed)

  script.on_nth_tick(Constants.SCHEDULE.SUBSTRATE_TICK, Events.on_tick_60)
  script.on_nth_tick(Constants.SCHEDULE.HUNGER_TICK, Events.on_tick_300)
  script.on_nth_tick(Constants.SCHEDULE.MUTATION_TICK, Events.on_tick_900)
end

return Events
