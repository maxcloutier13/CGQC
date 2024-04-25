#include "\CGQC\script_component.hpp"
private ["_arguments", "_targetClass", "_targetRandomDir", "_targetPatrolling"];

_arguments = _this select 3;
_targetClass      = _arguments select 0;
_targetAnimated   = _arguments select 1;
_targetRandomDir  = _arguments select 2;
_targetPatrolling = _arguments select 3;

//Override with mod unit
_targetClass = selectRandom cgqc_pax_opfor_squad;
sleep 0.5;
private ["_group", "_position", "_vecToTarget", "_direction"];

_position = screenToWorld [0.5, 0.5];

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
TrainingCourse_TargetList pushBack _unit;
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
