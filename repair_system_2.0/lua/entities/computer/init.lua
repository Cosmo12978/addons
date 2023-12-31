AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self:SetModel( "models/props_lab/monitor02.mdl" )
self:PhysicsInit( SOLID_VPHYSICS )     
self:SetMoveType( MOVETYPE_VPHYSICS )   
self:SetSolid( SOLID_VPHYSICS )         
self:SetUseType(SIMPLE_USE)
local phys = self:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.repair = true
until_restore_computer = CurTime() + 5
self.hitsneeded = math.random( 0,15 ) 
end



function ENT:OnTakeDamage(dmg,ply)

	 local player = dmg:GetAttacker()
	 local moneyaddedforrepair = math.random( 200,500 ) 

if( player:IsPlayer() and self.repair == false and IsValid(player:GetActiveWeapon()) and player:GetActiveWeapon():GetClass() == "repair_tool") then

if(self.hitsneeded >= 99) then return; end 
 
	self.hitsneeded = self.hitsneeded - dmg:GetDamage(); 
 
	if(self.hitsneeded >= 99) then 
		self.repair = true
			until_restore_computer = CurTime() + 250
			DarkRP.notify(player, 3, 6, "You repaired a computer! You got Payed $"..moneyaddedforrepair)
			player:addMoney(moneyaddedforrepair)

end

else
end

end

local sparktime = 0
local sparks_sounds_table = {"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"}





function ENT:Think()




local precents = self.hitsneeded ---- it takes the hits needed and does the % formula to get precent hit

if self.repair == false then
self:SetNWBool( "repair_state_computer", false )
self:SetNWString('repair_precent_computer',precents.. "% Repaired...")
end

if self.repair == true then
self:SetNWBool( "repair_state_computer", true )
end

if self.repair == true then
if CurTime() < until_restore_computer then return end
self.hitsneeded = math.random(  0,15  )
self.repair = false
self:SetNWBool( "repair_state_computer", false )
end
 

if self.hitsneeded >= 100 then
	self.hitsneeded = 0
	self.repair = true
end

if self.repair == false then
if CurTime() < sparktime then return end
self:EmitSound(Sound(table.Random(sparks_sounds_table)))
sparktime = CurTime() + 2.5
end



end 



	