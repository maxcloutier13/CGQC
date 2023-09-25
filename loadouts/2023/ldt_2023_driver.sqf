 // --- ldt_2023_driver ----------------------------------------------------------
// Driver 2023 loadout
params [["_target", player], ["_variant", "t_driver"], ["_gunVariant", "p90"]];
diag_log format ["[CGQC_FNC] ldt_2023_driver %1 started", _target];

// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1_tank"];
_goggles = ["G_mas_can_wrap_gog_B"];
_vests = ["cgqc_vest_mk1_driver"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_tank_driver"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "p90": {["p90"] spawn CGQC_fnc_switchPrimary;};
};

// === Backpack =============================================================================================
player addItemToBackpack "ToolKit";

diag_log "[CGQC_FNC] ldt_2023_driver done";