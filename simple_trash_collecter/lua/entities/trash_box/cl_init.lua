include("shared.lua")

	surface.CreateFont( "BOX_FONT", {
    font = "Roboto",
    size = 50,
    weight = 650,
    shadow = true,
    antialias = false,
});

function ENT:Draw()
	self:DrawModel()

	local Pos = self:GetPos()
	local Ang = Angle( -20, 0, 20)
	
	surface.SetFont("BOX_FONT")



	Ang:RotateAroundAxis(Ang:Forward(), 90)
	local TextAng = Ang
	TextAng:RotateAroundAxis(TextAng:Right(), -90)
	cam.Start3D2D(Pos + Ang:Right() * -20, Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.1)
		draw.WordBox(.9, -50, 0, self:GetNWString('trashinbox'), "BOX_FONT", Color(0, 0, 0, 155), Color(255,255,255,255))
	cam.End3D2D()
end