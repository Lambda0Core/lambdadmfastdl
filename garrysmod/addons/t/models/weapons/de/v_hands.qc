// Created by Crowbar 0.74

$modelname "../v_hands.mdl"

$bodygroup "arms"
{
	studio "v_hands_hev_newrig_small.smd"
}


$surfaceprop "default"

$contents "solid"

$illumposition -0.598 -16.411 -12.412

$cdmaterials "models\Weapons\V_hand\"
$cdmaterials "models\Weapons\ld_hands\"

$cbox 0 0 0 0 0 0

$bbox -0.447 -29.338 -28.834 33.269 28.142 4.01

$definebone "R_Arm" "" -9.477791 12.824127 0 0 -89.999982 0 0 0 0 0 0 0
$definebone "R_Forearm" "R_Arm" 12.337498 0.000006 0 0 0.013636 0 0 0 0 0 0 0
$definebone "R_Wrist" "R_Forearm" 15.3625 0.000003 -0.000001 -1.492956 1.145858 1.21639 0 0 0 0 0 0
$definebone "R_Thumb1" "R_Wrist" 1.780293 1.121474 -0.825805 19.305584 49.28657 -17.849011 0 0 0 0 0 0
$definebone "R_Thumb2" "R_Thumb1" 2.606444 -0.000296 0.000196 0.000002 -0.000003 0 0 0 0 0 0 0
$definebone "R_Thumb3" "R_Thumb2" 1.439153 -0.000359 0.00068 0.000002 -0.000003 0 0 0 0 0 0 0
$definebone "R_Index1" "R_Wrist" 5.813583 1.902728 0.349051 17.436997 21.811415 0.6102 0 0 0 0 0 0
$definebone "R_Index2" "R_Index1" 1.601248 -0.000033 -0.000577 -0.000001 0 -0.000001 0 0 0 0 0 0
$definebone "R_Index3" "R_Index2" 1.542324 0.000243 -0.000085 -0.000001 0 -0.000001 0 0 0 0 0 0
$definebone "R_Middle1" "R_Wrist" 5.796801 0.674393 0.503669 7.95718 8.0606 0.684742 0 0 0 0 0 0
$definebone "R_Middle2" "R_Middle1" 1.713551 -0.000777 0.000371 0 0.000001 0 0 0 0 0 0 0
$definebone "R_Middle3" "R_Middle2" 1.857147 -0.00025 0.000611 0 0.000001 0 0 0 0 0 0 0
$definebone "R_Ring1" "R_Wrist" 5.721643 -0.410158 0.261075 6.725837 -1.277409 0.780941 0 0 0 0 0 0
$definebone "R_Ring2" "R_Ring1" 1.771034 -0.000325 -0.000505 0 0 0 0 0 0 0 0 0
$definebone "R_Ring3" "R_Ring2" 1.28525 0.000422 0.000682 0 0 0 0 0 0 0 0 0
$definebone "R_Pinky1" "R_Wrist" 5.391228 -1.492035 0.326295 8.003016 -13.721594 0.910029 0 0 0 0 0 0
$definebone "R_Pinky2" "R_Pinky1" 1.514662 0.000685 -0.000379 -0.000001 0 0 0 0 0 0 0 0
$definebone "R_Pinky3" "R_Pinky2" 1.228537 0.000367 -0.000642 -0.000001 0 0 0 0 0 0 0 0
$definebone "HEV_Forearm_R" "R_Forearm" 1.232707 9.496117 10.348341 -0.000344 87.506867 0.022804 0 0 0 0 0 0
$definebone "L_Arm" "" 9.496418 12.824127 0 0 -89.999982 0 0 0 0 0 0 0
$definebone "L_Forearm" "L_Arm" 12.337497 -0.000007 0.000001 0 -0.013636 0 0 0 0 0 0 0
$definebone "L_Wrist" "L_Forearm" 15.362504 -0.000006 0 -1.492956 -1.145858 -1.21639 0 0 0 0 0 0
$definebone "L_Ring1" "L_Wrist" 5.721643 0.410159 0.261076 6.725837 1.277409 -0.780941 0 0 0 0 0 0
$definebone "L_Ring2" "L_Ring1" 1.771038 0.000317 -0.000504 0 0 0 0 0 0 0 0 0
$definebone "L_Ring3" "L_Ring2" 1.285244 -0.000415 0.000682 0 0 0 0 0 0 0 0 0
$definebone "L_Index1" "L_Wrist" 5.813578 -1.902733 0.349051 17.436997 -21.811415 -0.610257 0 0 0 0 0 0
$definebone "L_Index2" "L_Index1" 1.601254 0.000039 -0.000577 -0.000001 0.000003 0.000002 0 0 0 0 0 0
$definebone "L_Index3" "L_Index2" 1.542315 -0.000244 -0.000084 -0.000002 0.000061 0.000001 0 0 0 0 0 0
$definebone "L_Pinky1" "L_Wrist" 5.391222 1.492034 0.326297 8.003015 13.721594 -0.910029 0 0 0 0 0 0
$definebone "L_Pinky2" "L_Pinky1" 1.514658 -0.000682 -0.000379 -0.000001 0 0.000001 0 0 0 0 0 0
$definebone "L_Pinky3" "L_Pinky2" 1.228539 -0.000371 -0.000642 -0.000001 -0.000056 0.000001 0 0 0 0 0 0
$definebone "L_Thumb1" "L_Wrist" 1.780293 -1.121469 -0.825805 19.305586 -49.28657 17.849064 0 0 0 0 0 0
$definebone "L_Thumb2" "L_Thumb1" 2.606441 0.000288 0.0002 0.000003 0 0.000002 0 0 0 0 0 0
$definebone "L_Thumb3" "L_Thumb2" 1.439158 0.000359 0.000681 0.000003 0.000058 0.000003 0 0 0 0 0 0
$definebone "L_Middle1" "L_Wrist" 5.796795 -0.674396 0.503669 7.95718 -8.060656 -0.684685 0 0 0 0 0 0
$definebone "L_Middle2" "L_Middle1" 1.71356 0.000778 0.000371 -0.000001 0 0 0 0 0 0 0 0
$definebone "L_Middle3" "L_Middle2" 1.857138 0.000253 0.000611 -0.000001 -0.000057 0 0 0 0 0 0 0
$definebone "HEV_Forearm_L" "L_Forearm" 1.232707 -9.496119 10.348341 -0.000344 92.493158 -0.022804 0 0 0 0 0 0


$sectionframes 30 350

$sequence "admire" {
	"v_hands_anims\admire.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}
