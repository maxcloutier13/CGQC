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
        _target addItemToBackpack "cgqc_bandolier_ammo";
	};
    case "pmct_lead": {
        ["backpack", "cgqc_pack_mk1_radiobag_black"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "azm_bft_tx";
        _target addItemToUniform "azm_bft_rx";
        _target addItemToUniform "ACRE_PRC152";
        _target addItemToBackpack "cgqc_bandolier_ammo";
	};
    case "pmct_tl": {
        ["backpack", "cgqc_pack_mk1_radiobag_black"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "azm_bft_tx";
        _target addItemToUniform "azm_bft_rx";
        _target addItemToUniform "ACRE_PRC152";
        _target addItemToBackpack "cgqc_bandolier_ammo";
	};
    case "pmct_gren": {
        for "_i" from 1 to 5 do {_target addItemToBackpack "hlc_VOG25_AK"};
        for "_i" from 1 to 3 do {_target addItemToBackpack "hlc_GRD_Red"};
        for "_i" from 1 to 3 do {_target addItemToBackpack "hlc_GRD_green"};
        _target addItemToBackpack "cgqc_bandolier_ammo";
	};
    case "pmct_autorifleman": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
        _target addItemToBackpack "cgqc_bandolier_ammo";
	};
    case "pmct_mg": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
        ["hat", "rhs_altyn_bala"] call CGQC_fnc_switchStuff;
        _target removeItem "ACE_EntrenchingTool";
	};
    case "pmct_at": {
        ["backpack", "rhs_rpg_2"] call CGQC_fnc_switchStuff;
        _target addWeapon "rhs_weap_rpg7";
        _target addSecondaryWeaponItem "RPG7_F";
        for "_i" from 1 to 3 do {_target addItemToBackpack "RPG7_F"};
        _target removeItem "ACE_EntrenchingTool";
	};
    case "pmct_eng": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "ACE_M26_Clacker";
        _target addItemToBackpack "rhssaf_tm500_mag";
        _target addItemToBackpack "ToolKit";
        _target addItemToBackpack "ACE_DefusalKit";
        for "_i" from 1 to 2 do {_target addItemToBackpack "rhssaf_tm200_mag"};
        for "_i" from 1 to 4 do {_target addItemToBackpack "rhssaf_tm100_mag"};
        _target addItemToBackpack "cgqc_bandolier_ammo";
	};
    case "pmct_medic": {
        ["backpack", "B_Carryall_cbr"] call CGQC_fnc_switchStuff;
        _target addItemToBackpack "cgqc_items_medkit";
        _target removeItem "ACE_EntrenchingTool";
	};
    case "pmct_lifesaver": {
        ["backpack", "B_Kitbag_cbr"] call CGQC_fnc_switchStuff;
		for "_i" from 1 to 20 do {_target addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {_target addItemToBackpack "FF_Painkiller";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_splint";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_salineIV_500";};
        _target addItemToBackpack "cgqc_bandolier_ammo";
	};
    case "pmct_drone": {
        ["backpack", "B_UAV_01_backpack_F"] call CGQC_fnc_switchStuff;
        for "_i" from 1 to 2 do {_target addItemToVest "ACE_UAVBattery";};

	};
    case "pmct_sniper": {
        ["goggles", "rhssaf_veil_Green"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "ACE_RangeCard";
        _target addItemToUniform "ACE_Kestrel4500";
        _target addItemToUniform "ACE_ATragMX";
        _target addItemToUniform "ACE_Flashlight_KSF1";
        _target removeWeapon (binocular _target);
        _target addWeapon "ACE_Vector";
        _target addItemToUniform "ACE_Flashlight_KSF1";
        _target addItemToBackpack "cgqc_bandolier_ammo";
	};
    case "pmct_marks": {
        ["goggles", "rhssaf_veil_Green"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "ACE_RangeCard";
        _target removeWeapon (binocular _target);
        _target addWeapon "ACE_Vector";
        _target addItemToBackpack "cgqc_bandolier_ammo";
        _target addItemToUniform "ACE_Flashlight_KSF1";
	};
    case "pmct_driver": {
        ["vest", "cgqc_vest_mk1_driver"] call CGQC_fnc_switchStuff;
        ["backpack", "cgqc_pack_mk1_magic"] call CGQC_fnc_switchStuff;
        ["hat", "rhs_tsh4_ess_bala"] call CGQC_fnc_switchStuff;
        removeGoggles _target;
	};
    case "pmct_crew": {
        ["vest", "cgqc_vest_mk1_driver"] call CGQC_fnc_switchStuff;
        ["backpack", "cgqc_pack_mk1_magic"] call CGQC_fnc_switchStuff;
        ["hat", "rhs_tsh4_ess_bala"] call CGQC_fnc_switchStuff;
        removeGoggles _target;
	};
    case "pmct_zeus": {
        ["backpack", "cgqc_pack_mk1_magic_zeus"] call CGQC_fnc_switchStuff;
        ["hat", "H_Watchcap_blk"] call CGQC_fnc_switchStuff;
        ["goggles", "rhs_facewear_6m2_1"] call CGQC_fnc_switchStuff;
    };
};

// === Primary ==========================================================================================================
LOG_1("[pmct_variants] gunvariant: %1", _gunVariant);

switch (_gunVariant) do {
	case "ak12": {
        _target addWeapon "cgqc_gun_pmct_ak12";
        _target addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
    };
    case "ak12short": {
        _target addWeapon "cgqc_gun_pmct_aku12";
        _target addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
    };
	case "ak12gl": {
        _target addWeapon "cgqc_gun_pmct_ak12gl";
        _target addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
        _target addPrimaryWeaponItem "hlc_VOG25_AK";
        for "_i" from 1 to 5 do {_target addItemToVest "hlc_VOG25_AK"};
        for "_i" from 1 to 5 do {_target addItemToBackpack "hlc_VOG25_AK"};
        for "_i" from 1 to 3 do {_target addItemToBackpack "hlc_GRD_White"};
    };
    case "rpk12": {
        _target addWeapon "cgqc_gun_pmct_rpk12";
        _target addPrimaryWeaponItem "grcb_60Rnd_545x39_mix";
    };
    case "mg3": {
        _target addWeapon "cgqc_gun_pmct_mg3";
        _target addPrimaryWeaponItem "Tier1_250Rnd_762x51_Belt_M80A1_EPR";
    };
    case "svd": {
        _target addWeapon "cgqc_gun_pmct_svd";
        _target addPrimaryWeaponItem "rhs_10Rnd_762x54mmR_7N14";
    };
    case "awm": {
        _target addWeapon "cgqc_gun_pmct_AWM";
        _target addPrimaryWeaponItem "hlc_5rnd_300WM_FMJ_AWM";
    };
    case "ak12zeus": {
        _target addWeapon "cgqc_gun_pmct_aku12_zeus";
        _target addPrimaryWeaponItem "hlc_30Rnd_545x39_B_AK_Black";
    };
};

LOG("[pmct_variants] Adding mags");
// Add mags
[_target] call CGQC_fnc_addMags;

// Radio sides default
["defaultLR"] call CGQC_fnc_setRadios;

LOG("[pmct_variants] done");