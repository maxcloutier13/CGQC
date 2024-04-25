#include "\CGQC\script_component.hpp"
// --- loadoutPrep ----------------------------------------------------------
// Prep the player for loadout switch
params ["_target"];
LOG(" loadoutPrep started");

// === Remove all =======================================================================================================
[player] call CGQC_fnc_loadoutRemoveAll;
// === Reset traits
[player] call CGQC_fnc_resetTraits;

LOG(" loadoutPrep done");