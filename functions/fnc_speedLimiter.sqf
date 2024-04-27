#include "\CGQC\script_component.hpp"
// --- speedLimiter ----------------------------------------------------------
// Some speed limiter options for ease of use
params [["_speed", 0], ["_cruise", false]];
LOG_1(" speedLimiter %1 started", _speed);

if !(ACE_vehicles_isSpeedLimiter) then {
    LOG(" speedLimiter - Not on: starting");
    [player, vehicle player, _cruise] call ace_vehicles_fnc_speedLimiter;
};
ACE_vehicles_isSpeedLimiter = _cruise;
ACE_vehicles_speedLimit = _speed;

LOG(" speedLimiter done");