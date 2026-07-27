local EntityUtil = {}

function EntityUtil.chunk_key(position)
  local chunk_x = math.floor(position.x / 32)
  local chunk_y = math.floor(position.y / 32)
  return chunk_x .. ":" .. chunk_y
end

function EntityUtil.resolve(state)
  if not state or not state.surface_index or not state.position then
    return nil
  end

  local surface = game.surfaces[state.surface_index]
  if not surface or not surface.valid then
    return nil
  end

  local entities = surface.find_entities_filtered{
    name = state.name,
    position = state.position,
    radius = 1.0
  }

  for _, entity in pairs(entities) do
    if entity.valid and entity.unit_number == state.unit_number then
      return entity
    end
  end

  return nil
end

function EntityUtil.clamp(value, min_value, max_value)
  if value < min_value then
    return min_value
  end

  if value > max_value then
    return max_value
  end

  return value
end

function EntityUtil.distance(a, b)
  local dx = a.x - b.x
  local dy = a.y - b.y
  return math.sqrt(dx * dx + dy * dy)
end

return EntityUtil
