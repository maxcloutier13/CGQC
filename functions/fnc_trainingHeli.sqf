#include "\CGQC\script_component.hpp"
// --- trainingHeli ----------------------------------------------------------
// Helicopter training
params ["_type", ["_lz", "random"]];

LOG_1(" trainingHeli %1 started", _type);


cgqc_heli_vic = vehicle player;
switch (_type) do
{
	case "nam": {
		if (_lz isEqualTo "random") then {
			_namLz = ["cgqc_lz_ember", "cgqc_lz_fer", "cgqc_lz_boa", "cgqc_lz_habu", "cgqc_lz_adder", "cgqc_lz_viper", "cgqc_lz_cobra", "cgqc_lz_krait"];
			_target = selectRandom _namLz;
			["start", _target] spawn CGQC_fnc_trainingHeli;
		} else {
			["start", _lz] spawn CGQC_fnc_trainingHeli;
		};
	};
	case "newlz": {
		["stop"] spawn CGQC_fnc_trainingHeli;
		["start"] spawn CGQC_fnc_trainingHeli;
	};
	case "easy": {
		cgqc_heli_vic allowDamage false;
		["start"] spawn CGQC_fnc_trainingHeli;
	};
	case "normal": {
		["start"] spawn CGQC_fnc_trainingHeli;
	};
	case "stop":	{
		cgqc_training_heli = false;
		cgqc_heli_smoking = false;
		cgqc_heli_done = true;
		cgqc_heli_vic allowDamage true;
		["clear"] spawn CGQC_fnc_trainingHeli;
	};
	case "start":	{
		cgqc_training_heli = true;
		cgqc_heli_smoking = true;
		cgqc_heli_done = false;
		cgqc_heli_smoking = true;
		if !(vehicle player isKindOf "Helicopter") then {
			[["Get in an helicopter!", 1.5], false] call CBA_fnc_notify;
			waitUntil {sleep 0.5; vehicle player isKindOf "Helicopter" };
		};
		if (_lz isEqualTo "random") then {
			y_randomPos = [] call BIS_fnc_randomPos;
			y_searchArea = [ y_randomPos, 25, 500, 5, 0, 20, 0] call BIS_fnc_findSafePos;
			cgqc_heli_position = y_searchArea findEmptyPosition [1,500, typeOf cgqc_heli_vic];
			_lz = "";
		} else {
			cgqc_heli_position = getMarkerPos _lz;
		};
		// Task instead of marker
		[side player, "task_heli",
		[format["Land at grid: %1", mapGridPosition cgqc_heli_position],
			format["Land at grid: %1", mapGridPosition cgqc_heli_position], ""],
			cgqc_heli_position, "ASSIGNED", 1, true, "land", false] call BIS_fnc_taskCreate;
		// Spawn heli H
		cgqc_heli_h = "cgqc_refuel_h_short" createVehicle (cgqc_heli_position);
		// Spawn light
		cgqc_heli_light = "PortableHelipadLight_01_red_F" createVehicle (cgqc_heli_position);
		// Spawn smoke
		[] spawn {
			sleep 3;
			while {!cgqc_heli_done && cgqc_heli_smoking} do {
				cgqc_heli_smoke = createVehicle ["SmokeShellPurple", cgqc_heli_position, [], 0, "NONE"];
				waitUntil {isNull cgqc_heli_smoke};
			};
		};
		// Trigger to check that player is on target
		_act = "['done'] spawn CGQC_fnc_trainingHeli;";
		_deAct = "";
		_int = 2;
		cgqc_heli_trg = createTrigger ["EmptyDetector",cgqc_heli_position, false];
		cgqc_heli_trg setTriggerArea [10, 10, 0, true, 15];
		cgqc_heli_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_heli_trg setTriggerStatements ["this && isTouchingGround vehicle player", _act, _deAct];
		cgqc_heli_trg setTriggerInterval _int;
		// Trigger to check that player is getting close

		_act = "[['Getting close', 1.5], false] call CBA_fnc_notify; cgqc_heli_smoking = false; if !(isNil 'cgqc_heli_smoke') then {deleteVehicle cgqc_heli_smoke;}";
		_deAct = "";
		_int = 2;
		cgqc_heli_trg_close = createTrigger ["EmptyDetector",cgqc_heli_position, false];
		cgqc_heli_trg_close setTriggerArea [50, 50, 0, true];
		cgqc_heli_trg_close setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_heli_trg_close setTriggerStatements ["this", _act, _deAct];
		cgqc_heli_trg_close setTriggerInterval _int;
		[[format ["Fly to LZ %1 @ %2!", _lz,  mapGridPosition cgqc_heli_h], 1.5], false] call CBA_fnc_notify;
	};
	case "done": {
		cgqc_heli_done = true;
		[["Good job Viper", 1.5], [" Grab Another target!", 1], false] call CBA_fnc_notify;
		["task_heli", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		sleep 3;
		["stop"] spawn CGQC_fnc_trainingHeli;
	};
	case "clear": {
		// Delete trigger
		if !(isNil "cgqc_heli_trg") then {deleteVehicle cgqc_heli_trg;};
		if !(isNil "cgqc_heli_trg_close") then {deleteVehicle cgqc_heli_trg_close;};
		// Delete markers
		//if !(isNil "y_markerPlayer") then {deleteMarker "cgqc_heli_target";};
		// Delete task
		["task_heli", true, true] call BIS_fnc_deleteTask;
		//Delete all things
		if !(isNil "cgqc_heli_h") then {deleteVehicle cgqc_heli_h;};
		if !(isNil "cgqc_heli_light") then {deleteVehicle cgqc_heli_light;};
		if !(isNil "cgqc_heli_smoke") then {deleteVehicle cgqc_heli_smoke;};
	};
	default{LOG("[CGQC_ERROR] trainingHeli fail");};
};

LOG(" trainingHeli done");
