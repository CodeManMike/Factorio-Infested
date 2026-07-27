local MOD_GFX = "__the-ichor-engine__/graphics"

local Graphics = {}

function Graphics.path(...)
  return MOD_GFX .. "/" .. table.concat({...}, "/")
end

function Graphics.icon(item_name)
  return Graphics.path("icon", item_name .. ".png")
end

function Graphics.tech(tech_name)
  return Graphics.path("technology", tech_name .. ".png")
end

function Graphics.tile_texture(folder, filename)
  return Graphics.path("tile", folder, filename)
end

function Graphics.entity_frame(folder)
  return {
    filename = Graphics.path("entity", folder, folder .. ".png"),
    priority = "extra-high",
    width = 128,
    height = 128,
    frame_count = 1,
    line_length = 1,
    shift = util.by_pixel(0, -8),
    scale = 0.5
  }
end

function Graphics.tile_variants(folder, filename)
  local picture = Graphics.tile_texture(folder, filename)
  return {
    main = {
      {
        picture = picture,
        count = 1,
        size = 1,
        probability = 1
      }
    }
  }
end

function Graphics.apply_container_picture(proto, folder)
  proto.picture = {
    layers = {
      Graphics.entity_frame(folder)
    }
  }
end

function Graphics.apply_lab_animation(proto, folder)
  local frame = Graphics.entity_frame(folder)
  proto.off_animation = frame
  proto.on_animation = frame
end

function Graphics.apply_pole_pictures(proto, folder)
  local frame = Graphics.entity_frame(folder)
  proto.pictures = {
    up = frame,
    down = frame,
    left = frame,
    right = frame
  }
end

function Graphics.apply_assembler_animation(proto, folder)
  local frame = Graphics.entity_frame(folder)
  proto.animation = frame
end

function Graphics.apply_furnace_graphics(proto, folder)
  local frame = Graphics.entity_frame(folder)
  proto.animation = frame
  proto.working_visualisations = nil
end

function Graphics.apply_chemical_plant_graphics(proto, folder)
  local frame = Graphics.entity_frame(folder)
  proto.animation = frame
end

function Graphics.apply_entity_icon(proto, item_name)
  proto.icon = Graphics.icon(item_name)
  proto.icon_size = 64
end

return Graphics
