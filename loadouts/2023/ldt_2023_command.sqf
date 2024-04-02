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
		for "_i" from 1 to 2 do {_target addItemToBackpack "tsp_stickCharge_auto_mag"};
		for "_i" from 1 to 2 do {_target addItemToBackpack "tsp_popperCharge_auto_mag"};
		["2023_basic","cgqc_item_laserdesignator","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
	};
	case "sl": {
		_target removeItems "ACE_EntrenchingTool";
		_target removeItems "ACE_Canteen";
		_target addItem "ACE_M26_Clacker";
		// === Drones ================================
		_target addItemToBackpack "Rev_darter_item";
		_target addItemToBackpack "sps_black_hornet_01_Static_F";
		["2023_command","cgqc_item_laserdesignator","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
	};
	case "xo": {
		_target removeItems "ACE_EntrenchingTool";
		_target removeItems "ACE_Canteen";
		_target addItem "ACE_M26_Clacker";
		// === Drones ================================
		_target addItemToBackpack "Rev_darter_item";
		_target addItemToBackpack "sps_black_hornet_01_Static_F";
		["2023_command","cgqc_item_laserdesignator","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
	};
	case "hq": {
		_target removeItems "ACE_EntrenchingTool";
		// === Drones ================================
		_target addItemToBackpack "Rev_darter_item";
		_target addItemToBackpack "sps_black_hornet_01_Static_F";
		// === Comms =================================
		_target addItemToBackpack "ACRE_VHF30108SPIKE";
		["2023_command","cgqc_item_laserdesignator","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
	};
	case "jtac": {
		_target addItem "ACE_ATragMX";
		_target addItem "ACE_Kestrel4500";
		_target addItem "ACE_M26_Clacker";
		// === Stuff ================================
		_target addItemToBackpack "Rev_darter_item";
		_target addItemToBackpack "ACE_Tripod";
		_target addItemToBackpack "ACE_Vector";
		// === Explosives ================================
		_target addItemToBackpack "ACE_DefusalKit";
		_target addItemToBackpack "rhsusf_m112_mag";
		_target addItemToBackpack "rhsusf_mine_m14_mag";
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