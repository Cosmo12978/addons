AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )




function ENT:Initialize()
self.Entity:SetModel( "models/props_junk/PlasticCrate01a.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )      
self.Entity:SetUseType(SIMPLE_USE)   
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.trash = 0
self.cantake = false
end

function ENT:StartTouch(ent)
	if ent:GetClass() == "trash" then
		ent:Remove()
		self.trash = self.trash + 1	
	end
end

function ENT:Use()
print(self.trash)
if self.trash >= 1 then
	self.cantake = true
else
	self.cantake = false
end

if self.cantake == true then 
		local trash = ents.Create("trash")
			trash:SetPos(self:GetPos() + Vector(30, 0, 50))
			trash:Spawn()
			self.trash = self.trash -1
		end

end

function ENT:Think()
if self.trash == nill then
	self.trash = 0
end

local trashnumber = self.trash
self:SetNWString('trashinbox',trashnumber.. " Trash left in box")
end