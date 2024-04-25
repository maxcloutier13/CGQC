#include "\CGQC\script_component.hpp"
// --- ldt_2023_s_at ----------------------------------------------------------
// Rifleman 2023 loadout
params [["_target", player], ["_variant", "maaws"], ["_gunVariant", "rco"]];
LOG(" ldt_2023_s_at started");
// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1"];
_goggles = [""];
_vests = ["cgqc_vest_mk1_tan_lr"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_carryall"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
[_gunVariant] spawn CGQC_fnc_switchPrimary;

// Remove entrenching tool
player removeItems "ACE_EntrenchingTool";

switch (_variant) do {
	case "maaws": {
		["cgqc_gun_mk1_MAAWS"] call CGQC_fnc_getCustomGun;
        player addSecondaryWeaponItem "MRAWS_HEAT_F";
		player addItemToBackpack "MRAWS_HEAT_F";
		player addItemToBackpack "MRAWS_HEAT_F";
	};
	case "javelin": {
		["cgqc_gun_mk1_Javelin"] call CGQC_fnc_getCustomGun;
        player addSecondaryWeaponItem "jav_AT_mas_can";
		player addItemToBackpack "jav_AT_mas_can";
		player addItemToBackpack "jav_AT_mas_can";
	};
};

LOG(" ldt_2023_s_at done");