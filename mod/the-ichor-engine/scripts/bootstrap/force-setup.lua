local ForceSetup = {}

local FERAL_FORCE_NAME = "ichor-feral"

function ForceSetup.ensure()
  local feral = game.forces[FERAL_FORCE_NAME]
  if not feral then
    feral = game.create_force(FERAL_FORCE_NAME)
  end

  local player_force = game.forces.player
  if player_force then
    player_force.set_friend(feral, false)
    feral.set_friend(player_force, false)
  end

  local enemy_force = game.forces.enemy
  if enemy_force then
    feral.set_friend(enemy_force, false)
    enemy_force.set_friend(feral, false)
  end
end

return ForceSetup
