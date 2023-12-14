AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

include('team_allowed_config.lua')

function ENT:Initialize()
self.Entity:SetModel( "models/props_lab/generator.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )
self.Entity:SetUseType(SIMPLE_USE)         
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.on = false
self.team = 'None'
self.team1 = false
self.team2 = false
self.try1 = false
self.try2 = false



end








function ENT:Use(ply)
print(id)
if team.GetName(ply:Team()) == 'Medic' then
	self.team1 = true
	self.try1 = true
local delay = 5
local nextOccurance = 0
	local timeLeft = nextOccurance - CurTime()
	if timeLeft < 0 then -- If the time has passed the nextOccurance time
		print( "The event has been triggered!" )
		nextOccurance = CurTime() + delay
end


else
	if team.GetName(ply:Team()) == 'Gun Dealer' then
	self.team2 = true
	self.try2 = true
end
end


end





function ENT:Think()
if self.team1 == true then
print("1")
end

if self.team2 == true then
print("2")
end
if self.team1 == true and self.team2 == true then
	self.team1 = false
	self.team2 = false
end

if self.team1 == true and self.try2 == true then
	self.team1 = false
	self.team2 = true
	self.try2 = false
end

if self.team2 == true and self.try1 == true then
	self.team2 = false
	self.team1 = true
	self.try1 = false
end

if self.team1 == false and self.team2 == false then
	self:SetNWString( "side", "Team Controling: None" ) 
	Entity(1):SetNWBool("side1", true) 
end

if self.team1 == true then
	self:SetNWString( "side", "Team Controling: Team1" ) 
	self:SetNWInt( "Team_color", 66, 135, 245 ) 
	Entity(1):SetNWBool("side1", true)
	Entity(1):SetNWInt("Team_color")
end

if self.team2 == true then
	self:SetNWString( "side", "Team Controling: Team2" ) 
	Entity(1):SetNWBool("side1", true) 
end


self:SetNWFloat( "Team_color",100) 
Entity(1):SetNWFloat("Team_color")




	end
