// --- setGroupRadios ----------------------------------------------------------
// Set radio setups depending on role
params [];
diag_log format ["[CGQC_FNC] setGroupRadios started"];

// Set default 343 channel for group
_notFound = false;
_ch = 0;
switch (groupid cgqc_player_group) do {
case "Spartan-1": {_ch = 1;};
case "Spartan-2": {_ch = 2;};
case "Spartan-3": {_ch = 3;};
case "Spartan-4": {_ch = 4;};
case "Trident-1": {_ch = 5;};
case "Trident-2": {_ch = 6;};
case "Trident-3": {_ch = 7;};
case "Trident-4": {_ch = 8;};
case "Hermes";
case "Orion-1";
case "Orion-2";
case "Recon": {_ch = 9;};
case "Centaure-1";
case "Centaure-2";
case "Centaure-3";
case "Griffon-1";
case "Griffon-2";
case "Griffon-3";
case "Pegase-1";
case "Pegase-2";
case "Pegase-3";
case "Supports": {_ch = 10;};
case "HQ": {_ch = 16;};
default {
	_ch = 1;};
	_notFound = true;
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