include("shared.lua")





surface.CreateFont( "Main Machine Font", {
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

surface.CreateFont( "Status Font", {
	font = "Roboto", 
	extended = false,
	size = 50,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = true,
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

ang:RotateAroundAxis( self:GetAngles():Right(),270 )
ang:RotateAroundAxis( self:GetAngles():Forward(),90 )

local pos = self:GetPos() + ang:Right() * -100 + ang:Up() * 90 + ang:Forward() * -28

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 50, -5, 43, 350,75, Color(30,30,30,255) )

	draw.SimpleText( "Factory 1", "Status Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()






local pos = self:GetPos() + ang:Right() * -90 + ang:Up() * 90 + ang:Forward() * -28
for i = 1, 3 do
tcolor = Color(255,255,255)
end
cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 50, -150, 43, 700,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('side'), "Main Machine Font", 163, 80, tcolor, 1, 1 )

cam.End3D2D()












end