// --- primarySwitch ----------------------------------------------------------
// Switch primary weapons
_type = _this select 0;
_needGL = false;
_mag_count = 6; 

//Remove main weapon and mags 
_gun = primaryWeapon player;
player action ['SwitchWeapon', player, player, 250];
sleep 0.5;
if (_gun != "") then {
	_mags = primaryWeaponMagazine player;
	_mainMag = _mags select 0;
	sleep 0.5;
	if (count _mainMag > 0) then {
		player removeMagazines _mainMag;
	};
	if (count _mags > 1) then {
		player removeMagazines "1Rnd_HE_Grenade_shell";
		player removeMagazines "1Rnd_Smoke_Grenade_shell";
		player removeMagazines "1Rnd_SmokeBlue_Grenade_shell";
		player removeMagazines "1Rnd_SmokeRed_Grenade_shell";
		player removeMagazines "ACE_40mm_Flare_white";
		player removeMagazines "UGL_FlareRed_F";
		player removeMagazines "ACE_40mm_Flare_ir";
	};
	player removeWeapon _gun;
};

// Add gun
switch (_type) do {
	// Default guts ========================================================================
	case "mk18_dot":{
		["cgqc_gun_mk1_mk18"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		player addPrimaryWeaponItem "tier1_exps3_0_black";
		player addPrimaryWeaponItem "rhsusf_acc_grip2";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "mk18_gl":{
		["cgqc_gun_mk1_mk18_gl"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_Eotech551_L3_Black_Up";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "416_dot":{
		["Tier1_HK416D10_SMR_MFT"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		player addPrimaryWeaponItem "Tier1_10_NGAL_M603V";
		player addPrimaryWeaponItem "Tier1_Eotech553_Tan";
		player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "ACR_dot":{
		["UK3CB_ACR_Crew"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "g36_dot":{
		["UK3CB_G36_TAC_K"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		player addPrimaryWeaponItem "tier1_exps3_0_black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "virtus_dot":{
		["Tier1_SIG_MCX_115_Virtus_Black"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_MCX_NGAL_M300C_Black_FL";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "sr16_dot":{
		["Tier1_SR16_CQB_Mod2_MFT_Black"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_alt_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "CTAR21":{
		["arifle_TRG20_F"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "TAR21":{
		["arifle_TRG21_F"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "TAR21GL":{
		["arifle_TRG21_GL_F"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "m4_dotplus":{
		["cgqc_gun_mk1_m4a1blkII"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhsusf_acc_grip2";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "m4_lpvo":{ 
		["cgqc_gun_mk1_m4a1blkII"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "rhsusf_acc_grip2";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "m4_gl_m320":{
		["rhs_weap_m4_m320"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black_FL";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "acre_dotplus":{
		["UK3CB_ACR_Carbine"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "acre_lpvo":{
		["UK3CB_ACR_Carbine"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "acre_gl":{
		["UK3CB_ACR_Carbine_UGL"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "sr16_dotplus":{
		["Tier1_SR16_Carbine_Mod2_MFT_Black"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Down";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "sr16_lpvo":{
		["Tier1_SR16_Carbine_Mod2_MFT_Black"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "hk416_dotplus":{
		["Tier1_HK416D145_SMR_MFT"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		player addPrimaryWeaponItem "Tier1_145_NGAL_M600V_alt";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Desert_Up";
		player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "hk416_lpvo":{
		["Tier1_HK416D145_SMR_MFT"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		player addPrimaryWeaponItem "Tier1_145_NGAL_M600V_alt";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "m16_shortdot":{
		["rhs_weap_m16a4_imod_grip2"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black_PIP";
		player addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "acre_shortdot":{
		["UK3CB_ACR_Rifle_Long"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		player addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "mk12_lpvo":{
		["cgqc_gun_mk1_mk12"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		player addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
	};
	case "m27_lpvo":{
		["rhs_weap_m27iar_grip2"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C_Black_FL";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		player addPrimaryWeaponItem "rhsusf_acc_grip2";
	};
	case "417":{
		["cgqc_gun_mk1_hk417"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_SandmanS_Black";
		player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk_light";
		player addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		player addPrimaryWeaponItem "bipod_01_F_blk";
		_mag_count = 8;
	};
	case "m27": {
		["rhs_weap_m27iar_grip2"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
		player addPrimaryWeaponItem "rhs_mag_100Rnd_556x45_Mk262_cmag";
		player addPrimaryWeaponItem "bipod_01_F_blk";
		_mag_count = 6;
	};
	case "mk46":{
		["cgqc_gun_mk1_mk46"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk46Mod1_LA5_M600V_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
		player addPrimaryWeaponItem "Tier1_SAW_Bipod_DD";
		_mag_count = 4;
	};
	case "mk48":{
		["cgqc_gun_mk1_mk48"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_SOCOM762MG_Black";
		player addPrimaryWeaponItem "Tier1_Mk48Mod0_LA5_M600V_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "Tier1_100Rnd_762x51_Belt_M993_AP";
		player addPrimaryWeaponItem "Tier1_SAW_Bipod_2_KAC";
		_mag_count = 5;
	};
	case "p90":{
		["cgqc_gun_mk1_p90"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "muzzle_snds_570";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "optic_ACO_grn";
		player addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
		_mag_count = 4;
	};
	case "socom16":{
		["rhs_weap_m14_socom_rail"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M600V_Black";
		player addPrimaryWeaponItem "rhsusf_acc_m14_bipod";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		_mag_count = 9;
	};
	case "m14ebr":{
		["rhs_weap_m14ebrri"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		player addPrimaryWeaponItem "rhsusf_acc_nxs_3515x50f1_md";
		player addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
		player addPrimaryWeaponItem "rhs_acc_harris_swivel";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		_mag_count = 9;
	};
	case "sig556":{
		["srifle_DMR_03_F"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		player addPrimaryWeaponItem "optic_AMS";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "bipod_02_F_blk";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		_mag_count = 9;
	};
	case "noreen":{
		["srifle_DMR_02_F"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "optic_lrps";
		player addPrimaryWeaponItem "muzzle_snds_338_black";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "bipod_02_F_blk";
		player addPrimaryWeaponItem "ACE_10Rnd_338_300gr_HPBT_Mag";
		_mag_count = 10;
	};
	case "m200":{
		["cgqc_gun_mk1_m200"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "optic_lrps";
		player addPrimaryWeaponItem "ace_acc_pointer_green";
		player addPrimaryWeaponItem "7Rnd_mas_can_408_Mag";
		_mag_count = 10;
	};
};

sleep 1;
// Add mags to vest 
_mainMag = primaryWeaponMagazine player select 0;
for "_i" from 1 to _mag_count do {
	player addItem _mainMag;
};

if (_needGL) then {
	player addItem "1Rnd_HE_Grenade_shell";
	player addItem "1Rnd_HE_Grenade_shell";
	player addItem "1Rnd_HE_Grenade_shell";
	player addItem "1Rnd_HE_Grenade_shell";
	player addItem "1Rnd_HE_Grenade_shell";
	player addItem "1Rnd_Smoke_Grenade_shell";
	player addItem "1Rnd_Smoke_Grenade_shell";
	player addItem "1Rnd_SmokeBlue_Grenade_shell";
	player addItem "1Rnd_SmokeBlue_Grenade_shell";
	player addItem "1Rnd_SmokeRed_Grenade_shell";
	player addItem "1Rnd_SmokeRed_Grenade_shell";
	player addItem "ACE_40mm_Flare_white";
	player addItem "UGL_FlareRed_F";
	player addItem "ACE_40mm_Flare_ir";
};

player action ['SwitchWeapon', player, player, 100];
hint "Primary weapon switched";
sleep 5;
hintSilent "";