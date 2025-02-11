
if CLIENT then

	SWEP.PrintName			= "MP5"
	SWEP.Author				= "Upset"
	SWEP.Slot				= 2
	SWEP.SlotPos			= 0
	SWEP.CrosshairXY		= {0, 48}
	SWEP.WepSelectIcon		= surface.GetTextureID("hl1/icons/mp5")
	SWEP.AutoIconAngle		= Angle(-90, 90, 0)

	SWEP.ViewModelOffset = {
		PosForward = -4,
		PosRight = -1,
		PosUp = 0,
		
		AngForward = 0,
		AngRight = 0,
		AngUp = 0
	}

end

SWEP.Base 				= "weapon_hl1_base"
SWEP.Weight				= 15
SWEP.HoldType			= "ar2"

SWEP.Category			= "Half-Life"
SWEP.Spawnable			= true


SWEP.WorldModel        = "models/weapons/w_smg1.mdl"
SWEP.ViewModel        = "models/reanimated/weapons/c_smg1.mdl"

SWEP.PrimarySounds = {
	Sound("weapons/hks1.wav"),
	Sound("weapons/hks2.wav"),
	Sound("weapons/hks3.wav")
}

SWEP.PrimarySoundsHD = {
	Sound("hl1/weapons/hd/hks1.wav"),
	Sound("hl1/weapons/hd/hks2.wav"),
	Sound("hl1/weapons/hd/hks3.wav")
}

SWEP.ReloadTime = 1.5
SWEP.UnloadTime = .7
SWEP.MagBone = "Bone12"
SWEP.MagTime = 0.7

SWEP.Primary.Damage			= 5
SWEP.Primary.DamageCVar		= "hl1_sk_plr_dmg_mp5_bullet"
SWEP.Primary.Recoil			= 0
SWEP.Primary.RecoilRandom	= {-2, 2}
SWEP.Primary.Cone			= 0.05234
SWEP.Primary.Delay			= 0.1
SWEP.Primary.ClipSize 		= 50
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.MaxAmmo		= 250
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9mmRound"

SWEP.SecondarySounds = {
	Sound("weapons/glauncher.wav"),
	Sound("weapons/glauncher2.wav")
}
SWEP.Secondary.Recoil		= -10
SWEP.Secondary.Delay		= 1
SWEP.Secondary.DefaultClip	= 2
SWEP.Secondary.MaxAmmo		= 10
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "MP5_Grenade"

SWEP.MuzzleEffect			= "hl1_mflash_mp5"
SWEP.MuzzleSmoke			= false
SWEP.MuzzlePos				= Vector(15,1,7)

function SWEP:PrimaryAttack()
	if !self:CanPrimaryAttack() then return end
	
	if self:Clip1() <= 0 or self.Owner:WaterLevel() == 3 then
		self:PlayEmptySound()
		self:SetNextPrimaryFire(CurTime() + 0.15)
		return
	end

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	if self:IsMultiplayerRules() then
		self.Primary.Cone = 0.02618
	else
		self.Primary.Cone = 0.05234
	end
	self:ShootBullet(cvars.Number(self.Primary.DamageCVar, self.Primary.Damage), self.Primary.NumShots, self.Primary.Cone)
	self:EjectShell(self.Owner, 0)
	if self:IsHDEnabled() then
		self:WeaponSoundHD()
	else
		self:WeaponSound()
	end
	self:TakeClipPrimary()
	if self:IsHDEnabled() then
		self:HL1MuzzleFlash(nil, nil, "hl1_mflash_m4")
	else
		self:HL1MuzzleFlash()
	end
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:SendRecoil()
	if self:Clip1() <= 0 and self:rgAmmo() <= 0 then
		self:HEV_NoAmmo()
	end
	self:SetWeaponIdleTime(CurTime() + math.Rand(10, 15))
end

function SWEP:SecondaryAttack()
	if !self:CanPrimaryAttack() then return end

	if self.Owner:WaterLevel() == 3 then
		self:PlayEmptySound()
		self:SetNextPrimaryFire(CurTime() + 0.15)
		return
	end
	if self:Ammo2() <= 0 then
		self:PlayEmptySound()
		return
	end
	self:SetNextPrimaryFire(CurTime() + self.Secondary.Delay)
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
	self:WeaponSound(self.SecondarySounds[math.random(1, 2)])
	self:TakeClipSecondary()
	self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
	self:SetPlayerAnimation(ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW)
	self:SendRecoil(1)
	self:SetWeaponIdleTime(CurTime() + 5)
	
	if SERVER then
		local pos = self.Owner:GetShootPos()
		local ang = self.Owner:GetAimVector():Angle()
		pos = pos + ang:Forward() * 16
		local ent = ents.Create("ent_hl1_cgrenade")
		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:SetOwner(self.Owner)
		ent:Spawn()
		ent:Activate()
		local vel = ang:Forward() * 800
		ent:SetVelocity(vel)
		ent:SetLocalAngularVelocity(Angle(-math.Rand(-100, -500), 0, 0))
	end
	
	if self:Ammo2() <= 0 then
		self:HEV_NoAmmo()
	end
end

function SWEP:SpecialThink()
	self:ResetEmptySound()
end

function SWEP:WeaponIdle()
	local iAnim
	local flRand = util.SharedRandom("flRand", 0, 1)
	if flRand < .5 then		
		iAnim = self:LookupSequence("longidle")
	else
		iAnim = self:LookupSequence("idle1")
	end
	self.Owner:GetViewModel():SendViewModelMatchingSequence(iAnim)
	self:SetWeaponIdleTime(CurTime() + math.Rand(10, 15))
end

if SERVER then
	--[[function SWEP:NPCShoot_Primary(ShootPos, ShootDir)
		if !IsValid(self.Owner) then return end
		self:PrimaryAttack()
		timer.Create("HL1_MP5_NPCPrimaryAttack"..self.Owner:EntIndex(), self.Primary.Delay, 2, function()
			if !IsValid(self) or !IsValid(self.Owner) then return end
			self:PrimaryAttack()
		end)
	end]]
	
	function SWEP:GetNPCBulletSpread()
		return 4
	end

	function SWEP:GetNPCBurstSettings()
		return 3, 3, self.Primary.Delay
	end

	function SWEP:GetNPCRestTimes()
		return self.Primary.Delay, self.Primary.Delay + .05
	end
end