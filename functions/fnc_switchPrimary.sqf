#include "\CGQC\script_component.hpp"
// --- primarySwitch ----------------------------------------------------------
// Switch primary weapons
params ["_type", ["_target", player]];
LOG_1("[primarySwitch] %1 started", _type);

_needGL = false;
// Remove gun and ammo
[_target] call CGQC_fnc_removePrimary;

// Add gun
switch (_type) do {
	case "nam_svd": {
		["uns_SVD_CAMO_base"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_SVD_CAMO_base";
		_target addPrimaryWeaponItem "uns_o_PSO1_camo";
		_target addPrimaryWeaponItem "uns_b_svd_camo";
		_target addPrimaryWeaponItem "uns_m40mag_T";
	};
	case "nam_stoner": {
		["uns_m63asupport"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_m63abox";
	};
	case "nam_stoner_short": {
		["uns_M63a_drum"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_m63amag";
	};
	case "nam_rpd": {
		["uns_RPDsupport"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_rpdmag";
	};
	case "nam_rpd_short": {
		["uns_rpdsog"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_rpdmag";
	};
	case "nam_m40": {
		["uns_M40_base"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_o_RedfieldART";
		_target addPrimaryWeaponItem "uns_b_m40_camo";
		_target addPrimaryWeaponItem "uns_m40mag_T";
	};
	case "nam_sten": {
		["uns_SterlingSD"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_mk4mag";
	};
	case "nam_greese": {
		["uns_m3a1"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_s_M3a1";
		_target addPrimaryWeaponItem "uns_m3a1mag";
	};
	case "nam_thompson": {
		["uns_thompson"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_thompsonmag_30_T";
	};
	case "nam_m2": {
		["uns_m2carbine"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_m2carbinemag_T";
		_target addPrimaryWeaponItem "uns_o_M84";
	};
	case "nam_m14": {
		["uns_m14"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_m14mag_T";
		_target addPrimaryWeaponItem "uns_o_LeatherwoodART_m14";
	};
	case "nam_l2a1": {
		["uns_l2a1_shorty"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_l1a1mag_T";
	};
	case "nam_ak": {
		["uns_akms"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_ak47mag_T";
		_target addPrimaryWeaponItem "uns_b_6H3";
	};

	case "nam_car15_short": {
		["uns_xm177e2_short"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_30Rnd_556x45_Stanag_T";
	};
	case "nam_car15": {
		["uns_xm177e2"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_30Rnd_556x45_Stanag_T";
	};
	case "nam_car15GL": {
		["uns_xm177e2_m203"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "uns_30Rnd_556x45_Stanag_T";
		_target addPrimaryWeaponItem "uns_1Rnd_HEDP_M433";
		_needGL = true;
	};

	case "stoner":{
		["LMG_Mk200_black_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
		_target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black_2D";
		_target addPrimaryWeaponItem "200Rnd_65x39_cased_Box_Tracer";
		_target addPrimaryWeaponItem "HLC_bipod_UTGShooters";
	};
	case "sdar":{
		["arifle_SDAR_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
	};
	case "scar_ak":{
		["hlc_wp_MK17IUR_762R_grip2"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black_2D";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "hlc_30Rnd_762x39_m_ak_PMAG";
	};
	case "hk121":{
		["MMG_01_tan_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "muzzle_snds_93mmg_tan";
		_target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		_target addPrimaryWeaponItem "HLC_bipod_UTGShooters";
		_target addPrimaryWeaponItem "150Rnd_93x64_Mag";

	};
	case "csr16":{
		["121_USASOC_CSR_16"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "121_USASOC_MRAD";
		_target addPrimaryWeaponItem "121_USASOC_AML338_TAN";
		_target addPrimaryWeaponItem "121_USASOC_CSR_16";
		_target addPrimaryWeaponItem "121_USASOC_RVPS";
		_target addPrimaryWeaponItem "121_USASOC_Atlas";
		_target addPrimaryWeaponItem "121_308_Mk319_Mod_0_10rnd";
	};
	case "csr24":{
		["121_338_300gr_HPBT_5rnd"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "121_USASOC_MRAD";
		_target addPrimaryWeaponItem "121_USASOC_AML338_TAN";
		_target addPrimaryWeaponItem "121_USASOC_STORM_SLX_Laser";
		_target addPrimaryWeaponItem "121_USASOC_PVPS";
		_target addPrimaryWeaponItem "121_USASOC_Atlas";
		_target addPrimaryWeaponItem "121_308_Mk319_Mod_0_10rnd";
	};
	case "ctsr":{
		["121_USASOC_CTSR"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "121_USASOC_MRAD";
		_target addPrimaryWeaponItem "121_USASOC_AML338_TAN";
		_target addPrimaryWeaponItem "121_USASOC_STORM_SLX_Laser";
		_target addPrimaryWeaponItem "121_USASOC_PVPS";
		_target addPrimaryWeaponItem "121_USASOC_Atlas";
		_target addPrimaryWeaponItem "121_300WM_Berger_OTM_5rnd";
	};
	case "barrett_mk22":{
		["hlc_wp_SSR"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "121_USASOC_MRAD";
		_target addPrimaryWeaponItem "121_USASOC_AML338_TAN";
		_target addPrimaryWeaponItem "121_USASOC_STORM_SLX_Laser";
		_target addPrimaryWeaponItem "121_USASOC_PVPS";
		_target addPrimaryWeaponItem "121_USASOC_Atlas";
		_target addPrimaryWeaponItem "121_338_300gr_NM_10rnd";
	};

	case "scar_dmr":{
		["hlc_wp_SSR"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Black";
		_target addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		_target addPrimaryWeaponItem "HLC_bipod_UTGShooters";
		_target addPrimaryWeaponItem "rhs_mag_20Rnd_SCAR_762x51_m118_special_bk";
	};
	case "scar_l_long":{
		["hlc_wp_SCARL_DMR"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		_target addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "scar_h_long":{
		["hlc_wp_SCARH_DMR"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		_target addPrimaryWeaponItem "HLC_bipod_UTGShooters";
		_target addPrimaryWeaponItem "rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk";
	};
	case "scar_l_std_gl":{
		["hlc_wp_SCARL_STD_EGLM"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "hlc_optic_HensoldtZO_Hi_Docter";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "scar_l_std_gl_blackout":{
		["hlc_wp_SCARL_STD_300AAC_EGLM"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black_2D";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "scar_l_std":{
		["hlc_wp_SCARL_STD"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black_2D";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
	};
	case "scar_l_std_blackout":{
		["hlc_wp_SCARL_STD_300AAC"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SRD762_Desert";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_FDE_2D";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG_Tan";
	};
	case "scar_h_std":{
		["hlc_wp_SCARH_STD"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_Razor_Gen2_16_Geissele_Docter";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk";
	};
	case "scar_h_std_gl":{
		["hlc_wp_SCARH_STD_EGLM"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "hlc_optic_HensoldtZO_Hi_Docter";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "scar_l_cqb_gl":{
		["hlc_wp_SCARL_CQC_EGLM"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "scar_l_cqb":{
		["hlc_wp_SCARL_CQC"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "scar_l_cqb_blackout":{
		["hlc_WP_SCARL_CQC_300AAC"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG_Tan";
	};
	case "scar_h_cqb":{
		["hlc_wp_SCARH_CQC"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk";
	};
	case "scar_h_cqb_gl":{
		["hlc_wp_SCARH_CQC_EGLM"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SandmanS_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "scar_l_short":{
		["hlc_wp_SCAR_PDW"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "hlc_grip_AFG2";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
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
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "TAR21GL":{
		["arifle_TRG21_GL_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_target addPrimaryWeaponItem "Tier1_NGAL_Side";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		_target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
		_needGL = true;
	};
	case "m4_elcan":{
		["cgqc_gun_mk1_m4a1blkII"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
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
	case "sr16_elcan":{
		["Tier1_SR16_Carbine_Mod2_MFT_Black"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
		_target addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
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
	case "hk416_elcan":{
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
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
		_target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
		_target addPrimaryWeaponItem "Tier1_SAW_Bipod_DD";
	};
	case "minimi":{
		["lmg_03_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "muzzle_snds_M";
		_target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
		_target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
	};
	case "m249":{
		["Tier1_M249_light_S_Desert"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
		_target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_ARD_Docter_FDE_2D";
		_target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
		_target addPrimaryWeaponItem "Tier1_SAW_Bipod_2_DD_Desert";
	};
	case "mk48":{
		["cgqc_gun_mk1_mk48"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SOCOM762MG_Black";
		_target addPrimaryWeaponItem "Tier1_Mk48Mod0_LA5_M600V_Black";
		_target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black";
		_target addPrimaryWeaponItem "Tier1_250Rnd_762x51_Belt_M62_Tracer";
		_target addPrimaryWeaponItem "Tier1_SAW_Bipod_2_KAC";
	};
	case "lwmmg":{
		["MMG_02_black_F"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "muzzle_snds_338_black";
		_target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
		_target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black";
		_target addPrimaryWeaponItem "130Rnd_338_Mag";
		_target addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
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
		_target addPrimaryWeaponItem "Tier1_ATACR18_Geissele_Docter_Desert";
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
		["cgqc_gun_mk1_p90"] call CGQC_fnc_getCustomGun;
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
		["arifle_mas_can_mp5sd6_F"] call CGQC_fnc_getCustomGun;
		removeAllPrimaryWeaponItems _target;
		_target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
		_target addPrimaryWeaponItem "30Rnd_9x21_Mag_SMG_02";
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
	if (cgqc_player_isVietnam) then {
		LOG(" primarySwitch - Nam Style - adding GL stuff");
		_target addItemToVest "uns_m406vest";
		for "_i" from 1 to 10 do {_target addItemToBackpack "Uns_1Rnd_HE_M406"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "uns_1Rnd_SmokeGreen_40mm"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "uns_1Rnd_SmokeRed_40mm"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "uns_40mm_white"};
	} else {
		LOG(" primarySwitch - adding GL stuff");
		for "_i" from 1 to 5 do {_target addItemToVest "1Rnd_HE_Grenade_shell"};
		for "_i" from 1 to 10 do {_target addItemToBackpack "1Rnd_HE_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_SmokeRed_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_Smoke_Grenade_shell"};
		[] call CGQC_fnc_isDaytime;
		if !(cgqc_mission_daytime) then {
			LOG("[primarySwitch] Night-time. Get flares");
			hint "Night! get some flares";
			for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_white"};
			for "_i" from 1 to 2 do {_target addItemToBackpack "UGL_FlareRed_F"};
			for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_ir"};
		} else {
			LOG("[primarySwitch] Daytime. Skip flares");
			hint "Daytime. Skip flares";
		};
	};
};

// Add mags to vest
[_target] call CGQC_fnc_addMags;

[_target] call ace_weaponselect_fnc_putWeaponAway;

LOG("[primarySwitch] done");