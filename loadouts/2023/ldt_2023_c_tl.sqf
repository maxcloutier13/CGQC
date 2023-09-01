 // --- ldt_2023_c_teamleader ----------------------------------------------------------
// TL 2023 loadout
params [["_target", player], ["_variant", "carbine"]];
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
switch (_variant) do {
	case "carbine": {["m4_gl_m320"] call CGQC_fnc_switchPrimary;};
	case "cqb": {["mk18_gl"] call CGQC_fnc_switchPrimary;};
	case "noGL": {["mk18_tl"] call CGQC_fnc_switchPrimary;};
};

// === Vest Items ====================================================================================================

// === Backpack Items ====================================================================================================
for "_i" from 1 to 2 do {player addItemToBackpack "tsp_stickCharge_auto_mag"};
for "_i" from 1 to 2 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};

diag_log "[CGQC_FNC] ldt_2023_c_teamleader done";