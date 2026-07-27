local Alerts = {}

function Alerts.can_send(player_index, alert_key, cooldown_ticks)
  storage.ichor.alerts.cooldowns[player_index] = storage.ichor.alerts.cooldowns[player_index] or {}
  local player_cooldowns = storage.ichor.alerts.cooldowns[player_index]
  local next_tick = player_cooldowns[alert_key] or 0

  if game.tick < next_tick then
    return false
  end

  player_cooldowns[alert_key] = game.tick + cooldown_ticks
  return true
end

function Alerts.send_player(player, alert_key)
  if not player or not player.valid then
    return
  end

  player.print({"ichor-alert." .. alert_key})
end

function Alerts.try_alert_player(player, alert_key, cooldown_ticks)
  if not player or not player.valid then
    return
  end

  if Alerts.can_send(player.index, alert_key, cooldown_ticks) then
    Alerts.send_player(player, alert_key)
  end
end

function Alerts.try_alert_nearby_players(state, alert_key, cooldown_ticks)
  if not state or not state.surface_index or not state.position then
    return
  end

  local surface = game.surfaces[state.surface_index]
  if not surface or not surface.valid then
    return
  end

  for _, player in pairs(game.connected_players) do
    if player.surface == surface then
      local dx = player.position.x - state.position.x
      local dy = player.position.y - state.position.y
      if (dx * dx + dy * dy) <= (64 * 64) then
        Alerts.try_alert_player(player, alert_key, cooldown_ticks)
      end
    end
  end
end

return Alerts
