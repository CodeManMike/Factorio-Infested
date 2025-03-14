-- Factorio Infested
-- Biomass Transport System

local biomass_transport = {}

-- Constants
local TRANSPORT_INTERVAL = 10 -- Ticks between transport operations
local MAX_TRANSPORT_DISTANCE = 30 -- Maximum distance between network nodes
local TRANSPORT_RATE = 10 -- Items per transport operation

-- List of entities that can be part of the biomass network
local NETWORK_ENTITIES = {
    ["hatchery"] = {storage = true, production = true, consumption = true},
    ["evolution-chamber"] = {storage = false, production = false, consumption = true},
    ["infested-assembler"] = {storage = false, production = true, consumption = true},
    ["infested-drill"] = {storage = false, production = true, consumption = false},
    ["infested-lab"] = {storage = false, production = false, consumption = true},
    ["infested-turret"] = {storage = false, production = false, consumption = true},
    ["spine-crawler"] = {storage = false, production = false, consumption = true},
    ["spore-crawler"] = {storage = false, production = false, consumption = true},
    ["infested-belt"] = {storage = false, production = false, consumption = false, transport = true},
    ["creep-vein"] = {storage = false, production = false, consumption = false, transport = true},
    ["infested-inserter"] = {storage = false, production = false, consumption = false, transport = true},
    ["tendril"] = {storage = false, production = false, consumption = false, transport = true},
    ["infested-chest"] = {storage = true, production = false, consumption = false},
    ["sac"] = {storage = true, production = false, consumption = false},
    ["infested-boiler"] = {storage = false, production = false, consumption = true},
    ["spawning-pool"] = {storage = false, production = true, consumption = true},
    ["infested-pole"] = {storage = false, production = false, consumption = false, transport = true},
    ["creep-tumor"] = {storage = false, production = true, consumption = false},
    ["transport-network"] = {storage = true, production = false, consumption = false, transport = true},
    ["leviathan-chrysalis"] = {storage = true, production = false, consumption = true}
}

-- Check if an entity is part of the biomass network
function biomass_transport.is_network_entity(entity_name)
    return NETWORK_ENTITIES[entity_name] ~= nil
end

-- Register a network entity
function biomass_transport.register_network_entity(entity)
    if not global.biomass_network then
        global.biomass_network = {}
    end

    -- Store the entity reference and its details
    table.insert(global.biomass_network, {
        entity = entity,
        position = entity.position,
        name = entity.name,
        is_storage = NETWORK_ENTITIES[entity.name].storage,
        is_producer = NETWORK_ENTITIES[entity.name].production,
        is_consumer = NETWORK_ENTITIES[entity.name].consumption,
        last_transport_tick = game.tick
    })

    -- If this is a storage entity, initialize its storage tracking
    if NETWORK_ENTITIES[entity.name].storage and not global.biomass_storage then
        global.biomass_storage = {}
    end
end

-- Unregister a network entity
function biomass_transport.unregister_network_entity(entity)
    if not global.biomass_network then return end

    for i, node in ipairs(global.biomass_network) do
        if node.entity == entity then
            table.remove(global.biomass_network, i)
            return
        end
    end
end

-- Process biomass transport between network nodes
function biomass_transport.process_transport()
    if not global.biomass_network then return end

    -- Only process every TRANSPORT_INTERVAL ticks
    if game.tick % TRANSPORT_INTERVAL ~= 0 then return end

    -- Find storage nodes (sources) and consumer nodes (destinations)
    local storage_nodes = {}
    local consumer_nodes = {}

    for _, node in ipairs(global.biomass_network) do
        if not node.entity or not node.entity.valid then
            biomass_transport.unregister_network_entity(node.entity)
            goto continue
        end

        if node.is_storage then
            table.insert(storage_nodes, node)
        end

        if node.is_consumer then
            table.insert(consumer_nodes, node)
        end

        ::continue::
    end

    -- Process each consumer node
    for _, consumer in ipairs(consumer_nodes) do
        -- Skip if this consumer doesn't need resources
        if not biomass_transport.needs_resources(consumer.entity) then
            goto continue_consumer
        end

        -- Find the closest storage node with available resources
        local closest_storage = nil
        local min_distance = MAX_TRANSPORT_DISTANCE

        for _, storage in ipairs(storage_nodes) do
            -- Skip if this storage doesn't have resources
            if not biomass_transport.has_resources(storage.entity) then
                goto continue_storage
            end

            -- Calculate distance
            local distance = ((consumer.position.x - storage.position.x)^2 +
                             (consumer.position.y - storage.position.y)^2)^0.5

            -- Check if this is closer and within range
            if distance < min_distance then
                min_distance = distance
                closest_storage = storage
            end

            ::continue_storage::
        end

        -- If we found a valid storage node, transfer resources
        if closest_storage then
            biomass_transport.transfer_resources(closest_storage.entity, consumer.entity)

            -- Visualize the transfer with a beam
            rendering.draw_line({
                color = {r = 0.5, g = 0.0, b = 0.5, a = 0.8},
                width = 2,
                from = closest_storage.position,
                to = consumer.position,
                surface = closest_storage.entity.surface,
                time_to_live = TRANSPORT_INTERVAL
            })
        end

        ::continue_consumer::
    end
end

-- Check if an entity needs resources
function biomass_transport.needs_resources(entity)
    if not entity or not entity.valid then return false end

    -- Check if the entity has an inventory
    local inventory = entity.get_inventory(defines.inventory.chest) or
                     entity.get_inventory(defines.inventory.assembling_machine_input)

    if not inventory then return false end

    -- Check if there's room for more biomass
    return inventory.can_insert({name = "biomass", count = 1})
end

-- Check if an entity has resources to share
function biomass_transport.has_resources(entity)
    if not entity or not entity.valid then return false end

    -- Check if the entity has an inventory
    local inventory = entity.get_inventory(defines.inventory.chest) or
                     entity.get_inventory(defines.inventory.assembling_machine_output)

    if not inventory then return false end

    -- Check if there's biomass available
    return inventory.get_item_count("biomass") >= TRANSPORT_RATE
end

-- Transfer resources from source to destination
function biomass_transport.transfer_resources(source, destination)
    if not source or not source.valid or not destination or not destination.valid then
        return
    end

    -- Get inventories
    local source_inventory = source.get_inventory(defines.inventory.chest) or
                            source.get_inventory(defines.inventory.assembling_machine_output)

    local dest_inventory = destination.get_inventory(defines.inventory.chest) or
                          destination.get_inventory(defines.inventory.assembling_machine_input)

    if not source_inventory or not dest_inventory then return end

    -- Calculate how much to transfer
    local available = source_inventory.get_item_count("biomass")
    local to_transfer = math.min(available, TRANSPORT_RATE)

    if to_transfer <= 0 then return end

    -- Transfer the items
    local removed = source_inventory.remove({name = "biomass", count = to_transfer})
    if removed > 0 then
        local inserted = dest_inventory.insert({name = "biomass", count = removed})

        -- If not all items were inserted, return the remainder
        if inserted < removed then
            source_inventory.insert({name = "biomass", count = removed - inserted})
        end

        -- Play sound effect
        if inserted > 0 then
            destination.surface.play_sound({
                path = "biomass-collection",
                position = destination.position,
                volume = 0.3
            })
        end
    end
end

-- Add resources to global storage (used by pollution absorption)
function biomass_transport.add_to_global_storage(item_name, amount)
    if not global.biomass_network then return end

    -- Find storage nodes
    local storage_nodes = {}
    for _, node in ipairs(global.biomass_network) do
        if node.entity and node.entity.valid and node.is_storage then
            table.insert(storage_nodes, node)
        end
    end

    -- If no storage nodes, do nothing
    if #storage_nodes == 0 then return end

    -- Convert floating point amount to integer
    local int_amount = math.floor(amount)
    if int_amount <= 0 then return end

    -- Distribute evenly among storage nodes
    local per_node = math.max(1, math.floor(int_amount / #storage_nodes))
    local remainder = int_amount % #storage_nodes

    for i, node in ipairs(storage_nodes) do
        local node_amount = per_node
        if i <= remainder then
            node_amount = node_amount + 1
        end

        local inventory = node.entity.get_inventory(defines.inventory.chest)
        if inventory then
            inventory.insert({name = item_name, count = node_amount})
        end
    end
end

return biomass_transport
