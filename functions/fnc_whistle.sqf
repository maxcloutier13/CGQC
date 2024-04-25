#include "script_component.hpp"
// --- whistle ----------------------------------------------------------
// Whistling shenanigans
params ["_unit", ["_type", 1]];
diag_log format ["[CGQC_FNC] whistle %1 started", _unit];

/*
_sound = "";
switch (_type) do {
	case 1: {_sound = "fox_whistle1"};
	case 2: {_sound = "fox_whistle2"};
};*/

_sound = selectRandom ["fox_whistle1", "fox_whistle2"];

[_unit,[_sound, 200]]remoteExec ["say3D"];

diag_log "[CGQC_FNC] whistle done";