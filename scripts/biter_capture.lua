-- Factorio Infested
-- Biter Capture System

local biter_capture = {}

-- Genetic data values for different biter types
local BITER_GENETIC_VALUES = {
    ["small-biter"] = 5,
    ["medium-biter"] = 15,
    ["big-biter"] = 40,
    ["behemoth-biter"] = 100,

    ["small-spitter"] = 8,
    ["medium-spitter"] = 20,
    ["big-spitter"] = 50,
    ["behemoth-spitter"] = 120,

    ["small-worm-turret"] = 30,
    ["medium-worm-turret"] = 75,
    ["big-worm-turret"] = 150,

    ["biter-spawner"] = 200,
    ["spitter-spawner"] = 200
}

-- Handle entity death events
function biter_capture.on_entity_died(event)
    -- Check if a biter was killed
    local entity = event.entity
    if not entity or not entity.valid then return end

    -- Check if this is a biter entity
    local genetic_value = BITER_GENETIC_VALUES[entity.name]
    if not genetic_value then return end

    -- Check if killed by player or player's structures
    local cause = event.cause
    if not cause then return end

    local is_player_kill = false

    if cause.type == "character" then
        -- Direct player kill
        is_player_kill = true
    elseif cause.type == "car" or cause.type == "locomotive" or cause.type == "cargo-wagon" then
        -- Vehicle kill
        is_player_kill = true
    elseif cause.type == "ammo-turret" or cause.type == "electric-turret" or cause.type == "fluid-turret" then
        -- Turret kill
        is_player_kill = true
    elseif string.sub(cause.name, 1, 5) == "infested-" then
        -- Infested structure kill
        is_player_kill = true
    end

    -- If not a player kill, no genetic data
    if not is_player_kill then return end

    -- Apply settings multiplier
    local multiplier = settings.global["zerg-evolution-rate"].value
    local final_value = math.floor(genetic_value * multiplier)

    -- Add genetic data
    local genetic_data = require("scripts.genetic_data")
    genetic_data.add(final_value)

    -- Create visual effect
    biter_capture.create_capture_effect(entity.position, entity.surface)

    -- Track captured biter
    biter_capture.track_capture(entity.name)

    -- Notify player if it's a significant capture
    if genetic_value >= 100 then
        for _, player in pairs(game.players) do
            player.print({"", "[color=purple]Significant genetic data extracted from ", entity.name, "![/color]"})
        end
    end
end

-- Create visual effect for biter capture
function biter_capture.create_capture_effect(position, surface)
    -- Create purple particle effect
    surface.create_entity({
        name = "purple-dust-particle",
        position = position,
        movement = {0, 0},
        height = 0,
        vertical_speed = 0.1,
        frame_speed = 1
    })

    -- Create flying text
    surface.create_entity({
        name = "flying-text",
        position = {position.x, position.y - 1},
        text = "Genetic Data Extracted",
        color = {r = 0.8, g = 0.2, b = 0.8}
    })

    -- Play sound
    surface.play_sound({
        path = "biomass-collection",
        position = position,
        volume = 0.7
    })
end

-- Track captured biter types
function biter_capture.track_capture(biter_name)
    global.captured_biters = global.captured_biters or {}
    global.captured_biters[biter_name] = (global.captured_biters[biter_name] or 0) + 1

    -- Check if we've captured enough of this type to unlock special abilities
    biter_capture.check_special_unlocks(biter_name)
end

-- Check for special unlocks based on captured biters
function biter_capture.check_special_unlocks(biter_name)
    -- Special unlocks based on number of captures
    local special_unlocks = {
        ["small-biter"] = {count = 50, unlock = "zerg-zergling-boost"},
        ["medium-biter"] = {count = 30, unlock = "zerg-roach-armor"},
        ["big-biter"] = {count = 20, unlock = "zerg-hydralisk-range"},
        ["behemoth-biter"] = {count = 10, unlock = "zerg-ultralisk-charge"},

        ["small-spitter"] = {count = 50, unlock = "zerg-baneling-splash"},
        ["medium-spitter"] = {count = 30, unlock = "zerg-ravager-bile"},
        ["big-spitter"] = {count = 20, unlock = "zerg-mutalisk-bounce"},
        ["behemoth-spitter"] = {count = 10, unlock = "zerg-broodlord-range"},

        ["biter-spawner"] = {count = 5, unlock = "zerg-queen-spawn-boost"},
        ["spitter-spawner"] = {count = 5, unlock = "zerg-infestor-fungal"}
    }

    -- Check if this biter type has a special unlock
    local unlock_data = special_unlocks[biter_name]
    if not unlock_data then return end

    -- Check if we've captured enough
    if (global.captured_biters[biter_name] or 0) >= unlock_data.count then
        -- Check if already unlocked
        global.special_unlocks = global.special_unlocks or {}
        if global.special_unlocks[unlock_data.unlock] then return end

        -- Unlock the special ability
        global.special_unlocks[unlock_data.unlock] = true

        -- Notify players
        for _, player in pairs(game.players) do
            player.print({"", "[color=purple]New Zerg ability unlocked: ", unlock_data.unlock, "![/color]"})

            -- Play sound
            player.surface.play_sound({
                path = "evolution-complete",
                position = player.position,
                volume = 0.8
            })
        end
    end
end

-- Get total genetic data extracted from biters
function biter_capture.get_total_genetic_data()
    local total = 0

    for biter_name, count in pairs(global.captured_biters or {}) do
        local value = BITER_GENETIC_VALUES[biter_name] or 0
        total = total + (value * count)
    end

    return total
end

-- Get count of captured biters by type
function biter_capture.get_captured_count(biter_name)
    return global.captured_biters and global.captured_biters[biter_name] or 0
end

-- Initialize biter capture system
function biter_capture.init()
    global.captured_biters = global.captured_biters or {}
    global.special_unlocks = global.special_unlocks or {}
end

return biter_capture
