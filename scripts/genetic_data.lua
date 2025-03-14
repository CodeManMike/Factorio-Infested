-- Factorio Infested
-- Genetic Data System

local genetic_data = {}

-- Add genetic data to the global pool
function genetic_data.add(amount)
    global.genetic_data = global.genetic_data or 0
    global.genetic_data = global.genetic_data + amount

    -- Update GUI for all players
    genetic_data.update_gui_for_all_players()

    -- Check if we've reached a new evolution threshold
    local infested_evolution = require("scripts.evolution")
    infested_evolution.check_evolution_level()

    return amount
end

-- Get current genetic data amount
function genetic_data.get()
    return global.genetic_data or 0
end

-- Spend genetic data (returns true if successful, false if not enough)
function genetic_data.spend(amount)
    global.genetic_data = global.genetic_data or 0

    if global.genetic_data >= amount then
        global.genetic_data = global.genetic_data - amount
        genetic_data.update_gui_for_all_players()
        return true
    else
        return false
    end
end

-- Create GUI for a player
function genetic_data.create_gui(player)
    -- Remove existing GUI if it exists
    if player.gui.top["zerg-gui"] then
        player.gui.top["zerg-gui"].destroy()
    end

    -- Create main frame
    local main_frame = player.gui.top.add({
        type = "frame",
        name = "zerg-gui",
        direction = "horizontal",
        style = "inner_frame_in_outer_frame"
    })

    -- Add genetic data display
    local genetic_data_flow = main_frame.add({
        type = "flow",
        name = "genetic-data-flow",
        direction = "horizontal"
    })

    genetic_data_flow.add({
        type = "sprite",
        name = "genetic-data-icon",
        sprite = "item/genetic-data",
        tooltip = {"", "Genetic Data: Used for Zerg evolution and unlocking new structures"}
    })

    genetic_data_flow.add({
        type = "label",
        name = "genetic-data-label",
        caption = string.format("Genetic Data: %d", global.genetic_data or 0)
    })

    -- Add evolution level display
    local evolution_flow = main_frame.add({
        type = "flow",
        name = "evolution-flow",
        direction = "horizontal"
    })

    evolution_flow.add({
        type = "sprite",
        name = "evolution-icon",
        sprite = "technology/zerg-evolution-" .. (global.evolution_level or 1),
        tooltip = {"", "Evolution Level: Determines available Zerg structures and abilities"}
    })

    evolution_flow.add({
        type = "label",
        name = "evolution-label",
        caption = string.format("Evolution: Level %d", global.evolution_level or 1)
    })
end

-- Update GUI for a specific player
function genetic_data.update_gui(player)
    if not player or not player.valid then return end

    -- Create GUI if it doesn't exist
    if not player.gui.top["zerg-gui"] then
        genetic_data.create_gui(player)
        return
    end

    -- Update genetic data display
    local genetic_data_label = player.gui.top["zerg-gui"]["genetic-data-flow"]["genetic-data-label"]
    if genetic_data_label then
        genetic_data_label.caption = string.format("Genetic Data: %d", global.genetic_data or 0)
    end

    -- Update evolution level display
    local evolution_label = player.gui.top["zerg-gui"]["evolution-flow"]["evolution-label"]
    if evolution_label then
        evolution_label.caption = string.format("Evolution: Level %d", global.evolution_level or 1)
    end

    local evolution_icon = player.gui.top["zerg-gui"]["evolution-flow"]["evolution-icon"]
    if evolution_icon then
        evolution_icon.sprite = "technology/zerg-evolution-" .. (global.evolution_level or 1)
    end
end

-- Update GUI for all players
function genetic_data.update_gui_for_all_players()
    for _, player in pairs(game.players) do
        genetic_data.update_gui(player)
    end
end

-- Initialize GUI for a new player
function genetic_data.init_player(player)
    genetic_data.create_gui(player)
end

return genetic_data
