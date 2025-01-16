local ironsightWeapons = {
	["weapon_pistol"] = true,
	["weapon_357"] = true,
	["weapon_smg1"] = true,
	["weapon_shotgun"] = true,
	["weapon_ar2"] = true
}

local ironsightPos = {
	["weapon_pistol"] = Vector(2, -1, 2.85),
	["weapon_357"] = Vector(2, -3, 2.08),
	["weapon_smg1"] = Vector(2, -1, 1.15),
	["weapon_shotgun"] = Vector(2, -1, 2.85),
	["weapon_ar2"] = Vector(0, -1, 2.1)
}

local ironsightAng = {
    ["weapon_pistol"] = 4.2, 
    ["weapon_357"] = 0,
    ["weapon_smg1"] = 1.3,
    ["weapon_shotgun"] = 2.5,
    ["weapon_ar2"] = 0
}

hook.Add("InitPostEntity", "MMOD_DeploySpeed", function() 
    RunConsoleCommand("sv_defaultdeployspeed", "1")
end)

--------------
--Ironsights--
--------------

CreateConVar("mmod_ironsights", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE}, "Toggle ironsight (0: Off, 1: On)")
CreateClientConVar("cl_ironsight_key", "MOUSE3", FCVAR_ARCHIVE, "The key to toggle ironsight")
CreateClientConVar("cl_ironsight_toggle", "1", FCVAR_ARCHIVE, "Determines if you should hold or press the ironsight key")
CreateClientConVar("cl_ironsight_blur", "1", FCVAR_ARCHIVE, "Toggle blur during ironsights")

local transitionSpeed = 3.8
local lastToggleTime = 0
local toggleCooldown = 0.6
local canToggleIronsight = true
inIronsights = false

local function ToggleIronsight()
	if canToggleIronsight then
		inIronsights = not inIronsights
		lastToggleTime = CurTime()
	end
end

local function GetMouseKeyCode(buttonName)
	--I can't get the keycodes for mouse buttons so I'm doing this the other way
	local mouseButtonMap = {
		MOUSE1 = 107,
		MOUSE2 = 108,
		MOUSE3 = 109,
		MOUSE4 = 110,
		MOUSE5 = 111
	}
	return mouseButtonMap[buttonName] or -1
end

hook.Add("RenderScreenspaceEffects", "Ironsight_ToyTown", function()
	if GetConVar("cl_ironsight_blur"):GetInt() != 1 then return end

	if inIronsights then
		DrawToyTown(2.1, ScrH() / 2.5)
	end
end)

hook.Add("CreateMove", "Ironsights_CreateMove", function(cmd)

	if GetConVar("mmod_ironsights"):GetInt() != 1 then return end

	local randomsounds = {
		"/weapons/movement/weapon_movement_sprint1.wav",
		"/weapons/movement/weapon_movement_sprint2.wav",
		"/weapons/movement/weapon_movement_sprint3.wav",
		"/weapons/movement/weapon_movement_sprint4.wav",
		"/weapons/movement/weapon_movement_sprint5.wav",
		"/weapons/movement/weapon_movement_sprint6.wav",
		"/weapons/movement/weapon_movement_sprint7.wav",
		"/weapons/movement/weapon_movement_sprint8.wav",
		"/weapons/movement/weapon_movement_sprint9.wav"
	}
	
	local randomSound = table.Random(randomsounds)

	local ply = LocalPlayer()
	if !ply:Alive() then return end
	
	local wep = ply:GetActiveWeapon()
	if !IsValid(wep) then return end

	local class = wep:GetClass()
	if !ironsightWeapons[class] then return end

	local vm = ply:GetViewModel()
	if !IsValid(vm) then return end

	local ironsightKey = string.upper(GetConVar("cl_ironsight_key"):GetString())
	local ironsightKeyCode = input.GetKeyCode(ironsightKey)
	local mouseKey = GetMouseKeyCode(ironsightKey)

	if canToggleIronsight then
		local shouldToggle = false
		shouldToggle = input.IsMouseDown(mouseKey) or input.IsKeyDown(ironsightKeyCode)
		
		if GetConVar("cl_ironsight_toggle"):GetInt() == 0 then 
			if shouldToggle and (CurTime() - lastToggleTime > toggleCooldown) then
				if !ply.IronsightKeyDown then
					if (CurTime() - lastToggleTime > toggleCooldown) then
						ToggleIronsight(ply)
						ply:EmitSound(randomSound, 75, 100, 0.75)
					end
				end
			elseif inIronsights and (CurTime() - lastToggleTime > toggleCooldown) then
				ToggleIronsight(ply)
				ply:EmitSound(randomSound, 75, 100, 0.75)
			end	
			ply.IronsightKeyDown = shouldToggle
		elseif GetConVar("cl_ironsight_toggle"):GetInt() == 1 then 
			if canToggleIronsight then
				if shouldToggle then
					if (CurTime() - lastToggleTime > toggleCooldown) then
						ToggleIronsight(ply)
						ply:EmitSound(randomSound, 75, 100, 0.75)	
					end
				end
			end
		end
	end
	
	local seq = vm:GetSequence()
	local seqinfo = vm:GetSequenceInfo(seq)
	local blacklistanimations = string.find(seqinfo.activityname, "_RELOAD") or string.find(seqinfo.activityname, "_INSPECT") or string.find(seqinfo.activityname, "_SPRINT") or string.find(seqinfo.activityname, "_DRAW")

	if blacklistanimations or wep:Clip1() == 0 or GetConVar("mmod_ironsights"):GetInt() == 0 then
		if inIronsights then
			ToggleIronsight()
		end
		canToggleIronsight = false
	else
		canToggleIronsight = true
	end

end)


hook.Add("CalcView", "MMOD_IronsightView_FOV", function(ply, pos, angles, fov)

	if GetConVar("mmod_ironsights"):GetInt() != 1 then return end

	if !ply:Alive() then return end
	
	local wep = ply:GetActiveWeapon()
	if !IsValid(wep) then return end

	local class = wep:GetClass()
	if !ironsightWeapons[class] then return end
	
	local drawplayer = ply:ShouldDrawLocalPlayer() 

	local vm = ply:GetViewModel()
	if !IsValid(vm) then return end
	
	local playerfov = ply:GetFOV()

    if IsValid(vm) then

		local view = {}
	
		if !drawplayer then
	
			if inIronsights then
				
				view.fov = Lerp(math.min(1, (CurTime() - lastToggleTime) * transitionSpeed), playerfov, fov / 1.5)
			
				return view

			elseif (CurTime() - lastToggleTime < toggleCooldown) then

				view.fov = Lerp(math.min(1, (CurTime() - lastToggleTime) * transitionSpeed), fov / 1.5 , playerfov)
					
				return view
				
			end
		end
	end
end)
	

hook.Add("CalcViewModelView", "MMOD_IronsightView_VM", function(wep, vm, oldPos, oldAng, pos, ang)

	if GetConVar("mmod_ironsights"):GetInt() != 1 then return end
	
	-- Modern Warfare Base
	if vm:GetClass() == "mg_viewmodel" then return end

	local ply = vm:GetOwner()
	if !ply:Alive() then return end

	local wep = ply:GetActiveWeapon()
	if !IsValid(wep) then return end

	local class = wep:GetClass()
	if !ironsightWeapons[class] then return end
	
	local drawplayer = ply:ShouldDrawLocalPlayer() 

	local vm = ply:GetViewModel()
	if !IsValid(vm) then return end
	local activeclass = tostring(wep:GetClass())
	
    if IsValid(vm) then

		local ironsightOffset = ironsightPos[activeclass]
		local ironsightAngle = ironsightAng[activeclass] or 0
	
		local targetPosCopy = Vector(oldPos.x, oldPos.y, oldPos.z)
		local targetAngCopy = Angle(oldAng.p, oldAng.y, oldAng.r)

		targetAngCopy:RotateAroundAxis(oldAng:Forward(), ironsightAngle)

		local targetPos = targetPosCopy - oldAng:Forward() * ironsightOffset.x + oldAng:Right() * ironsightOffset.y + oldAng:Up() * ironsightOffset.z
		local targetAng = targetAngCopy
	
		if !drawplayer then

			if inIronsights then

				pos = LerpVector(math.min(1, (CurTime() - lastToggleTime) * transitionSpeed), pos, targetPos)
				ang = LerpAngle(math.min(1, (CurTime() - lastToggleTime) * transitionSpeed), ang, targetAng)

				return pos, ang
					
			elseif (CurTime() - lastToggleTime < toggleCooldown) then

				pos = LerpVector(math.min(1, (CurTime() - lastToggleTime) * transitionSpeed), targetPos, pos)
				ang = LerpAngle(math.min(1, (CurTime() - lastToggleTime) * transitionSpeed), targetAng, ang)
			
				return  pos, ang

			end
		end
	end
end)

-------------------
--Ironsight Anims--
-------------------

if game.SinglePlayer() and CLIENT then
	hook.Add("Think", "MMOD_Weapon_IronsightIdle_SP", function()

		local ply = LocalPlayer()
		if !ply:Alive() then return end

		local wep = ply:GetActiveWeapon()
		if !IsValid(wep) then return end

		local class = wep:GetClass()
		if !ironsightWeapons[class] then return end

		local vm = ply:GetViewModel()
		if !IsValid(vm) then return end
			
		local seq = vm:GetSequence()
		local seqinfo = vm:GetSequenceInfo(seq)
		local cyc = vm:GetCycle()
		
		local vel = ply:GetVelocity():Length()
		local crouchspeed = ply:GetWalkSpeed() * ply:GetCrouchedWalkSpeed() // minimum speed to play anim
	
		if seqinfo.activityname == "ACT_VM_IDLE" then
			if inIronsights then
				local seqToPlay = vm:LookupSequence("ACT_VM_IDLE_SILENCED")
				if seqToPlay then

				local dur = vm:SequenceDuration(seqToPlay)
				vm:SendViewModelMatchingSequence(seqToPlay)
				wep.MMOD_NextSightTime = CurTime() + dur
						
				else return false

				end
			end
		elseif seqinfo.activityname == "ACT_VM_IDLE_SILENCED" then
			if !inIronsights or wep.MMOD_NextWalkTime then 
				local seqToPlay = vm:LookupSequence("ACT_VM_IDLE")
				if seqToPlay then

				local dur = vm:SequenceDuration(seqToPlay)
				vm:SendViewModelMatchingSequence(seqToPlay)
			
				else return false

				end
			end
		end
	end)
end

-------------------
--Reload Logic Anims--
-------------------


hook.Add("PlayerPostThink", "MMOD_Weapon_AR2_Logic", function(ply)

    if not ply:Alive() then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then return end

    local class = wep:GetClass()
    if class ~= "weapon_ar2" then return end

    local vm = ply:GetViewModel()
    if not IsValid(vm) then return end

    local seq = vm:GetSequence()
    local seqinfo = vm:GetSequenceInfo(seq)

    -- Ensure empty reload plays correctly when the clip is empty
    if seqinfo.activityname == "ACT_VM_RELOAD" and wep:Clip1() == 0 then
        local emptyReloadSeq = vm:LookupSequence("ACT_VM_RELOADEMPTY")
        if emptyReloadSeq then
            local duration = vm:SequenceDuration(emptyReloadSeq)

            -- Play the empty reload animation
            vm:SendViewModelMatchingSequence(emptyReloadSeq)

            -- Adjust weapon timings to match the animation duration
            wep:SetNextPrimaryFire(CurTime() + duration)
            wep:SetNextSecondaryFire(CurTime() + duration)
            wep:SetSaveValue("m_flTimeWeaponIdle", CurTime() + duration)

            -- Ensure smooth transition to idle after animation completes
            timer.Simple(duration, function()
                if IsValid(vm) and IsValid(wep) and ply:GetActiveWeapon() == wep then
                    local idleSeq = vm:LookupSequence("ACT_VM_IDLE")
                    if idleSeq then
                        vm:SendViewModelMatchingSequence(idleSeq)
                    end
                end
            end)
        end
    end
end)


hook.Add("PlayerPostThink", "MMOD_Weapon_SMG_Logic", function(ply)

    if not ply:Alive() then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then return end

    local class = wep:GetClass()
    if class ~= "weapon_smg1" then return end

    local vm = ply:GetViewModel()
    if not IsValid(vm) then return end

    local seq = vm:GetSequence()
    local seqinfo = vm:GetSequenceInfo(seq)
    local cyc = vm:GetCycle()

    -- Play the empty reload sequence when the clip is empty
    if seqinfo.activityname == "ACT_VM_RELOAD" and wep:Clip1() == 0 then
        local emptyReloadSeq = vm:LookupSequence("ACT_VM_RELOAD_EMPTY")
        if emptyReloadSeq then
            local duration = vm:SequenceDuration(emptyReloadSeq)
            
            -- Play the empty reload animation
            vm:SendViewModelMatchingSequence(emptyReloadSeq)

            -- Adjust weapon timings to match the animation
            wep:SetNextPrimaryFire(CurTime() + duration)
            wep:SetNextSecondaryFire(CurTime() + duration)
            wep:SetSaveValue("m_flTimeWeaponIdle", CurTime() + duration)

            -- Transition to the idle animation after the reload animation ends
            timer.Simple(duration, function()
                if IsValid(vm) and IsValid(wep) and ply:GetActiveWeapon() == wep then
                    local idleSeq = vm:LookupSequence("ACT_VM_IDLE")
                    if idleSeq then
                        vm:SendViewModelMatchingSequence(idleSeq)
                    end
                end
            end)
        end
    end
end)

hook.Add("PlayerPostThink", "MMOD_Weapon_Pistol_Logic", function(ply)

    if not ply:Alive() then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then return end

    local class = wep:GetClass()
    if class ~= "weapon_pistol" then return end

    local vm = ply:GetViewModel()
    if not IsValid(vm) then return end

    local seq = vm:GetSequence()
    local seqinfo = vm:GetSequenceInfo(seq)
    local cyc = vm:GetCycle()

    -- Check if the reload animation should be replaced by a half-reload
    if seqinfo.activityname == "ACT_VM_RELOAD" and wep:Clip1() > 0 then
        local halfReloadSeq = vm:LookupSequence("ACT_VM_RELOAD_NOSHOT")
        if halfReloadSeq then
            local duration = vm:SequenceDuration(halfReloadSeq)
            
            -- Play the half-reload animation
            vm:SendViewModelMatchingSequence(halfReloadSeq)

            -- Adjust weapon timings to match the animation
            wep:SetNextPrimaryFire(CurTime() + duration)
            wep:SetNextSecondaryFire(CurTime() + duration)
            wep:SetSaveValue("m_flTimeWeaponIdle", CurTime() + duration)

            -- Transition to the idle animation after the reload animation ends
            timer.Simple(duration, function()
                if IsValid(vm) and IsValid(wep) and ply:GetActiveWeapon() == wep then
                    local idleSeq = vm:LookupSequence("ACT_VM_IDLE")
                    if idleSeq then
                        vm:SendViewModelMatchingSequence(idleSeq)
                    end
                end
            end)
        end
    end
end)

hook.Add("PlayerPostThink", "MMOD_Weapon_357_Logic", function(ply)
    if not ply:Alive() then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or wep:GetClass() ~= "weapon_357" then return end

    local vm = ply:GetViewModel()
    if not IsValid(vm) then return end

    local seq = vm:GetSequence()
    local seqinfo = vm:GetSequenceInfo(seq)
    local cyc = vm:GetCycle()

    -- Check if the reload animation should be replaced based on ammo left
    if seqinfo.activityname == "ACT_VM_RELOAD" then
        local ammoLeft = wep:Clip1()
        local totalAmmo = ply:GetAmmoCount(wep:GetPrimaryAmmoType())

        local seqMap = {
            [1] = "ACT_VM_RELOAD_SHELL1",
            [2] = "ACT_VM_RELOAD_SHELL2",
            [3] = "ACT_VM_RELOAD_SHELL3",
            [4] = "ACT_VM_RELOAD_SHELL4",
            [5] = "ACT_VM_RELOAD_SHELL5"
        }

        -- First, use the ammo left in the clip to determine the reload animation
        if seqMap[ammoLeft] then
            local customSeq = vm:LookupSequence(seqMap[ammoLeft])
            if customSeq then
                local duration = vm:SequenceDuration(customSeq)

                -- Play the custom reload animation
                vm:SendViewModelMatchingSequence(customSeq)

                -- Adjust weapon timings to match the animation
                wep:SetNextPrimaryFire(CurTime() + duration)
                wep:SetNextSecondaryFire(CurTime() + duration)
                wep:SetSaveValue("m_flTimeWeaponIdle", CurTime() + duration)

                -- Transition to the idle animation after the reload animation ends
                timer.Simple(duration, function()
                    if IsValid(vm) and IsValid(wep) and ply:GetActiveWeapon() == wep then
                        local idleSeq = vm:LookupSequence("ACT_VM_IDLE")
                        if idleSeq then
                            vm:SendViewModelMatchingSequence(idleSeq)
                        end
                    end
                end)

                -- Prevent the default full reload animation from playing
                return
            end
        end

        -- If ammoLeft is 0, fall back to checking the total ammo
        if ammoLeft == 0 and totalAmmo > 0 then
            -- Reverse the logic for total ammo to play the corresponding custom reload animation
            local reversedSeqMap = {
                [1] = "ACT_VM_RELOAD_SHELL5",  -- 1 ammo left = reload animation for 5 shells
                [2] = "ACT_VM_RELOAD_SHELL4",  -- 2 ammo left = reload animation for 4 shells
                [3] = "ACT_VM_RELOAD_SHELL3",  -- 3 ammo left = reload animation for 3 shells
                [4] = "ACT_VM_RELOAD_SHELL2",  -- 4 ammo left = reload animation for 2 shells
                [5] = "ACT_VM_RELOAD_SHELL1"   -- 5 ammo left = reload animation for 1 shell
            }

            -- Ensure we do not play a reload animation that would exceed the total ammo available
            if reversedSeqMap[totalAmmo] then
                local customSeq = vm:LookupSequence(reversedSeqMap[totalAmmo])
                if customSeq then
                    local duration = vm:SequenceDuration(customSeq)

                    -- Play the custom reload animation
                    vm:SendViewModelMatchingSequence(customSeq)

                    -- Adjust weapon timings to match the animation
                    wep:SetNextPrimaryFire(CurTime() + duration)
                    wep:SetNextSecondaryFire(CurTime() + duration)
                    wep:SetSaveValue("m_flTimeWeaponIdle", CurTime() + duration)

                    -- Transition to idle animation after the reload ends
                    timer.Simple(duration, function()
                        if IsValid(vm) and IsValid(wep) and ply:GetActiveWeapon() == wep then
                            local idleSeq = vm:LookupSequence("ACT_VM_IDLE")
                            if idleSeq then
                                vm:SendViewModelMatchingSequence(idleSeq)
                            end
                        end
                    end)

                    -- Prevent the default full reload animation from playing
                    return
                end
            end
        end
    end
end)

-------------------------------
--Physcannon draw fix
-------------------------------
hook.Add("PlayerSwitchWeapon", "ForcePhysCannonDrawAnimation", function(ply, oldWep, newWep)
    -- Check if the new weapon is the physcannon
    if IsValid(newWep) and newWep:GetClass() == "weapon_physcannon" then
        local vm = ply:GetViewModel() -- Get the player's view model
        if IsValid(vm) then
            local drawSeq = vm:LookupSequence("draw") -- Find the draw sequence
            if drawSeq then
                -- Play the draw animation
                vm:SendViewModelMatchingSequence(drawSeq)
                
                -- Get the duration of the draw animation
                local duration = vm:SequenceDuration(drawSeq)
                
                -- Prevent firing until the animation completes
                newWep:SetNextPrimaryFire(CurTime() + duration)
                newWep:SetNextSecondaryFire(CurTime() + duration)

                -- Optional: Block grav gun functions during the animation
                ply:SetNWFloat("PhysCannonDrawEndTime", CurTime() + duration)
            end
        end
    end
end)

-- Prevent interaction during the draw animation
hook.Add("GravGunPickupAllowed", "BlockPickupDuringDraw", function(ply, ent)
    if ply:GetNWFloat("PhysCannonDrawEndTime", 0) > CurTime() then
        return false
    end
end)

hook.Add("GravGunPunt", "BlockPuntDuringDraw", function(ply, ent)
    if ply:GetNWFloat("PhysCannonDrawEndTime", 0) > CurTime() then
        return false
    end
end)

-----------------------------
--Pistol ALT Viewmodel
-----------------------------
-- Create the convar to enable/disable the alternative pistol viewmodel
CreateConVar("mmod_onehanded_pistol", "0", FCVAR_ARCHIVE, "Enable/Disable the one-handed pistol model (0 = default, 1 = alternative)")

-- Function to change the viewmodel based on the convar and force animation playback
local function ChangePistolViewModel(ply, wep)
    if IsValid(wep) and wep:GetClass() == "weapon_pistol" then
        local viewmodel = ply:GetViewModel()

        -- Check if the model needs to be updated (only if convar is enabled or disabled)
        local useAltViewmodel = GetConVar("mmod_onehanded_pistol"):GetBool()

        -- Check if we need to change the model
        if useAltViewmodel then
            if viewmodel:GetModel() ~= "models/weapons/c_pistol_alt.mdl" then
                viewmodel:SetModel("models/weapons/c_pistol_alt.mdl")
                -- Force the draw animation to play after the model switch
                ply:GetViewModel():SetSequence(ply:GetViewModel():LookupSequence("draw"))
            end
        else
            if viewmodel:GetModel() ~= "models/weapons/c_pistol.mdl" then
                viewmodel:SetModel("models/weapons/c_pistol.mdl")
                -- Force the draw animation to play after the model switch
                ply:GetViewModel():SetSequence(ply:GetViewModel():LookupSequence("draw"))
            end
        end
    end
end

-- Hook into the player switch weapon to change the viewmodel when weapon_pistol is equipped
hook.Add("PlayerSwitchWeapon", "ChangePistolViewModelHook", function(ply, oldWep, newWep)
    ChangePistolViewModel(ply, newWep)
end)

-- Optionally, you can change the viewmodel immediately if the player already has the weapon equipped when the convar changes
hook.Add("Think", "UpdatePistolViewModelOnConvarChange", function()
    for _, ply in ipairs(player.GetAll()) do
        local wep = ply:GetActiveWeapon()
        if IsValid(wep) and wep:GetClass() == "weapon_pistol" then
            ChangePistolViewModel(ply, wep)  -- Ensure the correct viewmodel is set
        end
    end
end)





-------------------------------
--Stunstick Underwater Damage--
-------------------------------
	
if SERVER then
	hook.Add("PlayerPostThink", "MMOD_StunstickWater", function(ply, pos, sound, volume)

	local randomsounds = {
		"/ambient/energy/zap1.wav",
		"/ambient/energy/zap2.wav",
		"/ambient/energy/zap3.wav"
	}

	local randomNum = math.floor(math.random(3))
	local randomSound = randomsounds[randomNum]

	if !ply:Alive() then return end

	local wep = ply:GetActiveWeapon()
	if !IsValid(wep) then return end
	
	local class = wep:GetClass()
	if class != "weapon_stunstick" then return end

	local vm = ply:GetViewModel()
	if !IsValid(vm) then return end

	local seq = vm:GetSequence()
	local seqinfo = vm:GetSequenceInfo(seq)

	if seqinfo.activityname == "ACT_VM_MISSCENTER" or seqinfo.activityname == "ACT_VM_HITCENTER" then
		if (!wep.MMOD_Stunstick) or (wep.MMOD_Stunstick and CurTime() > wep.MMOD_Stunstick) then
			if ply:WaterLevel() > 2 then
			
				local dur = vm:SequenceDuration(seqinfo)
				ply:TakeDamage(40, ply, ply)
				ply:EmitSound(randomSound)

				wep.MMOD_Stunstick = CurTime() + dur

				return true

				end
			end
		end
	end)
end