
SWEP.Base                = "weapon_base"
SWEP.Category            = "Universal HL1 Weapon"
SWEP.Spawnable           = true
SWEP.AdminSpawnable          = true
SWEP.AdminOnly = true
SWEP.CSMuzzleFlashes=false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_glock_juniez2.mdl"
SWEP.WorldModel = "models/weapons/w_glock_juniez1.mdl"

SWEP.Primary.Sound = "weapons/j50cal/single.wav"
SWEP.Primary.ClipSize    = 17
SWEP.Primary.DefaultClip = 357
SWEP.Primary.Automatic   = false
SWEP.Primary.Ammo                = "ammo_hl1glock2"


SWEP.Secondary.ClipSize  = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic         = true
SWEP.Secondary.Ammo              = ""

	SWEP.PrintName    = "Glock (Super)"                        
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
dmginfo:SetDamageType(bit.bor(DMG_AIRBOAT,DMG_BLAST,DMG_NEVERGIB))
trace.Entity:SetHealth(0)
end
end
	
bullet.Num = 1
bullet.Dir= self.Owner:GetAimVector()
bullet.Src = self.Owner:GetShootPos()
bullet.Force = 50
bullet.HullSize= 1
bullet.Spread = 0
bullet.Damage = 100
bullet.Tracer		= 1
bullet.Attacker = self.Owner

self:FireBullets( bullet )

self:TakePrimaryAmmo(1)
self.Weapon:EmitSound(Sound(self.Primary.Sound))
self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
self.Owner:SetAnimation(PLAYER_ATTACK1)
self:SetNextPrimaryFire(CurTime()+0.12)
self:SetNextSecondaryFire(CurTime()+0.12)

if self.Weapon:Clip1()==0 then
timer.Simple(0.12,function() self:Reload() end)
end
end

 
function SWEP:SecondaryAttack()
 
if ( !self:CanPrimaryAttack() ) then return end

local bullet = {}
	
bullet.Callback = function(attacker, trace, dmginfo)
if SERVER then
dmginfo:SetDamageType(bit.bor(DMG_AIRBOAT,DMG_BLAST,DMG_NEVERGIB))
if trace.Entity:GetClass()~="prop_vehicle_apc" then
trace.Entity:SetHealth(0)
end
end
end
	
bullet.Num = 1
bullet.Dir= self.Owner:GetAimVector()
bullet.Src = self.Owner:GetShootPos()
bullet.Force = 20
bullet.HullSize= 1
bullet.Spread = 0
bullet.Damage = 100
bullet.Tracer		= 1
bullet.Attacker = self.Owner

self:FireBullets( bullet )

self:TakePrimaryAmmo(1)
self.Weapon:EmitSound(Sound(self.Primary.Sound))
self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
self.Owner:SetAnimation(PLAYER_ATTACK1)
self:SetNextPrimaryFire(CurTime()+0.12)
self:SetNextSecondaryFire(CurTime()+0.12)

if self.Weapon:Clip1()==0 then
timer.Simple(0.12,function() self:Reload() end)
end

end

function SWEP:Initialize()
self:SetWeaponHoldType( "pistol" )
end
