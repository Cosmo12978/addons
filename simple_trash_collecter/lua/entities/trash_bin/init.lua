AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/props_junk/TrashBin01a.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.collected = false

 self.hitsneeded = math.random( 10,20 ) 
end






function ENT:OnTakeDamage(dmg)

	local player = dmg:GetAttacker()


if( player:IsPlayer() and self.collected == false and IsValid(player:GetActiveWeapon()) and player:GetActiveWeapon():GetClass() == "trash_pickup")  then

if(self.hitsneeded <= 0) then return; end 
 
	self.hitsneeded = self.hitsneeded - dmg:GetDamage(); 
 
	if(self.hitsneeded <= 0) then 
		self.collected = true
		local trash = ents.Create("trash")
			trash:SetPos(self:GetPos() + Vector(0, 0, 50))
			trash:Spawn()
			until_restore = CurTime() + 300

end

else
	---darkrp effect
end

end


function ENT:Think()


local precents = self.hitsneeded / 20 * 100 ---- it takes the hits needed and does the % formula to get precent hit


self:SetNWString('tookprecent',precents.. "% Of Trash Left to Take")
if self.collected == true then
if CurTime() < until_restore then return end
self.hitsneeded = math.random( 10,20  )
self.collected = false
end 

end

	