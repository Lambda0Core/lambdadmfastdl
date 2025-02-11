AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.Model = Model("models/grenade.mdl")

function ENT:Initialize()
	self:SetMoveType(MOVETYPE_FLYGRAVITY)
	self:SetMoveCollide(MOVECOLLIDE_FLY_BOUNCE)
	self:SetSolid(SOLID_BBOX)
	self:SetModel(self.Model)
	self:SetCollisionBounds(Vector(), Vector())
	
	self:SetCorrectGravity()

	self.dmg = cvars.Number("hl1_sk_plr_dmg_mp5_grenade", 100)
	
	self.aiSnd = ents.Create("ai_sound")
	local aiSnd = self.aiSnd
	aiSnd:SetPos(self:GetPos())
	aiSnd:Spawn()
	aiSnd:SetParent(self)
	aiSnd:SetKeyValue("soundtype", 8)
	aiSnd:Activate()
	
	self:NextThink(CurTime())
end

function ENT:Explode(exppos, expnorm)
	exppos = exppos or self:GetPos()
	expnorm = expnorm or Vector()

	-- TODO: fix displacements
	util.Decal("Scorch", exppos - expnorm, exppos + expnorm)

	self:InsertSound(1, self:GetPos(), 1024, 3, NULL)
	
	local radius = self.dmg * 3.13
	local owner = self.Owner
	if IsValid(owner) then
		util.BlastDamage(self, owner, exppos, radius, self.dmg) -- not sure about radius value
	end
	self:Remove()
	
	gamemode.Call("OnEntityExplosion", self, exppos, radius, self.dmg)
end

function ENT:Think()
	if !self:IsInWorld() then
		self:Remove()
		return
	end

	if IsValid(self.aiSnd) then
		self.aiSnd:SetPos(self:GetPos() + self:GetVelocity() *.5)
		self.aiSnd:SetKeyValue("volume", self:GetVelocity():Length())
		self.aiSnd:SetKeyValue("duration", .2)
		self.aiSnd:Fire("EmitAISound")
	end
	
	self:NextThink(CurTime() + 0.2)
	return true
end

function ENT:StartTouch(ent)
	local tr = self:GetTouchTrace()
	local pos, norm = tr.HitPos, tr.HitNormal
	if self:IsCreature(ent) then
		self:ExplosionEffects(self:GetPos() + Vector(0,0,15))
		self:Explode(self:GetPos() - norm)
	else
		self:ExplosionEffects(pos, norm)
		self:Explode(pos, norm)
	end
end