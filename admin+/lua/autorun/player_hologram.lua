hook.Add( "PlayerSay", "hologram", function( ply, text )
	if ( string.lower( text ) == "/hologram"  ) then
		ply:SetMaterial("models/props_combine/com_shield001a")
		ply:SetColor(Color(3, 177, 252))
		return ""
	end
	if ( string.lower( text ) == "/hologramoff" ) then
		ply:SetMaterial("")
		ply:SetColor(Color(255,255,255))
end )


