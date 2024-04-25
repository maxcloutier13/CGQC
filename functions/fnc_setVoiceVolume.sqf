#include "script_component.hpp"
// --- setVoiceVolume ----------------------------------------------------------
// Quick set voice to specified volume
params [["_unit", player], ["_vol", "talk"]];
diag_log format ["[CGQC_FNC] setVoiceVolume %1/%2 started", _unit, _vol];


_target = 0;
_lvl = 0;
_normal = false;
switch (_vol) do {
	case "default": {
		_target = cgqc_acre_defaultVolume;
		_lvl = cgqc_acre_defaultLevel;
	};
	case "whisper": {_target = 0.1; _lvl = 0;};
	case "discreet": {_target = 0.2; _lvl = 0.15;};
	case "talk": {_target = 0.4;_lvl = 0.25;};
	case "normal": {_target = 0.7;_lvl = 0.5;_normal = true;};
	case "loud": {_target = 1.0;_lvl = 0.75;};
	case "shout": {_target = 1.3;_lvl = 1;};
};

if (_target > 0) then {
	[_target] call acre_api_fnc_setSelectableVoiceCurve;
	acre_sys_gui_volumeLevel = _lvl;
	diag_log "[CGQC_FNC] setVoiceVolume - Volume adjusted";
};

diag_log "[CGQC_FNC] setVoiceVolume done";

// 0.1 whispering
// 0.4 talking
// 0.7 default
// 1.0 loud
// 1.3 shout