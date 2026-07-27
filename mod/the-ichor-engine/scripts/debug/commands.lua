local Commands = {}

local StorageFactory = require("scripts.bootstrap.storage-factory")
local Constants = require("scripts.util.constants")
local Hunger = require("scripts.hunger.hunger")
local Registry = require("scripts.registry.registry")
local SubstrateSpread = require("scripts.substrate.spread")
local FeralConversion = require("scripts.feral.conversion")

local function get_player(event)
  if not event.player_index then
    return nil
  end

  return game.get_player(event.player_index)
end

local function serialize_table(value, indent)
  indent = indent or ""
  local value_type = type(value)

  if value_type ~= "table" then
    return tostring(value)
  end

  local lines = {"{"}
  for key, child in pairs(value) do
    table.insert(lines, indent .. "  [" .. tostring(key) .. "] = " .. serialize_table(child, indent .. "  ") .. ",")
  end
  table.insert(lines, indent .. "}")
  return table.concat(lines, "\n")
end

local function print_status(player)
  StorageFactory.ensure()

  local ichor = storage.ichor
  local campaign = ichor.campaign

  player.print(string.format(
    "[ichor] version=%s schema=%s escape_complete=%s cargo_unlocked=%s hunger=%.3f mood=%s",
    tostring(ichor.version),
    tostring(ichor.schema_version),
    tostring(campaign.escape_complete),
    tostring(campaign.cargo_unlocked),
    ichor.hive.hunger or 0,
    tostring(ichor.hive.mood or "dormant")
  ))
end

local function print_balance_report(player)
  StorageFactory.ensure()

  local counts = {
    entities = 0,
    bio_buildings = 0,
    feral_buildings = 0,
    substrate_sources = 0,
    low_loyalty = 0,
    high_mutation = 0
  }

  for unit_number, state in pairs(storage.ichor.entities) do
    counts.entities = counts.entities + 1

    if state.kind == "bio-building" then
      counts.bio_buildings = counts.bio_buildings + 1
      if state.loyalty <= Constants.LOYALTY.UNSTABLE_THRESHOLD then
        counts.low_loyalty = counts.low_loyalty + 1
      end
      if state.mutation_pressure >= Constants.MUTATION.WARNING_THRESHOLD then
        counts.high_mutation = counts.high_mutation + 1
      end
    elseif state.kind == "feral-building" then
      counts.feral_buildings = counts.feral_buildings + 1
    elseif state.kind == "substrate-source" then
      counts.substrate_sources = counts.substrate_sources + 1
    end
  end

  player.print(string.format(
    "[ichor] hunger=%.3f entities=%d bio=%d feral=%d substrate_sources=%d low_loyalty=%d high_mutation=%d",
    Hunger.get_hunger(),
    counts.entities,
    counts.bio_buildings,
    counts.feral_buildings,
    counts.substrate_sources,
    counts.low_loyalty,
    counts.high_mutation
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

  commands.add_command("ichor-feed", {"ichor-command.feed"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    StorageFactory.ensure()
    Hunger.set_hunger(Constants.DEBUG_COMMANDS.FEED_SET_HUNGER)
    Hunger.update_mood()
    player.print("[ichor] Hive hunger set to fed.")
  end)

  commands.add_command("ichor-starve", {"ichor-command.starve"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    StorageFactory.ensure()
    Hunger.set_hunger(Constants.DEBUG_COMMANDS.STARVE_SET_HUNGER)
    Hunger.update_mood()
    player.print("[ichor] Hive hunger set to starved.")
  end)

  commands.add_command("ichor-spread-substrate", {"ichor-command.spread-substrate"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    StorageFactory.ensure()
    local placed = SubstrateSpread.spread_around_player(player, Constants.DEBUG_COMMANDS.SPREAD_SUBSTRATE_RADIUS)
    player.print("[ichor] Spread living substrate on " .. placed .. " tiles.")
  end)

  commands.add_command("ichor-dump-selected", {"ichor-command.dump-selected"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    StorageFactory.ensure()

    local selected = player.selected
    if not selected or not selected.valid then
      player.print("[ichor] No selected entity.")
      return
    end

    local state = Registry.get_state(selected.unit_number)
    if not state then
      player.print("[ichor] Selected entity is not tracked: " .. selected.name)
      return
    end

    player.print("[ichor] entity state for unit_number=" .. selected.unit_number)
    player.print(serialize_table(state))
  end)

  commands.add_command("ichor-feralize-selected", {"ichor-command.feralize-selected"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    StorageFactory.ensure()

    local selected = player.selected
    if not selected or not selected.valid then
      player.print("[ichor] No selected entity.")
      return
    end

    if FeralConversion.force_convert_selected(selected) then
      player.print("[ichor] Selected entity feralized.")
    else
      player.print("[ichor] Could not feralize selected entity.")
    end
  end)

  commands.add_command("ichor-balance-report", {"ichor-command.balance-report"}, function(event)
    local player = get_player(event)
    if not player then
      return
    end

    print_balance_report(player)
  end)
end

return Commands
