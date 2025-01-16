// Created by Crowbar 0.74

$modelname "weapons/c_Pistol.mdl"

$bodygroup "studio"
{
	studio "Pistol_reference.smd"
}
$bodygroup "studio"
{
	blank
	blank
	blank
	blank
	blank
	blank
	blank
	studio "c_arms_chell.smd"
}



$surfaceprop "default"

$contents "solid"

$illumposition -2.839 -11.992 -10.449

$cdmaterials "models\chell\"
$cdmaterials "models\Weapons\V_Pistol\"
$cdmaterials "models\weapons\ld_pistol\"

$attachment "muzzle" "slide" 0 0 9 rotate -90 0 0
$attachment "1" "slide" 0 0 1 rotate 0 90 -180

$cbox 0 0 0 0 0 0

$bbox -7.066 -11.379 -68 33.009 12.783 -3.562

$definebone "base" "" -5.7 -24.203568 57.08226 0 0 89.999982 0 0 0 0 0 0
$definebone "trigger" "base" 0.003392 1.227001 1.576895 0 0 0 0 0 0 0 0 0
$definebone "mag" "base" 0 -0.798557 0.078646 0 0 0 0 0 0 0 0 0
$definebone "hammer" "base" 0 2.131973 -1.127913 0 0 0 0 0 0 0 0 0
$definebone "slide" "base" 0 2.340305 1.330421 0 0 0 0 0 0 0 0 0
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


$sequence "idle01" {
	"c_pistol_anims\idle01.smd"
	activity "ACT_VM_IDLE" 3
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "idle01empty" {
	"c_pistol_anims\idle01empty.smd"
	activity "ACT_VM_IDLE_EMPTY" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "fire" {
	"c_pistol_anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "fire1" {
	"c_pistol_anims\fire1.smd"
	activity "ACT_VM_RECOIL1" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "fire2" {
	"c_pistol_anims\fire2.smd"
	activity "ACT_VM_RECOIL2" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "fire3" {
	"c_pistol_anims\fire3.smd"
	activity "ACT_VM_RECOIL3" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "fireempty" {
	"c_pistol_anims\fireempty.smd"
	activity "ACT_VM_DRYFIRE" 1
	fadein 0.2
	fadeout 0.2
	node "2"
	fps 30
}

$sequence "draw" {
	"c_pistol_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	{ event 5004 0 "MMOD_Weapon_Pistol.Draw" }
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "drawempty" {
	"c_pistol_anims\drawempty.smd"
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "reload" {
	"c_pistol_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 1 "MMOD_Weapon_USP.SlidePull" }
	{ event 5004 8 "MMOD_Weapon_USP.ClipOut" }
	{ event 5004 17 "MMOD_Weapon_USP.ClipIn" }
	{ event 5004 26 "MMOD_Weapon_USP.ClipOn" }
	{ event 5004 31 "MMOD_Weapon_USP.SlideRelease" }
	{ event 5004 1 "MMOD_Weapon_Generic.Movement5" }
	{ event 5004 11 "MMOD_Weapon_Generic.Movement2" }
	{ event 5004 34 "MMOD_Weapon_Generic.Movement4" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "holster" {
	"c_pistol_anims\holster.smd"
	activity "ACT_VM_HOLSTER" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "holsterempty" {
	"c_pistol_anims\holsterempty.smd"
	activity "ACT_VM_HOLSTER" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "idletolow" {
	"c_pistol_anims\idletolow.smd"
	activity "ACT_VM_LOWERED_TO_IDLE" 1
	fadein 0.2
	fadeout 0.2
	transition "0" "1"
	fps 30
}

$sequence "lowtoidle" {
	"c_pistol_anims\lowtoidle.smd"
	activity "ACT_VM_IDLE_TO_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	transition "1" "0"
	fps 30
}

$sequence "lowidle" {
	"c_pistol_anims\lowidle.smd"
	activity "ACT_VM_IDLE_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	node "1"
	fps 30
	loop
}

$sequence "sprint" {
	"c_pistol_anims\sprint.smd"
	activity "ACT_VM_SPRINT" 1
	{ event 5004 1 "MMOD_Weapon_Generic.Sprint1" }
	{ event 5004 10 "MMOD_Weapon_Generic.Sprint2" }
	fadein 0.35
	fadeout 0.35
	node "Ready"
	fps 30
	loop
}

$sequence "shoot_is" {
	"c_pistol_anims\shoot_is.smd"
	activity "ACT_VM_PRIMARYATTACK_IRONSIGHTED" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "shoot1_is" {
	"c_pistol_anims\shoot1_is.smd"
	activity "ACT_VM_PRIMARYATTACK_IRONSIGHTED1" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "shoot2_is" {
	"c_pistol_anims\shoot2_is.smd"
	activity "ACT_VM_PRIMARYATTACK_IRONSIGHTED2" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "shoot3_is" {
	"c_pistol_anims\shoot3_is.smd"
	activity "ACT_VM_PRIMARYATTACK_IRONSIGHTED3" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "shoot_dryfire" {
	"c_pistol_anims\shoot_dryfire.smd"
	activity "ACT_VM_DRYFIRE" 1
	fadein 0
	fadeout 0.2
	node "2"
	fps 30
}

$sequence "shoot_last" {
	"c_pistol_anims\shoot_last.smd"
	activity "ACT_VM_SHOOTLAST" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "idle_is" {
	"c_pistol_anims\idle_is.smd"
	activity "ACT_VM_IDLE_SILENCED" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "Walk" {
	"c_pistol_anims\Walk.smd"
	activity "ACT_VM_WALK" 1
	{ event 5004 1 "MMOD_Weapon_Generic.Walk1" }
	{ event 5004 13 "MMOD_Weapon_Generic.Walk2" }
	fadein 0.4
	fadeout 0.4
	node "Ready"
	fps 35
	loop
}

$sequence "idle02" {
	"c_pistol_anims\idle02.smd"
	activity "ACT_VM_IDLE" 2
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "inspect1" {
	"c_pistol_anims\inspect1.smd"
	activity "ACT_VM_INSPECT" 1
	{ event 5004 70 "MMOD_Weapon_USP.SlidePull" }
	{ event 5004 82 "MMOD_Weapon_USP.SlideRelease" }
	{ event 5004 1 "MMOD_Weapon_Generic.Movement2" }
	{ event 5004 41 "MMOD_Weapon_Generic.Movement4" }
	{ event 5004 63 "MMOD_Weapon_Generic.Movement1" }
	{ event 5004 95 "MMOD_Weapon_Generic.Movement3" }
	fadein 0.2
	fadeout 0.2
	node "Ready"
	fps 30
}

$sequence "inspect2" {
	"c_pistol_anims\inspect2.smd"
	activity "ACT_VM_INSPECT_ALT" 1
	{ event 5004 1 "MMOD_Weapon_Generic.Movement3" }
	{ event 5004 21 "MMOD_Weapon_USP.ClipOut" }
	{ event 5004 51 "MMOD_Weapon_USP.ClipIn" }
	{ event 5004 65 "MMOD_Weapon_Generic.Movement2" }
	fadein 0.2
	fadeout 0.2
	node "Ready"
	fps 30
}

$sequence "draw2" {
	"c_pistol_anims\draw2.smd"
	activity "ACT_VM_DRAW" 1
	{ event 5004 0 "MMOD_Weapon_Pistol.Draw" }
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "reload2" {
	"c_pistol_anims\reload2.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 1 "MMOD_Weapon_USP.SlidePull" }
	{ event 5004 8 "MMOD_Weapon_USP.ClipOut" }
	{ event 5004 17 "MMOD_Weapon_USP.ClipIn" }
	{ event 5004 26 "MMOD_Weapon_USP.ClipOn" }
	{ event 5004 31 "MMOD_Weapon_USP.SlideRelease" }
	{ event 5004 1 "MMOD_Weapon_Generic.Movement5" }
	{ event 5004 11 "MMOD_Weapon_Generic.Movement2" }
	{ event 5004 34 "MMOD_Weapon_Generic.Movement4" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "reload_noshot" {
	"c_pistol_anims\reload_noshot.smd"
	activity "ACT_VM_RELOAD_NOSHOT" 1
	{ event 5004 1 "MMOD_Weapon_USP.SlidePull" }
	{ event 5004 8 "MMOD_Weapon_USP.ClipOut" }
	{ event 5004 17 "MMOD_Weapon_USP.ClipIn" }
	{ event 5004 26 "MMOD_Weapon_USP.ClipOn" }
	{ event 5004 1 "MMOD_Weapon_Generic.Movement5" }
	{ event 5004 11 "MMOD_Weapon_Generic.Movement2" }
	{ event 5004 34 "MMOD_Weapon_Generic.Movement4" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "reload_noshot2" {
	"c_pistol_anims\reload_noshot2.smd"
	activity "ACT_VM_RELOAD_NOSHOT" 1
	{ event 5004 1 "MMOD_Weapon_USP.SlidePull" }
	{ event 5004 8 "MMOD_Weapon_USP.ClipOut" }
	{ event 5004 17 "MMOD_Weapon_USP.ClipIn" }
	{ event 5004 26 "MMOD_Weapon_USP.ClipOn" }
	{ event 5004 1 "MMOD_Weapon_Generic.Movement5" }
	{ event 5004 11 "MMOD_Weapon_Generic.Movement2" }
	{ event 5004 34 "MMOD_Weapon_Generic.Movement4" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "idlefidget" {
	"c_pistol_anims\idlefidget.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "reload_vmanip" {
	"c_pistol_anims\reload_vmanip.smd"
	activity "ACT_VM_RELOAD_VMANIP" 1
	{ event 5004 1 "MMOD_Weapon_USP.SlidePull" }
	{ event 5004 8 "MMOD_Weapon_USP.ClipOut" }
	{ event 5004 23 "MMOD_Weapon_USP.ClipIn" }
	{ event 5004 37 "MMOD_Weapon_USP.ClipOn" }
	{ event 5004 39 "MMOD_Weapon_USP.SlideRelease" }
	{ event 5004 1 "MMOD_Weapon_Generic.Movement5" }
	{ event 5004 11 "MMOD_Weapon_Generic.Movement2" }
	{ event 5004 34 "MMOD_Weapon_Generic.Movement4" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "reload_vmanip2" {
	"c_pistol_anims\reload_vmanip2.smd"
	activity "ACT_VM_RELOAD_VMANIP" 1
	{ event 5004 1 "MMOD_Weapon_USP.SlidePull" }
	{ event 5004 8 "MMOD_Weapon_USP.ClipOut" }
	{ event 5004 23 "MMOD_Weapon_USP.ClipIn" }
	{ event 5004 37 "MMOD_Weapon_USP.ClipOn" }
	{ event 5004 39 "MMOD_Weapon_USP.SlideRelease" }
	{ event 5004 1 "MMOD_Weapon_Generic.Movement5" }
	{ event 5004 11 "MMOD_Weapon_Generic.Movement2" }
	{ event 5004 34 "MMOD_Weapon_Generic.Movement4" }
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}
