#include "\CGQC\script_component.hpp"
// --- loadoutRemoveAll ----------------------------------------------------------
// Remove everything from unit
params ["_target"];
LOG_1(" loadoutRemoveAll %1 started", _target);

removeAllItems _target;
removeAllAssignedItems _target;
removeAllWeapons _target;
removeAllContainers _target;
removeGoggles _target;
removeHeadgear _target;

LOG(" loadoutRemoveAll done");