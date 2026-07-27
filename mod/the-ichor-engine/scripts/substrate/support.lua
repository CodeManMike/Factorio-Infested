local Constants = require("scripts.util.constants")
local Registry = require("scripts.registry.registry")
local EntityUtil = require("scripts.util.entity-util")

local SubstrateSupport = {}

function SubstrateSupport.has_living_substrate(entity)
  if not entity or not entity.valid then
    return false
  end

  local tile = entity.surface.get_tile(entity.position.x, entity.position.y)
  return tile and tile.valid and tile.name == Constants.SUBSTRATE.LIVING_TILE
end

function SubstrateSupport.on_tick()
  local buildings = Registry.iterate_bio_buildings()

  for _, state in pairs(buildings) do
    local entity = EntityUtil.resolve(state)
    if entity and entity.valid then
      local supported = SubstrateSupport.has_living_substrate(entity)
      state.substrate_state = supported and "controlled" or "unsupported"
      entity.active = supported
      state.last_update_tick = game.tick
    end
  end
end

return SubstrateSupport
