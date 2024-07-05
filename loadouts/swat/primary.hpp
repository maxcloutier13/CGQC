// === SWAT ===========================================================================================
case "swat_shotgun":{
    ["sgun_mas_can_benelli_F"] call CGQC_fnc_getCustomGun;
    player addPrimaryWeaponItem "7Rnd_mas_can_12Gauge_Slug";
};

case "swat_mp5k":{
    ["hlc_smg_mp5k_PDW"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "hlc_30Rnd_9x19_SD_MP5";
};
case "swat_mp7":{
    ["cgqc_gun_mk1_mp7"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_L";
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "40Rnd_46x30SD_mas_can_mag";
};

case "swat_p90":{
    ["cgqc_gun_mk1_p90"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "muzzle_snds_570";
    _target addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
    _target addPrimaryWeaponItem "Tier1_MicroT2_Low_Black";
    _target addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
};

case "swat_blk":{
    ["hlc_rifle_honeybase"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "hlc_29rnd_300BLK_STANAG_S";
};

case "swat_mp5sd6":{
    ["hlc_smg_mp5sd6"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "hlc_30Rnd_9x19_SD_MP5";
};
case "swat_mp510":{
    ["hlc_mp510_tac"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "hlc_30Rnd_10mm_JHP_MP5";
};
case "swat_mp5a5":{
    ["hlc_smg_mp5N_tac"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "hlc_grip_SAW_Grip1";
    _target addPrimaryWeaponItem "hlc_30Rnd_9x19_GD_MP5";
};
case "swat_mp5n":{
    ["hlc_smg_9mmar"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "hlc_30Rnd_9x19_GD_MP5";
    _target addPrimaryWeaponItem "rhs_mag_m4009";
    _target addItemToVest "rhs_mag_m4009";
    _target addItemToVest "rhs_mag_m4009";
    _target addItemToVest "rhs_mag_m4009";
    _target addItemToVest "1Rnd_Smoke_Grenade_shell";
    _target addItemToVest "1Rnd_Smoke_Grenade_shell";
    _target addItemToBackpack "rhs_mag_m4009";
    _target addItemToBackpack "rhs_mag_m4009";
    _target addItemToBackpack "rhs_mag_m4009";
    _target addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";
    _target addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
};
case "swat_416":{
    ["hlc_rifle_416D10_ptato"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "Tier1_NGAL_Side";
    _target addPrimaryWeaponItem "hlc_muzzle_556NATO_rotexiiic_tan";
    _target addPrimaryWeaponItem "hlc_30rnd_556x45_S_L5";
};
case "swat_scarsc":{
    ["hlc_wp_SCAR_PDW_Blk"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
    _target addPrimaryWeaponItem "Tier1_SCAR_NGAL_M603V_FL";
    _target addPrimaryWeaponItem "Tier1_AAC_M42000_Black";
    _target addPrimaryWeaponItem "rhsusf_acc_grip2";
    _target addPrimaryWeaponItem "hlc_30rnd_556x45_S_EMAG";
};
case "swat_socom":{
    ["rhs_weap_m14_socom_rail"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_aac_m14dcqd_silencer";
    _target addPrimaryWeaponItem "Tier1_Shortdot_Geissele_Docter_Black_PIP";
    _target addPrimaryWeaponItem "hlc_20Rnd_762x51_S_M14";
    _target addPrimaryWeaponItem "rhsusf_acc_m14_bipod";
};
case "swat_m24":{
    ["rhs_weap_m24sws"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4";
    _target addPrimaryWeaponItem "rhsusf_5Rnd_762x51_m118_special_Mag";
    _target addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
};
case "swat_psg1":{
    ["hlc_rifle_PSG1A1_RIS"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhsusf_acc_M8541_low";
    _target addPrimaryWeaponItem "121_USASOC_Atlas";
    _target addPrimaryWeaponItem "hlc_20rnd_762x51_S_G3";
};
case "swat_awm":{
    ["hlc_rifle_awmagnum_BL"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "optic_LRPS";
    _target addPrimaryWeaponItem "hlc_5rnd_300WM_mk248_AWM";
};



