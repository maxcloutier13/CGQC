 // --- ldt_2023_s_mg ----------------------------------------------------------
// MG 2023 loadout
params [["_target", player], ["_variant", ""], ["_gunVariant", "mk46"]];
diag_log format ["[CGQC_FNC] ldt_2023_s_mg %1 started", _target];

// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1"];
_goggles = [""];
_vests = ["cgqc_vest_mk1_tan_lr"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_kitbag"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "mk46": {["mk46"] spawn CGQC_fnc_switchPrimary;};
	case "mk48": {["mk48"] spawn CGQC_fnc_switchPrimary;};
	case "m27": {["m27"] spawn CGQC_fnc_switchPrimary;};
	case "lwmmg": {["lwmmg"] spawn CGQC_fnc_switchPrimary;};
};

diag_log "[CGQC_FNC] ldt_2023_s_mg done";