// --- loadoutPrep ----------------------------------------------------------
// Prep the player for loadout switch
params ["_target"];
diag_log "[CGQC_FNC] loadoutPrep started";

// === Remove all =======================================================================================================
[player] call CGQC_fnc_loadoutRemoveAll;
// === Reset traits
[player] call CGQC_fnc_resetTraits;

diag_log "[CGQC_FNC] loadoutPrep done";