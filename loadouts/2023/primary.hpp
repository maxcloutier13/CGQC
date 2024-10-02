// 2023

// SCARs ----------------------------------------------------------------------------------------------
case "scar_l_long":{
    ["hlc_wp_SCARL_DMR", "lpvo", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "Tier1_Harris_Bipod_Tan";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk262_PMAG_Tan_mix";
};
case "scar_h_long":{
    ["hlc_wp_SCARH_DMR", "rco", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "Tier1_Harris_Bipod_Tan";
    _target addPrimaryWeaponItem "grcb_mag_20Rnd_SCAR_762x51_mk316_special_mix";
};
case "scar_l_std_gl":{
    ["hlc_wp_SCARL_STD_EGLM", "magnified", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk262_PMAG_Tan_mix";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};
case "scar_l_std_gl_blackout":{
    ["hlc_wp_SCARL_STD_300AAC_EGLM", "rco", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk262_PMAG_Tan_mix";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};
case "scar_l_std":{
    ["hlc_wp_SCARL_STD", "magnified", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_Black_2D";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk262_PMAG_Tan_mix";
};
case "scar_l_std_blackout":{
    ["hlc_wp_SCARL_STD_300AAC", "dot", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SRD762_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C";
    _target addPrimaryWeaponItem "Tier1_Elcan_156_C2_Docter_FDE_2D";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG_Tan";
};
case "scar_h_std":{
    ["hlc_wp_SCARH_STD", "rco", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Black";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "grcb_mag_20Rnd_SCAR_762x51_mk316_special_mix";
};
case "scar_h_std_gl":{
    ["hlc_wp_SCARH_STD_EGLM", "rco", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Black";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "grcb_mag_20Rnd_SCAR_762x51_mk316_special_mix";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};
case "scar_l_cqb_gl":{
    ["hlc_wp_SCARL_CQC_EGLM", "rco", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};
case "scar_l_cqb":{
    ["hlc_wp_SCARL_CQC", "dot", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan";
};
case "scar_l_cqb_blackout":{
    ["hlc_WP_SCARL_CQC_300AAC", "dot", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG_Tan";
};
case "scar_h_cqb":{
    ["hlc_wp_SCARH_CQC", "dot", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Black";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "grcb_mag_20Rnd_SCAR_762x51_mk316_special_mix";
};
case "scar_h_cqb_gl":{
    ["hlc_wp_SCARH_CQC_EGLM", "dot", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Black";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "grcb_mag_20Rnd_SCAR_762x51_mk316_special_mix";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};
case "scar_l_short":{
    ["hlc_wp_SCAR_PDW", "dot", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan";
};

// 5.56 CQB/SBR ----------------------------------------------------------------------------------------------
case "mk18_dot":{
    ["cgqc_gun_mk1_mk18", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
};
case "magpull":{
    ["hlc_rifle_RU556", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Tan";
    _target addPrimaryWeaponItem "Tier1_AAC_M42000_Desert";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};
case "mk18_tl":{
    ["cgqc_gun_mk1_mk18", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo_DE";
    _target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_FL";
    _target addPrimaryWeaponItem "Tier1_DD_VFG_DE";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
};

case "416_dot":{
    ["Tier1_HK416D10_SMR_MFT", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SRD762_Desert";
    _target addPrimaryWeaponItem "Tier1_10_NGAL_M603V";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2_tan";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
};

case "acre_sbr":{
    ["hlc_rifle_ACR_SBR_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};

case "fn_2000_short":{
    ["arifle_Mk20C_F", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};

// Blackout ----------------------------------------------------------------------------------------------
case "mcx_t2":{
    ["Tier1_SIG_MCX_115_Virtus_300BLK_FDE", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo_DE";
    _target addPrimaryWeaponItem "Tier1_MCX_NGAL_M603V";
    _target addPrimaryWeaponItem "Tier1_AFG_MLOK_FDE";
    _target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG";
};
case "badger":{
    ["hlc_rifle_honeybase", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "hlc_29rnd_300BLK_STANAG_S";
};
case "dissipator":{
    ["hlc_rifle_vendimus", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_AAC_762SDN6";
    _target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG";
};
case "bushmaster":{
    ["hlc_rifle_Bushmaster300", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SRD762_Black";
    _target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG";
};
case "blackjack":{
    ["hlc_rifle_bcmblackjack", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_AAC_SCARH";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "Tier1_30Rnd_762x35_300BLK_SMK_PMAG";
};

// 6.8 ACRE's ----------------------------------------------------------------------------------------------

case "acre_68_sbr":{
    ["hlc_rifle_ACR68_SBR_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "hlc_30rnd_68x43_FMJ_PMAG";
};
case "acre_68_sbr_gl":{
    ["hlc_rifle_ACR68_GL_SBR_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "hlc_30rnd_68x43_FMJ_PMAG";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};

case "acre_68_carb":{
    ["hlc_rifle_ACR68_Carb_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "hlc_30rnd_68x43_FMJ_PMAG";
};
case "acre_68_carb_gl":{
    ["hlc_rifle_ACR68_GL_Carb_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "hlc_30rnd_68x43_FMJ_PMAG";

};

case "acre_68_mid":{
    ["hlc_rifle_ACR68_MID_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "hlc_30rnd_68x43_OTM_PMAG";
};
case "acre_68_mid_gl":{
    ["hlc_rifle_ACR68_GL_mid_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "hlc_30rnd_68x43_OTM_PMAG";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};

case "acre_68_long":{
    ["hlc_rifle_ACR68_full_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
    _target addPrimaryWeaponItem "hlc_30rnd_68x43_OTM_PMAG";
};



// 5.56 Carbines ----------------------------------------------------------------------------------------------
case "sr16_dot":{
    ["Tier1_SR16_CQB_Mod2_MFT_Black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo";
    _target addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_alt_Black";
    _target addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};
case "CTAR21":{
    ["arifle_TRG20_F", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
};
case "TAR21":{
    ["arifle_TRG21_F", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
};
case "fn_2000":{
    ["arifle_Mk20_F", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};

case "m4_elcan":{
    ["cgqc_gun_mk1_m4a1blkII", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
};

case "sr16_elcan":{
    ["Tier1_SR16_Carbine_Mod2_MFT_Black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo";
    _target addPrimaryWeaponItem "Tier1_URX4_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};
case "hk416_elcan":{
    ["Tier1_HK416D145_MW13_MFT", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_AAC_M42000_Black";
    _target addPrimaryWeaponItem "Tier1_MW_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "Tier1_AFG_MLOK_Black";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
};
case "acre_carb":{
    ["hlc_rifle_ACR_Carb_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};
case "jack":{
    ["hlc_rifle_bcmjack", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_556NATO_rotexiiic_grey";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};

// 5.56 Full Rifle =================================================================
case "m16_shortdot":{
    ["rhs_weap_m16a4_imod_grip2", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
};
case "mk12_lpvo":{
    ["cgqc_gun_mk1_mk12", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "gtr_acc_AEM";
    _target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
};
case "m27_lpvo":{
    ["hlc_rifle_M27IAR", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_RotexIIIC_Grey";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
};
case "lar15":{
    ["hlc_rifle_samr2", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_PMAG";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
};

case "acre_mid":{
    ["hlc_rifle_ACR_MID_black", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
};

case "acre_spr":{
    ["hlc_rifle_ACR_full_black", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Gemtech_Halo";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black_FL";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk262_L5";
};

// 5.56 GL's =================================================================
case "mk18_gl":{
    ["cgqc_gun_mk1_mk18_gl", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};
case "416_10_gl":{
    ["rhs_weap_hk416d10_m320", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};



case "m4_gl_m320":{
    ["rhs_weap_m4_m320", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};
case "m4_gl_m320_rco":{
    ["rhs_weap_m4_m320", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};
case "416_14_gl":{
    ["rhs_weap_hk416d145_m320", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};

case "fn_2000_gl":{
    ["arifle_Mk20_GL_F", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "grcb_mag_30Rnd_556x45_Mk318_L5";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};

case "TAR21GL":{
    ["arifle_TRG21_GL_F", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
    _target addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
    _needGL = true;
};

// 7.62 CQB =================================================================
case "sa58":{
    ["hlc_rifle_falosw", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_AAC_762SDN6";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "hlc_20Rnd_762x51_barrier_fal";
};
case "g3ka4":{
    ["hlc_rifle_g3ka4", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";
};




// 7.62 Rifle =================================================================
case "socom16rifle":{
    ["rhs_weap_m14_socom_rail", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_aac_m14dcqd_silencer";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";
};
case "m14fiberglass":{
    ["rhs_weap_m14_ris_fiberglass", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_AAC_SCARH";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";
};
case "m14sopmodRifle":{
    ["hlc_rifle_m14sopmod", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SRD762_Black";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";
};



// 7.62 DMR =================================================================
case "417":{
    ["cgqc_gun_mk1_hk417", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Black";
    _target addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk_light";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
    _target addPrimaryWeaponItem "bipod_01_F_blk";
};
case "m110k5":{
    ["Tier1_M110k5_ACS", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_762_DSR";
    _target addPrimaryWeaponItem "Tier1_URX4_NGAL_M603V_FL";
    _target addPrimaryWeaponItem "Tier1_20Rnd_762x51_M118_Special_SR25_Mag";
    _target addPrimaryWeaponItem "Tier1_Harris_Bipod_MLOK_Tan";
};
case "m110k5_65":{
    ["Tier1_M110k5_ACS_65mm", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_762_DSR";
    _target addPrimaryWeaponItem "Tier1_URX4_NGAL_M603V_FL";
    _target addPrimaryWeaponItem "Tier1_20Rnd_65x48_Creedmoor_SR25_Mag";
    _target addPrimaryWeaponItem "Tier1_Harris_Bipod_MLOK_Tan";
};
case "sr25":{
    ["Tier1_SR25_EC", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_AAC_SCARH";
    _target addPrimaryWeaponItem "Tier1_SR25_LA5_Side";
    _target addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
    _target addPrimaryWeaponItem "Tier1_20Rnd_762x51_Mk316Mod0_SR25_Mag";
};
case "socom16":{
    ["rhs_weap_m14_socom_rail", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
};
case "m14sopmodDmr":{
    ["hlc_rifle_m14sopmod", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SRD762_Black";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";
};

case "m110_leupold":{
    ["Tier1_M110k1", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_762_DSR";
    _target addPrimaryWeaponItem "Tier1_20Rnd_762x51_M118_Special_SR25_Mag";
    _target addPrimaryWeaponItem "Tier1_M110_LA5_Side";
    _target addPrimaryWeaponItem "bipod_02_F_hex";
};
case "m14ebr":{
    ["rhs_weap_m14ebrri", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
    _target addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
    _target addPrimaryWeaponItem "rhs_acc_harris_swivel";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
};
case "m14dmr":{
    ["hlc_rifle_M14dmr_Rail", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Black";
    _target addPrimaryWeaponItem "hlc_acc_SF660_Barrel";
    _target addPrimaryWeaponItem "rhs_acc_harris_swivel";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
};
case "m21":{
    ["hlc_rifle_M21_Rail", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Black";
    _target addPrimaryWeaponItem "hlc_acc_SF660_Barrel";
    _target addPrimaryWeaponItem "rhs_acc_harris_swivel";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
};
case "sig556":{
    ["srifle_DMR_03_F", "lpvo"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "bipod_02_F_blk";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
};
case "scar_dmr":{
    ["hlc_wp_SSR", "lpvo", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SRD762_Desert";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
    _target addPrimaryWeaponItem "rhs_mag_20Rnd_SCAR_762x51_m118_special";
};

// MG =================================================================
case "m27": {
    ["hlc_rifle_M27IAR", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_RotexIIIC_Grey";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "rhs_mag_100Rnd_556x45_Mk262_cmag";
    _target addPrimaryWeaponItem "bipod_01_F_blk";
};
case "mk46":{
    ["cgqc_gun_mk1_mk46", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Black";
    _target addPrimaryWeaponItem "Tier1_Mk46Mod1_LA5_M600V_Black";
    _target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
    _target addPrimaryWeaponItem "Tier1_SAW_Bipod_DD";
};
case "mk46_desert":{
    ["Tier1_MK46_Mod1_Desert", "dot", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_Mk46Mod1_LA5_M600V";
    _target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
    _target addPrimaryWeaponItem "Tier1_SAW_Bipod_Desert";
};

case "minimi":{
    ["lmg_03_F", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_M";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
};
case "stoner":{
    ["LMG_Mk200_black_F", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "200Rnd_65x39_cased_Box_Tracer";
    _target addPrimaryWeaponItem "HLC_bipod_UTGShooters";
};
case "m249":{
    ["Tier1_M249_light_S_Desert", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_KAC_556_QDC_CQB_Tan";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C";
    _target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
    _target addPrimaryWeaponItem "Tier1_SAW_Bipod_2_DD_Desert";
};
case "mk48":{
    ["cgqc_gun_mk1_mk48", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SOCOM762MG_Black";
    _target addPrimaryWeaponItem "Tier1_Mk48Mod0_LA5_M600V_Black";
    _target addPrimaryWeaponItem "Tier1_250Rnd_762x51_Belt_M62_Tracer";
    _target addPrimaryWeaponItem "Tier1_SAW_Bipod_2_KAC";
};
case "mk48_desert":{
    ["Tier1_MK48_Mod0_Para_Desert", "rco", "afg"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SOCOM762MG_DE";
    _target addPrimaryWeaponItem "Tier1_Mk48Mod0_LA5_M600V";
    _target addPrimaryWeaponItem "Tier1_250Rnd_762x51_Belt_M62_Tracer";
    _target addPrimaryWeaponItem "Tier1_SAW_Bipod_2_Desert";
};

case "lwmmg":{
    ["MMG_02_black_F", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_338_black";
    _target addPrimaryWeaponItem "Tier1_Mk18_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "130Rnd_338_Mag";
    _target addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
};
case "hk121":{
    ["MMG_01_tan_F", "rco"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_93mmg_tan";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "HLC_bipod_UTGShooters";
    _target addPrimaryWeaponItem "150Rnd_93x64_Mag";

};

// Sniper =================================================================
case "m110_creed": {
    ["Tier1_M110k5_ACS_65mm"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "121_USASOC_RVPS";
    _target addPrimaryWeaponItem "Tier1_KAC_762_DSR";
    _target addPrimaryWeaponItem "Tier1_Harris_Bipod_MLOK_Tan";
    _target addPrimaryWeaponItem "Tier1_URX4_NGAL_M300C_FL";
    _target addPrimaryWeaponItem "Tier1_20Rnd_65x48_Creedmoor_SR25_Mag";

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
    _target addPrimaryWeaponItem "muzzle_snds_408";
    _target addPrimaryWeaponItem "ace_acc_pointer_green";
    _target addPrimaryWeaponItem "7Rnd_mas_can_408_Mag";
};
case "csr16":{
    ["121_USASOC_CSR_16"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "121_USASOC_MRAD";
    _target addPrimaryWeaponItem "121_USASOC_AML338_TAN";
    _target addPrimaryWeaponItem "121_USASOC_CSR_16";
    _target addPrimaryWeaponItem "121_USASOC_RVPS";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
    _target addPrimaryWeaponItem "121_338_300gr_HPBT_5rnd";
};
case "csr24":{
    ["121_USASOC_CSR_24"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "121_USASOC_MRAD";
    _target addPrimaryWeaponItem "121_USASOC_AML338_TAN";
    _target addPrimaryWeaponItem "121_USASOC_STORM_SLX_Laser";
    _target addPrimaryWeaponItem "121_USASOC_PVPS";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
    _target addPrimaryWeaponItem "121_338_300gr_HPBT_5rnd";
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
    ["121_USASOC_MRAD"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "121_USASOC_MRAD";
    _target addPrimaryWeaponItem "121_USASOC_AML338_TAN";
    _target addPrimaryWeaponItem "121_USASOC_STORM_SLX_Laser";
    _target addPrimaryWeaponItem "121_USASOC_PVPS";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
    _target addPrimaryWeaponItem "121_338_300gr_NM_10rnd";
};
case "psg1":{
    ["hlc_rifle_PSG1A1_RIS"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "optic_LRPS";
    _target addPrimaryWeaponItem "Tier1_Harris_Bipod_Black";
    _target addPrimaryWeaponItem "hlc_20rnd_762x51_Mk316_G3";
};
case "m1aebr":{
    ["pas_m14ebrri_1"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "optic_LRPS";
    _target addPrimaryWeaponItem "hlc_muzzle_AAC_SCARH";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
};
case "m2010":{
    ["rhs_weap_XM2010"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "optic_LRPS";
    _target addPrimaryWeaponItem "rhsusf_acc_M2010S_wd";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
    _target addPrimaryWeaponItem "hlc_5rnd_300WM_mk248_AWM";
};
case "m24":{
    ["rhs_weap_m24sws_wd"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_M8541_wd";
    _target addPrimaryWeaponItem "rhsusf_acc_m24_silencer_wd";
    _target addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
    _target addPrimaryWeaponItem "rhsusf_5Rnd_762x51_m118_special_Mag";
};
case "m107":{
    ["rhs_weap_M107"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "optic_LRPS";
    _target addPrimaryWeaponItem "ACE_10Rnd_127x99_AMAX_Mag";
};
case "qbu":{
    ["srifle_DMR_07_blk_F"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_M8541_mrds";
    _target addPrimaryWeaponItem "ACE_DBAL_A3_Green";
    _target addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
    _target addPrimaryWeaponItem "ACE_20Rnd_65_Creedmor_mag";
};
case "awc":{
    ["hlc_rifle_awmagnum_BL"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "optic_LRPS";
    _target addPrimaryWeaponItem "hlc_5rnd_300WM_mk248_AWM";
};


// Special guns  =====================================================
case "p90":{
    ["cgqc_gun_mk1_p90", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_570";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "optic_ACO_grn";
    _target addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
};
case "sdar":{
    ["arifle_SDAR_F"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
};
case "scar_ak":{
    ["hlc_wp_MK17IUR_762R_grip2", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Desert";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "rhssaf_30Rnd_762x39_M82_api";
};
case "ak_104":{
    ["rhs_weap_ak104_zenitco01_b33", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_762SUP_AK";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M600V_Black";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "rhssaf_30Rnd_762x39_M82_api";
};
case "slr107u":{
    ["hlc_rifle_slr107u_MTK", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_762SUP_AK";
    _target addPrimaryWeaponItem "Tier1_M4BII_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "rhssaf_30Rnd_762x39_M82_api";
};

case "sg553AK":{
    ["hlc_rifle_sg553RSB_TAC", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SandmanS_Black";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black_FL";
    _target addPrimaryWeaponItem "hlc_grip_AFG2";
    _target addPrimaryWeaponItem "rhssaf_30Rnd_762x39_M82_api";
};

// Qualification
case "qual_m16":{
    ["cgqc_gun_mk1_m16a4"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_A1_FlashHider";
    _target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
};

case "qual_mk46":{
    ["cgqc_gun_mk1_mk46", "dot"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_SAW_Bipod_DD";
    _target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch";
};

case "qual_417":{
    ["cgqc_gun_mk1_hk417"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
    _target addPrimaryWeaponItem "bipod_01_F_blk";
    _target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
};

case "qual_m24":{
    ["rhs_weap_m24sws"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_M8541";
    _target addPrimaryWeaponItem "rhsusf_acc_m24_muzzlehider_black";
    _target addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
    _target addPrimaryWeaponItem "rhsusf_5Rnd_762x51_m118_special_Mag";
};
