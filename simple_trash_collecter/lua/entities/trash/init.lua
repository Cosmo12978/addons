AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )
trashmodellist = {"models/props_junk/PopCan01a.mdl", "models/props_junk/plasticbucket001a.mdl","models/props_junk/metalgascan.mdl","models/props_junk/metal_paintcan001a.mdl","models/props_junk/glassjug01.mdl","models/props_junk/GlassBottle01a.mdl","models/props_junk/garbage_takeoutcarton001a.mdl","models/props_junk/garbage_plasticbottle003a.mdl","models/props_junk/garbage_plasticbottle002a.mdl","models/props_junk/Shoe001a.mdl","models/props_junk/garbage_plasticbottle001a.mdl","models/props_junk/garbage_newspaper001a.mdl","models/props_junk/garbage_milkcarton002a.mdl","models/props_junk/garbage_metalcan002a.mdl","models/props_junk/garbage_metalcan001a.mdl","models/props_junk/garbage_glassbottle003a.mdl","models/props_junk/garbage_glassbottle003a.mdl","models/props_junk/garbage_glassbottle002a.mdl","models/props_junk/garbage_bag001a.mdl","models/props_c17/lamp001a.mdl"}




function ENT:Initialize()
self.Entity:SetModel( table.Random(trashmodellist) )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
 
end

