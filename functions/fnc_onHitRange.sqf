#include "\CGQC\script_component.hpp"
params ["_event", ["_group", []]];
//params ["_target", "_shooter", "_bullet", "_ammo","_position", "_velocity"];
private ["_target", "_shooter", "_bullet", "_ammo", "_position", "_vectorToTarget", "_velocity", "_distance", "_targetDir", "_impactDeviation", "_accuracy", "_score", "_targetScore"];
//projectile version - params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
LOG("[onHitRange] started");

_target = _event select 0;
_shooter = _event select 1;
_bullet = _event select 2;
_position = _event select 3;
_velocity = _event select 4;
_ammo = _event select 6;
LOG_6("[onHitRange] Target:%1/Shooter:%2/Bullet:%3/Position:%4/Vel:%5/Ammo:%6", _target, _shooter, _bullet, _position, _velocity, _ammo);

_currentGun = currentWeapon player;
_currentMag =  currentMagazine player;
_gunName = (getText (configFile >> 'CfgWeapons' >> _currentGun >> 'displayName'));
_txtInfo = format ["<br/>%1<br/>%2", _gunName, _currentMag];

// Play impact sound
_sound = ["cgqc_sound_impact1", "cgqc_sound_impact2"];
_rand = selectRandom _sound;
// Play sound from the target towards everyone
["cgqc_event_playSound", [_target, _rand, 800]] call CBA_fnc_GlobalEvent;

_vectorToTarget = (getPosASL _shooter) vectorDiff _position;
_distance = vectorMagnitude _vectorToTarget;

_title = "Impact!";
_vel = floor (round(_velocity call BIS_fnc_magnitude));
_dist = floor (round(_distance * 10) / 10);
_textDist = format["Dist: %1m", _dist];
_textVel = format["Vel: %1m/s", _vel];
if (_vel <= 343) then {
    LOG("[on_hit_range] under 343m/s: Subsonic");
    _textVel = format["%1 - Subsonic", _textVel];
};
_weight = getNumber(configFile >> "CfgAmmo" >> _ammo select 4 >> "ACE_bulletMass");
_weightKg = _weight / 1000;
_velSquare = _vel * _vel;
_energy = floor (round(0.5 * _velSquare * _weightKg));
_textEnergy = format["Engergy: %1joules", _energy];
_textGroupSize = "";
_textShotNbr = "";
if (count _group > 0) then {
    _groupSize = [_group] call CGQC_fnc_groupSize;
    _groupSizeCm = round ((_groupSize * 100) * 10) / 10;
    _moa = [_distance, _groupSize, _target] call CGQC_fnc_groupMoa;
    _textShotNbr = format ["<br/>Shot %1", count _group];
    _textGroupSize = format ["Group: %1cm/%2moa", _groupSizeCm, _moa];
};

if ((typeOf _target) in [ "TargetP_Inf_Acc2_F", "TargetP_Inf2_Acc2_F", "TargetP_Inf_Acc2_NoPop_F", "TargetP_Inf2_Acc2_NoPop_F"]) then {
    LOG("[on_hit_range] Scored target");
    _targetDir = getDir _target;
    _impactDeviation = _position vectorDiff (getPosASL _target);
    _impactDeviation = _impactDeviation vectorDiff [sin(_targetDir) * 0.16, cos(_targetDir) * 0.16, 0.85];
    _impactDeviation = vectorMagnitude _impactDeviation;
    _targetScore = 0;
    if (_impactDeviation < 0.0575 * 4.0) then {
        _targetScore = 1;
    };
    if (_impactDeviation < 0.0575 * 3.0) then {
        _targetScore = 2;
    };
    if (_impactDeviation < 0.0575 * 2.0) then {
        _targetScore = 3;
    };
    if (_impactDeviation < 0.0575 * 1.0) then {
        _targetScore = 4;
    };
    if (_impactDeviation < 0.0575 * 0.5) then {
        _targetScore = 5;
    };
    _textScore = format["Score: %1/5", _targetScore];
    //_textTotal = format["Total: %1/%2", TrainingCourse_TotalTargetScore, (TrainingCourse_TargetsHit * 5)];
    //_textAcc = format["%1/100", round(_accuracy * 10000) / 100];
    //_textScore = format["%1/100", round(_score * 100) / 100];
    [
        [_title, 1.5, [0.161, 0.502, 0.725, 1]],
        [_textDist, 1.2],
        [_textVel, 1.2],
        [_textEnergy, 1.2],
        [_textScore, 1.2],
        [_textShotNbr, 1.2],
        [_textGroupSize, 1.2],
        [_txtInfo, 1.2],
        true
    ] call CBA_fnc_notify;
} else {
    LOG("[on_hit_range] Unscored target");
    //_title = "Impact!";
    //_textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
    //_textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
    //_textAcc = format["%1/100", round(_accuracy * 10000) / 100];
    //_textScore = format["%1/100", round(_score * 100) / 100];
    [[_title, 1.5, [0.161, 0.502, 0.725, 1]],
    [_textDist, 1.2],
    [_textVel, 1.2],
    [_textEnergy, 1.2],
    [_textShotNbr, 1.2],
    [_textGroupSize, 1.2],
    [_txtInfo, 1],
    true] call CBA_fnc_notify;
    //hintSilent format["RemV: %1 m/s\nDistance: %2 m\n\n---- Moyenne ----\nPrécision: %3/100\nScore: %4/100",
    //round(_velocity call BIS_fnc_magnitude),
    //round(_distance * 10) / 10,
    //round(_accuracy * 10000) / 100,
    //round(_score * 100) / 100];
};

LOG("[on_hit_range] done");