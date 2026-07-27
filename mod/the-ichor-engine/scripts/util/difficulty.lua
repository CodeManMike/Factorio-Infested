local Constants = require("scripts.util.constants")

local Difficulty = {}

function Difficulty.get_profile()
  local value = settings.startup["ichor-difficulty"].value
  return Constants.DIFFICULTY.MULTIPLIERS[value] or Constants.DIFFICULTY.MULTIPLIERS[Constants.DIFFICULTY.DEFAULT]
end

return Difficulty
