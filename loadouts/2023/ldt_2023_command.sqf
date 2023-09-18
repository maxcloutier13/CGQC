 // --- ldt_2023_c_command ----------------------------------------------------------
// TL 2023 loadout
params [["_target", player], ["_variant", "tl"], ["_gunVariant", "carbine"]];
diag_log format ["[CGQC_FNC] ldt_2023_c_teamleader %1 started", _target];

// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = [""];
_goggles = [""];
_vests = [""];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_radiobag"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_command","cgqc_item_laserdesignator","JAS_GPNVG18_Full_blk_TI"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "carbine": {["m4_gl_m320"] spawn CGQC_fnc_switchPrimary;};
	case "cqb": {["mk18_gl"] spawn CGQC_fnc_switchPrimary;};
	case "noGL": {["mk18_tl"] spawn CGQC_fnc_switchPrimary;};
	case "lpvo": {["m4_lpvo"] spawn CGQC_fnc_switchPrimary;};
	case "mk12": {["mk12_lpvo"] spawn CGQC_fnc_switchPrimary;};
};

switch (_variant) do {
	case "tl": {
		for "_i" from 1 to 2 do {player addItemToBackpack "tsp_stickCharge_auto_mag"};
		for "_i" from 1 to 2 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};
	};
	case "sl";
	case "hq": {
		player removeItems "ACE_EntrenchingTool";
		// === Drones ================================
		player addItemToBackpack "Rev_darter_item";
		// === Comms =================================
		player addItemToBackpack "ACRE_VHF30108SPIKE";

	};
	case "jtac": {
		player addItem "ACE_ATragMX";
		player addItem "ACE_Kestrel4500";
		player addItem "ACE_M26_Clacker";
		// === Stuff ================================
		player addItemToBackpack "Rev_darter_item";
		player addItemToBackpack "ACE_Tripod";
		player addItemToBackpack "ACE_Vector";
		// === Explosives ================================
		player addItemToBackpack "ACE_DefusalKit";
		player addItemToBackpack "rhsusf_m112_mag";
		player addItemToBackpack "rhsusf_mine_m14_mag";
	};
	case "zeus": {
		if (_ruck isNotEqualTo "") then {["backpack", "cgqc_pack_mk1_magic_zeus"] call CGQC_fnc_switchStuff;};
	};
};

diag_log "[CGQC_FNC] ldt_2023_c_hq done";











// === Vest Items ====================================================================================================

// === Backpack Items ====================================================================================================
for "_i" from 1 to 2 do {player addItemToBackpack "tsp_stickCharge_auto_mag"};
for "_i" from 1 to 2 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};

diag_log "[CGQC_FNC] ldt_2023_c_teamleader done";