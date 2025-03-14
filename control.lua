-- Zerg Factorio Space Age
-- Main control script

local genetic_data = require("scripts.genetic_data")
local zerg_evolution = require("scripts.zerg_evolution")
local biter_capture = require("scripts.biter_capture")
local creep_system = require("scripts.creep_system")
local biomass_transport = require("scripts.biomass_transport")

-- Initialize mod when a new game is created
script.on_init(function()
    -- Initialize genetic data and evolution
    global.genetic_data = global.genetic_data or 0
    global.evolution_level = global.evolution_level or 1

    -- Initialize systems
    zerg_evolution.init()
    biter_capture.init()

    -- Initialize creep system
    global.creep_tiles = global.creep_tiles or {}
    global.creep_sources = global.creep_sources or {}

    -- Initialize biomass transport
    global.biomass_network = global.biomass_network or {}
    global.biomass_storage = global.biomass_storage or {}
end)

-- Handle configuration changes
script.on_configuration_changed(function(data)
    -- Re-initialize systems when mod is updated
    zerg_evolution.init()
    biter_capture.init()

    -- Update GUI for all players
    for _, player in pairs(game.players) do
        genetic_data.update_gui(player)
    end
end)

-- Handle player creation
script.on_event(defines.events.on_player_created, function(event)
    local player = game.players[event.player_index]
    genetic_data.init_player(player)
end)

-- Handle biter capture events
script.on_event(defines.events.on_entity_died, function(event)
    biter_capture.on_entity_died(event)
end)

-- Handle building placement events
script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.created_entity
    if not entity or not entity.valid then return end

    -- Check if this is a Zerg building
    if string.sub(entity.name, 1, 5) == "zerg-" or entity.name == "creep-tumor" then
        -- Verify it's on or near creep if required by settings
        if settings.global["zerg-buildings-require-creep"].value then
            if not creep_system.is_on_creep(entity.position) and not creep_system.is_near_creep(entity.position) then
                -- If not on creep and not a creep producer, warn player and potentially remove
                if not creep_system.is_creep_producer(entity.name) then
                    game.players[event.player_index].print({"", "[color=red]Warning: ", entity.name, " must be placed on or near creep![/color]"})
                    entity.destroy()
                    return
                end
            end
        end

        -- If it's a creep producer, register it
        if creep_system.is_creep_producer(entity.name) then
            creep_system.register_creep_source(entity)
        end

        -- If it's part of the biomass network, register it
        if biomass_transport.is_network_entity(entity.name) then
            biomass_transport.register_network_entity(entity)
        end
    end
end)

-- Handle robot building placement
script.on_event(defines.events.on_robot_built_entity, function(event)
    local entity = event.created_entity
    if not entity or not entity.valid then return end

    -- Check if this is a Zerg building
    if string.sub(entity.name, 1, 5) == "zerg-" or entity.name == "creep-tumor" then
        -- Verify it's on or near creep if required by settings
        if settings.global["zerg-buildings-require-creep"].value then
            if not creep_system.is_on_creep(entity.position) and not creep_system.is_near_creep(entity.position) then
                -- If not on creep and not a creep producer, remove it
                if not creep_system.is_creep_producer(entity.name) then
                    entity.destroy()
                    return
                end
            end
        end

        -- If it's a creep producer, register it
        if creep_system.is_creep_producer(entity.name) then
            creep_system.register_creep_source(entity)
        end

        -- If it's part of the biomass network, register it
        if biomass_transport.is_network_entity(entity.name) then
            biomass_transport.register_network_entity(entity)
        end
    end
end)

-- Handle building removal events
script.on_event(defines.events.on_entity_destroyed, function(event)
    local entity = event.entity
    if not entity or not entity.valid then return end

    -- If it was a creep producer, unregister it
    if creep_system.is_creep_producer(entity.name) then
        creep_system.unregister_creep_source(entity)
    end

    -- If it was part of the biomass network, unregister it
    if biomass_transport.is_network_entity(entity.name) then
        biomass_transport.unregister_network_entity(entity)
    end
end)

-- Register custom commands for debugging
commands.add_command("zerg-add-genetic-data", "Add genetic data for debugging", function(command)
    local player = game.players[command.player_index]
    if not player or not player.admin then return end

    local amount = tonumber(command.parameter) or 100
    genetic_data.add(amount)
    player.print("Added " .. amount .. " genetic data. New total: " .. genetic_data.get())
end)

commands.add_command("zerg-evolution-level", "Set evolution level for debugging", function(command)
    local player = game.players[command.player_index]
    if not player or not player.admin then return end

    local level = tonumber(command.parameter) or 1
    zerg_evolution.set_level(level)
    player.print("Set evolution level to " .. level)
end)

commands.add_command("zerg-spread-creep", "Manually spread creep for debugging", function(command)
    local player = game.players[command.player_index]
    if not player or not player.admin then return end

    creep_system.force_spread_creep()
    player.print("Manually triggered creep spread")
end)

-- Update GUI elements and process game mechanics
script.on_event(defines.events.on_tick, function(event)
    -- Update GUI once per second
    if event.tick % 60 == 0 then
        genetic_data.update_gui_for_all_players()
    end

    -- Process creep spread every 5 seconds
    if event.tick % 300 == 0 then
        creep_system.process_creep_spread()
    end

    -- Process biomass transport every 10 ticks
    if event.tick % 10 == 0 then
        biomass_transport.process_transport()
    end

    -- Convert pollution to biomass every 30 seconds
    if event.tick % 1800 == 0 then
        creep_system.process_pollution_absorption()
    end
end)

-- Apply movement speed bonus on creep for players
script.on_event(defines.events.on_player_changed_position, function(event)
    local player = game.players[event.player_index]
    if not player or not player.valid or not player.character then return end

    -- Check if player is on creep
    if creep_system.is_on_creep(player.position) then
        -- Apply speed bonus if on creep
        player.character.character_running_speed_modifier = 0.3 -- 30% speed bonus
    else
        -- Remove speed bonus if not on creep
        player.character.character_running_speed_modifier = 0
    end
end)
