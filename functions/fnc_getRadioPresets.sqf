// --- getRadiosPresets ----------------------------------------------------------
// Get radios and set everything
params ["_type", ["_team", 1]];
diag_log format ["[CGQC_FNC] getRadioPresets %1/%2 started", _type, _team];

_radios = [];
_preset = "";

// Remove everything to begin with
[ACE_player, "all"] call CGQC_fnc_removeRadios;

// Training radio override
if (cgqc_flag_isTraining) then {
	// Training setup
	_radios = ["ACRE_PRC343", "ACRE_PRC152"];
	_preset = "training";
	_team = 1;
} else {
	switch (_type) do {
		case "training": {_radios = ["ACRE_PRC343", "ACRE_PRC152"];_preset = "training"};
		case "inf":	{_radios = ["ACRE_PRC343"];_preset = "spartan"};
		case "medic": {_radios = ["ACRE_PRC343", "ACRE_PRC152"];_preset = "medic"};
		case "tl": {_radios = ["ACRE_PRC343", "ACRE_PRC152"];_preset = "spartan_1"};
		case "sl": {_radios = ["ACRE_PRC343", "ACRE_PRC117F", "ACRE_PRC117F"];_preset = "hq"};
		case "hq": {_radios = ["ACRE_PRC343", "ACRE_PRC117F", "ACRE_PRC117F"];_preset = "hq"};
		case "recon": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "recon"};
		case "jtac": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "jtac"};
		case "pilot": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "griffon_pieton"};
		case "driver": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "centaure_pieton"};
		default	{default {diag_log "[CGQC_ERROR] mk3_getRadios issue";}};
	};
};

// Do the deed
[_radios] call CGQC_fnc_addRadios;
[_preset,_team] spawn {
	params ["_preset", "_team"];
	sleep 5;
	diag_log format ["[CGQC_FNC] getRadioPresets setRadios: %1/%2 started", _preset, _team];
	[_preset, _team] spawn CGQC_fnc_setRadios;
};

diag_log "[CGQC_FNC] getRadioPresets done";