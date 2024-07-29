#include "\CGQC\script_component.hpp"
// --- ldt_2023_s_eng ----------------------------------------------------------
// Engineer 2023 loadout
params [["_target", player], ["_variant", "engineer"], ["_gunVariant", "carbine"]];
LOG(" ldt_2023_s_eng started");
// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1"];
_goggles = [""];
_vests = ["cgqc_vest_mk1_tan_ar"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_carryall"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// Switch for UAV
player unlinkItem "ItemGPS";
player linkItem "B_UavTerminal";

// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "carbine": {["m4_elcan"] spawn CGQC_fnc_switchPrimary;};
};

// Common items
player addItemToVest "ACE_DefusalKit";
player addItemToVest "ACE_M26_Clacker";

switch (_variant) do {
	case "engineer": {
		player addWeapon "ACE_VMH3";
		// === Repair/building items ====================================================================================================
		player addItemToBackpack "ToolKit";
		player addItemToBackpack "ACE_Fortify";
		player addItemToBackpack "ACE_SpraypaintGreen";
		player addItemToBackpack "ACE_SpraypaintRed";
		// Breaching stuf
		player addItemToBackpack "tsp_frameCharge_mag";
		player addItemToBackpack "tsp_breach_stick_mag";
		player addItemToBackpack "tsp_breach_stick_mag";
		player addItemToBackpack "tsp_breach_popper_mag";
		player addItemToBackpack "tsp_breach_popper_mag";
	};
	case "saboteur": {
		// === Explosives ================================
		for "_i" from 1 to 4 do { player addItemToBackpack "rhsusf_m112_mag"};
		for "_i" from 1 to 4 do { player addItemToBackpack "SLAMDirectionalMine_Wire_Mag"};
		for "_i" from 1 to 4 do { player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag"};
		player addItemToBackpack "ATMine_Range_Mag";
	};
	case "demolition": {
		// === Explosives ================================
		for "_i" from 1 to 6 do { player addItemToBackpack "rhsusf_m112x4_mag"};
		player addItemToBackpack "ATMine_Range_Mag";
	};
};

LOG(" ldt_2023_s_eng done");