local StorageFactory = {}

local DEFAULT_STATE = {
  version = "0.0.1",
  schema_version = 1,
  campaign = {
    planet_name = "ichor",
    escape_complete = false,
    cargo_unlocked = false
  },
  hive = {
    core_unit_number = nil,
    hunger = 0.0,
    last_fed_tick = 0,
    mood = "dormant"
  },
  entities = {},
  entity_indexes = {
    by_kind = {},
    by_surface = {},
    by_chunk = {}
  },
  substrate = {
    sources = {},
    spread_cursor = 1,
    dirty_chunks = {}
  },
  gui = { players = {} },
  alerts = { cooldowns = {} },
  debug = { last_balance_report_tick = 0 }
}

local function merge_defaults(target, defaults)
  for key, value in pairs(defaults) do
    if target[key] == nil then
      if type(value) == "table" then
        local copy = {}
        for inner_key, inner_value in pairs(value) do
          copy[inner_key] = inner_value
        end
        target[key] = copy
      else
        target[key] = value
      end
    elseif type(value) == "table" and type(target[key]) == "table" then
      merge_defaults(target[key], value)
    end
  end
end

function StorageFactory.ensure()
  storage.ichor = storage.ichor or {}
  merge_defaults(storage.ichor, DEFAULT_STATE)
end

return StorageFactory
