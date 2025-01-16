
-- default settings
local defaultSoundTable = {
	channel = CHAN_AUTO, 
	volume = 1,
	level = 60, 
	pitchstart = 100,
	pitchend = 100,
	name = "noName",
	sound = "path/to/sound"
}

local fireSoundTable = {
	channel = CHAN_AUTO, 
	volume = 1,
	level = 97, 
	pitchstart = 92,
	pitchend = 112,
	name = "noName",
	sound = "path/to/sound"
}

local muteSoundTable = {
	channel = CHAN_AUTO, 
	volume = 0.001,
	level = 60, 
	pitchstart = 100,
	pitchend = 100,
	name = "noName",
	sound = "hl1/fvox/_comma.wav"
}

-- "<" makes the sound directional, refer to https://developer.valvesoftware.com/wiki/Soundscripts#Sound_Characters
local function makeSoundDirectional(snd)
	if type(snd) == "table" then
		for key, sound in ipairs(snd) do
			snd[key] = "<" .. sound
		end
	else
		snd = "<" .. snd
	end
	
	return snd
end

local function addDefaultSound(name, snd)
	snd = makeSoundDirectional(snd)
	
	defaultSoundTable.name = name
	defaultSoundTable.sound = snd

	sound.Add(defaultSoundTable)
	
	-- precache the registered sounds
	if type(defaultSoundTable.sound) == "table" then
		for k, v in pairs(defaultSoundTable.sound) do
			util.PrecacheSound(v)
		end
	else
		util.PrecacheSound(snd)
	end
end

local function addFireSound(name, snd, volume, soundLevel, channel, pitchStart, pitchEnd, noDirection)
	-- use defaults if no args are provided
	volume = volume or 1
	soundLevel = soundLevel or 97
	channel = channel or CHAN_AUTO
	pitchStart = pitchStart or 92
	pitchEnd = pitchEnd or 112
	
	if not noDirection then
		snd = makeSoundDirectional(snd)
	end
	
	fireSoundTable.name = name
	fireSoundTable.sound = snd
	
	fireSoundTable.channel = channel
	fireSoundTable.volume = volume
	fireSoundTable.level = soundLevel
	fireSoundTable.pitchstart = pitchStart
	fireSoundTable.pitchend = pitchEnd
	
	sound.Add(fireSoundTable)
	
	-- precache the registered sounds
	
	if type(fireSoundTable.sound) == "table" then
		for k, v in pairs(fireSoundTable.sound) do
			util.PrecacheSound(v)
		end
	else
		util.PrecacheSound(snd)
	end
end

local function muteSound(name)	
	muteSoundTable.name = name
	sound.Add(muteSoundTable)
end

// MMOD sounds
// firing sounds
addFireSound("Weapon_Pistol.Single", {
    "weapons/pistol/player_pistol_fire1.wav",
    "weapons/pistol/player_pistol_fire2.wav",
    "weapons/pistol/player_pistol_fire3.wav"},
    0.55, SNDLVL_GUNFIRE, CHAN_WEAPON, 98, 102
)

addFireSound("Weapon_357.Single", {
    "weapons/357/357_fire1.wav",
    "weapons/357/357_fire2.wav",
    "weapons/357/357_fire3.wav"},
    0.93, SNDLVL_GUNFIRE, CHAN_WEAPON, 88, 93
)

addFireSound("Weapon_AR2.Single", {
    "weapons/ar2/fire1.wav",
    "weapons/ar2/fire2.wav",
    "weapons/ar2/fire3.wav"},
    0.8, SNDLVL_GUNFIRE, CHAN_WEAPON, 85, 95
)

addFireSound("Weapon_SMG1.Single", {
    "weapons/smg1/smg1_fire1.wav",
    "weapons/smg1/smg1_fire2.wav",
    "weapons/smg1/smg1_fire3.wav"},
    0.55, SNDLVL_GUNFIRE, CHAN_WEAPON, 95, 105
)

addFireSound("Weapon_Shotgun.Single", "weapons/shotgun/shotgun_fire.wav", 0.86, SNDLVL_GUNFIRE, CHAN_WEAPON, 100, 100)
addFireSound("Weapon_Shotgun.Double", "weapons/shotgun/shotgun_dbl_fire.wav", 1, SNDLVL_GUNFIRE, CHAN_WEAPON, 90, 95)

addFireSound("Weapon_Crossbow.Single", "weapons/crossbow/fire1.wav", 0.61, SNDLVL_NORM, CHAN_WEAPON, 93, 108)

// npc fire sounds
addFireSound("Weapon_Pistol.NPC_Single", {
    "weapons/pistol/npc_pistol_fire1.wav",
    "weapons/pistol/npc_pistol_fire2.wav",
    "weapons/pistol/npc_pistol_fire3.wav"},
    1, SNDLVL_GUNFIRE, CHAN_WEAPON, 98, 102
)

addDefaultSound("Weapon_Pistol.NPC_Reload", "weapons/pistol/npc_pistol_reload1.wav")

addFireSound("Weapon_SMG1.NPC_Single", {
    "weapons/smg1/npc_smg1_fire1.wav",
    "weapons/smg1/npc_smg1_fire2.wav",
    "weapons/smg1/npc_smg1_fire3.wav"},
    1, SNDLVL_GUNFIRE, CHAN_WEAPON, 98, 102
)

addFireSound("Weapon_Shotgun.NPC_Single", "weapons/shotgun/npc_shotgun_fire.wav", 1, SNDLVL_GUNFIRE, CHAN_WEAPON, 100, 100)
addFireSound("Weapon_Shotgun.NPC_Double", "weapons/shotgun/npc_shotgun_dbl_fire.wav", 1, SNDLVL_GUNFIRE, CHAN_WEAPON, 100, 100)

addFireSound("Weapon_AR2.NPC_Single", {
    "weapons/ar2/ar2_dist1.wav",
    "weapons/ar2/ar2_dist2.wav",
    "weapons/ar2/ar2_dist3.wav"},
    0.85, SNDLVL_GUNFIRE, CHAN_WEAPON, 95, 105
)


// muted some HL2 sounds because they keep playing even if they should not
muteSound("Weapon_Pistol.Reload")
muteSound("Weapon_SMG1.Reload")
muteSound("Weapon_Shotgun.Special1")
muteSound("Weapon_Crossbow.BoltElectrify")

// reload/other sounds
addDefaultSound("MMOD_Weapon_357.CloseLoader", "weapons/357/357_reload4.wav")
addDefaultSound("MMOD_Weapon_357.Draw", "weapons/357/357_deploy.wav")
addDefaultSound("MMOD_Weapon_357.Fidget_Spinner", "weapons/357/357_spin2.wav")
addDefaultSound("MMOD_Weapon_357.Hammer_Pull", "weapons/357/357_hammerpull.wav")
addDefaultSound("MMOD_Weapon_357.Hammer_Release", "weapons/357/357_hammerrelease.wav")
addDefaultSound("MMOD_Weapon_357.OpenLoader", "weapons/357/357_reload1.wav")
addDefaultSound("MMOD_Weapon_357.Shellout", "weapons/357/357_shellout.wav")
addDefaultSound("MMOD_Weapon_357.Shellin", "weapons/357/357_shellin.wav")
addDefaultSound("MMOD_Weapon_357.RemoveLoader", "weapons/357/357_reload2.wav")
addDefaultSound("MMOD_Weapon_357.ReplaceLoader", "weapons/357/357_reload3.wav")
addDefaultSound("MMOD_Weapon_357.Spin", "weapons/357/357_spin1.wav")

addFireSound("Weapon_CombineGuard.Special1", "weapons/ar2/ar2_charge.wav", 0.7, SNDLVL_NORM, CHAN_WEAPON, 100, 100)
addDefaultSound("MMOD_Weapon_Irifle.Draw", "weapons/ar2/ar2_deploy.wav")
addDefaultSound("MMOD_Weapon_AR2.BoltPull", "weapons/ar2/ar2_boltpull.wav")
addDefaultSound("MMOD_Weapon_AR2.FidgetPush", "weapons/ar2/ar2_push.wav")
addDefaultSound("MMOD_Weapon_AR2.FidgetRotate", "weapons/ar2/ar2_rotate.wav")
addDefaultSound("MMOD_Weapon_AR2.MagIn", "weapons/ar2/ar2_magin.wav")
addDefaultSound("MMOD_Weapon_AR2.MagOut", "weapons/ar2/ar2_magout.wav")
addDefaultSound("MMOD_Weapon_AR2.Reload_Push", "weapons/ar2/ar2_reload_push.wav")
addDefaultSound("MMOD_Weapon_AR2.Reload_Rotate", "weapons/ar2/ar2_reload_rotate.wav")

addDefaultSound("MMOD_Weapon_Crossbow.Draw", "weapons/crossbow/crossbow_deploy.wav")
addDefaultSound("MMOD_Weapon_Crossbow.DrawBack", "weapons/crossbow/crossbow_draw.wav")
addDefaultSound("MMOD_Weapon_Crossbow.Lens", "weapons/crossbow/crossbow_lens.wav")
addDefaultSound("MMOD_Weapon_Crossbow.String", "weapons/crossbow/crossbow_string.wav")
addDefaultSound("MMOD_Weapon_Crossbow.BoltElectrify", {"weapons/crossbow/bolt_load1.wav", "weapons/crossbow/bolt_load2.wav"})

addDefaultSound("MMOD_Weapon_Grenade.Draw", "weapons/draw_grenade.wav")
addDefaultSound("MMOD_Weapon_Grenade.Pull", "weapons/grenade/pin_pull.wav")
addDefaultSound("MMOD_Weapon_Grenade.Ready", "weapons/grenade/grenade_ready.wav")
addDefaultSound("MMOD_Weapon_Grenade.Roll", "weapons/grenade/grenade_lob.wav")
addDefaultSound("MMOD_Weapon_Grenade.Throw", "weapons/grenade/grenade_throw.wav")

addDefaultSound("MMOD_Weapon_RPG.Button", "weapons/rpg/rpg_button.wav")
addDefaultSound("MMOD_Weapon_RPG.Draw", "weapons/rpg/rpg_deploy.wav")
addDefaultSound("MMOD_Weapon_RPG.Inspect", "weapons/rpg/rpg_fidget.wav")
addDefaultSound("MMOD_Weapon_RPG.Pet1", "weapons/rpg/rpg_pet1.wav")
addDefaultSound("MMOD_Weapon_RPG.Pet2", "weapons/rpg/rpg_pet2.wav")
addDefaultSound("MMOD_Weapon_RPG.Reload", "weapons/rpg/rpg_reload1.wav")

addDefaultSound("MMOD_Weapon_SMG1.BoltBack", "weapons/smg1/smg1_boltback.wav")
addDefaultSound("MMOD_Weapon_SMG1.BoltForward", "weapons/smg1/smg1_boltforward.wav")
addDefaultSound("MMOD_Weapon_SMG1.ClipHit", "weapons/smg1/smg1_cliphit.wav")
addDefaultSound("MMOD_Weapon_SMG1.ClipIn", "weapons/smg1/smg1_clipin.wav")
addDefaultSound("MMOD_Weapon_SMG1.ClipOut", "weapons/smg1/smg1_clipout.wav")
addDefaultSound("MMOD_Weapon_SMG1.Deploy", "weapons/smg1/smg1_deploy.wav")
addDefaultSound("MMOD_Weapon_SMG1.GripFold", "weapons/smg1/smg1_gripfold.wav")
addDefaultSound("MMOD_Weapon_SMG1.GripUnfold", "weapons/smg1/smg1_gripunfold.wav")
addDefaultSound("MMOD_Weapon_SMG1.BRelease", "weapons/smg1/smg1_release.wav")
addDefaultSound("MMOD_Weapon_SMG1.GLBack", "weapons/smg1/smg1_cockback.wav")
addDefaultSound("MMOD_Weapon_SMG1.GLForward", "weapons/smg1/smg1_cockforward.wav")

addDefaultSound("MMOD_Weapon_Shotgun.Cock_Back", "weapons/shotgun/shotgun_cock_back.wav")
addDefaultSound("MMOD_Weapon_Shotgun.Cock_Forward", "weapons/shotgun/shotgun_cock_forward.wav")
addDefaultSound("MMOD_Weapon_Shotgun.Draw", "weapons/shotgun/shotgun_deploy.wav")

addDefaultSound("Weapon_Shotgun.Reload", {
    "weapons/shotgun/shotgun_reload1.wav",
    "weapons/shotgun/shotgun_reload2.wav",
    "weapons/shotgun/shotgun_reload3.wav",
    "weapons/shotgun/shotgun_reload4.wav",
    "weapons/shotgun/shotgun_reload5.wav",
    "weapons/shotgun/shotgun_reload6.wav"}
)

addDefaultSound("Weapon_Shotgun.Sling1", "weapons/shotgun/spas_sling1.wav")
addDefaultSound("Weapon_Shotgun.Sling2", "weapons/shotgun/spas_sling2.wav")
addDefaultSound("Weapon_Shotgun.Sling3", "weapons/shotgun/spas_sling3.wav")
addDefaultSound("Weapon_Shotgun.Sling4", "weapons/shotgun/spas_sling4.wav")

addDefaultSound("MMOD_Weapon_StunStick.Draw", "weapons/crowbar/crowbar_deploy.wav")

addDefaultSound("MMOD_Weapon_Pistol.Draw", "weapons/pistol/pistol_deploy.wav")
addDefaultSound("MMOD_Weapon_USP.ClipOn", "weapons/pistol/pistol_clipon.wav")
addDefaultSound("MMOD_Weapon_USP.ClipIn", "weapons/pistol/pistol_clipin.wav")
addDefaultSound("MMOD_Weapon_USP.ClipOut", "weapons/pistol/pistol_clipout.wav")
addDefaultSound("MMOD_Weapon_USP.SlidePull", "weapons/pistol/pistol_slidepull.wav")
addDefaultSound("MMOD_Weapon_USP.SlideRelease", "weapons/pistol/pistol_sliderelease.wav")

addDefaultSound("MMOD_Weapon_Bugbait.Draw", "weapons/bugbait/bugbait_deploy.wav")
addDefaultSound("MMOD_Weapon_Bugbait.Throw", "weapons/bugbait/bugbait_throw1.wav")

addDefaultSound("MMOD_Weapon_Crowbar.Draw", "weapons/crowbar/crowbar_deploy.wav")

addDefaultSound("MMOD_Weapon_Physcannon.Draw", "weapons/physcanon/gravgun_deploy_wo_soundeffect.wav")


-- Create the ConVar to enable/disable sounds
CreateConVar("mmod_genericsfx", "1", FCVAR_ARCHIVE, "Enable or disable MMOD generic sound effects (1 = enable, 0 = disable)")

-- Function to register sounds
local function RegisterGenericSFX()
    if GetConVar("mmod_genericsfx"):GetBool() then
        addDefaultSound("MMOD_Weapon_Generic.Movement1", "weapons/movement/Weapon_Movement1.wav", 1, SNDLVL_NONE, CHAN_AUTO, 100, 100, true)
        addDefaultSound("MMOD_Weapon_Generic.Movement2", "weapons/movement/Weapon_Movement2.wav", 1, SNDLVL_NONE, CHAN_AUTO, 100, 100, true)
        addDefaultSound("MMOD_Weapon_Generic.Movement3", "weapons/movement/Weapon_Movement3.wav", 1, SNDLVL_NONE, CHAN_AUTO, 100, 100, true)
        addDefaultSound("MMOD_Weapon_Generic.Movement4", "weapons/movement/Weapon_Movement4.wav", 1, SNDLVL_NONE, CHAN_AUTO, 100, 100, true)
        addDefaultSound("MMOD_Weapon_Generic.Movement5", "weapons/movement/Weapon_Movement5.wav", 1, SNDLVL_NONE, CHAN_AUTO, 100, 100, true)
        addDefaultSound("MMOD_Weapon_Generic.Movement6", "weapons/movement/Weapon_Movement6.wav", 1, SNDLVL_NONE, CHAN_AUTO, 100, 100, true)

        addFireSound("MMOD_Weapon_Generic.Sprint1", {
            "weapons/movement/Weapon_Movement_Sprint1.wav",
            "weapons/movement/Weapon_Movement_Sprint2.wav",
            "weapons/movement/Weapon_Movement_Sprint3.wav",
            "weapons/movement/Weapon_Movement_Sprint4.wav",
            "weapons/movement/Weapon_Movement_Sprint5.wav",
            "weapons/movement/Weapon_Movement_Sprint6.wav",
            "weapons/movement/Weapon_Movement_Sprint7.wav",
            "weapons/movement/Weapon_Movement_Sprint8.wav",
            "weapons/movement/Weapon_Movement_Sprint9.wav"
        }, 0.3, 60, CHAN_AUTO, 100, 100, true)

        addFireSound("MMOD_Weapon_Generic.Sprint2", {
            "weapons/movement/Weapon_Movement_Sprint9.wav",
            "weapons/movement/Weapon_Movement_Sprint8.wav",
            "weapons/movement/Weapon_Movement_Sprint7.wav",
            "weapons/movement/Weapon_Movement_Sprint6.wav",
            "weapons/movement/Weapon_Movement_Sprint5.wav",
            "weapons/movement/Weapon_Movement_Sprint4.wav",
            "weapons/movement/Weapon_Movement_Sprint3.wav",
            "weapons/movement/Weapon_Movement_Sprint2.wav",
            "weapons/movement/Weapon_Movement_Sprint1.wav"
        }, 0.3, 60, CHAN_AUTO, 100, 100, true)

        addFireSound("MMOD_Weapon_Generic.Walk1", {
            "weapons/movement/Weapon_Movement_Walk1.wav",
            "weapons/movement/Weapon_Movement_Walk2.wav",
            "weapons/movement/Weapon_Movement_Walk3.wav",
            "weapons/movement/Weapon_Movement_Walk4.wav",
            "weapons/movement/Weapon_Movement_Walk5.wav",
            "weapons/movement/Weapon_Movement_Walk6.wav",
            "weapons/movement/Weapon_Movement_Walk7.wav",
            "weapons/movement/Weapon_Movement_Walk8.wav",
            "weapons/movement/Weapon_Movement_Walk9.wav"
        }, 0.2, 60, CHAN_AUTO, 100, 100, true)

        addFireSound("MMOD_Weapon_Generic.Walk2", {
            "weapons/movement/Weapon_Movement_Walk9.wav",
            "weapons/movement/Weapon_Movement_Walk8.wav",
            "weapons/movement/Weapon_Movement_Walk7.wav",
            "weapons/movement/Weapon_Movement_Walk6.wav",
            "weapons/movement/Weapon_Movement_Walk5.wav",
            "weapons/movement/Weapon_Movement_Walk4.wav",
            "weapons/movement/Weapon_Movement_Walk3.wav",
            "weapons/movement/Weapon_Movement_Walk2.wav",
            "weapons/movement/Weapon_Movement_Walk1.wav"
        }, 0.2, 60, CHAN_AUTO, 100, 100, true)
    else
        print("MMOD Generic SFX is disabled. Sounds will not be registered.")
    end
end

-- Hook to initialize or reinitialize sounds
hook.Add("Initialize", "MMOD_RegisterGenericSFX", RegisterGenericSFX)
hook.Add("OnReloaded", "MMOD_RegisterGenericSFX_Reload", RegisterGenericSFX)

-- ConVar change listener to notify users
cvars.AddChangeCallback("mmod_genericsfx", function(convar_name, old_value, new_value)
    print("MMOD Generic SFX ConVar changed from " .. old_value .. " to " .. new_value .. ". Restart the game or reload the script for changes to take effect.")
end)
