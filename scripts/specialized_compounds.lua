-- Factorio Infested
-- Specialized Compounds System

local specialized_compounds = {}

-- Constants
local COMPOUND_TYPES = {
    "carapace",     -- Defensive material (from processing stone/iron)
    "acid",         -- Offensive material (from processing sulfur/oil)
    "toxin",        -- Advanced compound for spreading infection (from processing uranium/oil)
    "enzyme"        -- Catalytic material (from processing coal/biomass)
}

local INFUSED_MATERIALS = {
    "neural_conduits",      -- Energy transmission material (copper-infused biomass)
    "enzymatic_catalyst",   -- Process accelerator (coal-infused biomass)
    "organic_fluids",       -- Advanced bio-compounds (oil-infused biomass)
    "hyper_evolutionary_dna" -- Ultimate evolution material (uranium-infused biomass)
}

-- Initialize the specialized compounds system
function specialized_compounds.init()
    global.specialized_compounds = global.specialized_compounds or {}
    global.infused_materials = global.infused_materials or {}

    -- Initialize compound types
    for _, compound_type in ipairs(COMPOUND_TYPES) do
        global.specialized_compounds[compound_type] = global.specialized_compounds[compound_type] or 0
    end

    -- Initialize infused materials
    for _, material_type in ipairs(INFUSED_MATERIALS) do
        global.infused_materials[material_type] = global.infused_materials[material_type] or 0
    end
end

-- Add specialized compound
function specialized_compounds.add_compound(compound_type, amount)
    if not global.specialized_compounds[compound_type] then
        return 0
    end

    global.specialized_compounds[compound_type] = global.specialized_compounds[compound_type] + amount

    -- Update GUI for all players
    specialized_compounds.update_gui_for_all_players()

    return amount
end

-- Get specialized compound amount
function specialized_compounds.get_compound(compound_type)
    return global.specialized_compounds[compound_type] or 0
end

-- Add infused material
function specialized_compounds.add_infused_material(material_type, amount)
    if not global.infused_materials[material_type] then
        return 0
    end

    global.infused_materials[material_type] = global.infused_materials[material_type] + amount

    -- Update GUI for all players
    specialized_compounds.update_gui_for_all_players()

    return amount
end

-- Get infused material amount
function specialized_compounds.get_infused_material(material_type)
    return global.infused_materials[material_type] or 0
end

-- Process resource infusion
function specialized_compounds.process_infusion(recipe_name, ingredients, products)
    -- This function will be called when an infusion recipe is completed
    -- It will convert the ingredients into the appropriate specialized compound or infused material

    if recipe_name == "carapace-plating" then
        -- Convert iron and stone to carapace
        specialized_compounds.add_compound("carapace", products.amount)
    elseif recipe_name == "neural-conduit" then
        -- Convert copper and biomass to neural conduits
        specialized_compounds.add_infused_material("neural_conduits", products.amount)
    elseif recipe_name == "enzymatic-catalyst" then
        -- Convert coal and biomass to enzymatic catalyst
        specialized_compounds.add_infused_material("enzymatic_catalyst", products.amount)
    elseif recipe_name == "organic-fluids" then
        -- Convert oil and biomass to organic fluids
        specialized_compounds.add_infused_material("organic_fluids", products.amount)
    elseif recipe_name == "hyper-evolutionary-dna" then
        -- Convert uranium and biomass to hyper-evolutionary DNA
        specialized_compounds.add_infused_material("hyper_evolutionary_dna", products.amount)
    elseif recipe_name == "acid-production" then
        -- Convert sulfur and oil to acid
        specialized_compounds.add_compound("acid", products.amount)
    elseif recipe_name == "toxin-production" then
        -- Convert uranium and oil to toxin
        specialized_compounds.add_compound("toxin", products.amount)
    elseif recipe_name == "enzyme-production" then
        -- Convert coal and biomass to enzyme
        specialized_compounds.add_compound("enzyme", products.amount)
    end
end

-- Update GUI for all players
function specialized_compounds.update_gui_for_all_players()
    for _, player in pairs(game.players) do
        if player.connected then
            specialized_compounds.update_gui(player)
        end
    end
end

-- Update GUI for a player
function specialized_compounds.update_gui(player)
    -- Create or update compounds GUI
    local frame = player.gui.left["compounds-frame"]
    if not frame then
        frame = player.gui.left.add({type = "frame", name = "compounds-frame", caption = "Specialized Compounds"})

        -- Add labels for each compound type
        for _, compound_type in ipairs(COMPOUND_TYPES) do
            frame.add({type = "label", name = compound_type .. "-label"})
        end

        -- Add separator
        frame.add({type = "line"})

        -- Add labels for each infused material
        for _, material_type in ipairs(INFUSED_MATERIALS) do
            frame.add({type = "label", name = material_type .. "-label"})
        end
    end

    -- Update compound values
    for _, compound_type in ipairs(COMPOUND_TYPES) do
        frame[compound_type .. "-label"].caption = string.format("%s: %d", compound_type:gsub("_", " "):gsub("^%l", string.upper), global.specialized_compounds[compound_type] or 0)
    end

    -- Update infused material values
    for _, material_type in ipairs(INFUSED_MATERIALS) do
        frame[material_type .. "-label"].caption = string.format("%s: %d", material_type:gsub("_", " "):gsub("^%l", string.upper), global.infused_materials[material_type] or 0)
    end
end

-- Register handlers for infusion recipes
function specialized_compounds.register_handlers()
    script.on_event(defines.events.on_recipe_completed, function(event)
        local recipe = event.recipe
        if not recipe then return end

        -- Check if this is an infusion recipe
        if string.find(recipe.name, "infusion") or
           string.find(recipe.name, "plating") or
           string.find(recipe.name, "conduit") or
           string.find(recipe.name, "catalyst") or
           string.find(recipe.name, "fluids") or
           string.find(recipe.name, "dna") or
           string.find(recipe.name, "production") then

            specialized_compounds.process_infusion(recipe.name, event.ingredients, event.products)
        end
    end)
end

return specialized_compounds
