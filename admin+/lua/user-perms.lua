hook.Add( "PlayerNoClip", "FeelFreeToTurnItOff", function( ply, desiredState )
    if ( desiredState == false ) then 
       ply:SetNoDraw(false) -- the player wants to turn noclip off
        return true -- always allow
    elseif (ply:GetUserGroup() == "Trial Mod" or ply:GetUserGroup() == "Mod" or ply:GetUserGroup() == "Senior Mod" or ply:GetUserGroup() == "Admin" or ply:GetUserGroup() == "Super Admin" or ply:GetUserGroup() == "Head of Staff" or ply:GetUserGroup() == "Event Planner" or ply:GetUserGroup() == "Manager" ) then
        ply:SetNoDraw(true)
        return true -- allow administrators to enter noclip
    end
end )

hook.Add( "CanProperty", "property", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)


if ( SERVER ) then


hook.Add( "PlayerSpawnProp", "prop", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then --- if player is these ranks then return false
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.") -- darkrp notify
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true   --- if user are these ranks then true
end

end)


hook.Add( "PlayerSpawnRagdoll", "ragdoll", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end

end)




hook.Add( "PlayerSpawnVehicle", "vehicle", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)



hook.Add( "PlayerSpawnEffect", "effect", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)



hook.Add( "PlayerSpawnNPC", "npc", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)

hook.Add( "PlayerSpawnSWEP", "weapononground", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)

hook.Add( "PlayerSpawnSENT", "entity", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)




hook.Add( "CanTool", "tool", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)






hook.Add( "CanDrive", "drive", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)



hook.Add( "CanArmDupe", "candupe", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super Admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)

hook.Add( "PlayerGiveSWEP", "giveweapon", function( client )
   if client:GetUserGroup() == "Trial Mod" or client:GetUserGroup() == "user" then
    DarkRP.notify(client, 3, 6, "This is restricted to Mod+ only.")
        return false
    end

if client:GetUserGroup() == "Mod" or client:GetUserGroup() == "Senior Mod" or client:GetUserGroup() == "Admin" or client:GetUserGroup() == "Super admin" or client:GetUserGroup() == "Head of Staff" or client:GetUserGroup() == "Event Planner" or client:GetUserGroup() == "Manager" then
    return true
end
end)



end

