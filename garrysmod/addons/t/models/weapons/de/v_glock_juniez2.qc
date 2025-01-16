// Created by Crowbar 0.74

$modelname "weapons/c_glock_juniez2.mdl"

$bodygroup "ld_glock"
{
	studio "v_glock_classic_reference.smd"
}
$bodygroup "arms"
{
	blank
	blank
	blank
	blank
	blank
	blank
	blank
	studio "v_glock_classic_v_hands_hev_newrig.smd"
}


$surfaceprop "default"

$contents "solid"

$illumposition -2.839 -11.992 -10.449

$cdmaterials "models\weapons\ld_pistol\"
$cdmaterials "models\Weapons\V_hand\"
$cdmaterials "models\Weapons\ld_hands\"

$attachment "muzzle" "bone.muzzle" 0.4 -0.16 0 rotate 0 0 0
$attachment "ejectbrass" "ValveBiped.eject" 0 0 -0.56 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -8.603 -19.681 -19.448 32.586 14.003 -1.449

$definebone "Bone01" "" -3.705103 -14.756879 -3.284124 -0.915873 -89.999982 89.999982 0 0 0 0 0 0
$definebone "bone_clip" "" -3.703457 -15.368413 -9.772624 -74.635034 -89.999982 89.999982 0 0 0 0 0 0
$definebone "bone_gun" "" -3.726108 -18.537968 -4.233055 -0.612721 -89.999982 89.999982 0 0 0 0 0 0
$definebone "bone.muzzle" "bone_gun" 6.761675 1.049216 -0.021005 0 0.445589 0 0 0 0 0 0 0
$definebone "ValveBiped.eject" "bone_gun" 0.961569 1.049215 0.499438 -89.999982 0.445589 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999873 -90.000098 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.93766 -73.71188 168.619298 91.480562 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028142 0.000004 0 2.738852 -33.527937 -90.505156 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692554 0 0 -0.000007 -3.459062 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481676 0 -0.000033 -6.108484 2.532071 90.136743 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859703 -0.142403 -1.191974 8.682203 -50.431562 -26.822049 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312563 -0.000004 0 -0.000003 -25.19409 0.000007 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729363 -0.000002 0 0 -13.997294 0.000007 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942326 0.046769 -0.431443 4.194393 -46.466016 -8.696354 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539093 0.000002 0 0 -14.197723 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196321 0 0 -0.000001 -24.683139 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.88369 -0.046767 0.431443 1.250765 -33.682279 4.921823 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719578 -0.000002 0 0.316044 -20.997629 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209181 -0.000004 0 0.176703 -12.39879 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859856 -0.137946 1.332466 -2.449396 -30.465178 20.308435 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719433 -0.000002 -0.000001 0.233427 -20.79887 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099672 0 0.000001 0.148743 -13.999129 -0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806046 -0.348922 1.321258 -38.916041 -45.19599 -70.054225 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789782 -0.000002 0 -0.00001 13.093403 0.00001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207003 0 0.000002 -0.000012 20.790348 0.000005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.71205 168.618792 -95.596516 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028142 0.000004 0 -0.46209 -33.623806 93.935243 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692553 0 -0.000002 -0.000024 -3.459059 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481697 0 0 6.108052 2.532074 -89.664285 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132566 1.193108 -9.056515 -50.352978 26.713356 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312561 0.000004 0.000001 0.000004 -25.191339 0.000015 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729369 0.000002 -0.000001 0.000007 -13.995685 0.000015 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942295 0.050322 0.431043 -4.53731 -46.421329 8.598838 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539101 -0.000004 0 0.000001 -14.196219 0.00001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196322 0 0 0.000006 -24.680767 0.000007 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883659 -0.050331 -0.431043 -1.51284 -33.672457 -4.921993 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719584 0 0 -0.456877 -20.99524 -0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209188 -0.000002 0 -0.255599 -12.397424 -0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859829 -0.148944 -1.331282 2.209726 -30.481427 -20.306714 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719427 -0.000002 0.000001 -0.3789 -20.796657 -0.000014 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099663 -0.000004 0 -0.241279 -13.998051 -0.000015 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806021 -0.359836 -1.318334 38.596443 -45.467528 69.98164 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789783 0.000002 -0.000002 -0.000009 13.09524 0.000015 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.206999 0 0 -0.000015 20.792923 0.000009 0 0 0 0 0 0




$sectionframes 30 120

$sequence "idle1" {
	"v_glock_juniez2_anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "idle2" {
	"v_glock_juniez2_anims\idle2.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "idle_fidget" {
	"v_glock_juniez2_anims\idle_fidget.smd"
	activity "ACT_VM_FIDGET" 1
	{ event AE_CL_PLAYSOUND 12 "weapon_glock.Eject" }
	{ event AE_CL_PLAYSOUND 67 "weapon_glock.Insert" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "fire1" {
	"v_glock_juniez2_anims\fire1.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 35
}

$sequence "fire2" {
	"v_glock_juniez2_anims\fire2.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 35
}

$sequence "recoil1" {
	"v_glock_juniez2_anims\recoil1.smd"
	activity "ACT_VM_RECOIL1" 1
	{ event 5001 0 "1" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 35
}

$sequence "recoil3" {
	"v_glock_juniez2_anims\recoil3.smd"
	activity "ACT_VM_RECOIL3" 3
	{ event 5001 0 "1" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 35
}

$sequence "recoil2" {
	"v_glock_juniez2_anims\recoil2.smd"
	activity "ACT_VM_RECOIL2" 2
	{ event 5001 0 "1" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 35
}

$sequence "fire_empty" {
	"v_glock_juniez2_anims\fire_empty.smd"
	activity "ACT_GLOCK_SHOOTEMPTY" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "gun_reload" {
	"v_glock_juniez2_anims\gun_reload.smd"
	activity "ACT_GLOCK_SHOOT_RELOAD" 1
	{ event AE_CL_PLAYSOUND 10 "weapon_glock.Eject" }
	{ event AE_CL_PLAYSOUND 43 "weapon_glock.Insert" }
	{ event 3110 47 "" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "gun_reload_empty" {
	"v_glock_juniez2_anims\gun_reload_empty.smd"
	activity "ACT_VM_RELOAD" 1
	{ event AE_CL_PLAYSOUND 0 "weapon_glock.SlideOpen" }
	{ event AE_CL_PLAYSOUND 10 "weapon_glock.Eject" }
	{ event AE_CL_PLAYSOUND 43 "weapon_glock.Insert" }
	{ event AE_CL_PLAYSOUND 51 "weapon_glock.SlideClose" }
	{ event 3110 47 "" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "draw1" {
	"v_glock_juniez2_anims\draw1.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "holster" {
	"v_glock_juniez2_anims\holster.smd"
	activity "ACT_VM_HOLSTER" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "idletolow" {
	"v_glock_juniez2_anims\idletolow.smd"
	activity "ACT_VM_LOWERED_TO_IDLE" 1
	fadein 0.2
	fadeout 0.2
	transition "0" "1"
	fps 30
}

$sequence "lowtoidle" {
	"v_glock_juniez2_anims\lowtoidle.smd"
	activity "ACT_VM_IDLE_TO_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	transition "1" "0"
	fps 30
}

$sequence "lowidle1" {
	"v_glock_juniez2_anims\lowidle1.smd"
	activity "ACT_VM_IDLE_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	node "1"
	fps 30
	loop
}

$sequence "idletosprint" {
	"v_glock_juniez2_anims\idletosprint.smd"
	activity "ACT_VM_SPRINT_ENTER" 1
	fadein 0.2
	fadeout 0.2
	transition "0" "1"
	fps 30
}

$sequence "sprinttoidle" {
	"v_glock_juniez2_anims\sprinttoidle.smd"
	activity "ACT_VM_SPRINT_LEAVE" 1
	fadein 0.2
	fadeout 0.2
	transition "1" "0"
	fps 30
}

$sequence "sprintidle1" {
	"v_glock_juniez2_anims\sprintidle1.smd"
	activity "ACT_VM_SPRINT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	node "1"
	fps 30
	loop
}

$sequence "draw_admire" {
	"v_glock_juniez2_anims\draw_admire.smd"
	activity "ACT_VM_PICKUP" 1
	{ event AE_CL_PLAYSOUND 7 "weapon_glock.Draw" }
	{ event AE_CL_PLAYSOUND 46 "weapon_glock.SlideOpenLong" }
	{ event AE_CL_PLAYSOUND 70 "weapon_glock.SlideClose" }
	fadein 0.2
	fadeout 0.2
	fps 30
}
