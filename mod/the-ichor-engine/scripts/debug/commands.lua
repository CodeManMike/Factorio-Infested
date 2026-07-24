local Commands = {}

local StorageFactory = require("scripts.bootstrap.storage-factory")

local function get_player(event)
  if not event.player_index then
    return nil
  end

  return game.get_player(event.player_index)
end

local function print_status(player)
  StorageFactory.ensure()

  local ichor = storage.ichor
  local campaign = ichor.campaign

  player.print(string.format(
    "[ichor] version=%s schema=%s escape_complete=%s cargo_unlocked=%s hunger=%.3f",
    tostring(ichor.version),
    tostring(ichor.schema_version),
    tostring(campaign.escape_complete),
    tostring(campaign.cargo_unlocked),
    ichor.hive.hunger or 0
  ))
end

function Commands.register()
  commands.add_command("ichor-status", {"ichor-command.status"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    print_status(player)
  end)

  commands.add_command("ichor-complete-escape", {"ichor-command.complete-escape"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    StorageFactory.ensure()
    storage.ichor.campaign.escape_complete = true
    storage.ichor.campaign.cargo_unlocked = true
    player.print({"ichor-alert.cargo-unlocked"})
  end)

  commands.add_command("ichor-reset-escape", {"ichor-command.reset-escape"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    StorageFactory.ensure()
    storage.ichor.campaign.escape_complete = false
    storage.ichor.campaign.cargo_unlocked = false
    player.print({"ichor-alert.cargo-locked"})
  end)
end

return Commands
