#include "script_component.hpp"
// --- setACRE ----------------------------------------------------------
// Set ACRE setup
params ["_type"];
diag_log format ["[CGQC_FNC] setACRE %1 started", _type];
_language = ["en"];
_radios = "default";
_info = "All English";

/*
switch (_type) do {
	case "unlock": {
		[false, false] call acre_api_fnc_setupMission;
		hint "Everyone speaks english";
	};
	case "side": {
		if (cgqc_config_sideLanguage) then {
			diag_log "[CGQC_FNC] setACRE - Language: On. Setting it up";
			// Check if player is Zeus
			if ([player] call CGQC_fnc_checkZeus) then {
				diag_log "[CGQC_FNC] setACRE - Zeus: Polyglot";
				_language = ["en", "ru", "ab"];
				_info = "English/Russian/Arabic";
				_radios = "default";
			} else {
				diag_log "[CGQC_FNC] setACRE - Not Zeus";
				switch (cgqc_player_side) do {
					case WEST: { _language = ["en"]; _radios = "default"; _info = "English";diag_log "[CGQC_FNC] setACRE - West"};
					case EAST: { _language = ["ru"]; _radios = "default3"; _info = "Russian";diag_log "[CGQC_FNC] setACRE - East"};
					case INDEPENDENT: { _language = ["ab"]; _radios = "default2"; _info = "Arabic";diag_log "[CGQC_FNC] setACRE - Independent"};
					default { _language = ["en","ru", "ab"]; _radios = "default"; _info = "English/Russian/Arabic";diag_log "[CGQC_FNC] setACRE - Zeus?"};
				};
			};
		};
	};
};

if !(cgqc_config_sideLanguage) then {
	_language = ["en"];
	_info = "All English";
};
// Set language
if (_language isNotEqualTo "") then {
	[_language] call acre_api_fnc_babelSetSpokenLanguages;
	[_language select 0] call acre_sys_core_fnc_setSpeakingLanguage;
	hint format ["You speak %1", _info];
};
if !(cgqc_config_sideRadios) then {
	_radios = "default";
};
// Set radio frequencies
diag_log "[CGQC_FNC] setACRE - Setting frequencies";
["ACRE_PRC152", _radios] spawn acre_api_fnc_setPreset;
["ACRE_PRC117f", _radios] spawn acre_api_fnc_setPreset;


cgqc_player_acre_setup = true;
*/
diag_log format ["[CGQC_FNC] setACRE %1: %2/%3 executed", _info, _language, _radios];
diag_log "[CGQC_FNC] setACRE done";