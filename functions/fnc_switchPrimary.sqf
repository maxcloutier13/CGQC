// --- primarySwitch ----------------------------------------------------------
// Switch primary weapons
params ["_type", ["_target", player]];
diag_log format ["[CGQC_FNC] primarySwitch %1 started", _type];

_needGL = false;
// Remove gun and ammo
[_target] call CGQC_fnc_removePrimary;

// Add gun
switch (_type) do {
	case "mk18_dot":{
		["cgqc_gun_mk1_mk18"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_Eotech553_Black";
		_target addPrimaryWeaponItem "rhsusf_acc_grip2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "mk18_tl":{
		["cgqc_gun_mk1_mk18"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_Gemtech_Halo_DE";
		_target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_FL";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_Tano";
		_target addPrimaryWeaponItem "Tier1_DD_VFG_DE";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "mk18_gl":{
		["cgqc_gun_mk1_mk18_gl"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_Eotech551_L3_Black_Up";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "416_dot":{
		["Tier1_HK416D10_SMR_MFT"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		_target addPrimaryWeaponItem "Tier1_10_NGAL_M603V";
		_target addPrimaryWeaponItem "Tier1_Eotech553_Tan";
		_target addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "ACR_dot":{
		["UK3CB_ACR_Crew"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "g36_dot":{
		["UK3CB_G36_TAC_K"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "tier1_exps3_0_black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "mcx_t2":{
		["Tier1_SIG_MCX_115_Virtus_300BLK_FDE"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_Gemtech_Halo_DE";
		_target addPrimaryWeaponItem "Tier1_MCX_NGAL_M603V";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Tan";
		_target addPrimaryWeaponItem "Tier1_AFG_MLOK_FDE";
		_target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG";
	};

	case "sr16_dot":{
		["Tier1_SR16_CQB_Mod2_MFT_Black"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_alt_Black";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		_target addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "CTAR21":{
		["arifle_TRG20_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_target addPrimaryWeaponItem "Tier1_NGAL_Side";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "TAR21":{
		["arifle_TRG21_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_target addPrimaryWeaponItem "Tier1_NGAL_Side";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "TAR21GL":{
		["arifle_TRG21_GL_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_target addPrimaryWeaponItem "Tier1_NGAL_Side";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "m4_dotplus":{
		["cgqc_gun_mk1_m4a1blkII"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		_target addPrimaryWeaponItem "rhsusf_acc_grip2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "m4_lpvo":{
		["cgqc_gun_mk1_m4a1blkII"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		_target addPrimaryWeaponItem "rhsusf_acc_grip2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "m4_gl_m320":{
		["rhs_weap_m4_m320"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "acre_dotplus":{
		["UK3CB_ACR_Carbine"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "acre_lpvo":{
		["UK3CB_ACR_Carbine"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "acre_gl":{
		["UK3CB_ACR_Carbine_UGL"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "sr16_dotplus":{
		["Tier1_SR16_Carbine_Mod2_MFT_Black"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Down";
		_target addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "sr16_lpvo":{
		["Tier1_SR16_Carbine_Mod2_MFT_Black"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		_target addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "hk416_dotplus":{
		["Tier1_HK416D145_SMR_MFT"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		_target addPrimaryWeaponItem "Tier1_145_NGAL_M600V_alt";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Desert_Up";
		_target addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "hk416_lpvo":{
		["Tier1_HK416D145_SMR_MFT"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		_target addPrimaryWeaponItem "Tier1_145_NGAL_M600V_alt";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		_target addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "m16_shortdot":{
		["rhs_weap_m16a4_imod_grip2"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black_PIP";
		_target addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "acre_shortdot":{
		["UK3CB_ACR_Rifle_Long"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		_target addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "mk12_lpvo":{
		["cgqc_gun_mk1_mk12"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		_target addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
	};
	case "m27_lpvo":{
		["rhs_weap_m27iar_grip2"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		_target addPrimaryWeaponItem "rhsusf_acc_grip2";
	};
	case "417":{
		["cgqc_gun_mk1_hk417"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Black";
		_target addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk_light";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		_target addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
		_target addPrimaryWeaponItem "bipod_01_F_blk";
	};
	case "m27": {
		["rhs_weap_m27iar_grip2"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
		_target addPrimaryWeaponItem "rhs_mag_100Rnd_556x45_Mk262_cmag";
		_target addPrimaryWeaponItem "bipod_01_F_blk";
	};
	case "mk46":{
		["cgqc_gun_mk1_mk46"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_Mk46Mod1_LA5_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		_target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
		_target addPrimaryWeaponItem "Tier1_SAW_Bipod_DD";
	};
	case "mk48":{
		["cgqc_gun_mk1_mk48"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SOCOM762MG_Black";
		_target addPrimaryWeaponItem "Tier1_Mk48Mod0_LA5_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_EXPS3_0_3xMag_Black_Up";
		_target addPrimaryWeaponItem "Tier1_100Rnd_762x51_Belt_M993_AP";
		_target addPrimaryWeaponItem "Tier1_SAW_Bipod_2_KAC";
	};
	case "p90":{
		["cgqc_gun_mk1_p90"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "muzzle_snds_570";
		_target addPrimaryWeaponItem "Tier1_NGAL_Side";
		_target addPrimaryWeaponItem "optic_ACO_grn";
		_target addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
	};
	case "m110k5":{
		["Tier1_M110k5"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_762_DSR";
		_target addPrimaryWeaponItem "Tier1_URX4_NGAL_M603V_FL";
		_target addPrimaryWeaponItem "Tier1_ATACR18_Geissele_Docter_Desert_PIP";
		_target addPrimaryWeaponItem "Tier1_20Rnd_762x51_M118_Special_SR25_Mag";
		_target addPrimaryWeaponItem "Tier1_Harris_Bipod_MLOK_Tan";
	};
	case "socom16":{
		["rhs_weap_m14_socom_rail"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		_target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		_target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "rhsusf_acc_m14_bipod";
		_target addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
	};
	case "m110_leupold":{
		["Tier1_M110k1"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_762_DSR";
		_target addPrimaryWeaponItem "Tier1_LeupoldM3A_Geissele_Docter_Tan";
		_target addPrimaryWeaponItem "Tier1_20Rnd_762x51_M118_Special_SR25_Mag";
		_target addPrimaryWeaponItem "Tier1_M110_LA5_Side";
		_target addPrimaryWeaponItem "bipod_02_F_hex";
	};
	case "m14ebr":{
		["rhs_weap_m14ebrri"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		_target addPrimaryWeaponItem "rhsusf_acc_nxs_3515x50f1_md";
		_target addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
		_target addPrimaryWeaponItem "rhs_acc_harris_swivel";
		_target addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
	};
	case "sig556":{
		["srifle_DMR_03_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
		_target addPrimaryWeaponItem "optic_AMS";
		_target addPrimaryWeaponItem "Tier1_NGAL_Side";
		_target addPrimaryWeaponItem "bipod_02_F_blk";
		_target addPrimaryWeaponItem "ACE_20Rnd_762x51_M118LR_Mag";
	};
	case "noreen":{
		["srifle_DMR_02_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "optic_lrps";
		_target addPrimaryWeaponItem "muzzle_snds_338_black";
		_target addPrimaryWeaponItem "Tier1_NGAL_Side";
		_target addPrimaryWeaponItem "bipod_02_F_blk";
		_target addPrimaryWeaponItem "ACE_10Rnd_338_300gr_HPBT_Mag";
	};
	case "m200":{
		["cgqc_gun_mk1_m200"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "optic_lrps";
		_target addPrimaryWeaponItem "ace_acc_pointer_green";
		_target addPrimaryWeaponItem "7Rnd_mas_can_408_Mag";
	};

	case "swat_p90":{
		["UK3CB_P90C_TR_black"] call CGQC_fnc_getCustomGun;
		removeAllPrimaryWeaponItems _target;
		_target addPrimaryWeaponItem "muzzle_snds_570";
		_target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Low_Black";
		_target addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
	};

	case "swat_blk":{
		["Tier1_SIG_MCX_115_Virtus_300BLK_Black"] call CGQC_fnc_getCustomGun;
		removeAllPrimaryWeaponItems _target;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_MCX_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG";
		_target addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
	};

	case "swat_mp7":{
		["rhsusf_weap_MP7A2_grip2"] call CGQC_fnc_getCustomGun;
		removeAllPrimaryWeaponItems _target;
		_target addPrimaryWeaponItem "rhsusf_mag_40Rnd_46x30_AP";
		_target addPrimaryWeaponItem "rhsusf_acc_rotex_mp7";
		_target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black_FL";
		_target addPrimaryWeaponItem "rhsusf_acc_T1_low";
	};

	case "swat_mp5sd6":{
		["UK3CB_MP5SD6"] call CGQC_fnc_getCustomGun;
		removeAllPrimaryWeaponItems _target;
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "30Rnd_9x21_Mag_SMG_02";
	};

	case "swat_m14":{
		["UK3CB_M14DMR_Railed_BLK"] call CGQC_fnc_getCustomGun;
		removeAllPrimaryWeaponItems _target;
		_target addPrimaryWeaponItem "uk3cb_muzzle_snds_M14";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		_target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mag_SD";
	};

	case "swat_m24":{
		["rhs_weap_m24sws"] call CGQC_fnc_getCustomGun;
		removeAllPrimaryWeaponItems _target;
		_target addPrimaryWeaponItem "rhsusf_acc_m24_silencer_black";
		_target addPrimaryWeaponItem "Tier1_LeupoldM3A_Geissele_Docter_Black";
		_target addPrimaryWeaponItem "rhsusf_5Rnd_762x51_m118_special_Mag";
		_target addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
	};

	case "swat_socom":{
		["rhs_weap_m14_socom_rail"] call CGQC_fnc_getCustomGun;
		removeAllPrimaryWeaponItems _target;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Black";
		_target addPrimaryWeaponItem "Tier1_Mk18_NGAL_Side";
		_target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black_PIP";
		_target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mag_SD";
		_target addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
	};
};



if (_needGL) then { // Load with grenade launcher stuff
	diag_log "[CGQC_FNC] primarySwitch - adding GL stuff";
	for "_i" from 1 to 5 do {_target addItemToVest "1Rnd_HE_Grenade_shell"};
	for "_i" from 1 to 10 do {_target addItemToBackpack "1Rnd_HE_Grenade_shell"};
	for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_SmokeRed_Grenade_shell"};
	for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell"};
	for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_Smoke_Grenade_shell"};
	for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_white"};
	for "_i" from 1 to 2 do {_target addItemToBackpack "UGL_FlareRed_F"};
	for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_ir"};
	for "_i" from 1 to 2 do {_target addItemToBackpack "SmokeShell"};
};

// Add mags to vest
[] call CGQC_fnc_addMags;

_target action ['SwitchWeapon', _target, _target, 250];

diag_log "[CGQC_FNC] primarySwitch done";