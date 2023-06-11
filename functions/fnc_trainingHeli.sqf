// --- trainingHeli ----------------------------------------------------------
// Helicopter training 

_type = _this select 0;

cgqc_heli_vic = vehicle player;
switch (_type) do
{
	case "easy": {
		cgqc_heli_vic allowDamage false;
		["start"] execVM '\cgqc\functions\fnc_trainingHeli.sqf';
	};
	case "normal": {
		["start"] execVM '\cgqc\functions\fnc_trainingHeli.sqf';
	};
	case "stop":	{
		cgqc_training_heli = false;
		cgqc_heli_smoking = false;
		cgqc_heli_done = true;
		cgqc_heli_vic allowDamage true;
		["clear"] execVM "\cgqc\functions\fnc_trainingHeli.sqf";
	};
	case "start":	{
		cgqc_training_heli = true;
		cgqc_heli_smoking = true;
		cgqc_heli_done = false;
		cgqc_heli_smoking = true;
		if !(vehicle player isKindOf "Helicopter") then {
			hint "Get in an helicopter!";
			waitUntil {sleep 0.1; vehicle player isKindOf "Helicopter" };
		};
		
		
		// Find suitable area
		y_randomPos = [] call BIS_fnc_randomPos;
		y_searchArea = [ y_randomPos, 25, 500, 5, 0, 20, 0] call BIS_fnc_findSafePos;
		cgqc_heli_position = y_searchArea findEmptyPosition [1,500, typeOf cgqc_heli_vic];
		// Task instead of marker
		[side player, "task_heli", 
		[format["Land at grid: %1", mapGridPosition cgqc_heli_position],
			format["Land at grid: %1", mapGridPosition cgqc_heli_position], ""],
			cgqc_heli_position, "ASSIGNED", 1, true, "land", false] call BIS_fnc_taskCreate;
		//Spawn marker 
		//y_markerPlayer = createMarker ["cgqc_heli_target", cgqc_heli_position];
		//"cgqc_heli_target" setMarkerType "hd_pickup"; 
		//"cgqc_heli_target" setMarkerText "LZ";
		//"cgqc_heli_target" setMarkerColor "ColorBlue";
		// Spawn heli H 
		cgqc_heli_h = "cgqc_refuel_h_short" createVehicle (cgqc_heli_position);
		// Spawn light 
		cgqc_heli_light = "PortableHelipadLight_01_red_F" createVehicle (cgqc_heli_position);
		// Spawn smoke 
		[] spawn {
			sleep 5;
			while {!cgqc_heli_done && cgqc_heli_smoking} do {
				cgqc_heli_smoke = createVehicle ["SmokeShellPurple", cgqc_heli_position, [], 0, "NONE"];
				waitUntil {isNull cgqc_heli_smoke};
			};
		};
		// Trigger to check that player is on target 
		_act = "['done'] execVM '\cgqc\functions\fnc_trainingHeli.sqf';";
		_deAct = "";
		_int = 2;
		cgqc_heli_trg = createTrigger ["EmptyDetector",cgqc_heli_position, false];
		cgqc_heli_trg setTriggerArea [10, 10, 0, true, 15];
		cgqc_heli_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_heli_trg setTriggerStatements ["this && isTouchingGround vehicle player", _act, _deAct];
		cgqc_heli_trg setTriggerInterval _int;
		// Trigger to check that player is getting close 
		_act = "hint 'Getting close'; cgqc_heli_smoking = false; if !(isNil 'cgqc_heli_smoke') then {deleteVehicle cgqc_heli_smoke;}";
		_deAct = "";
		_int = 2;
		cgqc_heli_trg_close = createTrigger ["EmptyDetector",cgqc_heli_position, false];
		cgqc_heli_trg_close setTriggerArea [100, 100, 0, true];
		cgqc_heli_trg_close setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_heli_trg_close setTriggerStatements ["this", _act, _deAct];
		cgqc_heli_trg_close setTriggerInterval _int;
		hint format ["Fly to LZ @ %1!", mapGridPosition cgqc_heli_h];
	};
	case "done": {
		cgqc_heli_done = true; 
		hint 'Good job Viper. Standby for next target';
		["task_heli", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		sleep 3;
		["clear"] execVM "\cgqc\functions\fnc_trainingHeli.sqf"; // Delete everything and start again
		["start"] execVM "\cgqc\functions\fnc_trainingHeli.sqf";
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
	default
	{
		hint "heli problem";
	};
};

sleep 5;
hintSilent "";
