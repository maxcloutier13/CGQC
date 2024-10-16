#include "\CGQC\script_component.hpp"
// --- ldt_2023_c_command ----------------------------------------------------------
// TL 2023 loadout
params [["_target", player], ["_variant", "tl"], ["_gunVariant", "carbine"]];
LOG("[ldt_2023_c_command] started");

// Basic setup
[] call CGQC_ldt_2023_basic;
// Check for customLoadout
_nvg = "JAS_GPNVG18_blk";
switch (cgqc_customLoadout) do {
	case "afg": {
		_nvg = "JAS_GPNVG18_tan";
		_gunVariant = "afg"
	};
};

// === Clothing ==========================================================================================================
_hats = [""];
_goggles = [""];
_vests = [""];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_radiobag"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;


// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "carbine": {["m4_gl_m320_rco"] call CGQC_fnc_switchPrimary;};
	case "cqb": {["mk18_gl"] call CGQC_fnc_switchPrimary;};
	case "noGL": {["mk18_tl"] call CGQC_fnc_switchPrimary;};
	case "m4": {["m4_elcan"] call CGQC_fnc_switchPrimary;};
	case "mk12": {["mk12_lpvo"] call CGQC_fnc_switchPrimary;};
	case "afg": {["scar_l_std_gl"] call CGQC_fnc_switchPrimary;};
};

switch (_variant) do {
	case "tl": {
		["2023_basic","cgqc_item_laserdesignator", _nvg] call CGQC_fnc_getLinkedItems;
	};
	case "sl": {
		_target removeItems "ACE_EntrenchingTool";
		_target removeItems "ACE_Canteen";
		_target addItem "ACE_M26_Clacker";
		// === Drones ================================
		["Rev_darter"] call CGQC_fnc_getDrone;
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		["2023_command","cgqc_item_laserdesignator", _nvg] call CGQC_fnc_getLinkedItems;
	};
	case "xo": {
		_target removeItems "ACE_EntrenchingTool";
		_target removeItems "ACE_Canteen";
		_target addItem "ACE_M26_Clacker";
		// === Drones ================================
		["Rev_darter"] call CGQC_fnc_getDrone;
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		["2023_command","cgqc_item_laserdesignator", _nvg] call CGQC_fnc_getLinkedItems;
	};
	case "hq": {
		_target removeItems "ACE_EntrenchingTool";
		// === Drones ================================
		["Rev_darter"] call CGQC_fnc_getDrone;
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		// === Comms =================================
		_target addItemToBackpack "ACRE_VHF30108SPIKE";
		["2023_command","cgqc_item_laserdesignator", _nvg] call CGQC_fnc_getLinkedItems;
		// Switch android for tablet
		_target addItemToUniform "ItemcTab";
		_target removeItem "ItemAndroid";
	};
	case "jtac": {
		_target addItem "ACE_ATragMX";
		_target addItem "ACE_Kestrel4500";
		_target addItem "ACE_M26_Clacker";
		["2023_command","cgqc_item_laserdesignator", _nvg] call CGQC_fnc_getLinkedItems;
		// === Stuff ================================
		["Rev_darter"] call CGQC_fnc_getDrone;
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		_target addItemToBackpack "ACE_Tripod";
		_target addItemToBackpack "ACE_Vector";
		// === Explosives ================================
		_target addItemToBackpack "ACE_DefusalKit";
		_target addItemToBackpack "rhsusf_m112_mag";
		_target addItemToBackpack "rhsusf_mine_m14_mag";
		["scar_dmr"] call CGQC_fnc_switchPrimary;
	};
	case "zeus": {
		if (_ruck isNotEqualTo "") then {["backpack", "cgqc_pack_mk1_magic_zeus"] call CGQC_fnc_switchStuff;};
	};
};

// Load camo and equipment from var
[] call CGQC_ldt_camo;

LOG("[ldt_2023_command] done");