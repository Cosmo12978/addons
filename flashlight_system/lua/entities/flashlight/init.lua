AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" ) --- includes diffrent files included with this entity

function ENT:Initialize() --- function that gives physics, model, and basic options
self.Entity:SetModel( "models/maxofs2d/lamp_flashlight.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )
self.Entity:DrawShadow(false)  --- makes shawdows with the entity false to save preformence        
self.Entity:SetUseType(SIMPLE_USE)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
end

function ENT:Use(ply) --- use function on use then do this
	ply:ChatPrint( "You picked up a flashlight. You can now use a flashlight" ) -- prints on player who picked it up chat
	self:Remove() -- removes entity
	ply.canuseflashlightvar = true -- makes flashlight	able true
end






