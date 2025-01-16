list.Set( "PlayerOptionsModel", "HEV Mk IV Freeman", "models/moody/avila/HEVAvila_HLA_pm.mdl" )
player_manager.AddValidModel( "HEV Mk IV Freeman", "models/moody/avila/HEVAvila_HLA_pm.mdl" )
player_manager.AddValidHands( "HEV Mk IV Freeman", "models/moody/avila/HEVAvila_c_arms.mdl", 0, "00000000" )

local NPC =
{
	Name = "HEV Mk IV / Gordon Freeman",
	Class = "npc_citizen",
	KeyValues = { citizentype = 4 },
	Model = "models/moody/avila/HEVAvila_HLA_npc.mdl",
	Category = "Borealis: Last Man Standing"
}

list.Set( "NPC", "npc_HEVAvilafreeman", NPC )

