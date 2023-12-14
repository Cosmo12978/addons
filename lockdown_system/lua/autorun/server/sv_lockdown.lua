util.AddNetworkString("Status0") -- pools the net message making it a thing
util.AddNetworkString("Status0_update")
util.AddNetworkString("Status1")
util.AddNetworkString("Status1_update")
util.AddNetworkString("Status2")
util.AddNetworkString("Status2_update")
util.AddNetworkString("Status3")
util.AddNetworkString("Status3_update")
util.AddNetworkString("Status4")
util.AddNetworkString("Status4_update")
util.AddNetworkString("Status5")
util.AddNetworkString("Status5_update")



hook.Add("PlayerSay", "lockdownstatus", function( ply, text ) -- on player say function
        local team_allowed = ply:Team()
        if team_allowed == TEAM_CITIZEN or team_allowed == TEAM_MEDIC or team_allowed == TEAM_MAYOR then

         if string.lower(text) == "/lockdown0" then -- when player says this then
            net.Start("Status0") -- start message to client to switch status to 0
                net.Broadcast() -- sends to all players
                level0_update = true
                level1_update = false
                level2_update = false
                level3_update = false
                level4_update = false
                level5_update = false
            return "" -- return nothing
        end
        if string.lower(text) == "/lockdown1" then
            net.Start("Status1")
                net.Broadcast()
                level0_update = false
                level1_update = true
                level2_update = false
                level3_update = false
                level4_update = false
                level5_update = false
            return ""
        end
        if string.lower(text) == "/lockdown2" then
            net.Start("Status2")
                net.Broadcast()
                level0_update = false
                level1_update = false
                level2_update = true
                level3_update = false
                level4_update = false
                level5_update = false
            return ""
        end
        if string.lower(text) == "/lockdown3" then
            net.Start("Status3")
                net.Broadcast()
                Doorclose() -- runs door close function
                level0_update = false
                level1_update = false
                level2_update = false
                level3_update = true
                level4_update = false
                level5_update = false
            return ""
    end
     if string.lower(text) == "/lockdown4" then
            net.Start("Status4")
                net.Broadcast()
                 Doorclose()
                level0_update = false
                level1_update = false
                level2_update = false
                level3_update = false
                level4_update = true
                level5_update = false
            return ""
    end
     if string.lower(text) == "/lockdown5" then
            net.Start("Status5")
                net.Broadcast()
                Doorclose()
                level0_update = false
                level1_update = false
                level2_update = false
                level3_update = false
                level4_update = false
                level5_update = true
            return ""
    end

end

end)



function Doorclose() -- function
for k, door in pairs( ents.GetAll() ) do  -- look at every entity on the map

if door:GetClass() ==  "func_door" then -- if the entity is this entity ( door ) then
    door:Fire("close") -- close door
end
end
end


local update_timeing = 0
hook.Add( "Think", "Set_GUI", function( ply ) -- think function
if level0_update == true then -- when level is active then 
    if CurTime() < update_timeing then return end -- if timer is up then
    net.Start("Status0_update") -- update the GUI to the level
    net.Broadcast() -- sends to all players
     update_timeing = CurTime() + 10 -- every 10s it GUI checks to see if it needs to update. This would fix change any new players GUI to the current level.  
end

if level1_update == true then
    if CurTime() < update_timeing then return end
    net.Start("Status1_update")
    net.Broadcast()
    update_timeing = CurTime() + 10 
end

if level2_update == true then
    if CurTime() < update_timeing then return end
    net.Start("Status2_update")
    net.Broadcast()
     update_timeing = CurTime() + 10 
end
if level3_update == true then
    if CurTime() < update_timeing then return end
    net.Start("Status3_update")
    net.Broadcast()
     update_timeing = CurTime() + 10 
end
if level4_update == true then
    if CurTime() < update_timeing then return end
    net.Start("Status4_update")
    net.Broadcast()
     update_timeing = CurTime() + 10 
end
if level5_update == true then
    if CurTime() < update_timeing then return end
    net.Start("Status5_update")
    net.Broadcast()
     update_timeing = CurTime() + 10 
end
end)