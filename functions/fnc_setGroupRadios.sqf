// --- setGroupRadios ----------------------------------------------------------
// Set radio setups depending on role
params [["_groupName", groupid cgqc_player_group], ["_color", 'UNSET']];
diag_log format ["[CGQC_FNC] setGroupRadios %1/%2 started", _groupName, _color];

// Set default 343 channel for group
_notFound = false;
_ch = 0;
switch (groupid cgqc_player_group) do {
	case "Spartan": {
		switch (_color) do {
			case "UNSET": {_ch = 16;};
			case "RED": {_ch = 1;};
			case "GREEN": {_ch = 1;};
			case "BLUE": {_ch = 2;};
			case "YELLOW": {_ch = 2;};
			default {_ch = 1;};
		};
	};
	case "Typhon": {
		switch (_color) do {
			case "UNSET": {_ch = 15;};
			case "RED": {_ch = 3;};
			case "GREEN": {_ch = 3;};
			case "BLUE": {_ch = 4;};
			case "YELLOW": {_ch = 4;};
			default {_ch = 3;};
		};
	};
	case "Hermes";
	case "Orion";
	case "Recon": {_ch = 9;};
	case "Centaure";
	case "Griffon";
	case "Pegase";
	case "Supports": {_ch = 10;};
	case "HQ": {_ch = 16;};
	default {
		_ch = 1;};
		_notFound = true;
	};
};
if (_notFound) then {
	hint "Group not found. Set your 343 channel manually";
} else {
	// Find 343
	_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
	if !(isNil "_personalRadio") then {
		// Set channel
		hint format ["343 set to team channel:%1", _ch];
		[_personalRadio, _ch] call acre_api_fnc_setRadioChannel;
	} else {
		hint "no 343 found... skipping";
	};
};

[] call CGQC_fnc_setPatch;

diag_log "[CGQC_FNC] setRadios done";