#include "\CGQC\script_component.hpp"
// --- checkVitals ----------------------------------------------------------
// Check if the unit is stable
params ["_target"];
LOG_1("[checkVitals] %1 started", _target);

_name = name _target;
_txt = "";
_check = [_target] call ace_medical_status_fnc_hasStableVitals;
if (_check) then {
    _txt = format["%1 is stable", _name];
} else {
    _txt = format["%1 is not stable", _name];
};

[["Check Vitals", 1.5],[_txt, 1],  false] call CBA_fnc_notify;

LOG("[checkVitals] done");