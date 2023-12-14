include("shared.lua")

surface.CreateFont( "Unarrest Npc Font", {
	font = "Roboto", 
	extended = false,
	size = 50,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function ENT:Draw()
if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 1500 ) then return end

self:DrawModel()

if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 500 ) then return end
	
local ang = self:GetAngles()

ang:RotateAroundAxis( self:GetAngles():Right(),0 )
ang:RotateAroundAxis( self:GetAngles():Forward(),0 )

local pos = self:GetPos() + ang:Right() * -40 + ang:Up() * 2 + ang:Forward() * 10

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 60, -110, 43, 560,75, Color(30,30,30,255) )

	draw.SimpleText( "Water Tank", "Unarrest Npc Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()




local pos = self:GetPos() + ang:Right() * -20 + ang:Up() * 2 + ang:Forward() * 10

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 60, -120, 43, 560,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('waterprecent'), "Unarrest Npc Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()



local pos = self:GetPos() + ang:Right() * -30 + ang:Up() * 2 + ang:Forward() * 10

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 60, -120, 43, 560,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('wateron'), "Unarrest Npc Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()







end


