// === SWAT ===========================================================================================
case "swat_p90":{
    ["cgqc_gun_mk1_p90", "dot"] call CGQC_fnc_getCustomGun;
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