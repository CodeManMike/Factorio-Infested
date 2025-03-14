-- Factorio Infested
-- Main control script

local genetic_data = require("scripts.genetic_data")
local infested_evolution = require("scripts.evolution")
local biter_capture = require("scripts.biter_capture")
local creep_system = require("scripts.creep_system")
local biomass_transport = require("scripts.biomass_transport")
local specialized_compounds = require("scripts.specialized_compounds")

-- Initialize mod when a new game is created
script.on_init(function()
    -- Initialize genetic data and evolution
    global.genetic_data = global.genetic_data or 0
    global.evolution_level = global.evolution_level or 1
    global.biomass = global.biomass or 0

    -- Initialize systems
    infested_evolution.init()
    biter_capture.init()
    specialized_compounds.init()

    -- Initialize creep system
    global.creep_tiles = global.creep_tiles or {}
    global.creep_sources = global.creep_sources or {}

    -- Initialize biomass transport
    global.biomass_network = global.biomass_network or {}
    global.biomass_storage = global.biomass_storage or {}

    -- Initialize specialized compounds
    global.specialized_compounds = global.specialized_compounds or {
        carapace = 0,
        acid = 0,
        toxin = 0,
        enzyme = 0
    }

    -- Initialize resource-infused materials
    global.infused_materials = global.infused_materials or {
        neural_conduits = 0,
        enzymatic_catalyst = 0,
        organic_fluids = 0,
        hyper_evolutionary_dna = 0
    }

    -- Register handlers
    specialized_compounds.register_handlers()
end)

-- Handle configuration changes
script.on_configuration_changed(function(data)
    -- Re-initialize systems when mod is updated
    infested_evolution.init()
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

-- Handle creep spread
script.on_nth_tick(60, function(event)
    if settings.global["infested-auto-spread-creep"].value then
        creep_system.spread_creep()
    end
end)

-- Handle biomass transport
script.on_nth_tick(10, function(event)
    biomass_transport.process_transport()
end)

-- Handle pollution conversion to biomass
script.on_nth_tick(300, function(event)
    if settings.global["infested-pollution-to-biomass"].value then
        creep_system.convert_pollution_to_biomass()
    end
end)

-- Handle building placement
script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.created_entity

    -- Check if building requires creep
    if settings.global["infested-buildings-require-creep"].value then
        if string.find(entity.name, "infested") or string.find(entity.name, "evolution") then
            -- Check if building is on creep
            if not creep_system.is_on_creep(entity.position) then
                -- Not on creep, cancel placement and refund item
                local player = game.players[event.player_index]
                player.insert({name = event.stack.name, count = 1})
                entity.destroy()
                player.print({"", "[color=red]This building requires creep to be placed![/color]"})
                return
            end
        end
    end

    -- Register creep sources
    if entity.name == "creep-tumor" or entity.name == "hatchery" then
        creep_system.register_creep_source(entity)
    end

    -- Register biomass transport nodes
    if string.find(entity.name, "infested") or entity.name == "transport-network" then
        biomass_transport.register_node(entity)
    end
end)

-- Handle building removal
script.on_event(defines.events.on_entity_died, function(event)
    local entity = event.entity

    -- Unregister creep sources
    if entity.name == "creep-tumor" or entity.name == "hatchery" then
        creep_system.unregister_creep_source(entity)
    end

    -- Unregister biomass transport nodes
    if string.find(entity.name, "infested") or entity.name == "transport-network" then
        biomass_transport.unregister_node(entity)
    end
end)

-- Handle GUI clicks
script.on_event(defines.events.on_gui_click, function(event)
    genetic_data.on_gui_click(event)
end)

-- Add biomass
function add_biomass(amount)
    global.biomass = global.biomass + amount

    -- Update GUI for all players
    for _, player in pairs(game.players) do
        if player.connected and settings.get_player_settings(player)["infested-show-biomass-gui"].value then
            update_biomass_gui(player)
        end
    end

    return amount
end

-- Update biomass GUI for a player
function update_biomass_gui(player)
    -- Create or update biomass GUI
    local frame = player.gui.left["biomass-frame"]
    if not frame then
        frame = player.gui.left.add({type = "frame", name = "biomass-frame", caption = "Biomass"})
        frame.add({type = "label", name = "biomass-label"})
    end

    frame["biomass-label"].caption = string.format("Available: %d", global.biomass)
end

-- Add specialized compound
function add_specialized_compound(compound_type, amount)
    if global.specialized_compounds[compound_type] then
        global.specialized_compounds[compound_type] = global.specialized_compounds[compound_type] + amount
        return amount
    end
    return 0
end

-- Add infused material
function add_infused_material(material_type, amount)
    if global.infused_materials[material_type] then
        global.infused_materials[material_type] = global.infused_materials[material_type] + amount
        return amount
    end
    return 0
end

-- Remote interface for other mods to interact with
remote.add_interface("factorio_infested", {
    add_genetic_data = function(amount)
        return infested_evolution.add_genetic_data(amount)
    end,
    add_biomass = function(amount)
        return add_biomass(amount)
    end,
    get_evolution_level = function()
        return infested_evolution.get_level()
    end,
    get_genetic_data = function()
        return infested_evolution.get_genetic_data()
    end,
    get_biomass = function()
        return global.biomass
    end,
    add_compound = function(compound_type, amount)
        return specialized_compounds.add_compound(compound_type, amount)
    end,
    get_compound = function(compound_type)
        return specialized_compounds.get_compound(compound_type)
    end,
    add_infused_material = function(material_type, amount)
        return specialized_compounds.add_infused_material(material_type, amount)
    end,
    get_infused_material = function(material_type)
        return specialized_compounds.get_infused_material(material_type)
    end
})
