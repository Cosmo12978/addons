AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()

  precents = 1000
  wateron = false
local tankmax = 200

self.Entity:SetModel( "models/squad/sf_plates/sf_plate3x4.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )      
self:SetAngles(Angle(0, 120, 90)) 
self.Entity:SetUseType(SIMPLE_USE)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
 
  precents = 1000
  wateron = false
local tankmax = 200


end




function ENT:Use(ply)

if wateron == true then
if precents >= 50 then
ply:GiveAmmo( 50, "water_ammo", true )
 precents =  precents - 50
end
end


end


function ENT:OnTakeDamage(dmg)

	local player = dmg:GetAttacker()


if( player:IsPlayer() and IsValid(player:GetActiveWeapon()) and player:GetActiveWeapon():GetClass() == "hose"  or player:GetActiveWeapon():GetClass() == "hose" ) then


if wateron == false then
	wateron = true
else
	wateron = false
end


end
end



function ENT:Think()


self:RemoveAllDecals()

if wateron == true then
self:SetNWString('wateron',"Water: On")
else
	self:SetNWString('wateron',"Water: Off")
end

self:SetNWString('waterprecent',precents.. " Gallons of water")


end