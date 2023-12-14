AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/squad/sf_plates/sf_plate3x4.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )      
self:SetAngles(Angle(20, 0, 20)) 
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
 
 precents = 200
local tankmax = 200

end


function ENT:OnTakeDamage(dmg)

	local player = dmg:GetAttacker()


if( player:IsPlayer() and IsValid(player:GetActiveWeapon()) and player:GetActiveWeapon():GetClass() == "hose"  or player:GetActiveWeapon():GetClass() == "hose" ) then

print("connect")
end
end







function ENT:Think()





self:SetNWString('waterprecent',precents.. " Gallons of water")
end