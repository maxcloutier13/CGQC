#include "\CGQC\script_component.hpp"
// --- on_hitTestTarget ----------------------------------------------------------
// Effect on testing targets
params ["_event"];
LOG("[on_hitTestTarget] started");

_target = _event select 0;
_shooter = _event select 1;
_bullet = _event select 2;
_hitPosition = _event select 3;
_velocity = _event select 4;
_ammo = _event select 6;
LOG_6("[on_hitTestTarget] T:%1/S:%2/B:%3/P:%4/V:%5/A:%6", _target,_shooter , _bullet, _hitPosition, _velocity, _ammo);
if (local _shooter) then {
    // Play impact sound
    _sound = ["cgqc_sound_impact1", "cgqc_sound_impact2"];
    _rand = selectRandom _sound;
    // Play sound from the target towards everyone
    ["cgqc_event_playSound", [_target, _rand, 800]] call CBA_fnc_GlobalEvent;

    _vectorToTarget = (getPosASL _shooter) vectorDiff _hitPosition;
    _distance = vectorMagnitude _vectorToTarget;

    _title = "Impact!";
    _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
    _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
    //_textAcc = format["%1/100", round(_accuracy * 10000) / 100];
    //_textScore = format["%1/100", round(_score * 100) / 100];
    [[_title, 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1.2], [_textVel, 1.2], true] remoteExec ["CBA_fnc_notify", owner _shooter];

    if (count cgqc_zeroHits > 0) then {
        {
            deleteVehicle _x;
        } forEach cgqc_zeroHits;
    };
    _hit = "Sign_Sphere10cm_F" createVehicle [0, 0, 0];
    // Move the impact point
    _hit setPosASL _hitPosition;
    cgqc_zeroHits pushBack _hit;
};
LOG("[on_hitTestTarget] done");