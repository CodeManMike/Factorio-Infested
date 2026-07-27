local Constants = require("scripts.util.constants")
local Registry = require("scripts.registry.registry")
local EntityUtil = require("scripts.util.entity-util")
local Alerts = require("scripts.alerts.alerts")

local FeralConversion = {}

function FeralConversion.should_convert(state, definition)
  if not definition or not definition.can_feralize or not definition.feral_variant then
    return false
  end

  if state.loyalty > Constants.FERAL.CONVERT_WHEN_LOYALTY_AT_OR_BELOW then
    return false
  end

  if Constants.FERAL.REQUIRE_MUTATION_PRESSURE and state.mutation_pressure < Constants.FERAL.REQUIRED_MUTATION_PRESSURE then
    return false
  end

  return true
end

function FeralConversion.place_feral_substrate(surface, position)
  if not Constants.FERAL.PLACE_FERAL_SUBSTRATE_ON_CONVERSION then
    return
  end

  local radius = Constants.FERAL.FERAL_SUBSTRATE_RADIUS
  local updates = {}

  for x = -radius, radius do
    for y = -radius, radius do
      local tile_position = {x = position.x + x, y = position.y + y}
      table.insert(updates, {name = Constants.SUBSTRATE.FERAL_TILE, position = tile_position})
    end
  end

  if #updates > 0 then
    surface.set_tiles(updates, true)
  end
end

function FeralConversion.convert_entity(state, definition)
  local entity = EntityUtil.resolve(state)
  if not entity or not entity.valid then
    return false
  end

  local surface = entity.surface
  local position = entity.position
  local direction = entity.direction
  local feral_force = game.forces[Constants.FERAL.FORCE_NAME]

  Registry.unregister_entity(entity)
  entity.destroy{raise_destroy = true}

  local created = surface.create_entity{
    name = definition.feral_variant,
    position = position,
    direction = direction,
    force = feral_force,
    raise_built = true
  }

  if not created or not created.valid then
    return false
  end

  Registry.register_entity(created)

  local new_state = Registry.get_state(created.unit_number)
  if new_state then
    new_state.faction_state = "feral"
    new_state.loyalty = 0
    new_state.mutation_pressure = 1.0
  end

  FeralConversion.place_feral_substrate(surface, position)

  if Constants.FERAL.ALERT_ON_CONVERSION then
    Alerts.try_alert_nearby_players(new_state or state, "feralized", Constants.ALERTS.COOLDOWN_FERALIZED)
  end

  return true
end

function FeralConversion.try_convert(state)
  local definition = Registry.get_definition(state.name)
  if not FeralConversion.should_convert(state, definition) then
    return false
  end

  return FeralConversion.convert_entity(state, definition)
end

function FeralConversion.force_convert_selected(entity)
  local definition = Registry.get_definition(entity.name)
  if not definition or not definition.can_feralize then
    return false
  end

  local state = Registry.get_state(entity.unit_number)
  if not state then
    return false
  end

  state.loyalty = Constants.DEBUG_COMMANDS.FERALIZE_SELECTED_FORCE_LOYALTY
  state.mutation_pressure = Constants.DEBUG_COMMANDS.FERALIZE_SELECTED_FORCE_MUTATION
  return FeralConversion.convert_entity(state, definition)
end

return FeralConversion
