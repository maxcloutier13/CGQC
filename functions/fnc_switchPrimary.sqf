// --- primarySwitch ----------------------------------------------------------
// Switch primary weapons
params ["_type"];
_needGL = false;


//Remove main weapon and mags 
_gun = primaryWeapon player;
player action ['SwitchWeapon', player, player, 250];

if (_gun != "") then {
	_mags = primaryWeaponMagazine player;
	_mainMag = _mags select 0;
	
	if (!isNil "_mainMag") then {
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
	case "mk18_dot":{
		["cgqc_gun_mk1_mk18"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		player addPrimaryWeaponItem "tier1_exps3_0_black";
		player addPrimaryWeaponItem "rhsusf_acc_grip2";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "mk18_gl":{
		["cgqc_gun_mk1_mk18_gl"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_Eotech551_L3_Black_Up";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
		break;
	};
	case "416_dot":{
		["Tier1_HK416D10_SMR_MFT"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		player addPrimaryWeaponItem "Tier1_10_NGAL_M603V";
		player addPrimaryWeaponItem "Tier1_Eotech553_Tan";
		player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "ACR_dot":{
		["UK3CB_ACR_Crew"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "g36_dot":{
		["UK3CB_G36_TAC_K"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		player addPrimaryWeaponItem "tier1_exps3_0_black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "mcx_t2":{
		["Tier1_SIG_MCX_115_Virtus_300BLK_FDE"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "Tier1_Gemtech_Halo_DE";
		player addPrimaryWeaponItem "Tier1_MCX_NGAL_M603V";
		player addPrimaryWeaponItem "Tier1_MicroT2_Tan";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_FDE";
		player addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG";
		break;
	};

	case "sr16_dot":{
		["Tier1_SR16_CQB_Mod2_MFT_Black"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_alt_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "CTAR21":{
		["arifle_TRG20_F"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "TAR21":{
		["arifle_TRG21_F"] call CGQC_fnc_getCustomGun;
		player addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "TAR21GL":{
		["arifle_TRG21_GL_F"] call CGQC_fnc_getCustomGun;	
		player addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
		break;
	};
	case "m4_dotplus":{
		["cgqc_gun_mk1_m4a1blkII"] call CGQC_fnc_getCustomGun;	
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhsusf_acc_grip2";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "m4_lpvo":{ 
		["cgqc_gun_mk1_m4a1blkII"] call CGQC_fnc_getCustomGun;	
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "rhsusf_acc_grip2";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		break;
	};
	case "m4_gl_m320":{
		["rhs_weap_m4_m320"] call CGQC_fnc_getCustomGun;	
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black_FL";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
		break;
	};
	case "acre_dotplus":{
		["UK3CB_ACR_Carbine"] call CGQC_fnc_getCustomGun;	
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "acre_lpvo":{
		["UK3CB_ACR_Carbine"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		break;
	};
	case "acre_gl":{
		["UK3CB_ACR_Carbine_UGL"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
		break;
	};
	case "sr16_dotplus":{
		["Tier1_SR16_Carbine_Mod2_MFT_Black"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Down";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "sr16_lpvo":{
		["Tier1_SR16_Carbine_Mod2_MFT_Black"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		break;
	};
	case "hk416_dotplus":{
		["Tier1_HK416D145_SMR_MFT"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		player addPrimaryWeaponItem "Tier1_145_NGAL_M600V_alt";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Desert_Up";
		player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		break;
	};
	case "hk416_lpvo":{
		["Tier1_HK416D145_SMR_MFT"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		player addPrimaryWeaponItem "Tier1_145_NGAL_M600V_alt";
		player addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		break;
	};
	case "m16_shortdot":{
		["rhs_weap_m16a4_imod_grip2"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black_PIP";
		player addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		break;
	};
	case "acre_shortdot":{
		["UK3CB_ACR_Rifle_Long"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		player addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		break;
	};
	case "mk12_lpvo":{
		["cgqc_gun_mk1_mk12"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		player addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		player addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
		break;
	};
	case "m27_lpvo":{
		["rhs_weap_m27iar_grip2"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C_Black_FL";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		player addPrimaryWeaponItem "rhsusf_acc_grip2";
		break;
	};
	case "417":{
		["cgqc_gun_mk1_hk417"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_SandmanS_Black";
		player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk_light";
		player addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		player addPrimaryWeaponItem "bipod_01_F_blk";
		break;
	};
	case "m27": {
		["rhs_weap_m27iar_grip2"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
		player addPrimaryWeaponItem "rhs_mag_100Rnd_556x45_Mk262_cmag";
		player addPrimaryWeaponItem "bipod_01_F_blk";
		break;
	};
	case "mk46":{
		["cgqc_gun_mk1_mk46"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_Mk46Mod1_LA5_M600V_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
		player addPrimaryWeaponItem "Tier1_SAW_Bipod_DD";
		break;
	};
	case "mk48":{
		["cgqc_gun_mk1_mk48"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_SOCOM762MG_Black";
		player addPrimaryWeaponItem "Tier1_Mk48Mod0_LA5_M600V_Black";
		player addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		player addPrimaryWeaponItem "Tier1_100Rnd_762x51_Belt_M993_AP";
		player addPrimaryWeaponItem "Tier1_SAW_Bipod_2_KAC";
		break;
	};
	case "p90":{
		["cgqc_gun_mk1_p90"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "muzzle_snds_570";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "optic_ACO_grn";
		player addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
		break;
	};
	case "m110k5":{
		["Tier1_M110k5"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_762_DSR";
		player addPrimaryWeaponItem "Tier1_URX4_NGAL_M603V_FL";
		player addPrimaryWeaponItem "Tier1_ATACR18_Geissele_Docter_Desert_PIP";
		player addPrimaryWeaponItem "Tier1_20Rnd_762x51_M118_Special_SR25_Mag";
		player addPrimaryWeaponItem "Tier1_Harris_Bipod_MLOK_Tan";
		break;
	};
	case "socom16":{
		["rhs_weap_m14_socom_rail"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_M600V_Black";
		player addPrimaryWeaponItem "rhsusf_acc_m14_bipod";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		break;
	};
	case "m110_leupold":{
		["Tier1_M110k1"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "Tier1_KAC_762_DSR";
		player addPrimaryWeaponItem "Tier1_LeupoldM3A_Geissele_Docter_Tan";
		player addPrimaryWeaponItem "Tier1_20Rnd_762x51_M118_Special_SR25_Mag";
		player addPrimaryWeaponItem "Tier1_M110_LA5_Side";
		player addPrimaryWeaponItem "bipod_02_F_hex";
		break;
	};
	case "m14ebr":{
		["rhs_weap_m14ebrri"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		player addPrimaryWeaponItem "rhsusf_acc_nxs_3515x50f1_md";
		player addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
		player addPrimaryWeaponItem "rhs_acc_harris_swivel";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		break;
	};
	case "sig556":{
		["srifle_DMR_03_F"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		player addPrimaryWeaponItem "optic_AMS";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "bipod_02_F_blk";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		break;
	};
	case "noreen":{
		["srifle_DMR_02_F"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "optic_lrps";
		player addPrimaryWeaponItem "muzzle_snds_338_black";
		player addPrimaryWeaponItem "Tier1_NGAL_Side";
		player addPrimaryWeaponItem "bipod_02_F_blk";
		player addPrimaryWeaponItem "ACE_10Rnd_338_300gr_HPBT_Mag";
		break;
	};
	case "m200":{
		["cgqc_gun_mk1_m200"] call CGQC_fnc_getCustomGun;		
		player addPrimaryWeaponItem "optic_lrps";
		player addPrimaryWeaponItem "ace_acc_pointer_green";
		player addPrimaryWeaponItem "7Rnd_mas_can_408_Mag";
		break;
	};

	case "swat_p90":{
		["UK3CB_P90C_TR_black"] call CGQC_fnc_getCustomGun;		
		removeAllPrimaryWeaponItems player;
		player addPrimaryWeaponItem "muzzle_snds_570";
		player addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_MicroT2_Low_Black";
		player addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
		break;
	};

	case "swat_blk":{
		["Tier1_SIG_MCX_115_Virtus_300BLK_Black"] call CGQC_fnc_getCustomGun;		
		removeAllPrimaryWeaponItems player;
		player addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		player addPrimaryWeaponItem "Tier1_MCX_NGAL_M300C_Black";
		player addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		player addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG";
		player addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		break;
	};

	case "swat_mp7":{
		["rhsusf_weap_MP7A2_grip2"] call CGQC_fnc_getCustomGun;		
		removeAllPrimaryWeaponItems player;
		player addPrimaryWeaponItem "rhsusf_mag_40Rnd_46x30_AP";
		player addPrimaryWeaponItem "rhsusf_acc_rotex_mp7";
		player addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black_FL";
		player addPrimaryWeaponItem "rhsusf_acc_T1_low";
		break;
	};

	case "swat_mp5sd6":{
		["UK3CB_MP5SD6"] call CGQC_fnc_getCustomGun;		
		removeAllPrimaryWeaponItems player;
		player addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		player addPrimaryWeaponItem "30Rnd_9x21_Mag_SMG_02";
		break;
	};

	case "swat_m14":{
		["UK3CB_M14DMR_Railed_BLK"] call CGQC_fnc_getCustomGun;		
		removeAllPrimaryWeaponItems player;
		player addPrimaryWeaponItem "uk3cb_muzzle_snds_M14";
		player addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_Mag_SD";
		break;
	};

	case "swat_m24":{
		["rhs_weap_m24sws"] call CGQC_fnc_getCustomGun;		
		removeAllPrimaryWeaponItems player;
		player addPrimaryWeaponItem "rhsusf_acc_m24_silencer_black";
		player addPrimaryWeaponItem "Tier1_LeupoldM3A_Geissele_Docter_Black";
		player addPrimaryWeaponItem "rhsusf_5Rnd_762x51_m118_special_Mag";
		player addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
		break;
	};

	case "swat_socom":{
		["rhs_weap_m14_socom_rail"] call CGQC_fnc_getCustomGun;		
		removeAllPrimaryWeaponItems player;
		player addPrimaryWeaponItem "Tier1_SandmanS_Black";
		player addPrimaryWeaponItem "Tier1_Mk18_NGAL_Side";
		player addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black_PIP";
		player addPrimaryWeaponItem "ACE_20Rnd_762x51_Mag_SD";
		player addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
		break;
	};
};

// Add mags to vest 
[] call CGQC_fnc_addMags;

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