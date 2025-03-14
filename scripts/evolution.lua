-- Factorio Infested
-- Evolution System

local evolution = {}

-- Evolution levels and their thresholds
local EVOLUTION_THRESHOLDS = {
    [1] = 0,          -- Starting level
    [2] = 1000,       -- Level 2 requires 1,000 genetic data
    [3] = 5000,       -- Level 3 requires 5,000 genetic data
    [4] = 15000,      -- Level 4 requires 15,000 genetic data
    [5] = 50000       -- Level 5 requires 50,000 genetic data
}

-- Initialize evolution system
function evolution.init()
    global.evolution_level = global.evolution_level or 1
    global.genetic_data = global.genetic_data or 0
    global.evolution_unlocks = global.evolution_unlocks or {}

    -- Initialize unlocks for each level
    for level = 1, 5 do
        global.evolution_unlocks[level] = global.evolution_unlocks[level] or {}
    end

    -- Set up default unlocks for level 1
    if not global.evolution_unlocks[1].initialized then
        evolution.setup_level_1_unlocks()
        global.evolution_unlocks[1].initialized = true
    end
end

-- Set up default unlocks for level 1
function evolution.setup_level_1_unlocks()
    global.evolution_unlocks[1] = {
        buildings = {
            "infested-assembler",
            "infested-drill",
            "infested-lab",
            "infested-turret",
            "infested-belt",
            "infested-inserter",
            "infested-chest",
            "infested-boiler",
            "infested-steam-engine",
            "infested-pole"
        },
        technologies = {
            "basic-biomass-processing",
            "basic-resource-infusion",
            "simple-defenses"
        },
        initialized = true
    }
end

-- Check if evolution level should increase
function evolution.check_evolution_level()
    local current_level = global.evolution_level
    local genetic_data = global.genetic_data

    -- Check if we have enough genetic data for the next level
    for level = current_level + 1, 5 do
        if genetic_data >= EVOLUTION_THRESHOLDS[level] then
            evolution.increase_level(level)
            return
        end
    end
end

-- Increase evolution level and unlock new content
function evolution.increase_level(new_level)
    local old_level = global.evolution_level
    global.evolution_level = new_level

    -- Unlock new content based on the new level
    evolution.unlock_level_content(new_level)

    -- Notify all players of the evolution
    for _, player in pairs(game.players) do
        player.print({"", "[color=purple]Evolution level increased to ", new_level, "![/color]"})
        player.play_sound({path = "infested-evolution-level-up"})
    end

    -- Apply global bonuses based on new evolution level
    evolution.apply_global_bonuses(new_level)
end

-- Unlock content for a specific evolution level
function evolution.unlock_level_content(level)
    -- Initialize level unlocks if not already done
    if not global.evolution_unlocks[level].initialized then
        evolution.setup_level_unlocks(level)
        global.evolution_unlocks[level].initialized = true
    end

    -- Unlock technologies for this level
    for _, tech_name in ipairs(global.evolution_unlocks[level].technologies or {}) do
        for _, force in pairs(game.forces) do
            if force.technologies[tech_name] then
                force.technologies[tech_name].enabled = true
            end
        end
    end

    -- Unlock recipes for this level
    for _, recipe_name in ipairs(global.evolution_unlocks[level].recipes or {}) do
        for _, force in pairs(game.forces) do
            if force.recipes[recipe_name] then
                force.recipes[recipe_name].enabled = true
            end
        end
    end
end

-- Set up unlocks for specific evolution levels
function evolution.setup_level_unlocks(level)
    if level == 2 then
        global.evolution_unlocks[2] = {
            buildings = {
                "evolution-chamber",
                "spine-crawler",
                "spore-crawler",
                "improved-biomass-processor",
                "advanced-infusion-chamber"
            },
            technologies = {
                "evolution-chamber-tech",
                "improved-biomass-processing",
                "advanced-resource-infusion",
                "improved-defenses"
            },
            recipes = {
                "evolution-chamber",
                "spine-crawler",
                "spore-crawler",
                "improved-biomass-processor",
                "advanced-infusion-chamber",
                "carapace-plating",
                "neural-conduit"
            },
            initialized = true
        }
    elseif level == 3 then
        global.evolution_unlocks[3] = {
            buildings = {
                "specialized-extractor",
                "creep-tumor",
                "advanced-defensive-structure",
                "biomass-integrator"
            },
            technologies = {
                "specialized-resource-processing",
                "improved-creep-spread",
                "advanced-defensive-systems",
                "efficient-resource-biomass-integration"
            },
            recipes = {
                "specialized-extractor",
                "creep-tumor",
                "advanced-defensive-structure",
                "biomass-integrator",
                "enzymatic-catalyst",
                "organic-fluids"
            },
            initialized = true
        }
    elseif level == 4 then
        global.evolution_unlocks[4] = {
            buildings = {
                "advanced-biomass-compound-processor",
                "transport-network",
                "pollution-processor",
                "high-efficiency-extractor"
            },
            technologies = {
                "advanced-biomass-compounds",
                "transport-network-tech",
                "specialized-pollution-processing",
                "high-efficiency-resource-utilization"
            },
            recipes = {
                "advanced-biomass-compound-processor",
                "transport-network",
                "pollution-processor",
                "high-efficiency-extractor",
                "advanced-carapace",
                "advanced-neural-conduit"
            },
            initialized = true
        }
    elseif level == 5 then
        global.evolution_unlocks[5] = {
            buildings = {
                "space-adaptation-chamber",
                "leviathan-chrysalis",
                "ultimate-evolution-form",
                "hyper-evolutionary-processor"
            },
            technologies = {
                "space-adaptation",
                "leviathan-chrysalis-tech",
                "ultimate-evolution",
                "hyper-evolutionary-processing"
            },
            recipes = {
                "space-adaptation-chamber",
                "leviathan-chrysalis",
                "ultimate-evolution-form",
                "hyper-evolutionary-processor",
                "hyper-evolutionary-dna",
                "space-adapted-creep"
            },
            initialized = true
        }
    end
end

-- Apply global bonuses based on evolution level
function evolution.apply_global_bonuses(level)
    local bonus_multiplier = 1 + (level - 1) * 0.2 -- 20% increase per level

    -- Apply bonuses to all infested buildings
    for _, surface in pairs(game.surfaces) do
        for _, entity in pairs(surface.find_entities_filtered({type = {"assembling-machine", "mining-drill", "lab", "furnace"}})) do
            if string.find(entity.name, "infested") then
                -- Apply speed bonus
                if entity.speed_bonus then
                    entity.speed_bonus = bonus_multiplier - 1
                end

                -- Apply productivity bonus
                if entity.productivity_bonus then
                    entity.productivity_bonus = (level - 1) * 0.05 -- 5% per level above 1
                end
            end
        end
    end
end

-- Add genetic data and check for evolution
function evolution.add_genetic_data(amount)
    -- Apply multiplier from settings
    local multiplier = settings.global["infested-genetic-data-multiplier"].value
    amount = amount * multiplier

    -- Add to global total
    global.genetic_data = global.genetic_data + amount

    -- Check if we should evolve
    evolution.check_evolution_level()

    -- Update GUI for all players
    for _, player in pairs(game.players) do
        if player.connected then
            evolution.update_gui(player)
        end
    end

    return amount
end

-- Get current evolution level
function evolution.get_level()
    return global.evolution_level
end

-- Get current genetic data
function evolution.get_genetic_data()
    return global.genetic_data
end

-- Get genetic data needed for next level
function evolution.get_next_level_requirement()
    local current_level = global.evolution_level
    if current_level < 5 then
        return EVOLUTION_THRESHOLDS[current_level + 1]
    else
        return nil -- Max level reached
    end
end

-- Update GUI for a player
function evolution.update_gui(player)
    -- This function will be implemented in the genetic_data.lua script
    if remote.interfaces["genetic_data"] and remote.interfaces["genetic_data"]["update_gui"] then
        remote.call("genetic_data", "update_gui", player)
    end
end

return evolution
