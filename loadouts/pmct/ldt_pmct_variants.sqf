#include "\CGQC\script_component.hpp"
// --- pmct_variants ----------------------------------------------------------
// PMCT loadout
params [["_target", player], ["_variant", "tl"], ["_gunVariant", "ak12"]];
LOG("[pmct_variants] started");

// Basic setup
[] call CGQC_ldt_pmct_basic;

switch (_variant) do {
    case "pmct_rifle": {
        for "_i" from 1 to 2 do {_target addItemToVest "rhs_mag_rgd5"};
	};
    case "pmct_lead": {
        ["backpack", "cgqc_pack_mk1_radiobag_black"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "azm_bft_tx";
        _target addItemToUniform "azm_bft_rx";
        _target addItemToUniform "ACRE_PRC152";
        _target addItemToUniform "ACRE_PRC152";
	};
    case "pmct_tl": {
        ["backpack", "cgqc_pack_mk1_radiobag_black"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "azm_bft_tx";
        _target addItemToUniform "azm_bft_rx";
        _target addItemToUniform "ACRE_PRC152";
	};
    case "pmct_gren": {
        for "_i" from 1 to 5 do {_target addItemToBackpack "hlc_VOG25_AK"};
        for "_i" from 1 to 3 do {_target addItemToBackpack "hlc_GRD_Red"};
        for "_i" from 1 to 3 do {_target addItemToBackpack "hlc_GRD_green"};
	};
    case "pmct_autorifleman": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
	};
    case "pmct_mg": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
        ["hat", "rhs_altyn_bala"] call CGQC_fnc_switchStuff;
	};
    case "pmct_at": {
        ["backpack", "rhs_rpg_2"] call CGQC_fnc_switchStuff;
        _target addWeapon "rhs_weap_rpg7";
        _target addSecondaryWeaponItem "RPG7_F";
        for "_i" from 1 to 3 do {_target addItemToBackpack "RPG7_F"};
	};
    case "pmct_eng": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "ACE_M26_Clacker";
        _target addItemToBackpack "rhssaf_tm500_mag";
        _target addItemToBackpack "ToolKit";
        _target addItemToBackpack "ACE_DefusalKit";
        for "_i" from 1 to 2 do {_target addItemToBackpack "rhssaf_tm200_mag"};
        for "_i" from 1 to 4 do {_target addItemToBackpack "rhssaf_tm100_mag"};
	};
    case "pmct_medic": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
        _target addItemToBackpack "cgqc_items_medkit";
	};
    case "pmct_lifesaver": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
		for "_i" from 1 to 20 do {_target addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {_target addItemToBackpack "FF_Painkiller";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_splint";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_salineIV_500";};
	};
    case "pmct_drone": {
        ["backpack", "B_UAV_01_backpack_F"] call CGQC_fnc_switchStuff;
        for "_i" from 1 to 2 do {_target addItemToVest "ACE_UAVBattery";};

	};
    case "pmct_sniper": {
        ["goggles", "rhssaf_veil_Green"] call CGQC_fnc_switchStuff;
	};
    case "pmct_marks": {
        ["goggles", "rhssaf_veil_Green"] call CGQC_fnc_switchStuff;
	};
    case "pmct_driver": {
        ["vest", "cgqc_vest_mk1_driver"] call CGQC_fnc_switchStuff;
        ["backpack", "cgqc_pack_mk1_magic"] call CGQC_fnc_switchStuff;
        ["hat", "rhs_tsh4_ess_bala"] call CGQC_fnc_switchStuff;
        ["goggles", "rhs_facewear_6m2_1"] call CGQC_fnc_switchStuff;
	};
    case "pmct_crew": {
        ["vest", "cgqc_vest_mk1_driver"] call CGQC_fnc_switchStuff;
        ["backpack", "cgqc_pack_mk1_magic"] call CGQC_fnc_switchStuff;
        ["hat", "rhs_tsh4_ess_bala"] call CGQC_fnc_switchStuff;
        ["goggles", "rhs_facewear_6m2_1"] call CGQC_fnc_switchStuff;
	};
    case "pmct_zeus": {
		if (_ruck isNotEqualTo "") then {["backpack", "cgqc_pack_mk1_magic_zeus"] call CGQC_fnc_switchStuff;};
    };
};

// === Primary ==========================================================================================================
LOG_1("[pmct_variants] gunvariant: %1", _gunVariant);

switch (_gunVariant) do {
	case "ak12": {
        ["cgqc_gun_pmct_ak12", "none", "", false] call CGQC_fnc_getCustomGun;
        player addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
    };
    case "ak12short": {
        ["cgqc_gun_pmct_aku12", "none", "", false] call CGQC_fnc_getCustomGun;
        player addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
    };
	case "ak12gl": {
        ["cgqc_gun_pmct_ak12gl", "none", "", false] call CGQC_fnc_getCustomGun;
        player addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
        player addPrimaryWeaponItem "hlc_VOG25_AK";
        for "_i" from 1 to 5 do {_target addItemToVest "hlc_VOG25_AK"};
        for "_i" from 1 to 5 do {_target addItemToBackpack "hlc_VOG25_AK"};
        for "_i" from 1 to 3 do {_target addItemToBackpack "hlc_GRD_White"};
    };
    case "rpk12": {
        ["cgqc_gun_pmct_rpk12", "none", "", false] call CGQC_fnc_getCustomGun;
        player addPrimaryWeaponItem "grcb_60Rnd_545x39_mix";
    };
    case "mg3": {
        ["cgqc_gun_pmct_mg3", "none", "", false] call CGQC_fnc_getCustomGun;
        player addPrimaryWeaponItem "Tier1_250Rnd_762x51_Belt_M80A1_EPR";
    };
    case "svd": {
        ["cgqc_gun_pmct_svd", "none", "", false] call CGQC_fnc_getCustomGun;
        player addPrimaryWeaponItem "rhs_10Rnd_762x54mmR_7N14";
    };
    case "awm": {
        ["cgqc_gun_pmct_AWM", "none", "", false] call CGQC_fnc_getCustomGun;
        player addPrimaryWeaponItem "hlc_5rnd_300WM_FMJ_AWM";
    };
    case "ak12zeus": {
        ["cgqc_gun_pmct_aku12_zeus", "none", "", false] call CGQC_fnc_getCustomGun;
        player addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
    };
};

LOG("[pmct_variants] Adding mags");
// Add mags
[_target] call CGQC_fnc_addMags;

LOG("[pmct_variants] done");