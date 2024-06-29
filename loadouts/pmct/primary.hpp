// PMC-T
case "ak12":{
    ["hlc_rifle_ak12"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_SF3P_762R";
    _target addPrimaryWeaponItem "rhs_acc_1p87";
    _target addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";
    _target addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
};
case "ak12_gl":{
    ["hlc_rifle_ak12GL"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_SF3P_762R";
    _target addPrimaryWeaponItem "rhs_acc_1p87";
    _target addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";
    _target addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
    _target addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
    _target addPrimaryWeaponItem "hlc_VOG25_AK";
};
case "ak12_s":{
    ["hlc_rifle_aku12"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_SF3P_762R";
    _target addPrimaryWeaponItem "rhs_acc_1p87";
    _target addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";
    _target addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
};
case "rpk12":{
    ["hlc_rifle_RPK12"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "hlc_muzzle_SF3P_762R";
    _target addPrimaryWeaponItem "rhs_acc_1p87";
    _target addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";
    _target addPrimaryWeaponItem "grcb_60Rnd_545x39_mix";
};
case "mg3":{
    ["hlc_lmg_MG3KWS_b"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhs_acc_1p87";
    _target addPrimaryWeaponItem "Tier1_250Rnd_762x51_Belt_M80A1_EPR";
};
case "svd":{
    ["rhs_weap_svdp_npz"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "optic_DMS";
    _target addPrimaryWeaponItem "rhs_10Rnd_762x54mmR_7N14";
};
case "awm":{
    ["hlc_rifle_awmagnum_BL"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "rhs_acc_dh520x56";
    _target addPrimaryWeaponItem "hlc_5rnd_300WM_FMJ_AWM";
};