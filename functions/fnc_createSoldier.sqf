#include "\CGQC\script_component.hpp"
// --- createSoldier ----------------------------------------------------------
// Create sniping targets
params ["_targetClass", "_targetRandomDir", "_targetPatrolling", ["_targetSpawnDist", 0]];
LOG_4("[createSoldier] %1/%2/%3/%4 started", _targetClass, _targetRandomDir, _targetPatrolling, _targetSpawnDist);

//Override with mod unit
_targetClass = selectRandom cgqc_pax_opfor_squad;
sleep 0.5;
private ["_group", "_position", "_vecToTarget", "_direction"];

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

if (_targetRandomDir) then
{
	_direction = random 360;
} else
{
	_vecToTarget = (getPosATL player) vectorFromTo _position;
	_direction = (_vecToTarget select 0) atan2 (_vecToTarget select 1);
	_direction = _direction + 90;
};

_group = createGroup east;
_unit = _group createUnit [_targetClass, [_position select 0, _position select 1, 0.0], [], 0, "CAN_COLLIDE"];
_unit setDir _direction;
removeAllWeapons _unit;
_unit disableAI "PATH";
_unit disableAI "AUTOCOMBAT";
_group setBehaviour "SAFE";
cgqc_training_targetList pushBack _unit;
if (_targetPatrolling) then
{
	_unit enableAI "PATH";
	_group addWaypoint [[(_position select 0) + sin(_direction) * 20, (_position select 1) + cos(_direction) * 20, 0.0], 0];
	[_group, 1] setWaypointType "MOVE";
	_group addWaypoint [[(_position select 0) - sin(_direction) * 20, (_position select 1) - cos(_direction) * 20, 0.0], 0];
	[_group, 2] setWaypointType "MOVE";
	_group addWaypoint [[(_position select 0) + sin(_direction) * 20, (_position select 1) + cos(_direction) * 20, 0.0], 0];
	[_group, 3] setWaypointType "CYCLE";
	{[_group, _x] setWaypointSpeed "LIMITED";} forEach [1, 2, 3];
};

[["Unit Spawned"], false] call CBA_fnc_notify;
LOG("[createSoldier] done");
