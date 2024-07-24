#include "\CGQC\script_component.hpp"
// --- lock ----------------------------------------------------------
// Lock doors and such
params ["_module"];
LOG("[lock] started");

_pos = getPos _module;
_range = _module getVariable "range";
_house = _module getVariable "chance_house";
_door = _module getVariable "chance_door";
_lock = _module getVariable "lock";

LOG_5("[lock] Locking %1/%2/%3/%4/%5", _pos, _range, _house, _door, _lock);
[_pos, _range, _house, _door, _lock] call tsp_fnc_breach_lock;

LOG("[lock] done");