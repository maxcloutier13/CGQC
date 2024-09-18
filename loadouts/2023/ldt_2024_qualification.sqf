#include "\CGQC\script_component.hpp"
// --- ldt_2023_i_qualification ----------------------------------------------------------
// Qualification loadout
params [["_target", player], ["_variant", "service"]];
LOG_1("[ldt_2023_i_qualification] %1 started", _variant);
removeAllItems _target;
removeAllWeapons _target;
removeAllAssignedItems _target;
// === Clothing ==========================================================================================================
_hats = ["cgqc_cap_green"];
_goggles = ["G_mas_can_gog"];
_vests = ["cgqc_vest_mk1_tan"];
_uniforms = ["cgqc_uniform_mk1"];
_rucks = ["cgqc_pack_mk1_magic"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;


// Super basic stuff
_essentials = ["ACE_EarPlugs", "ACE_RangeCard"];
_linkedBase = ["ItemWatch", "ItemMap", "ItemCompass"];
_binos = "cgqc_item_rangefinder";
{player addItem _x;} forEach _essentials;
{player linkItem _x;} forEach _linkedBase;
player addWeapon _binos;

switch (_variant) do {
	case "service": {
		// Service rifle and a single mag is all ya need.
		["cgqc_gun_mk1_m16a4"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "hlc_muzzle_A1_FlashHider";
		_target addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
	};
	case "mg": {
		// Machinegun
		["cgqc_gun_mk1_mk46"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_SAW_Bipod_DD";
		_target addPrimaryWeaponItem "rhsusf_200Rnd_556x45_mixed_soft_pouch";
	};
	case "dmr": {
		["cgqc_gun_mk1_hk417"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "Tier1_Razor_Gen3_110_Geissele_Docter";
		_target addPrimaryWeaponItem "bipod_01_F_blk";
		_target addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
	};
	case "sniper": {
		["rhs_weap_m24sws"] call CGQC_fnc_getCustomGun;
		_target addPrimaryWeaponItem "rhsusf_acc_M8541";
		_target addPrimaryWeaponItem "rhsusf_acc_m24_muzzlehider_black";
		_target addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
		_target addPrimaryWeaponItem "rhsusf_5Rnd_762x51_m118_special_Mag";
	};
};


LOG(" ldt_2023_i_qualification done");