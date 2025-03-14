-- Factorio Infested
-- Creep System Script

local creep_system = {}

-- Constants
local CREEP_TILE_NAME = "infested-creep"
local MATURE_CREEP_TILE_NAME = "infested-mature-creep"
local CREEP_SPREAD_DISTANCE = 3
local CREEP_SPREAD_CHANCE = 0.3
local CREEP_MATURATION_CHANCE = 0.1
local CREEP_DECAY_CHANCE = 0.05
local POLLUTION_TO_BIOMASS_RATIO = 10 -- How much pollution to convert to 1 biomass

-- List of entities that can produce creep
local CREEP_PRODUCERS = {
    ["hatchery"] = {radius = 15, strength = 1.0},
    ["creep-tumor"] = {radius = 10, strength = 0.8},
    ["spawning-pool"] = {radius = 8, strength = 0.6},
    ["evolution-chamber"] = {radius = 5, strength = 0.4}
}

-- Check if an entity is a creep producer
function creep_system.is_creep_producer(entity_name)
    return CREEP_PRODUCERS[entity_name] ~= nil
end

-- Check if a position is on creep
function creep_system.is_on_creep(position)
    local surface = game.surfaces[1] -- Assuming main surface
    local tile = surface.get_tile(position.x, position.y)
    return tile.name == CREEP_TILE_NAME or tile.name == MATURE_CREEP_TILE_NAME
end

-- Check if a position is near creep (within 3 tiles)
function creep_system.is_near_creep(position)
    local surface = game.surfaces[1]
    for x = -3, 3 do
        for y = -3, 3 do
            local check_pos = {x = position.x + x, y = position.y + y}
            local tile = surface.get_tile(check_pos.x, check_pos.y)
            if tile.name == CREEP_TILE_NAME or tile.name == MATURE_CREEP_TILE_NAME then
                return true
            end
        end
    end
    return false
end

-- Register a creep source
function creep_system.register_creep_source(entity)
    if not global.creep_sources then
        global.creep_sources = {}
    end

    -- Store the entity reference and its details
    table.insert(global.creep_sources, {
        entity = entity,
        position = entity.position,
        radius = CREEP_PRODUCERS[entity.name].radius,
        strength = CREEP_PRODUCERS[entity.name].strength,
        last_spread_tick = game.tick
    })

    -- Initial creep placement around the source
    creep_system.place_initial_creep(entity)
end

-- Unregister a creep source
function creep_system.unregister_creep_source(entity)
    if not global.creep_sources then return end

    for i, source in ipairs(global.creep_sources) do
        if source.entity == entity then
            table.remove(global.creep_sources, i)
            return
        end
    end
end

-- Place initial creep around a new creep source
function creep_system.place_initial_creep(entity)
    local surface = entity.surface
    local position = entity.position
    local radius = CREEP_PRODUCERS[entity.name].radius / 3 -- Initial radius is smaller

    -- Place creep in a circle around the entity
    for x = -radius, radius do
        for y = -radius, radius do
            local pos = {x = position.x + x, y = position.y + y}
            local distance = ((pos.x - position.x)^2 + (pos.y - position.y)^2)^0.5

            if distance <= radius then
                local tile = surface.get_tile(pos.x, pos.y)
                if tile.collides_with("ground-tile") then
                    surface.set_tiles({{name = CREEP_TILE_NAME, position = pos}})

                    -- Register this tile in our creep tracking system
                    if not global.creep_tiles then
                        global.creep_tiles = {}
                    end
                    local tile_key = pos.x .. "," .. pos.y
                    global.creep_tiles[tile_key] = {
                        position = pos,
                        mature = false,
                        age = 0,
                        last_update = game.tick
                    }
                end
            end
        end
    end

    -- Play creep spread sound
    surface.play_sound({path = "creep-spread", position = position, volume = 0.5})
end

-- Process creep spread for all sources
function creep_system.process_creep_spread()
    if not global.creep_sources then return end

    local creep_spread_rate = settings.global["zerg-creep-spread-rate"].value
    local max_creep_distance = settings.global["zerg-max-creep-distance"].value

    for _, source in ipairs(global.creep_sources) do
        -- Skip invalid entities
        if not source.entity or not source.entity.valid then
            creep_system.unregister_creep_source(source.entity)
            goto continue
        end

        -- Determine if this source should spread creep this tick
        local spread_interval = math.max(300, 600 - (source.strength * 100))
        if (game.tick - source.last_spread_tick) < spread_interval then
            goto continue
        end

        -- Update last spread tick
        source.last_spread_tick = game.tick

        -- Get all creep tiles within the source's radius
        local surface = source.entity.surface
        local creep_tiles = {}

        for tile_key, tile_data in pairs(global.creep_tiles or {}) do
            local pos = tile_data.position
            local distance = ((pos.x - source.position.x)^2 + (pos.y - source.position.y)^2)^0.5

            if distance <= source.radius and distance <= max_creep_distance then
                table.insert(creep_tiles, tile_data)
            end
        end

        -- No creep tiles to spread from
        if #creep_tiles == 0 then
            goto continue
        end

        -- Select a random creep tile to spread from
        local random_tile = creep_tiles[math.random(#creep_tiles)]

        -- Try to spread in a random direction
        local directions = {
            {x = 1, y = 0},
            {x = -1, y = 0},
            {x = 0, y = 1},
            {x = 0, y = -1},
            {x = 1, y = 1},
            {x = -1, y = 1},
            {x = 1, y = -1},
            {x = -1, y = -1}
        }

        local direction = directions[math.random(#directions)]
        local new_pos = {
            x = random_tile.position.x + direction.x,
            y = random_tile.position.y + direction.y
        }

        -- Check if the new position is valid for creep
        local tile = surface.get_tile(new_pos.x, new_pos.y)
        if tile.collides_with("ground-tile") and
           tile.name ~= CREEP_TILE_NAME and
           tile.name ~= MATURE_CREEP_TILE_NAME then

            -- Apply spread chance modified by source strength and settings
            if math.random() < (CREEP_SPREAD_CHANCE * source.strength * creep_spread_rate) then
                -- Place new creep tile
                surface.set_tiles({{name = CREEP_TILE_NAME, position = new_pos}})

                -- Register the new creep tile
                local tile_key = new_pos.x .. "," .. new_pos.y
                global.creep_tiles[tile_key] = {
                    position = new_pos,
                    mature = false,
                    age = 0,
                    last_update = game.tick
                }

                -- Occasionally play creep spread sound
                if math.random() < 0.2 then
                    surface.play_sound({path = "creep-spread", position = new_pos, volume = 0.3})
                end
            end
        end

        -- Process creep maturation
        if random_tile.mature == false and math.random() < CREEP_MATURATION_CHANCE then
            random_tile.age = random_tile.age + 1

            -- After enough age, convert to mature creep
            if random_tile.age >= 5 then
                surface.set_tiles({{name = MATURE_CREEP_TILE_NAME, position = random_tile.position}})
                random_tile.mature = true
            end
        end

        ::continue::
    end

    -- Process creep decay for tiles far from any source
    creep_system.process_creep_decay()
end

-- Process creep decay for tiles far from any source
function creep_system.process_creep_decay()
    if not global.creep_tiles or not global.creep_sources then return end

    local max_creep_distance = settings.global["zerg-max-creep-distance"].value
    local surface = game.surfaces[1]
    local tiles_to_remove = {}

    for tile_key, tile_data in pairs(global.creep_tiles) do
        -- Check if this tile is within range of any creep source
        local in_range = false

        for _, source in ipairs(global.creep_sources) do
            if source.entity and source.entity.valid then
                local distance = ((tile_data.position.x - source.position.x)^2 +
                                 (tile_data.position.y - source.position.y)^2)^0.5

                if distance <= source.radius and distance <= max_creep_distance then
                    in_range = true
                    break
                end
            end
        end

        -- If not in range of any source, it may decay
        if not in_range and math.random() < CREEP_DECAY_CHANCE then
            -- Mature creep first reverts to normal creep
            if tile_data.mature then
                surface.set_tiles({{name = CREEP_TILE_NAME, position = tile_data.position}})
                tile_data.mature = false
                tile_data.age = 3 -- Give it some age so it doesn't immediately mature again
            else
                -- Normal creep decays to the original tile
                local original_tile = surface.get_hidden_tile(tile_data.position.x, tile_data.position.y) or "grass-1"
                surface.set_tiles({{name = original_tile, position = tile_data.position}})
                table.insert(tiles_to_remove, tile_key)
            end
        end
    end

    -- Remove decayed tiles from tracking
    for _, key in ipairs(tiles_to_remove) do
        global.creep_tiles[key] = nil
    end
end

-- Convert pollution to biomass on creep tiles
function creep_system.process_pollution_absorption()
    if not global.creep_tiles then return end

    local surface = game.surfaces[1]
    local total_absorbed = 0

    for _, tile_data in pairs(global.creep_tiles) do
        local pollution = surface.get_pollution(tile_data.position)

        if pollution > 0 then
            -- Mature creep absorbs more pollution
            local absorption_rate = tile_data.mature and 2 or 1
            local amount_to_absorb = math.min(pollution, absorption_rate)

            -- Reduce pollution
            surface.pollute(tile_data.position, -amount_to_absorb)
            total_absorbed = total_absorbed + amount_to_absorb
        end
    end

    -- Convert absorbed pollution to biomass
    if total_absorbed > 0 then
        local biomass_amount = math.floor(total_absorbed / POLLUTION_TO_BIOMASS_RATIO)

        if biomass_amount > 0 then
            -- Find a hatchery to store the biomass
            for _, source in ipairs(global.creep_sources or {}) do
                if source.entity and source.entity.valid and
                   (source.entity.name == "zerg-hatchery" or
                    source.entity.name == "zerg-lair" or
                    source.entity.name == "zerg-hive") then

                    -- Add biomass to the entity's inventory if possible
                    local inventory = source.entity.get_inventory(defines.inventory.chest)
                    if inventory then
                        inventory.insert({name = "biomass", count = biomass_amount})
                        break
                    end
                end
            end
        end
    end
end

-- Force spread creep (for debug command)
function creep_system.force_spread_creep()
    for i = 1, 10 do
        creep_system.process_creep_spread()
    end
end

return creep_system
