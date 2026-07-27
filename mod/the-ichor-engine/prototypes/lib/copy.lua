local Copy = {}

function Copy.prototype(type_name, source_name, new_name, overrides)
  local source = data.raw[type_name][source_name]
  if not source then
    error("Missing prototype " .. type_name .. "/" .. source_name)
  end

  local proto = table.deepcopy(source)
  proto.name = new_name

  if overrides then
    for key, value in pairs(overrides) do
      proto[key] = value
    end
  end

  return proto
end

return Copy
