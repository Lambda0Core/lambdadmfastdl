// Created by Crowbar 0.74

$modelname "weapons/c_shotgun_classic.mdl"

$bodygroup "studio"
{
	studio "Shotgun_reference_fix.smd"
}
$bodygroup "hands"
{
	blank
	blank
	blank
	blank
	blank
	blank
	studio "c_arms_hev.smd"
}


$surfaceprop "default"

$contents "solid"

$illumposition -6.894 -23.083 -12.083

$cdmaterials "models\Weapons\V_hand\"
$cdmaterials "models\Weapons\V_shotgun\"
$cdmaterials "models\weapons\shell\"
$cdmaterials "models\weapons\ld_shotgun\"

$attachment "muzzle" "ValveBiped.Gun" -0.03 0.51 23.45 rotate -90 0 0
$attachment "1" "ValveBiped.Gun" -0.95 1.14 -11.59 rotate 0 180 -180

$cbox 0 0 0 0 0 0

$bbox 5.199 -12.665 -29.433 51.883 2.828 -3.721

$definebone "ValveBiped.Bip01" "" -5.947269 -23.90802 38.566917 0 0 89.999982 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine" "ValveBiped.Bip01" 0.000005 3.345127 -2.981894 4.94394 89.999463 89.999982 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine1" "ValveBiped.Bip01_Spine" 4.018326 -0.000011 -0.000036 0.000115 -1.675443 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine2" "ValveBiped.Bip01_Spine1" 3.518559 -0.000013 -0.000023 -0.002521 5.748429 0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Gun" "ValveBiped.Bip01_Spine2" 11.945869 24.169973 -4.015508 -89.997059 -89.131373 0 0 0 0 0 0 0
$definebone "ValveBiped.Pump" "ValveBiped.Gun" -0.004457 -0.545135 -2.136547 0 -0.000057 0 0 0 0 0 0 0
$definebone "ValveBiped.square" "ValveBiped.Gun" 0.009656 -6.406681 -21.608521 0 -0.000057 0 0 0 0 0 0 0
$definebone "ValveBiped.Latch" "ValveBiped.Gun" -0.004448 -1.902596 -13.215969 -0.000057 -0.000057 -0.000229 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999811 -90.000153 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033349 1.000767 1.937662 -73.711914 168.61923 91.480712 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028146 0.000002 0 2.738682 -33.528009 -90.505156 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692554 0.000025 0.000009 0.000002 -3.459004 -0.00023 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.48168 0.000019 -0.000019 -6.108311 2.532188 90.136866 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859707 -0.142389 -1.191974 8.682493 -50.431112 -26.821875 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312561 -0.000011 0.000001 -0.000227 -25.194328 0.000055 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729362 0 0.000002 0.000174 -13.997026 -0.00012 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942329 0.046783 -0.431442 4.194111 -46.466016 -8.696352 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539093 0.00001 -0.000006 0.000346 -14.197323 -0.000061 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196323 -0.000004 0.000002 -0.000402 -24.683588 -0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883694 -0.046754 0.431444 1.250998 -33.68179 4.921822 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719572 -0.000008 0.000008 0.315931 -20.997755 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209183 0 0.000003 0.177104 -12.398404 -0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859859 -0.137936 1.332467 -2.449509 -30.465133 20.308495 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719429 0.000002 -0.000007 0.233711 -20.798665 -0.000227 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099674 -0.000004 0.000004 0.148687 -13.99921 0.000295 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806049 -0.348925 1.321258 -38.916273 -45.195659 -70.054641 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789783 0.000006 -0.000006 -0.000004 13.093399 -0.00006 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.206999 0.000004 0.000002 -0.000061 20.79052 0.000113 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.937612 73.711975 168.618779 -95.596441 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028148 0.00001 0.000003 -0.462146 -33.623761 93.935243 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692556 0.000001 -0.000006 -0.00002 -3.459405 -0.00023 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481705 0.000076 -0.00001 6.108453 2.532416 -89.664114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.13259 1.193111 -9.056677 -50.353261 26.713182 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312567 -0.000002 -0.000002 0.00012 -25.191455 0.000232 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729368 -0.000002 -0.000001 0.000178 -13.995899 -0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942303 0.050297 0.431046 -4.537306 -46.421572 8.59878 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539099 -0.000008 0.000001 -0.00017 -14.196184 0.000059 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196323 -0.000004 -0.000003 0.000061 -24.680948 -0.000171 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883663 -0.050357 -0.43104 -1.512664 -33.673099 -4.921992 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719584 0.000006 0.000007 -0.456815 -20.99525 0.000058 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209188 0 0.000005 -0.255993 -12.397029 0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859833 -0.148969 -1.33128 2.209897 -30.482294 -20.306882 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719429 0.00001 0.000009 -0.378826 -20.796499 0.000125 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099669 0 0.000007 -0.241316 -13.998057 0.000231 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806019 -0.359842 -1.318333 38.596135 -45.467941 69.981353 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.78978 -0.000004 -0.000004 -0.000082 13.095026 -0.000104 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207003 0.000004 -0.000002 -0.00014 20.793215 0.000174 0 0 0 0 0 0


$sectionframes 30 120

$sequence "idle01" {
	"c_shotgun_classic_anims\idle01.smd"
	activity "ACT_VM_IDLE" 3
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "fire01" {
	"c_shotgun_classic_anims\fire01.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "SHOTGUN MUZZLE" }
	{ event 5004 12 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 18 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "altfire" {
	"c_shotgun_classic_anims\altfire.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "SHOTGUN MUZZLE" }
	{ event 5004 16 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 21 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "draw" {
	"c_shotgun_classic_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	{ event 5004 1 "MMOD_Weapon_Shotgun.Draw" }
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "holster" {
	"c_shotgun_classic_anims\holster.smd"
	activity "ACT_VM_HOLSTER" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "reload1" {
	"c_shotgun_classic_anims\reload1.smd"
	activity "ACT_SHOTGUN_RELOAD_START" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "reload2" {
	"c_shotgun_classic_anims\reload2.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "reload3" {
	"c_shotgun_classic_anims\reload3.smd"
	activity "ACT_SHOTGUN_RELOAD_FINISH" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "pump" {
	"c_shotgun_classic_anims\pump.smd"
	activity "ACT_SHOTGUN_PUMP" 1
	{ event 6001 5 "2" }
	{ event 5004 3 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 9 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "dryfire" {
	"c_shotgun_classic_anims\dryfire.smd"
	activity "ACT_VM_DRYFIRE" 1
	fadein 0.2
	fadeout 0.2
	node "2"
	fps 30
}

$sequence "lowered" {
	"c_shotgun_classic_anims\lowered.smd"
	activity "ACT_VM_IDLE_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	node "1"
	fps 30
	loop
}

$sequence "lowered_to_idle" {
	"c_shotgun_classic_anims\lowered_to_idle.smd"
	activity "ACT_VM_LOWERED_TO_IDLE" 1
	fadein 0.2
	fadeout 0.2
	transition "1" "0"
	fps 30
}

$sequence "idle_to_lowered" {
	"c_shotgun_classic_anims\idle_to_lowered.smd"
	activity "ACT_VM_IDLE_TO_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	transition "0" "1"
	fps 30
}

$sequence "Sprint" {
	"c_shotgun_classic_anims\Sprint.smd"
	activity "ACT_VM_SPRINT" 1
	{ event 5004 1 "MMOD_Weapon_Generic.Sprint1" }
	{ event 5004 10 "MMOD_Weapon_Generic.Sprint2" }
	fadein 0.3
	fadeout 0.3
	node "Ready"
	fps 30
	loop
}

$sequence "fire" {
	"c_shotgun_classic_anims\fire.smd"
	activity "ACT_RANGE_ATTACK_SHOTGUN" 1
	{ event AE_MUZZLEFLASH 0 "SHOTGUN MUZZLE" }
	{ event 6001 0 "3" }
	{ event 3004 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 5
}

$sequence "pump2_sighted" {
	"c_shotgun_classic_anims\pump2_sighted.smd"
	activity "ACT_SMG2_DRYFIRE2" 1
	{ event 6001 5 "2" }
	{ event 5004 3 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 9 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "fire_ironsights" {
	"c_shotgun_classic_anims\fire_ironsights.smd"
	activity "ACT_VM_PRIMARYATTACK_IRONSIGHTED1" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	fadein 0
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "Walk" {
	"c_shotgun_classic_anims\Walk.smd"
	activity "ACT_VM_WALK" 1
	{ event AE_CL_PLAYSOUND 1 "MMOD_Weapon_Generic.Walk1" }
	{ event AE_CL_PLAYSOUND 13 "MMOD_Weapon_Generic.Walk2" }
	fadein 0.4
	fadeout 0.4
	node "Ready"
	fps 35
	loop
}

$sequence "inspect1" {
	"c_shotgun_classic_anims\inspect1.smd"
	activity "ACT_VM_INSPECT" 1
	{ event 5004 1 "MMOD_Weapon_Generic.Movement1" }
	{ event 5004 32 "MMOD_Weapon_Generic.Movement2" }
	{ event 5004 43 "Weapon_Shotgun.Sling1" }
	{ event 5004 52 "Weapon_Shotgun.Sling2" }
	{ event 5004 60 "Weapon_Shotgun.Sling3" }
	{ event 5004 77 "Weapon_Shotgun.Sling4" }
	{ event 5004 86 "MMOD_Weapon_Generic.Movement5" }
	fadein 0.6
	fadeout 0.6
	fps 30
}

$sequence "inspect2" {
	"c_shotgun_classic_anims\inspect2.smd"
	activity "ACT_VM_INSPECT_ALT" 1
	{ event 5004 68 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 97 "MMOD_Weapon_Shotgun.Cock_Forward" }
	{ event 5004 1 "MMOD_Weapon_Generic.Movement1" }
	{ event 5004 56 "MMOD_Weapon_Generic.Movement5" }
	fadein 0.6
	fadeout 0.6
	fps 30
}

$sequence "reload1_empty" {
	"c_shotgun_classic_anims\reload1.smd"
	activity "ACT_SHOTGUN_RELOAD_START" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30

}

$sequence "idle02" {
	"c_shotgun_classic_anims\idle02.smd"
	activity "ACT_VM_IDLE" 2
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "idlefidget" {
	"c_shotgun_classic_anims\idlefidget.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "idle_sighted" {
	"c_shotgun_classic_anims\idle_sighted.smd"
	activity "ACT_VM_IDLE_SILENCED" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 10
}

$sequence "fire02" {
	"c_shotgun_classic_anims\fire02.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "SHOTGUN MUZZLE" }
	{ event 5004 11 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 17 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "fire03" {
	"c_shotgun_classic_anims\fire03.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "SHOTGUN MUZZLE" }
	{ event 5004 11 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 17 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "altfire2" {
	"c_shotgun_classic_anims\altfire2.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "SHOTGUN MUZZLE" }
	{ event 5004 16 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 21 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "draw2" {
	"c_shotgun_classic_anims\draw2.smd"
	activity "ACT_VM_DRAW" 2
	{ event 5004 1 "MMOD_Weapon_Shotgun.Draw" }
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "reload2_1" {
	"c_shotgun_classic_anims\reload2_1.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "reload2_2" {
	"c_shotgun_classic_anims\reload2_2.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "reload2_3" {
	"c_shotgun_classic_anims\reload2_3.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "pump2" {
	"c_shotgun_classic_anims\pump2.smd"
	activity "ACT_SHOTGUN_PUMP" 1
	{ event 6001 5 "2" }
	{ event 5004 3 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 9 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "pump3" {
	"c_shotgun_classic_anims\pump3.smd"
	activity "ACT_SHOTGUN_PUMP" 1
	{ event 6001 5 "2" }
	{ event 5004 3 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 9 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "pump4" {
	"c_shotgun_classic_anims\pump4.smd"
	activity "ACT_SHOTGUN_PUMP" 1
	{ event 6001 5 "2" }
	{ event 5004 3 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 9 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "pump_vmanip" {
	"c_shotgun_classic_anims\pump_vmanip.smd"
	activity "ACT_SHOTGUN_PUMP_VMANIP" 1
	{ event 6001 18 "2" }
	{ event 5004 14 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 24 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "pump_vmanip2" {
	"c_shotgun_classic_anims\pump_vmanip2.smd"
	activity "ACT_SHOTGUN_PUMP_VMANIP" 1
	{ event 6001 18 "2" }
	{ event 5004 14 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 24 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "pump_vmanip3" {
	"c_shotgun_classic_anims\pump_vmanip3.smd"
	activity "ACT_SHOTGUN_PUMP_VMANIP" 1
	{ event 6001 18 "2" }
	{ event 5004 14 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 24 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "pump_vmanip4" {
	"c_shotgun_classic_anims\pump_vmanip4.smd"
	activity "ACT_SHOTGUN_PUMP_VMANIP" 1
	{ event 6001 18 "2" }
	{ event 5004 14 "MMOD_Weapon_Shotgun.Cock_Back" }
	{ event 5004 24 "MMOD_Weapon_Shotgun.Cock_Forward" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}
