AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )




function ENT:Initialize()
self.Entity:SetModel("models/props_wasteland/laundry_cart001.mdl")
self.Entity:SetMaterial("phoenix_storms/gear")
self.Entity:SetColor(Color(0, 225, 46))
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )    
self.Entity:SetUseType(SIMPLE_USE)     
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.moneytocollect = 0
end

function ENT:StartTouch(ent,ply) --  on touch
	if ent:GetClass() == "trash" then -- trash
		ent:Remove() -- remove entity
		self.moneytocollect = self.moneytocollect + 1 -- add one on moneytocollect
end
end


function ENT:Use(ply) -- when ply uses
if self.moneytocollect >= 1 then  --- checks if there is more than 0 trash in the bin and if true
	ply:addMoney(500) --- give player 500
	self.moneytocollect = self.moneytocollect -1 --- subtract a trash collect


end
end



function ENT:Think()
local precents = self.moneytocollect
self:SetNWString('moneytocollect',precents.. " Trash To Cash In")---sends to client to put on text screen


	end