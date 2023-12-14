level0 = true ----- when server first starts sets the level to 0

---------- After command change the lockdown level ----------

net.Receive("Status0", function(len ,ply)
    if level0 then return end
    level0 = true
    level1 = false
    level2 = false
    level3 = false
    level4 = false
    level5 = false
    call_staff_ld = false
    surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav") ---- On switchto level play this ----
end)
net.Receive("Status0_update", function(len ,ply)
    if level0 then return end
    level0 = true
    level1 = false
    level2 = false
    level3 = false
    level4 = false
    level5 = false
    hook.Run("Think")
end)
net.Receive("Status1", function(len ,ply)
    if level1 then return end
    level0 = false
    level1 = true
    level2 = false
    level3 = false
    level4 = false
    level5 = false
    call_staff_ld = false
    surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav") ---- On switchto level play this ----
    hook.Run("Think")
end)

net.Receive("Status1_update", function(len ,ply)
    if level1 then return end
    level0 = false
    level1 = true
    level2 = false
    level3 = false
    level4 = false
    level5 = false
    hook.Run("Think")
end)

net.Receive("Status2", function(len ,ply)
    if level2 then return end
    level0 = false
    level1 = false
    level2 = true
    level3 = false
    level4 = false
    level5 = false
    call_staff_ld = false
    surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav") ---- On switchto level play this ----
    hook.Run("Think")

end)
net.Receive("Status2_update", function(len ,ply)
    if level2 then return end
    level0 = false
    level1 = false
    level2 = true
    level3 = false
    level4 = false
    level5 = false
    hook.Run("Think")
end)
net.Receive("Status3", function(len ,ply)
    if level3 then return end
    level0 = false
    level1 = false
    level2 = false
    level3 = true
    level4 = false
    level5 = false
    call_staff_ld = false
    surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav") ---- On switchto level play this ----
    hook.Run("Think")

end)
net.Receive("Status3_update", function(len ,ply)
    if level3 then return end
    level0 = false
    level1 = false
    level2 = false
    level3 = true
    level4 = false
    level5 = false
    hook.Run("Think")
end)
net.Receive("Status4", function(len ,ply)
    if level4 then return end
    level0 = false
    level1 = false
    level2 = false
    level3 = false
    level4 = true
    level5 = false
    call_staff_ld = false
    surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav") ---- On switchto level play this ----
    hook.Run("Think")
end)
net.Receive("Status4_update", function(len ,ply)
    if level4 then return end
    level0 = false
    level1 = false
    level2 = false
    level3 = false
    level4 = true
    level5 = false
    hook.Run("Think")
end)
net.Receive("Status5", function(len ,ply)
    local delay5 = 0
    if CurTime() < delay5 and level5 then return end 
    level0 = false
    level1 = false
    level2 = false
    level3 = false
    level4 = false
    level5 = true
    call_staff_ld = false
    surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav") ---- On switchto level play this ----
    hook.Run("Think")
    delay5 = CurTime() + 10
end)
net.Receive("Status5_update", function(len ,ply)
    if level5 then return end
    level0 = false
    level1 = false
    level2 = false
    level3 = false
    level4 = false
    level5 = true
    hook.Run("Think")
end)
---------- repeat every 5 minutes alarm ----------
 
local pa_alarm_repeat = 0

hook.Add( "Think", "CurTimeDelay", function() -- function
    if level1 == true then -- if level is true then
    if CurTime() < pa_alarm_repeat then return end    -- if timer is over then 
     surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav") -- play sound
    pa_alarm_repeat = CurTime() + 300 -- add another 5 minutes back to the timer
end

    if level2 == true then
    if CurTime() < pa_alarm_repeat then return end    
     surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav")
    pa_alarm_repeat = CurTime() + 300
end

    if level3 == true then
    if CurTime() < pa_alarm_repeat then return end    
     surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav")
    pa_alarm_repeat = CurTime() + 300
end

    if level4 == true then
    if CurTime() < pa_alarm_repeat then return end    
     surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav")
    pa_alarm_repeat = CurTime() + 300
end

    if level5 == true then
    if CurTime() < pa_alarm_repeat then return end    
     surface.PlaySound("npc/attack_helicopter/aheli_damaged_alarm1.wav")
    pa_alarm_repeat = CurTime() + 300
end

end)

---------- GUI ----------


surface.CreateFont( "lockdownlevel", { -- create font to use
	font = "Montserrat", -- font type
	size = 30, -- charater size
	weight = 500, -- charater weight
} )


hook.Add("HUDPaint", "levels", function() -- hud function

if level0 == true then -- if level is true then
	surface.SetDrawColor( 255, 255, 255, 255 ) -- color the GUI
	surface.DrawRect(  ScrW() * 0.859,ScrH() * 0.04, 208, 50 ) -- Position the GUI and draw box
	draw.DrawText( "Lockdown Level: 0", "lockdownlevel", ScrW() * 0.912, ScrH() * 0.05, color_black, TEXT_ALIGN_CENTER ) -- Add text to GUI and position it and color it
else
end 


if level1 == true then
	surface.SetDrawColor( 3, 252, 48, 255 )
	surface.DrawRect(  ScrW() * 0.859,ScrH() * 0.04, 208, 50 )
	draw.DrawText( "Lockdown Level: 1", "lockdownlevel", ScrW() * 0.912, ScrH() * 0.05, color_black, TEXT_ALIGN_CENTER )
else
end 

if level2 == true then
	surface.SetDrawColor( 2, 223, 247, 255 )
	surface.DrawRect(  ScrW() * 0.859,ScrH() * 0.04, 208, 50 )
	draw.DrawText( "Lockdown Level: 2", "lockdownlevel", ScrW() * 0.912, ScrH() * 0.05, color_black, TEXT_ALIGN_CENTER )
else
end

if level3 == true then
	surface.SetDrawColor( 252, 144, 3, 255 )
	surface.DrawRect(  ScrW() * 0.859,ScrH() * 0.04, 208, 50 )
	draw.DrawText( "Lockdown Level: 3", "lockdownlevel", ScrW() * 0.912, ScrH() * 0.05, color_black, TEXT_ALIGN_CENTER )
else
end

if level4 == true then
	surface.SetDrawColor( 209, 101, 0, 255 )
	surface.DrawRect(  ScrW() * 0.859,ScrH() * 0.04, 208, 50 )
	draw.DrawText( "Lockdown Level: 4", "lockdownlevel", ScrW() * 0.912, ScrH() * 0.05, color_black, TEXT_ALIGN_CENTER )
else
end

if level5 == true then
	surface.SetDrawColor( 247, 17, 5, 255 )
	surface.DrawRect(  ScrW() * 0.859,ScrH() * 0.04, 208, 50 )
	draw.DrawText( "Lockdown Level: 5", "lockdownlevel", ScrW() * 0.912, ScrH() * 0.05, color_black, TEXT_ALIGN_CENTER )
else
end



end)


