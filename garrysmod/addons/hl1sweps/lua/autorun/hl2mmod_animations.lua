local inspectableWeapons = {
    ["weapon_pistol"] = true,
    ["weapon_357"] = true,
    ["weapon_smg1"] = true,
    ["weapon_ar2"] = true,
    ["weapon_shotgun"] = true,
    ["weapon_crossbow"] = true,
    ["weapon_rpg"] = true,
    ["weapon_stunstick"] = true,
    ["weapon_crowbar"] = true,
}

local sprintableWeapons = {
    ["weapon_pistol"] = true,
    ["weapon_357"] = true,
    ["weapon_smg1"] = true,
    ["weapon_shotgun"] = true,
    ["weapon_crossbow"] = true,
    ["weapon_rpg"] = true,
    ["weapon_frag"] = true,
    ["weapon_stunstick"] = true,
    ["weapon_crowbar"] = true,
    ["weapon_physcannon"] = true,
    ["weapon_bugbait"] = true,
    ["weapon_ar2"] = true
}

--reset the MMOD variables on player's first load/spawn
hook.Add("PlayerInitialSpawn", "MMOD_Variable_Reset", function(ply)
	--get the player's weapons
	weaponTable = ply:GetWeapons()

	--go through each of the player's weapons
	for num, wep in ipairs(weaponTable) do
		local weaponClass = wep:GetClass()

		--if they are MMOD weapons, reset their inspect and walk/spring animation variables
		--must check if they are MMOD weapons in case the player is using other weapons (i.e. HL1 weapons or custom weapons)
		if inspectableWeapons[weaponClass] then
			wep.MMOD_NextInspectTime = nil
		end

		if sprintableWeapons[weaponClass] then
			wep.MMOD_NextSprintTime = nil
			wep.MMOD_NextWalkTime = nil
		end
	end
end)

if SERVER then
    hook.Add("KeyPress", "MMOD_Weapon_Inspect", function(ply, key)
        -- Check if the inspect action is pressed (IN_RELOAD key)
        if key != IN_RELOAD then return end
        if not ply:Alive() then return end

        local wep = ply:GetActiveWeapon()
        if not IsValid(wep) then return end

        local class = wep:GetClass()
        if not inspectableWeapons[class] then return end

        local vm = ply:GetViewModel()
        if not IsValid(vm) then return end

        local seq = vm:GetSequence()
        local seqinfo = vm:GetSequenceInfo(seq)

        -- Prevent inspect action if VManip is active
        if VManip and VManip:IsActive() then
            return
        end

        -- Check if the current activity is "ACT_VM_IDLE"
        if seqinfo.activityname == "ACT_VM_IDLE" then
            -- Ensure that the inspect action doesn't trigger too soon
            if not wep.MMOD_NextInspectTime or (wep.MMOD_NextInspectTime and CurTime() > wep.MMOD_NextInspectTime) then
                if wep:Clip1() == wep:GetMaxClip1() then
                    -- Randomly choose one of the inspect sequences
                    local seqToPlay = vm:LookupSequence("inspect"..tostring(math.random(1,2)))
                    if seqToPlay then
                        local dur = vm:SequenceDuration(seqToPlay)

                        -- Set the idle time to the duration of the inspect animation
                        wep:SetSaveValue("m_flTimeWeaponIdle", dur)
                        vm:SendViewModelMatchingSequence(seqToPlay)
                        wep.MMOD_NextInspectTime = CurTime() + dur
                    end
                end
            end
        end
    end)
end


hook.Add("PlayerPostThink", "MMOD_AR2_Skin", function(ply)
	if !ply:Alive() then return end

	local wep = ply:GetActiveWeapon()
	if !IsValid(wep) then return end

	local class = wep:GetClass()
	if class != "weapon_ar2" then return end

	local vm = ply:GetViewModel()
	if !IsValid(vm) then return end

	local seq = vm:GetSequence()
	local seqinfo = vm:GetSequenceInfo(seq)

	local seqName = seqinfo.label
	local cyc = vm:GetCycle()

	if (string.find(seqName, "fire") and cyc < 0.2) or string.find(seqName, "shake") or (seqName == "inspect1" and cyc > 0.1 and cyc < 0.9) or (seqName == "inspect2" and cyc > 0.4 and cyc < 0.55)then
		if vm:GetSkin() != 1 then
			vm:SetSkin(1)
		end
	else
		if vm:GetSkin() != 0 then
			vm:SetSkin(0)
		end
	end
end)

if SERVER then

	/*
	local function AdjustViewModelPlayback(ply)
		-- Get the player's speeds
		local maxSpeed = ply:GetMaxSpeed()
		local walkSpeed = ply:GetWalkSpeed()
		local runSpeed = ply:GetRunSpeed()

		local minSpeed = 80
		local maxPlaybackRate = 1.0

		-- Calculate the lerp factor based on max speed
		local lerpFactor = math.Clamp((maxSpeed - minSpeed) / walkSpeed, 0, 1)

		local playbackRate = Lerp(lerpFactor, 0.5, maxPlaybackRate)
		playbackRate = math.min(playbackRate, maxPlaybackRate)
		
		local vm = ply:GetViewModel()
		local currentPlaybackRate = vm:GetPlaybackRate()
			
		vm:SetPlaybackRate(Lerp(FrameTime() * 0.5, currentPlaybackRate, playbackRate))
		
		--vm:SetPlaybackRate(playbackRate)
	end
	*/

	hook.Add("PlayerPostThink", "MMOD_Weapon_Sprint", function(ply)
		if !ply:Alive() then return end

		local wep = ply:GetActiveWeapon()
		if !IsValid(wep) then return end

		local class = wep:GetClass()
		if !sprintableWeapons[class] then return end

		local vm = ply:GetViewModel()
		if !IsValid(vm) then return end

		local seq = vm:GetSequence()
		local seqinfo = vm:GetSequenceInfo(seq)

		local vel = ply:GetVelocity():Length()
		local crouchspeed = ply:GetWalkSpeed() * ply:GetCrouchedWalkSpeed() --minimum speed to play anim

		if seqinfo.activityname == "ACT_VM_IDLE" then
			if sprintableWeapons[class] then
			if (!wep.MMOD_NextSprintTime) or (wep.MMOD_NextSprintTime and CurTime() > wep.MMOD_NextSprintTime) then
				if ply:KeyDown(IN_SPEED) and ply:OnGround() and vel >= crouchspeed and !ply:Crouching() then
				local seqToPlay = vm:LookupSequence("sprint")
					if seqToPlay then

						local dur = vm:SequenceDuration(seqToPlay)
						wep:SetSaveValue("m_flTimeWeaponIdle", 200)
						vm:SendViewModelMatchingSequence(seqToPlay)
						wep.MMOD_NextSprintTime = CurTime() + dur

						else return false

						end
					end
				end
			end
		elseif string.lower(seqinfo.label) == "sprint" then
			if !ply:KeyDown(IN_SPEED) or !ply:OnGround() or vel < crouchspeed or ply:Crouching() then
			local seqToPlay = vm:LookupSequence("idle01")
				if seqToPlay then

				local dur = vm:SequenceDuration(seqToPlay)
				vm:SendViewModelMatchingSequence(seqToPlay)
				wep.MMOD_NextSprintTime = CurTime() + 0.25

				else return false

				end
			end
			--AdjustViewModelPlayback(ply)
		end
	end)

	hook.Add("PlayerPostThink", "MMOD_Weapon_Walk", function(ply)
		if !ply:Alive() then return end

		local wep = ply:GetActiveWeapon()
		if !IsValid(wep) then return end

		local class = wep:GetClass()
		if !sprintableWeapons[class] then return end

		local vm = ply:GetViewModel()
		if !IsValid(vm) then return end

		local seq = vm:GetSequence()
		local seqinfo = vm:GetSequenceInfo(seq)

		local vel = ply:GetVelocity():Length()
		local crouchspeed = ply:GetWalkSpeed() * ply:GetCrouchedWalkSpeed() // minimum speed to play anim

		if seqinfo.activityname == "ACT_VM_IDLE" then
			if sprintableWeapons[class] then
			if (!wep.MMOD_NextWalkTime) or (wep.MMOD_NextWalkTime and CurTime() > wep.MMOD_NextWalkTime) then
				if ply:OnGround() and vel >= crouchspeed and !ply:Crouching() then
				local seqToPlay = vm:LookupSequence("walk")
					if seqToPlay then
						
						local dur = vm:SequenceDuration(seqToPlay)
						wep:SetSaveValue("m_flTimeWeaponIdle", 200)
						vm:SendViewModelMatchingSequence(seqToPlay)
						wep.MMOD_NextWalkTime = CurTime() + dur

						else return false

						end
					end
				end
			end
		elseif string.lower(seqinfo.label) == "walk" then
			if ply:Crouching() or !ply:OnGround() or vel < crouchspeed or (ply:KeyDown(IN_SPEED) and ply:OnGround() and vel >= 50) then
			local seqToPlay = vm:LookupSequence("idle01")
				if seqToPlay then

				local dur = vm:SequenceDuration(seqToPlay)
				vm:SendViewModelMatchingSequence(seqToPlay)
				wep.MMOD_NextWalkTime = CurTime() + 0.25

				else return false

				end
			end
			--AdjustViewModelPlayback(ply)
		end
	end)
end


---------------------------
--Crossbow Zoom Animation--
---------------------------

if SERVER then
	hook.Add("PlayerPostThink", "MMOD_CrossbowReloadZoom", function(ply)
		if !ply:Alive() then return end

		local wep = ply:GetActiveWeapon()
		if !IsValid(wep) then return end

		local class = wep:GetClass()
		if class != "weapon_crossbow" then return end

		local vm = ply:GetViewModel()
		if !IsValid(vm) then return end

		local seq = vm:GetSequence()
		local seqinfo = vm:GetSequenceInfo(seq)
	
		local seqName = seqinfo.label
		local cyc = vm:GetCycle()
	
		if ply:GetFOV() < 25 and (seqinfo.activityname == "ACT_VM_RELOAD" and cyc < 0.1) then
			local seqToPlay = vm:LookupSequence("reload_zoomed")
		
			if seqToPlay then

			vm:SendViewModelMatchingSequence(seqToPlay)
			wep.MMOD_CrossbowReload = true
			
			else return false
			
			end
		end
	end)
end

-----------------------------
--Shotgun Reload Empty Animation--
-----------------------------
if SERVER then
    hook.Add("PlayerPostThink", "ReplaceShotgunReloadStart", function(ply)
        if not ply:Alive() then return end

        local wep = ply:GetActiveWeapon()
        if not IsValid(wep) or wep:GetClass() ~= "weapon_shotgun" then return end

        local vm = ply:GetViewModel()
        if not IsValid(vm) then return end

        -- Prevent animation glitches by tracking reload state
        wep.IsReloading = wep.IsReloading or false

        -- Detect if the shotgun is about to play ACT_SHOTGUN_RELOAD_START
        local currentActivity = vm:GetSequenceActivity(vm:GetSequence())
        if currentActivity == ACT_SHOTGUN_RELOAD_START and not wep.IsReloading then
            wep.IsReloading = true -- Mark as reloading to prevent duplicate animations

            if wep:Clip1() == 0 then
                -- Replace with ACT_SHOTGUN_RELOAD_START_EMPTY if the clip is empty
                local emptyReloadSeq = vm:LookupSequence("ACT_SHOTGUN_RELOAD_START_EMPTY")
                if emptyReloadSeq and emptyReloadSeq > 0 then
                    vm:SendViewModelMatchingSequence(emptyReloadSeq)
                    local duration = vm:SequenceDuration()

                    -- Adjust weapon timings to match the new sequence duration
                    wep:SetNextPrimaryFire(CurTime() + duration)
                    wep:SetNextSecondaryFire(CurTime() + duration)
                    wep:SetSaveValue("m_flTimeWeaponIdle", CurTime() + duration)

                    -- Simulate adding 1 ammo to the clip and reducing reserve ammo
                    timer.Simple(duration / 2, function()
                        if IsValid(ply) and IsValid(wep) then
                            local reserveAmmo = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
                            if reserveAmmo > 0 then
                                wep:SetClip1(wep:Clip1() + 1)
                                ply:SetAmmo(reserveAmmo - 1, wep:GetPrimaryAmmoType())
                            else
                            end
                        end
                    end)
                end
            else
            end
        elseif currentActivity ~= ACT_SHOTGUN_RELOAD_START then
            -- Reset reload state when the sequence changes
            wep.IsReloading = false
        end
    end)
end


if CLIENT then
	CreateClientConVar("mmod_replacements_stopsway", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_USERINFO}, "Disable to support viewmodel lagger and other calcvmview scripts")
	CreateClientConVar("mmod_replacements_lense", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_USERINFO}, "Add a refraction overlay for crossbow scope")
	CreateClientConVar("mmod_replacements_crossbow_overlay", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_USERINFO}, "Adds an overlay for crossbow scope")

	hook.Add("CalcViewModelView", "MMOD_Weapon_StopDefaultSway", function(wep, vm, oldPos, oldAng, pos, ang)
		local ply = wep:GetOwner()
		if sprintableWeapons[wep:GetClass()] and IsValid(ply) and ply:GetVelocity():Length() > 1 and GetConVar("mmod_replacements_stopsway"):GetInt() == 1 then
			local can = true
			local leaning = ply:GetNW2Int("TFALean", 0) != 0 // should work with tfa leaning

			if leaning then can = false end

			if can then
				return oldPos, oldAng
			end
		end
	end)

	local cbScope = Material("vgui/scopes/hl2mmod_scopes_crossbow")

	hook.Add("RenderScreenspaceEffects", "MMOD_Weapon_CrossbowZoomOverlay", function()
		local ply = LocalPlayer()

		local wep = ply:GetActiveWeapon()
		if !IsValid(wep) then return end

		if GetConVar("mmod_replacements_crossbow_overlay"):GetInt() == 1 then
			if ply:Alive() and wep:GetClass() == "weapon_crossbow" then
				if ply:GetFOV() < 25 then // cannot check crossbow's m_bInZoom, because something is broken, so I have to do it this way
					cam.Start2D()
						local w, h = ScrW(), ScrH()

						local start1 = w/2-h/2

						surface.SetDrawColor(255, 255, 255, 255)
						surface.SetMaterial(cbScope)
						surface.DrawTexturedRect(start1, 0, h, h)

						surface.SetDrawColor(0, 0, 0, 255)
						surface.DrawRect(0, 0, start1, h)

						surface.DrawRect(w-start1, 0, w, h)

						surface.DrawRect(-1, -1, w + 2, 2)

						surface.DrawRect(-1, -1, 2, h + 2)
					cam.End2D()
				end
			end
		end
	end)

	local cbLense = Material("models/weapons/v_crossbow/lens")

	local function mmod_replacements_lense_cvar_func(name, oldval, newval)
		if newval == "0" then
			cbLense:SetTexture("$basetexture", "vgui/black")
		elseif newval == "1" then
			cbLense:SetTexture("$basetexture", "_rt_SmallFB1")
		elseif newval == "2" then
			cbLense:SetTexture("$basetexture", "_rt_FullFrameFB")
		end
	end

	cvars.RemoveChangeCallback("mmod_replacements_lense", "mmod_replacements_lense_id")
	cvars.AddChangeCallback("mmod_replacements_lense", mmod_replacements_lense_cvar_func, "mmod_replacements_lense_id")

	hook.Add("InitPostEntity", "MMOD_Weapon_CrossbowLenseConvarInit", function()
		mmod_replacements_lense_cvar_func(nil, nil, GetConVar("mmod_replacements_lense"):GetString())
	end)
end