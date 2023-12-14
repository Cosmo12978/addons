hook.Add( "PlayerInitialSpawn", "onspawnflashlight", function( ply )
hook.Run("BlockFlashLight")-- runs the hook function
ply.canuseflashlightvar = false -- stores variable on player and makes it false first spawning
end)
hook.Add( "PlayerSwitchFlashlight", "BlockFlashLight", function( ply, enabled ) -- makes it if player can use flashlight or not
	if ply.canuseflashlightvar == true then
		return true
	end

	if ply.canuseflashlightvar == false then
	return false
end
end )



hook.Add( "PlayerDeath", "blockflashon", function( ply ) -- when player dies then they can't turn on flashlight again
ply.canuseflashlightvar = false
end)


