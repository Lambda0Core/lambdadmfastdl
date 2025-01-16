DeriveGamemode( "sandbox" )

GM.Name = "Deathmatch Unlimited"
GM.Author = ".kkrill"
GM.Email = "N/A"
GM.Website = "N/A"

DMU = {}
DMU.Version = 1404
print("[DMU] DMU Version is v" .. DMU.Version)

-- Convert old playlist files
if SERVER and cookie.GetNumber( "DMU_LastVersion", 0 ) < 1200 then
    local replace_table = {
        tdm = "Team Deathmatch",
        ffa = "FFA Deathmatch",
        gun_game = "Gun Game",
        hot_rockets = "Hot Rockets",
        kill_confirmed = "Kill Confirmed",
        king_of_the_hill = "King Of The Hill",
        laser_tag = "Laser Tag",
        one_in_the_chamber = "One In The Chamber",
        shotty_snipers = "Shotty Snipers",
        zombie_vip = "Zombie VIP",
    }

    timer.Simple(0, function()
        for i = 1, #DMU.PlayLists do
            for j = 1, #DMU.PlayLists[i].modes do
                DMU.PlayLists[i].modes[j] = replace_table[string.lower(DMU.PlayLists[i].modes[j])] or DMU.PlayLists[i].modes[j]
            end
        end

        print("[DMU] Playlists have been updated!")
        DMU.SavePlayLists()
    end)
end

cookie.Set( "DMU_LastVersion", DMU.Version )

gameevent.Listen( "player_activate" )

function GM:Initialize()

end

function GM:ShouldCollide(ent1, ent2)
    if not (ent1:IsPlayer() and ent2:IsPlayer()) then return end
    return ent1:Team() ~= ent2:Team()
end

local function check_allow_feature()
    if GetConVar("dmu_server_sandbox") and GetConVar("dmu_server_sandbox"):GetBool() then
        return true
    else
        return false
    end
end

function GM:ScalePlayerDamage( ply, hitgroup, dmginfo )

    -- More damage if we're shot in the head
    if ( hitgroup == HITGROUP_HEAD ) then

        dmginfo:ScaleDamage( 2 )

    end

    -- Less damage if we're shot in the arms or legs
    if ( hitgroup == HITGROUP_LEFTARM ||
         hitgroup == HITGROUP_RIGHTARM ||
         hitgroup == HITGROUP_LEFTLEG ||
         hitgroup == HITGROUP_RIGHTLEG ||
         hitgroup == HITGROUP_GEAR ) then

        dmginfo:ScaleDamage( 0.55 )

    end

end

hook.Add("SpawnMenuOpen", "dmu_SpawnMenu", check_allow_feature)

local context_menu_disabled = CreateConVar( "dmu_server_disable_context_menu", "0", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Prevents players from opening the context menu. Note that even with context menu enabled players won't be able to use properties without sandbox mode enabled.")

function GM:ContextMenuOpen() return !context_menu_disabled:GetBool() or check_allow_feature() end

function GM:CanProperty() return check_allow_feature() end

function GM:PlayerDeathSound() return true end

function GM:PlayerNoClip(ply) return check_allow_feature() end

function GM:PlayerSpawnVehicle(ply,model,name,table) return check_allow_feature() end

function GM:PlayerSpawnSWEP(ply,weapon,info) return check_allow_feature() end

function GM:PlayerSpawnSENT(ply,class) return check_allow_feature() end

function GM:PlayerSpawnRagdoll(ply,model) return check_allow_feature() end

function GM:PlayerSpawnProp(ply,model) return check_allow_feature() end

function GM:PlayerSpawnObject(ply,model,skin) return check_allow_feature() end

function GM:PlayerSpawnNPC(ply,npc_type,weapon) return check_allow_feature() end

function GM:PlayerSpawnEffect(ply,model) return check_allow_feature() end

function GM:PlayerGiveSWEP(ply,weapon,swep) return check_allow_feature() end

CreateConVar( "dmu_server_weapons_starter", "weapon_pistol,weapon_crowbar,weapon_smg1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Default starter weapons, separated by commas. Can be overriden by game mode.")
CreateConVar( "dmu_server_weapons_common", "weapon_alyx-gun,weapon_mp-5,weapon_hl1_satchel", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Default common weapons, separated by commas. Can be overriden by game mode.")
CreateConVar( "dmu_server_weapons_uncommon", "weapon_hl1_shotgun,weapon_357,weapon_original_new", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Default uncommon weapons, separated by commas. Can be overriden by game mode.")
CreateConVar( "dmu_server_weapons_rare", "weapon_ar2,weapon_crossbow,weapon_oicw,weapon_hl1_snark", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Rare weapons, separated by commas. Can be overriden by game mode.")
CreateConVar( "dmu_server_weapons_very_rare", "weapon_psp,weapon_magicstick,weapon_sword,weapon_hl1_gauss", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Very rare weapons, separated by commas. Can be overriden by game mode.")

CreateConVar( "dmu_server_weapon_respawn_time", "30", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Default weapons respawn time.")
CreateConVar( "dmu_server_pickup_respawn_time", "15", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Default health/armor pick-ups respawn time.")

DMU.DefaultScoreLimit = CreateConVar( "dmu_server_score_limit", "60", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Default score limit. Can be overriden by game mode."):GetInt()