// --- setACRE ----------------------------------------------------------
// Set ACRE setup
params ["_type"];
diag_log format ["[CGQC_FNC] setACRE %1 started", _type];
_language = "";
_radios = "";
_info = "";

switch (_type) do {
	case "side": { // Get side keys
		if (cgqc_config_sideLanguage) then {
			_side = side player;
			switch (_side) do {
				case WEST: { _language = "en"; _radios = "default"; _info = "WEST";};
				case EAST: { _language = "ru"; _radios = "default3"; _info = "EAST"};
				case INDEPENDENT: { _language = "ab"; _radios = "default2"; _info = "IND"};
			};
		} else {
			_language = "en";
			_radios = "default";
			_info = "All same";
		};
	};
};

// Set language
if (_language isNotEqualTo "") then {
	[_language] call acre_api_fnc_babelSetSpokenLanguages;
};
if (_radios isNotEqualTo "") then {
	// Set radio presets
	["ACRE_PRC152", _radios] call acre_api_fnc_setPreset;
	["ACRE_PRC117f", _radios] call acre_api_fnc_setPreset;
};

diag_log format ["[CGQC_FNC] setACRE %1: %2/%3 executed", _info, _language, _radios];
diag_log "[CGQC_FNC] setACRE done";