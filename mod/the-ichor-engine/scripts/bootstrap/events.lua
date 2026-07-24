local CargoLock = require("scripts.space-age.cargo-lock")

local Events = {}

function Events.on_built_entity(event)
  CargoLock.on_built_entity(event)
end

function Events.register()
  script.on_event(defines.events.on_built_entity, Events.on_built_entity)
  script.on_event(defines.events.on_robot_built_entity, Events.on_built_entity)
  script.on_event(defines.events.script_raised_built, Events.on_built_entity)
  script.on_event(defines.events.script_raised_revive, Events.on_built_entity)

  script.on_event(defines.events.on_cargo_pod_finished_descending, CargoLock.on_cargo_pod_finished_descending)
  script.on_event(defines.events.on_cargo_pod_delivered_cargo, CargoLock.on_cargo_pod_delivered_cargo)
end

return Events
