// --- checkLoadout ----------------------------------------------------------
// Check if a unit has a fixed loadout and sets it if it's the case 
params ["_type", ["_switch", true]];
diag_log format ["[CGQC_FNC] checkLoadout %1 started", _type];

_found = false;
_switchRole = "";
_section = 1;

switch (_type) do {
	// == Training ================================================================
	case "CGQC_Soldat_Base";
	case "CGQC_Officer_Base": {
		_found = true;
		[] call CGQC_fnc_initTraining;
	};
	// == Command ================================================================
	//case "CGQC_units_mk1_0_HQ":{
	//	["hq", 1, true] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf";
	//};
	// == Infantry ================================================================
	case "CGQC_units_vanilla_rifleman":{
		_found = true;
		_switchRole = "vanilla_rifleman";	
	};
	case "CGQC_units_vanilla_tl":{
		_found = true;
		_switchRole = "vanilla_tl";	
	};
};

if (_found) then {
	diag_log "[CGQC_FNC] Loadout found. Switching.";
	[_switchRole, _section, false]  call CGQC_fnc_switchRole;
} else {
	diag_log "[CGQC_FNC] Loadout not found";
};

// Give basic items to unit in case it's missing 
// Admin stuff 
_items = (items player);
_mags = magazines player;
if !("ACE_MapTools" in _items) then {player addItem "ACE_MapTools";};
if !("acex_intelitems_notepad" in _mags) then {player addItem "acex_intelitems_notepad";};

diag_log "[CGQC_FNC] checkLoadout done";