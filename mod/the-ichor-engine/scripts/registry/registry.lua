local Constants = require("scripts.util.constants")
local Definitions = require("scripts.registry.definitions")
local EntityUtil = require("scripts.util.entity-util")

local Registry = {}

local function ensure_indexes()
  storage.ichor.entity_indexes = storage.ichor.entity_indexes or {
    by_kind = {},
    by_surface = {},
    by_chunk = {}
  }
end

local function add_to_index(index_table, key, unit_number)
  index_table[key] = index_table[key] or {}
  index_table[key][unit_number] = true
end

local function remove_from_index(index_table, key, unit_number)
  if not index_table[key] then
    return
  end

  index_table[key][unit_number] = nil

  if next(index_table[key]) == nil then
    index_table[key] = nil
  end
end

local function default_flags()
  return {
    warned_no_substrate = false,
    warned_no_neural = false,
    warned_low_loyalty = false,
    warned_mutation = false
  }
end

local function default_state(entity, definition)
  local position = entity.position
  local chunk_key = EntityUtil.chunk_key(position)

  return {
    unit_number = entity.unit_number,
    name = entity.name,
    kind = definition.kind,
    surface_index = entity.surface.index,
    surface_name = entity.surface.name,
    position = {x = position.x, y = position.y},
    force_name = entity.force.name,
    chunk_key = chunk_key,
    loyalty = 1.0,
    neural_signal = 0.0,
    hunger_stress = 0.0,
    mutation_pressure = 0.0,
    substrate_state = "unknown",
    disconnected_ticks = 0,
    faction_state = "loyal",
    last_update_tick = game.tick,
    flags = default_flags()
  }
end

function Registry.register_entity(entity)
  if not entity or not entity.valid then
    return
  end

  local definition = Definitions[entity.name]
  if not definition then
    return
  end

  ensure_indexes()

  local unit_number = entity.unit_number
  local state = storage.ichor.entities[unit_number]

  if not state then
    state = default_state(entity, definition)
    storage.ichor.entities[unit_number] = state
  else
    state.name = entity.name
    state.kind = definition.kind
    state.surface_index = entity.surface.index
    state.surface_name = entity.surface.name
    state.position = {x = entity.position.x, y = entity.position.y}
    state.chunk_key = EntityUtil.chunk_key(entity.position)
    state.force_name = entity.force.name
    state.last_update_tick = game.tick
  end

  add_to_index(storage.ichor.entity_indexes.by_kind, definition.kind, unit_number)
  add_to_index(storage.ichor.entity_indexes.by_surface, tostring(entity.surface.index), unit_number)
  add_to_index(storage.ichor.entity_indexes.by_chunk, state.chunk_key, unit_number)

  if definition.kind == "substrate-source" then
    storage.ichor.substrate.sources[unit_number] = {
      unit_number = unit_number,
      surface_index = entity.surface.index,
      position = {x = entity.position.x, y = entity.position.y}
    }
  end

  if definition.kind == "hive-core" then
    storage.ichor.hive.core_unit_number = unit_number
  end
end

function Registry.unregister_entity(entity)
  if not entity or not entity.unit_number then
    return
  end

  local unit_number = entity.unit_number
  local state = storage.ichor.entities[unit_number]
  if not state then
    return
  end

  ensure_indexes()

  remove_from_index(storage.ichor.entity_indexes.by_kind, state.kind, unit_number)
  remove_from_index(storage.ichor.entity_indexes.by_surface, tostring(state.surface_index), unit_number)
  remove_from_index(storage.ichor.entity_indexes.by_chunk, state.chunk_key, unit_number)

  storage.ichor.entities[unit_number] = nil
  storage.ichor.substrate.sources[unit_number] = nil

  if storage.ichor.hive.core_unit_number == unit_number then
    storage.ichor.hive.core_unit_number = nil
  end
end

function Registry.get_definition(entity_name)
  return Definitions[entity_name]
end

function Registry.get_state(unit_number)
  return storage.ichor.entities[unit_number]
end

function Registry.iterate_by_kind(kind)
  local index = storage.ichor.entity_indexes.by_kind[kind] or {}
  local result = {}

  for unit_number in pairs(index) do
    local state = storage.ichor.entities[unit_number]
    if state then
      table.insert(result, state)
    end
  end

  return result
end

function Registry.iterate_bio_buildings()
  return Registry.iterate_by_kind("bio-building")
end

function Registry.get_hive_core_entity()
  local unit_number = storage.ichor.hive.core_unit_number
  if not unit_number then
    return nil
  end

  return EntityUtil.resolve(storage.ichor.entities[unit_number])
end

return Registry
