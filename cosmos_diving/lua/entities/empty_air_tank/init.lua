AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize() --- function that gives physics, model, and basic options
self.Entity:SetModel( "models/props_c17/canister01a.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )
self.Entity:DrawShadow(false)  --- makes shawdows with the entity false to save preformence        
self.Entity:SetUseType(SIMPLE_USE)
self:SetColor(Color(173, 173, 170))
self:SetMaterial("phoenix_storms/gear")
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
end

function ENT:Use(ply) --- use function on use then do this
	ply:ChatPrint( "You have emptied your air tank." ) -- prints on player who picked it up chat
	self:Remove() -- removes entity
	self:EmitSound(Sound("player/pl_drown1.wav"))
	ply.airtankpickup = true
	ply.airtankpleft = 0
end






