 // --- ldt_2023_pilot ----------------------------------------------------------
// Pilot 2023 loadout
params [["_target", player], ["_variant", "h_pilot"], ["_gunVariant", "p90"]];
diag_log format ["[CGQC_FNC] ldt_2023_pilot %1 started", _target];

// Basic setup
[] call CGQC_ldt_2023_basic;

_hats = [""];
// === Clothing ==========================================================================================================
switch (_variant) do {
	case "h_pilot": {_hats = ["cgqc_helmet_heli_black"];};
	case "h_crew": {_hats = ["cgqc_helmet_crew_black"];};
};

_goggles = ["G_mas_can_wrap_B"];
_vests = ["cgqc_vest_mk1_pilot_black"];
_uniforms = ["cgqc_uniform_mk1_helipilot"];
_rucks = ["CGQC_units_mk1_4_Pilot_heli_pack"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "p90": {["p90"] spawn CGQC_fnc_switchPrimary;};
};

for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellPurple"};

diag_log "[CGQC_FNC] ldt_2023_pilot done";