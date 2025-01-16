
SWEP.Base                = "weapon_base"
SWEP.Category            = "Universal HL1 Weapon"
SWEP.Spawnable           = true
SWEP.AdminSpawnable          = true
SWEP.AdminOnly = false
SWEP.CSMuzzleFlashes=false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_glock_juniez2.mdl"
SWEP.WorldModel = "models/weapons/w_glock_juniez1.mdl"

SWEP.Primary.Sound = "weapons/jglock/pistol_fire2.wav"
SWEP.Primary.ClipSize    = 17
SWEP.Primary.DefaultClip = 357
SWEP.Primary.Automatic   = true
SWEP.Primary.Ammo                = "ammo_hl1glock1"

SWEP.Secondary.ClipSize  = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic         = true
SWEP.Secondary.Ammo              = ""
 
	SWEP.PrintName    = "Glock"                        
    SWEP.Author       = "NeoSource"
    SWEP.Instructions = "Fire bullets."
    SWEP.ViewModelFOV = 50
    SWEP.Slot         = 1   
 
	SWEP.DrawCrosshair = true


	SWEP.Weight = 5

	SWEP.AutoSwitchTo = false
	SWEP.AutoSwitchFrom = false

function SWEP:Reload()
self:DefaultReload(ACT_VM_RELOAD)
end

function SWEP:Deploy()
self:SendWeaponAnim(ACT_VM_DRAW)
return true
end

function SWEP:PrimaryAttack()

if ( !self:CanPrimaryAttack() ) then return end

local bullet = {}
	
bullet.Callback = function(attacker, trace, dmginfo)
if SERVER then
dmginfo:SetDamageType(bit.bor(DMG_AIRBOAT,DMG_NEVERGIB))
end
end
	
bullet.Num = 1
bullet.Dir= self.Owner:GetAimVector()
bullet.Src = self.Owner:GetShootPos()
bullet.Force = 20
bullet.HullSize= 0
bullet.Spread = Vector(0.005,0.005, 0)
bullet.Damage = 15
bullet.Tracer		= 1
bullet.Attacker = self.Owner

self:FireBullets( bullet )

self:TakePrimaryAmmo(1)
self.Weapon:EmitSound(Sound(self.Primary.Sound))
self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
self.Owner:SetAnimation(PLAYER_ATTACK1)
self:SetNextPrimaryFire(CurTime()+0.3)
self:SetNextSecondaryFire(CurTime()+0.3)

if self.Weapon:Clip1()==0 then
timer.Simple(0.2,function() self:Reload() end)
end
end

 
function SWEP:SecondaryAttack()
 
if ( !self:CanPrimaryAttack() ) then return end

local bullet = {}
	
bullet.Callback = function(attacker, trace, dmginfo)
if SERVER then
dmginfo:SetDamageType(bit.bor(DMG_AIRBOAT,DMG_NEVERGIB))
end
end
	
bullet.Num = 1
bullet.Dir= self.Owner:GetAimVector()
bullet.Src = self.Owner:GetShootPos()
bullet.Force = 20
bullet.Spread = Vector(0.02,0.02, 0)
bullet.HullSize= 0
bullet.Damage = 15
bullet.Tracer		= 1
bullet.Attacker = self.Owner

self:FireBullets( bullet )

self:TakePrimaryAmmo(1)
self.Weapon:EmitSound(Sound(self.Primary.Sound))
self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
self.Owner:SetAnimation(PLAYER_ATTACK1)
self:SetNextPrimaryFire(CurTime()+0.2)
self:SetNextSecondaryFire(CurTime()+0.2)

if self.Weapon:Clip1()==0 then
timer.Simple(0.2,function() self:Reload() end)
end

end

function SWEP:Initialize()
self:SetWeaponHoldType( "pistol" )
end
