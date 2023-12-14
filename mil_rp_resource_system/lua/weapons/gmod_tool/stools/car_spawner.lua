TOOL.Category = "Milrp resource system"
TOOL.Name = "Car position helper"


TOOL.Information = {
		{ name = "------How to add a car spawn------"},
		{ name = " Left click to get a position"},
		{ name = "Open console and copy the vector (x,y,z)"},
		{ name = "Paste it into the admin menu in the car dealer"}

	}



function TOOL:LeftClick( trace )
	self:GetOwner():ChatPrint("Vector("..trace.HitPos.x..", "..trace.HitPos.y..", "..trace.HitPos.z..")")
	return true
end





