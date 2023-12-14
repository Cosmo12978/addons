AddCSLuaFile("shared.lua")

SWEP.PrintName = "Trash Pickup"
SWEP.Author = "Cosmothecat"
SWEP.Category = "Trash Collecter"
SWEP.Purpose = "Used to take trash."
SWEP.Instructions = "Left click to take trash."

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/v_hands.mdl"
SWEP.WorldModel = ""
SWEP.DrawCrosshair 		= false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Slot = 4
SWEP.SlotPos = 1		

SWEP.Primary.Ammo = "none"
SWEP.Secondary.Ammo = "none"

	

function SWEP:PrimaryAttack() 
	local tgt = self.Owner:GetEyeTrace()
if tgt.HitPos:Distance(self.Owner:GetShootPos()) <= 75 then
	local hit = self:GetOwner():GetEyeTrace().Entity
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
			bullet.Force  = 1
			bullet.Damage = 1300

self.Owner:FireBullets( bullet )

end
     self:SetNextPrimaryFire( CurTime() + 1 )
	end

function SWEP:SecondaryAttack()

	end