local Constants = require("scripts.util.constants")
local Hunger = require("scripts.hunger.hunger")
local Registry = require("scripts.registry.registry")

local Gui = {}

local function ensure_player_gui(player_index)
  storage.ichor.gui.players[player_index] = storage.ichor.gui.players[player_index] or {
    hive_open = false,
    selected_unit_number = nil
  }
end

local function destroy_element(element)
  if element and element.valid then
    element.destroy()
  end
end

function Gui.ensure_top_button(player)
  if not player or not player.valid then
    return
  end

  if player.gui.top[Constants.GUI.TOP_BUTTON_NAME] then
    return
  end

  local button = player.gui.top.add{
    type = "sprite-button",
    name = Constants.GUI.TOP_BUTTON_NAME,
    sprite = "ichor_sprite_top_button",
    tooltip = {"ichor-gui.top-button-tooltip"},
    style = "slot_button"
  }
  button.tags = {ichor = true}
end

function Gui.destroy_panels(player)
  destroy_element(player.gui.left[Constants.GUI.HIVE_PANEL_NAME])
  destroy_element(player.gui.left[Constants.GUI.ENTITY_PANEL_NAME])
end

function Gui.toggle_hive_panel(player)
  ensure_player_gui(player.index)
  local gui_state = storage.ichor.gui.players[player.index]

  if player.gui.left[Constants.GUI.HIVE_PANEL_NAME] then
    Gui.destroy_panels(player)
    gui_state.hive_open = false
    return
  end

  Gui.destroy_panels(player)
  gui_state.hive_open = true

  local frame = player.gui.left.add{
    type = "frame",
    name = Constants.GUI.HIVE_PANEL_NAME,
    direction = "vertical",
    caption = {"ichor-gui.hive-panel-title"}
  }

  frame.add{type = "label", name = "ichor_hive_hunger", caption = ""}
  frame.add{type = "label", name = "ichor_hive_mood", caption = ""}
  frame.add{type = "label", name = "ichor_hive_cargo", caption = ""}
  frame.add{type = "label", name = "ichor_hive_entities", caption = ""}

  Gui.refresh_hive_panel(player)
end

function Gui.refresh_hive_panel(player)
  local frame = player.gui.left[Constants.GUI.HIVE_PANEL_NAME]
  if not frame or not frame.valid then
    return
  end

  local hunger = Hunger.get_hunger()
  local campaign = storage.ichor.campaign
  local entity_count = 0

  for _ in pairs(storage.ichor.entities) do
    entity_count = entity_count + 1
  end

  frame["ichor_hive_hunger"].caption = {
    "ichor-gui.hive-hunger",
    string.format("%.0f", hunger * 100)
  }
  frame["ichor_hive_mood"].caption = {
    "ichor-gui.hive-mood",
    storage.ichor.hive.mood or "dormant"
  }
  frame["ichor_hive_cargo"].caption = {
    "ichor-gui.hive-cargo",
    campaign.escape_complete and "unlocked" or "locked"
  }
  frame["ichor_hive_entities"].caption = {
    "ichor-gui.hive-entities",
    entity_count
  }
end

function Gui.refresh_entity_panel(player)
  local frame = player.gui.left[Constants.GUI.ENTITY_PANEL_NAME]
  if not frame or not frame.valid then
    return
  end

  local selected = player.selected
  if not selected or not selected.valid then
    frame["ichor_entity_name"].caption = {"ichor-gui.entity-none"}
    frame["ichor_entity_state"].caption = ""
    frame["ichor_entity_substrate"].caption = ""
    frame["ichor_entity_neural"].caption = ""
    frame["ichor_entity_loyalty"].caption = ""
    frame["ichor_entity_mutation"].caption = ""
    frame["ichor_entity_cause"].caption = ""
    return
  end

  local state = Registry.get_state(selected.unit_number)
  if not state then
    frame["ichor_entity_name"].caption = {"ichor-gui.entity-untracked", selected.localised_name}
    frame["ichor_entity_state"].caption = ""
    frame["ichor_entity_substrate"].caption = ""
    frame["ichor_entity_neural"].caption = ""
    frame["ichor_entity_loyalty"].caption = ""
    frame["ichor_entity_mutation"].caption = ""
    frame["ichor_entity_cause"].caption = ""
    return
  end

  local primary_cause = "stable"
  if state.substrate_state ~= "controlled" then
    primary_cause = "no substrate"
  elseif state.neural_signal < Constants.NEURAL.SIGNAL_FULL then
    primary_cause = "no neural signal"
  elseif state.hunger_stress >= Constants.HUNGER.HUNGER_HIGH then
    primary_cause = "hive hunger"
  end

  frame["ichor_entity_name"].caption = {"ichor-gui.entity-name", selected.name}
  frame["ichor_entity_state"].caption = {"ichor-gui.entity-state", state.faction_state}
  frame["ichor_entity_substrate"].caption = {"ichor-gui.entity-substrate", state.substrate_state}
  frame["ichor_entity_neural"].caption = {
    "ichor-gui.entity-neural",
    string.format("%.0f", state.neural_signal * 100)
  }
  frame["ichor_entity_loyalty"].caption = {
    "ichor-gui.entity-loyalty",
    string.format("%.0f", state.loyalty * 100)
  }
  frame["ichor_entity_mutation"].caption = {
    "ichor-gui.entity-mutation",
    string.format("%.0f", state.mutation_pressure * 100)
  }
  frame["ichor_entity_cause"].caption = {"ichor-gui.entity-cause", primary_cause}
end

function Gui.ensure_entity_panel(player)
  if player.gui.left[Constants.GUI.ENTITY_PANEL_NAME] then
    Gui.refresh_entity_panel(player)
    return
  end

  local frame = player.gui.left.add{
    type = "frame",
    name = Constants.GUI.ENTITY_PANEL_NAME,
    direction = "vertical",
    caption = {"ichor-gui.entity-panel-title"}
  }

  frame.add{type = "label", name = "ichor_entity_name", caption = ""}
  frame.add{type = "label", name = "ichor_entity_state", caption = ""}
  frame.add{type = "label", name = "ichor_entity_substrate", caption = ""}
  frame.add{type = "label", name = "ichor_entity_neural", caption = ""}
  frame.add{type = "label", name = "ichor_entity_loyalty", caption = ""}
  frame.add{type = "label", name = "ichor_entity_mutation", caption = ""}
  frame.add{type = "label", name = "ichor_entity_cause", caption = ""}

  Gui.refresh_entity_panel(player)
end

function Gui.on_player_created(player)
  Gui.ensure_top_button(player)
  Gui.ensure_entity_panel(player)
end

function Gui.on_selected_entity_changed(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  ensure_player_gui(player.index)
  storage.ichor.gui.players[player.index].selected_unit_number = player.selected and player.selected.unit_number or nil
  Gui.ensure_entity_panel(player)
  Gui.refresh_entity_panel(player)
end

function Gui.on_gui_click(event)
  if event.element and event.element.valid and event.element.name == Constants.GUI.TOP_BUTTON_NAME then
    local player = game.get_player(event.player_index)
    if player then
      Gui.toggle_hive_panel(player)
    end
  end
end

function Gui.on_tick()
  local refreshed = 0

  for _, player in pairs(game.connected_players) do
    if refreshed >= Constants.BATCH.GUI_PLAYERS_PER_TICK then
      break
    end

    Gui.ensure_top_button(player)

    if player.gui.left[Constants.GUI.HIVE_PANEL_NAME] then
      Gui.refresh_hive_panel(player)
    end

    if player.gui.left[Constants.GUI.ENTITY_PANEL_NAME] then
      Gui.refresh_entity_panel(player)
    end

    refreshed = refreshed + 1
  end
end

function Gui.on_init_players()
  for _, player in pairs(game.players) do
    Gui.on_player_created(player)
  end
end

return Gui
