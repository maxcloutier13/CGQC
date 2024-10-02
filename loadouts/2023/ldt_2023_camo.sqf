#include "\CGQC\script_component.hpp"
// --- 2023_camo ----------------------------------------------------------
// Load custom camo and stuffs for the setting
params [["_target", player]];
LOG("[2023_camo] started");

_camo = player getVariable ["cgqc_var_startingCamo", "GREEN"];

if (_camo isNotEqualTo "GREEN") then {
    [_camo, true] spawn CGQC_fnc_switchUniform;
};

LOG("[2023_camo] done");