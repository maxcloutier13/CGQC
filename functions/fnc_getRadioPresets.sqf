#include "\CGQC\script_component.hpp"
// --- getRadiosPresets ----------------------------------------------------------
// Get radios and set everything
params ["_type", ["_team", 1]];
LOG_2("[getRadioPresets] %1/%2 started", _type, _team);

_radios = [];
_preset = "";

// Remove everything to begin with
[ACE_player, "all"] call CGQC_fnc_removeRadios;

switch (_type) do {
	case "training": {_radios = ["ACRE_PRC343", "ACRE_PRC152"];_preset = "training"};
	case "inf":	{_radios = ["ACRE_PRC343"];_preset = "spartan"};
	case "2ic": {_radios = ["ACRE_PRC343", "ACRE_PRC148"];_preset = "2ic"};
	case "medic": {_radios = ["ACRE_PRC343", "ACRE_PRC152"];_preset = "medic"};
	case "tl": {_radios = ["ACRE_PRC343", "ACRE_PRC152"];_preset = "spartan_1"};
	case "sl": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "sl"};
	case "hq": {_radios = ["ACRE_PRC343", "ACRE_PRC117F", "ACRE_PRC117F"];_preset = "hq"};
	case "recon": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "recon"};
	case "jtac": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "jtac"};
	case "pilot": {_radios = ["ACRE_PRC152", "ACRE_PRC152", "ACRE_PRC343"];_preset = "griffon_pieton"};
	case "driver": {_radios = ["ACRE_PRC152", "ACRE_PRC152", "ACRE_PRC343"];_preset = "centaure_pieton"};
	case "zeus": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "zeus"};
	default	{ERROR("[CGQC_ERROR] mk3_getRadios issue");};
};


// Do the deed
LOG("[getRadioPresets] Starting AddRadios");
[_radios] call CGQC_fnc_addRadios;
[_preset,_team] spawn {
	params ["_preset", "_team"];
	LOG_2("[getRadioPresets] setRadios: %1/%2 started. Sleeping 4s", _preset, _team);
	sleep 4;
	LOG("[getRadioPresets] Starting setRadios");
	[_preset, _team] spawn CGQC_fnc_setRadios;
	LOG("[getRadioPresets] Starting setGroupRadios");
	[] spawn CGQC_fnc_setGroupRadios;
};

LOG("[getRadioPresets] done");