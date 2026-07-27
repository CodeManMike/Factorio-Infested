local Bootstrap = {}

local StorageFactory = require("scripts.bootstrap.storage-factory")
local ForceSetup = require("scripts.bootstrap.force-setup")
local Events = require("scripts.bootstrap.events")
local Commands = require("scripts.debug.commands")
local Gui = require("scripts.gui.gui")

function Bootstrap.on_init()
  StorageFactory.ensure()
  ForceSetup.ensure()
  Gui.on_init_players()
end

function Bootstrap.on_configuration_changed()
  StorageFactory.ensure()
  ForceSetup.ensure()
  Gui.on_init_players()
end

function Bootstrap.on_load()
  -- We do not write to storage in on_load.
end

Events.register()
Commands.register()

script.on_init(Bootstrap.on_init)
script.on_configuration_changed(Bootstrap.on_configuration_changed)
script.on_load(Bootstrap.on_load)

return Bootstrap
