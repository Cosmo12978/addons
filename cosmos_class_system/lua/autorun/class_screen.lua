include("class_config.lua")
function Spawn( ply )
util.AddNetworkString( "Open_class_menu" )
util.AddNetworkString( "Class1" )
util.AddNetworkString( "Class2" )
util.AddNetworkString( "Class3" )
util.AddNetworkString( "Class4" )
util.AddNetworkString( "Class5" )
util.AddNetworkString( "Class6" )
util.AddNetworkString( "Class7" )
util.AddNetworkString( "Class8" )
util.AddNetworkString( "Class9" )
net.Start("Open_class_menu")
net.Send(ply)
end
hook.Add( "PlayerSpawn", "classmenuspawn", Spawn )



net.Receive( "Class1", function(player,ply)
Entity( 1 ):Give(class1primaryitem)
Entity( 1 ):GiveAmmo( 500, class1primaryitemammo, true )
Entity( 1 ):Give(class1secondaryitem)
Entity( 1 ):GiveAmmo( 500, class1secondaryitemammo, true )
Entity( 1 ):Give(class1grenade)
Entity( 1 ):GiveAmmo( 4, class1grenademammo, true )
Entity( 1 ):Give(class1melee)
ply:SetArmor( 100 )


end)

net.Receive( "Class2", function(player,ply)
Entity( 1 ):Give(class2primaryitem)
Entity( 1 ):GiveAmmo( 500, class2primaryitemammo, true )
Entity( 1 ):Give(class2secondaryitem)
Entity( 1 ):GiveAmmo( 500, class2secondaryitemammo, true )
Entity( 1 ):Give(class1grenade)
Entity( 1 ):GiveAmmo( 4, class2grenademammo, true )
Entity( 1 ):Give(class2melee)
ply:SetArmor( 125 )

end)

net.Receive( "Class3", function(player,ply)
Entity( 1 ):Give(class3primaryitem)
Entity( 1 ):GiveAmmo( 500, class3primaryitemammo, true )
Entity( 1 ):Give(class3secondaryitem)
Entity( 1 ):GiveAmmo( 500, class3secondaryitemammo, true )
Entity( 1 ):Give(class3grenade)
Entity( 1 ):GiveAmmo( 2, class3grenademammo, true )
Entity( 1 ):Give(class3melee)
ply:SetArmor( 50 )

end)


net.Receive( "Class4", function(player,ply)
Entity( 1 ):Give(class4primaryitem)
Entity( 1 ):GiveAmmo( 500, class4primaryitemammo, true )
Entity( 1 ):Give(class4secondaryitem)
Entity( 1 ):GiveAmmo( 500, class4secondaryitemammo, true )
Entity( 1 ):Give(class4grenade)
Entity( 1 ):GiveAmmo( 2, class4grenademammo, true )
Entity( 1 ):Give(class4specialitem)
Entity( 1 ):GiveAmmo( 4, class4specialitemammo, true )
Entity( 1 ):Give(class4extraitem)
Entity( 1 ):Give(class4melee)
ply:SetArmor( 200 )
end)


net.Receive( "Class5", function(player,ply)
Entity( 1 ):Give(class5primaryitem)
Entity( 1 ):GiveAmmo( 500, class5primaryitemammo, true )
Entity( 1 ):Give(class5secondaryitem)
Entity( 1 ):GiveAmmo( 500, class5secondaryitemammo, true )
Entity( 1 ):Give(class5melee)
Entity( 1 ):Give(class5extraitem)
ply:SetArmor( 100 )

end)

net.Receive( "Class6", function(player,ply)
Entity( 1 ):Give(class6secondaryitem)
Entity( 1 ):GiveAmmo( 500, class6secondaryitemammo, true )
Entity( 1 ):Give(class6melee)
Entity( 1 ):Give(class6grenade)
Entity( 1 ):GiveAmmo( 4, class6grenademammo, true )
Entity( 1 ):Give(class6extraitem)


end)

net.Receive( "Class7", function(player,ply)
Entity( 1 ):Give(class7melee)
end)


net.Receive( "Class8", function(player,ply)
Entity( 1 ):Give(class8secondaryitem)
Entity( 1 ):GiveAmmo( 500, class8secondaryitemammo, true )
ply:SetArmor( 50 )


end)

net.Receive( "Class9", function(player,ply)
Entity( 1 ):Give(class9extraitem)
Entity( 1 ):Give(class9melee)
Entity( 1 ):Give(class9tool)
Entity( 1 ):Give(class9tool2)

end)



if ( CLIENT ) then
net.Receive( "Open_class_menu", function()

local ClassMenu = vgui.Create("DFrame") -- The name of the panel we don't have to parent it.
ClassMenu:SetPos(780, 200) -- Set the position to 100x by 100y. 
ClassMenu:SetSize(400, 700) -- Set the size to 300x by 200y.
ClassMenu:SetTitle("") -- Set the title in the top left to "Derma Frame".
ClassMenu:MakePopup() -- Makes your mouse be able to move around.
ClassMenu:SetDraggable(false)
ClassMenu:SetBackgroundBlur(true)
ClassMenu:ShowCloseButton(false)
ClassMenu.Paint = function()
	draw.RoundedBox( 20, 0, 0, ClassMenu:GetWide(), ClassMenu:GetTall(), Color( 0, 77, 85, 255 ) )
end
local logo = vgui.Create("DImage", ClassMenu)
logo:SetPos(23, 35)	
logo:SetSize(350, 150)	
logo:SetImage("materials/pngs/ccc_logo.png")

local class1 = vgui.Create( "DButton", ClassMenu ) 
class1:SetText( class1name )					
class1:SetPos( 140, 200 )					
class1:SetSize( 100, 30 )					
class1.DoClick = function()	
	ClassMenu:Close()			
	net.Start( "Class1" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end

local class2 = vgui.Create( "DButton", ClassMenu ) 
class2:SetText( class2name )					
class2:SetPos( 140, 250 )					
class2:SetSize( 100, 30 )					
class2.DoClick = function()	
	ClassMenu:Close()						
	net.Start( "Class2" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end 



local class3 = vgui.Create( "DButton", ClassMenu ) 
class3:SetText( class3name )					
class3:SetPos( 140, 300 )					
class3:SetSize( 100, 30 )					
class3.DoClick = function()		
	ClassMenu:Close()					
	net.Start( "Class3" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end

local class4 = vgui.Create( "DButton", ClassMenu ) 
class4:SetText( class4name )					
class4:SetPos( 140, 350 )					
class4:SetSize( 100, 30 )					
class4.DoClick = function()		
	ClassMenu:Close()					
	net.Start( "Class4" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end

local class5 = vgui.Create( "DButton", ClassMenu ) 
class5:SetText( class5name )					
class5:SetPos( 140, 400 )					
class5:SetSize( 100, 30 )					
class5.DoClick = function()		
	ClassMenu:Close()					
	net.Start( "Class5" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end

local class6 = vgui.Create( "DButton", ClassMenu ) 
class6:SetText( class6name )					
class6:SetPos( 140, 450 )					
class6:SetSize( 100, 30 )					
class6.DoClick = function()		
	ClassMenu:Close()					
	net.Start( "Class6" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end

local class7 = vgui.Create( "DButton", ClassMenu ) 
class7:SetText( class7name )					
class7:SetPos( 140, 500 )					
class7:SetSize( 100, 30 )					
class7.DoClick = function()		
	ClassMenu:Close()					
	net.Start( "Class7" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end

local class8 = vgui.Create( "DButton", ClassMenu ) 
class8:SetText( class8name )					
class8:SetPos( 140, 550 )					
class8:SetSize( 100, 30 )					
class8.DoClick = function()		
	ClassMenu:Close()					
	net.Start( "Class8" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end

local class9 = vgui.Create( "DButton", ClassMenu ) 
class9:SetText( class9name )					
class9:SetPos( 140, 600 )					
class9:SetSize( 100, 30 )					
class9.DoClick = function()		
	ClassMenu:Close()					
	net.Start( "Class9" )
	net.SendToServer()	
	surface.PlaySound( "buttons/blip1.wav" )
end

local class10 = vgui.Create( "DButton", ClassMenu ) 
class10:SetText( "Class 10 - None" )					
class10:SetPos( 140, 650 )					
class10:SetSize( 100, 30 )					
class10.DoClick = function()		
	ClassMenu:Close()	
	surface.PlaySound( "buttons/blip1.wav" )				
end

end)

end





