#include "script_component.hpp"
// --- switchOptics ----------------------------------------------------------
// Switch optics
params ["_type", ["_target", player]];
diag_log format ["[CGQC_FNC] switchOptics %1 started", _type];

_target addPrimaryWeaponItem _type;

diag_log "[CGQC_FNC] switchOptics done";