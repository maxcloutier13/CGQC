#include "\CGQC\script_component.hpp"
// --- createTarget ----------------------------------------------------------
// Create sniping targets
// ["metalTarget_Stand_AZone", false, cgqc_sniping_movingTarget, cgqc_sniping_distanceMode] spawn CGQC_fnc_createTarget
params ["_targetClass", "_targetRandomDir", "_targetAnimated", ["_targetSpawnDist", 0]];
LOG_4("[createTarget] %1/%2/%3/%4 started", _targetClass, _targetRandomDir, _targetAnimated, _targetSpawnDist);
//private ["_arguments", "_targetClass", "_targetRandomDir", "_targetAnimated"];

// If mode 1 then spawn all targets
if (_targetSpawnDist isEqualTo 1) exitWith {
	[_targetClass] spawn {
		params["_targetClass"];
		_toSpawn = [25, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000];
		{
			[_targetClass, false, false, _x] call CGQC_fnc_createTarget;
			sleep 0.5;
		} forEach _toSpawn;
	};
};

// Rifle testing mode
if (_targetSpawnDist isEqualTo 2) exitWith {
	_toSpawn = [25, 50, 100, 300, 500];
	{
		[_targetClass, false, false, _x, "zero"] call CGQC_fnc_createTarget;
	} forEach _toSpawn;
	/*
	// Add the eventHandler to every targets
	{
		zero_target = _x;
		[-1, {
			zero_target addEventHandler ["HitPart", {
				(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];		// flush previous hits
				if (isNull _projectile) exitWith {};
				if !(_isDirect) exitWith {};
				if !(_projectile isKindOf "BulletBase") exitWith {};
				if (_shooter != player) exitWith {};
				if (local _shooter) then {
					hint "You are the shooter!";
					if (count cgqc_training_zero_hits > 0) then {
						{deleteVehicle _x;}	forEach cgqc_training_zero_hits;
					};
					// Create new hit
					y_spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
					y_spr setPosASL (_this select 0 select 3);
					// Write hit message
					_vectorToTarget = (getPosASL _shooter) vectorDiff _position;
					_distance = vectorMagnitude _vectorToTarget;
					_title = "Impact!";
					_textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
					_textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
					//_textAcc = format["%1/100", round(_accuracy * 10000) / 100];
					//_textScore = format["%1/100", round(_score * 100) / 100];
					[[_title, 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1.2], [_textVel, 1.2]] spawn CBA_fnc_notify;

					// Play sound for everyone
					_sound = ["cgqc_sound_impact1", "cgqc_sound_impact2"];
					y_rand = selectRandom _sound;
					publicVariable "y_spr";
					PublicVariable "y_rand";
					[-2, {
						y_spr say3D [y_rand, 800];
					}] call CBA_fnc_globalExecute;
					// Keep the hit
					cgqc_training_zero_hits=cgqc_training_zero_hits+[y_spr];
					publicVariable "cgqc_training_zero_hits";
				};
			}];
		}] call CBA_fnc_globalExecute;
	} forEach cgqc_training_targetList;
	*/
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
_target allowDamage false;

_direction = 0;
if (_targetRandomDir) then {
	_direction = random 360;
} else {
	_vecToTarget = (getPosASL player) vectorFromTo (getPosASL _target);
	_direction = (_vecToTarget select 0) atan2 (_vecToTarget select 1);
	if (_targetClass isEqualTo "Hostage_Target") then {
		LOG("[createTarget] - Hostage target, turning");
		_direction = _direction + 90;
	};
};
_target setDir _direction;

LOG("[createTarget] Adding hit eventhandler");
_target addEventHandler ["HitPart", {
    params ["_event"];

    _shooter = _event select 1;
    _pos = _event select 3;
    //_mkr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
	_mkr = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0], false];
    _rgb = [0,0,0,1];
    _lastDigit = (count cgqc_sniping_hit) % 10;
    _caseIndex = (_lastDigit % 5) + 1;
    switch (_caseIndex) do {
        case 1: {_rgb = [255,0,0,1]};
        case 2: {_rgb = [255,255,0,1]};
        case 3: {_rgb = [0,255,0,1]};
        case 4: {_rgb = [0,0,255,1]};
        case 5: {_rgb = [255,255,255,1]};
    };
    _texture = _rgb call BIS_fnc_colorRGBAtoTexture;
	//_mkr setObjectTexture  [0, _texture];
    [_mkr, [0, _texture]] remoteExec ["setObjectTexture", 0];
	//[_mkr, 0.2] remoteExec ["setObjectScale", 0];
	_mkr setObjectScale 0.2;
    _mkr setPosASL _pos;

    cgqc_sniping_hit = cgqc_sniping_hit + [_mkr];
    tgt_hi_2 = _this select 0 select 3;
    //_spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
	_spr = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0], false];
    [_spr, [0, _texture]] remoteExec ["setObjectTexture", 0];
	//_spr setObjectTexture  [0, _texture];
    _spr setPosASL tgt_hi_2;
    [_spr] spawn {
        params ["_spr"];
        sleep 2;
        deleteVehicle _spr;
    };
    if (local _shooter) then {
        [_this select 0, cgqc_sniping_hit] spawn CGQC_fnc_onHitRange;
    };
}];

cgqc_training_targetList pushBack _target;

if (_targetAnimated) then {
	[_target, (_direction + 90), 1 + (random 4), 10] execVM "\cgqc\functions\fnc_animate_target.sqf";
};

[["Target Spawned"], true] call CBA_fnc_notify;
LOG("[createTarget] done");