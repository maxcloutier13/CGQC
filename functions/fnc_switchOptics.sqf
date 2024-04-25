#include "\CGQC\script_component.hpp"
// --- switchOptics ----------------------------------------------------------
// Switch optics
params ["_type", ["_target", player]];
LOG_1(" switchOptics %1 started", _type);

_target addPrimaryWeaponItem _type;

LOG(" switchOptics done");