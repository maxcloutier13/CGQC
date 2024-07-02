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
_unit setVehicleVarName format ["damage_%1", random 10000];

// Unit killed
_unit addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	cgqc_damage_text pushBack "Fatal Damage<br/>";
	if (local _unit) then {
		[_unit] spawn {
			params ["_unit"];
			sleep 2;
			deleteVehicle _unit;
		};
	};
}];

// Unit hit
_unit addEventHandler ["HitPart", {
	(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
	tgt_hi_5 = _this select 0 select 3;
	[_target, _shooter, _position, _velocity, _ammo] spawn {
		params ["_target", "_shooter", "_position", "_velocity", "_ammo"];
		_spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
		_spr setPosASL tgt_hi_5;
		sleep 0.5;
		_txtDamage = "";
		{
			_txtDamage = _txtDamage + _x;
		} forEach cgqc_damage_text;
		cgqc_damage_text = [];
		_currentGun = currentWeapon player;
		_currentMag =  currentMagazine player;
		_gunName = (getText (configFile >> 'CfgWeapons' >> _currentGun >> 'displayName'));
		_txtInfo = format ["<br/>%1<br/>%2", _gunName, _currentMag];
		_vectorToTarget = (getPosASL _shooter) vectorDiff _position;
		_distance = vectorMagnitude _vectorToTarget;
		_textDist = format["Dist: %1m", floor (round(_distance * 10) / 10)];
		_textVel = format["Vel: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
		_weight = getNumber(configFile >> "CfgAmmo" >> _ammo select 4 >> "ACE_bulletMass");
		_weightKg = _weight / 1000;
		_vel = _velocity call BIS_fnc_magnitude;
		_velSquare = _vel * _vel;
		_energy = floor (round(0.5 * _velSquare * _weightKg));
		_textEnergy = format["Engergy: %1joules<br/>", _energy];
		if (_vel <= 343) then {
			_textVel = format["%1 - Subsonic", _textVel];
		};
		[["Target hit", 1.5, [0.161, 0.502, 0.725, 1]],
			[_textDist, 1],
			[_textVel, 1],
			[_textEnergy, 1],
			[_txtDamage, 1],
			[_txtInfo, 1],
		true] remoteExec ["CBA_fnc_notify", owner _shooter];
		sleep 2;
		deleteVehicle _spr;
	};
}];

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
