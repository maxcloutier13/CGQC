// === Nam ===========================================================================================
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
    _target addPrimaryWeaponItem "uns_m40mag";
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
};
case "nam_m2_scope":{
    ["uns_m2carbine"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "uns_m2carbinemag_NT";
    _target addPrimaryWeaponItem "uns_o_M84";
    _target addPrimaryWeaponItem "uns_b_m4";
};
case "nam_m14_scope": {
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
case "nam_m14": {
    ["uns_m14"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "uns_m14mag_T";
    _target addPrimaryWeaponItem "uns_b_m6";
};
// Special purpose
case "nam_pdw": {
    ["uns_pm63"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "uns_25Rnd_pm";
};
case "nam_swedishk": {
    ["uns_m45"] call CGQC_fnc_getCustomGun;
    _target addPrimaryWeaponItem "uns_m45mag";
};