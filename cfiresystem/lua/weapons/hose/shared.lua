AddCSLuaFile("shared.lua")

SWEP.PrintName = "Hose"
SWEP.Author = "Cosmo1297"
SWEP.Category = "CFIRE"
SWEP.Purpose = "To fight fire"
SWEP.Instructions = "Somthing"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = ""
SWEP.WorldModel = "models/props_lab/tpplug.mdl"
SWEP.DrawCrosshair 		= false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Slot = 4
SWEP.SlotPos = 1		

game.AddAmmoType( { name = "water_ammo" } )
if ( CLIENT ) then language.Add( "water_ammo", "Water Ammo" ) end

SWEP.MaxAmmo = 60

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = SWEP.MaxAmmo
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "water_ammo"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
Connected = false
	

function SWEP:DoExtinguish( pushforce, effectscale )

	if ( self:Ammo1() < 1 ) then return end


	if ( !self.IsInfinite ) then
		self:TakePrimaryAmmo( 1 )
	end

	effectscale = effectscale or 1
	pushforce = pushforce or 0

	local tr
	if ( self.Owner:IsNPC() ) then
		tr = util.TraceLine( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 16384,
			filter = self.Owner
		} )
	else
		tr = self.Owner:GetEyeTrace()
	end

	local pos = tr.HitPos

	for id, prop in pairs( ents.FindInSphere( pos, 100 ) ) do
		if ( !IsValid( prop ) or prop:GetPos():Distance( self:GetPos() ) > 256 ) then continue end
		if ( prop:IsWeapon() and IsValid( prop:GetOwner() ) ) then continue end -- Played equipped weapons
		if ( prop:GetClass():find( "viewmodel" ) ) then continue end -- View models

		if ( pushforce > 0 ) then
			local physobj = prop:GetPhysicsObject()
			if ( IsValid( physobj ) ) then
				physobj:ApplyForceOffset( self.Owner:GetAimVector() * pushforce, pos )
			end
		end

		-- Perhaps this random call should be replaced by a timer of sorts?
		if ( math.random( 0, 1000 ) > 500 ) then
			local retval = hook.Call( "ExtinguisherDoExtinguish", nil, prop )
			if ( retval == true ) then continue end

			if ( prop:IsOnFire() ) then prop:Extinguish() end

			local class = prop:GetClass()
			if ( string.find( class, "ent_minecraft_torch" ) and prop:GetWorking() ) then
				prop:SetWorking( false )
			elseif ( string.find( class, "env_fire" ) ) then -- Gas Can support. Should work in ravenholm too.
				prop:Fire( "Extinguish" )
			end
		end
	end


end

function SWEP:PrimaryAttack()


	if Connected == true then
		print("fire")
	if ( self:GetNextPrimaryFire() > CurTime() ) then return end

	if ( IsFirstTimePredicted() ) then

		self:DoExtinguish( 196, 1 )
	
	end

	self:SetNextPrimaryFire( CurTime() + 0.09 )

if ( !SERVER ) then return end
self:SetNWString( 'waterprecents', "g" )
end



end

function SWEP:SecondaryAttack()
local tgt = self.Owner:GetEyeTrace()
if tgt.HitPos:Distance(self.Owner:GetShootPos()) <= 75 then
	local hit = self:GetOwner():GetEyeTrace().Entity

	if hit:GetClass() == "panel" then
	self:SendWeaponAnim( ACT_VM_DRAW )
		self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	    hit:EmitSound(Sound("physics/concrete/rock_impact_hard1.wav"))
	    hit:EmitSound(Sound("ambient/materials/rock1.wav"))
       
bullet = {}
			bullet.Num    = 0
			bullet.Src    = self.Owner:GetShootPos()
			bullet.Dir    = self.Owner:GetAimVector()
			bullet.Spread = Vector(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 0
			bullet.Damage = 0

self.Owner:FireBullets( bullet )




      if Connected == false then
	Connected = true
else
	Connected = false
end





   end




	
end
end

 function SWEP:Think()
 	if ( SERVER ) then
 	self:SetNWInt( 'water', 1200 )
 end
 end

