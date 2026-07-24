local CargoLock = {}

local LOCKED_ENTITY_NAMES = {
  ["cargo-landing-pad"] = true
}

function CargoLock.is_ichor_surface(surface)
  return surface and surface.valid and surface.name == "ichor"
end

function CargoLock.is_lock_enabled()
  return settings.startup["ichor-lock-cargo-before-escape"].value
end

function CargoLock.is_cargo_unlocked()
  if not CargoLock.is_lock_enabled() then
    return true
  end

  return storage.ichor
    and storage.ichor.campaign
    and storage.ichor.campaign.escape_complete == true
end

function CargoLock.on_built_entity(event)
  local entity = event.entity or event.created_entity
  if not entity or not entity.valid then
    return
  end

  if not LOCKED_ENTITY_NAMES[entity.name] then
    return
  end

  if not CargoLock.is_ichor_surface(entity.surface) then
    return
  end

  if CargoLock.is_cargo_unlocked() then
    return
  end

  local player = event.player_index and game.get_player(event.player_index) or nil
  local position = entity.position
  local surface = entity.surface
  local force = entity.force
  local item_name = entity.name

  entity.destroy{raise_destroy = true}

  if player and player.valid then
    player.insert{name = item_name, count = 1}
    player.print({"ichor-alert.cargo-locked"})
  else
    surface.spill_item_stack{
      position = position,
      stack = {name = item_name, count = 1},
      enable_looted = true,
      force = force
    }
  end
end

function CargoLock.on_cargo_pod_finished_descending(event)
  local pod = event.cargo_pod
  if not pod or not pod.valid then
    return
  end

  if not CargoLock.is_ichor_surface(pod.surface) then
    return
  end

  if CargoLock.is_cargo_unlocked() then
    return
  end

  pod.destroy{raise_destroy = true}
end

function CargoLock.on_cargo_pod_delivered_cargo(event)
  local pod = event.cargo_pod
  local container = event.spawned_container
  local surface = nil

  if pod and pod.valid then
    surface = pod.surface
  end

  if not surface and container and container.valid then
    surface = container.surface
  end

  if not CargoLock.is_ichor_surface(surface) then
    return
  end

  if CargoLock.is_cargo_unlocked() then
    return
  end

  if container and container.valid then
    container.destroy{raise_destroy = true}
  end

  if pod and pod.valid then
    pod.destroy{raise_destroy = true}
  end
end

return CargoLock
