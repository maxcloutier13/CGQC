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
	case "m16_shortdot":{
		["rhs_weap_m16a4_imod_grip2"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black_PIP";
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
	case "417":{
		["cgqc_gun_mk1_hk417"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "Tier1_SandmanS_Black";
		player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk_light";
		player addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		player addPrimaryWeaponItem "bipod_01_F_blk";
		_mag_count = 8;
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
	case "m14ebr":{
		["rhs_weap_m14ebrri"] execVM "\CGQC_2022\functions\getCustomGun.sqf";sleep 0.5;
		player addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		player addPrimaryWeaponItem "rhsusf_acc_nxs_3515x50f1_md";
		player addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
		player addPrimaryWeaponItem "rhs_acc_harris_swivel";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		_mag_count = 9;
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