#include "\CGQC\script_component.hpp"
// --- createTarget ----------------------------------------------------------
// Create sniping targets
params ["_targetClass", "_targetRandomDir", "_targetAnimated", ["_targetSpawnDist", 0]];
LOG_4("[createTarget] %1/%2/%3/%4 started", _targetClass, _targetRandomDir, _targetAnimated, _targetSpawnDist);
//private ["_arguments", "_targetClass", "_targetRandomDir", "_targetAnimated"];

// If mode 1 then spawn all targets
if (_targetSpawnDist isEqualTo 1) exitWith {
	_toSpawn = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000];
	{
		["TargetP_Inf2_Acc2_F", false, false, _x] spawn CGQC_fnc_createTarget;
	} forEach _toSpawn;
};

if(_targetClass == "tank") then {
	_targetClass = cgqc_pax_opfor_vic_tank select 0;
};

// Default: Position is on cursor
_position = screenToWorld [0.5, 0.5];

if (_targetSpawnDist > 0) then {
	// Distance mode. Spawn at specific distance.
	// Get the player's position and direction
	_playerPos = getPosATL player;
	_playerDir = getDir player;
	// Calculate the position 100 meters in front of the player
	_position = [
		(_playerPos select 0) + (_targetSpawnDist * sin(_playerDir)),
		(_playerPos select 1) + (_targetSpawnDist * cos(_playerDir)),
		_playerPos select 2
	];
};

_target = _targetClass createVehicle [0, 0, 0];
_target setPosATL [_position select 0, _position select 1, 0.0];

_direction = 0;
if (_targetRandomDir) then {
	_direction = random 360;
} else {
	if (_targetClass == "Hostage_Target") then {
		// Convert 90 degrees to radians
		_angleOffset = 90 * (pi / 180);
		// Adjust the direction by subtracting 90 degrees (in radians)
		_direction = _direction - _angleOffset;

	};
	_vecToTarget = (getPosASL player) vectorFromTo (getPosASL _target);
	_direction = (_vecToTarget select 0) atan2 (_vecToTarget select 1);
};

_target setDir _direction;

_target addEventHandler ["HitPart", {
	(_this select 0) execVM "\cgqc\functions\fnc_on_hit.sqf"
}];

TrainingCourse_TargetList pushBack _target;

if (_targetAnimated) then {
	[_target, (_direction + 90), 1 + (random 4), 10] execVM "\cgqc\functions\fnc_animate_target.sqf";
};

[["Target Spawned"], false] call CBA_fnc_notify;
LOG("[createTarget] done");
