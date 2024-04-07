// --- loadoutRemoveAll ----------------------------------------------------------
// Remove everything from unit
params ["_target"];
diag_log format ["[CGQC_FNC] loadoutRemoveAll %1 started", _target];

removeAllItems _target;
removeAllAssignedItems _target;
removeAllWeapons _target;
removeAllContainers _target;
removeGoggles _target;
removeHeadgear _target;

diag_log "[CGQC_FNC] loadoutRemoveAll done";