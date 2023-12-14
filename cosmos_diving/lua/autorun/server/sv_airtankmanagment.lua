util.AddNetworkString("airleftintank")


hook.Add( "PlayerInitialSpawn", "setupspawn", function( ply )
ply.airtankpickup = false
ply.airtankpleft = 0
end)

hook.Add( "PlayerDeath", "deathset", function(ply)
ply.airtankpickup = false
ply.airtankpleft = 0
end)
local bubblessound = {"player/pl_drown2.wav","player/pl_drown3.wav"}
delay = 0
hook.Add( "SetupMove", "Drowning:HandleWaterInLungs", function( ply)

net.Start("airleftintank")
	net.WriteFloat(ply.airtankpleft)
	net.Send(ply)

	if ( ply:WaterLevel() >= 3 ) then
	if ply.airtankpickup == true then
    ply.airtankpleft = ply.airtankpleft -0.02
end
if ply.airtankpleft <= 0 then
	ply.airtankpickup = false
end

		if ply.airtankpickup == false then
			if CurTime() < delay then return end	
			if ply:Health() >= 5 then
			local dmginfo = DamageInfo()
			    dmginfo:SetDamageType(DMG_GENERIC)
				dmginfo:SetDamage(5)
				ply:EmitSound(Sound(table.Random(bubblessound)))
			    dmginfo:SetAttacker(game.GetWorld())
			    dmginfo:SetInflictor(game.GetWorld())
			    ply:TakeDamageInfo(dmginfo)
            	delay = CurTime() + 1
            end
		end
	

	end


end )

hook.Add( "PlayerDeath", "removetank", function( ply ) -- when player dies then they can't turn on flashlight again
ply.airtankpickup = false
local hurting = 0
end)

