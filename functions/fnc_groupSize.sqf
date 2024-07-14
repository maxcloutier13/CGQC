#include "\CGQC\script_component.hpp"
// --- groupSize ----------------------------------------------------------
// Finds the size of the shot group
params["_group"];
LOG("[groupSize]] started");

_biggestSize = 0;
{
    _currentHit = _x;
    {
        _otherHit = _x;
        _dist = _currentHit distance _otherHit;
        if (_dist > _biggestSize) then {
            _biggestSize = _dist;
        };
    } forEach _group;
} forEach _group;

LOG("[groupSize]] done");
//Return the biggest found distance
_biggestSize;