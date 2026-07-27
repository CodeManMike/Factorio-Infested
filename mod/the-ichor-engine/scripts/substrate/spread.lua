local Constants = require("scripts.util.constants")
local Difficulty = require("scripts.util.difficulty")
local EntityUtil = require("scripts.util.entity-util")

local SubstrateSpread = {}

local function is_valid_spread_tile(surface, tile)
  if not tile or not tile.valid then
    return false
  end

  if tile.name == Constants.SUBSTRATE.LIVING_TILE or tile.name == Constants.SUBSTRATE.FERAL_TILE then
    return false
  end

  if not Constants.SUBSTRATE.ALLOW_SPREAD_ON_WATER and tile.collides_with("water_tile") then
    return false
  end

  return true
end

function SubstrateSpread.spread_at(surface, center, radius, tiles_to_place)
  if not surface or not surface.valid then
    return 0
  end

  local placed = 0
  local attempts = 0
  local max_attempts = Constants.SUBSTRATE.SPREAD_RANDOM_ATTEMPTS * tiles_to_place

  while placed < tiles_to_place and attempts < max_attempts do
    attempts = attempts + 1

    local angle = math.random() * 2 * math.pi
    local distance = math.random(Constants.SUBSTRATE.MIN_DISTANCE_FROM_SOURCE, Constants.SUBSTRATE.MAX_DISTANCE_FROM_SOURCE)
    local target = {
      x = center.x + math.cos(angle) * distance,
      y = center.y + math.sin(angle) * distance
    }

    if EntityUtil.distance(center, target) <= radius then
      local tile = surface.get_tile(target.x, target.y)
      if is_valid_spread_tile(surface, tile) then
        surface.set_tiles({{name = Constants.SUBSTRATE.LIVING_TILE, position = target}}, true)
        placed = placed + 1
      end
    end
  end

  return placed
end

function SubstrateSpread.on_tick()
  local sources = storage.ichor.substrate.sources
  local source_keys = {}

  for unit_number in pairs(sources) do
    table.insert(source_keys, unit_number)
  end

  if #source_keys == 0 then
    return
  end

  storage.ichor.substrate.spread_cursor = storage.ichor.substrate.spread_cursor or 1
  local profile = Difficulty.get_profile()
  local batch = Constants.BATCH.SUBSTRATE_SOURCES_PER_TICK
  local spread_multiplier = settings.startup["ichor-substrate-spread-multiplier"].value
  local tiles_per_source = math.max(1, math.floor(Constants.SUBSTRATE.TILES_PER_SPREAD_TICK * profile.substrate * spread_multiplier))

  for _ = 1, batch do
    if storage.ichor.substrate.spread_cursor > #source_keys then
      storage.ichor.substrate.spread_cursor = 1
    end

    local unit_number = source_keys[storage.ichor.substrate.spread_cursor]
    storage.ichor.substrate.spread_cursor = storage.ichor.substrate.spread_cursor + 1

    local source = sources[unit_number]
    local state = storage.ichor.entities[unit_number]
    if source and state then
      local surface = game.surfaces[source.surface_index]
      if surface and surface.valid then
        SubstrateSpread.spread_at(surface, source.position, Constants.SUBSTRATE.NODE_RADIUS, tiles_per_source)
      end
    end
  end
end

function SubstrateSpread.spread_around_player(player, radius)
  if not player or not player.valid then
    return 0
  end

  local surface = player.surface
  local position = player.position
  local area = {
    {position.x - radius, position.y - radius},
    {position.x + radius, position.y + radius}
  }

  local tiles = surface.find_tiles_filtered{area = area}
  local updates = {}

  for _, tile in pairs(tiles) do
    if is_valid_spread_tile(surface, tile) then
      table.insert(updates, {name = Constants.SUBSTRATE.LIVING_TILE, position = tile.position})
    end
  end

  if #updates > 0 then
    surface.set_tiles(updates, true)
  end

  return #updates
end

return SubstrateSpread
