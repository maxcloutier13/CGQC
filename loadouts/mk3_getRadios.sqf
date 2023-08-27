// --- mk3GetRadios ----------------------------------------------------------
// Get radios and set everything

// Proceed
_item = _this select 0;
_radios = [];
_preset = "";
_team = "";


// Remove everything to begin with
[ACE_player, "all"] call CGQC_fnc_removeRadios;

// Training radio override
if (cgqc_flag_isTraining) then { 
	// Training setup 
	hint "Switching radios... Training";
	_radios = ["ACRE_PRC343", "ACRE_PRC152"];
	_preset = "training";
	_team = 1;
} else {
	switch (_item) do {
		case "inf":	{_radios = ["ACRE_PRC343"];_preset = "spartan";_team = 1};
		case "medic": {_radios = ["ACRE_PRC343", "ACRE_PRC152"];_preset = "medic";_team = 1};
		case "tl": {_radios = ["ACRE_PRC343", "ACRE_PRC152"];_preset = "spartan_1";_team = 1};
		case "sl": {_radios = ["ACRE_PRC343", "ACRE_PRC117F", "ACRE_PRC117F"];_preset = "hq";_team = 1};
		case "recon": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "recon";_team = 1};
		case "pilot": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "griffon_pieton";_team = 1};
		case "driver": {_radios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152"];_preset = "centaure_pieton";_team = 1};		
		default	{default {diag_log "[CGQC_ERROR] mk3_getRadios issue";}};
	};
};

// Do the deed
[_radios] call CGQC_fnc_addRadios;
[_preset, _team] call CGQC_fnc_setRadios;