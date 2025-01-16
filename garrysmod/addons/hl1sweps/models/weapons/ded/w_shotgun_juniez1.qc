// Created by Crowbar 0.74

$modelname "weapons/w_shotgun_juniez1.mdl"

$bodygroup "Body"
{
	studio "w_jshotgun_reference.smd"
}


$surfaceprop "weapon"

$contents "solid"

$illumposition 0.977 -13.468 0.917

$cdmaterials "models\weapons\ld_shotgun\"

$attachment "muzzle" "ValveBiped.Bip01_R_Hand" 27.5 -4.5 -4.7 rotate 0 0 0
$attachment "ejectbrass" "ValveBiped.Bip01_R_Hand" 11.5 -1.75 -4.4 rotate 90 0 0

$cbox 0 0 0 0 0 0

$bbox -1.195 -1.296 -3.472 28.381 3.243 5.327

$hboxset "default"

$definebone "ValveBiped.Bip01_R_Hand" "" 0.306459 1.19594 -1.01338 3.102802 -96.141743 -164.587861 0 0 0 0 0 0

$bonemerge "ValveBiped.Bip01_R_Hand"


$sequence "idle1" {
	"w_shotgun_juniez1_anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "fire" {
	"w_shotgun_juniez1_anims\fire.smd"
	activity "ACT_RANGE_ATTACK_SHOTGUN" 1
	{ event AE_NPC_MUZZLEFLASH 0 "SHOTGUN MUZZLE" }
	{ event 6001 0 "2" }
	{ event AE_NPC_WEAPON_FIRE 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "fire2" {
	"w_shotgun_juniez1_anims\fire2.smd"
	activity "ACT_RANGE_ATTACK2" 1
	{ event AE_NPC_MUZZLEFLASH 0 "SHOTGUN MUZZLE" }
	{ event 6001 0 "2" }
	{ event AE_NPC_WEAPON_FIRE 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_shotgun_juniez1_physics.smd"
{
	$mass 5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}

$keyvalues
{
	prop_data 
	{
		"base" "metal.small"
	}
}
