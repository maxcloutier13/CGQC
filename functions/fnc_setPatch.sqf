#include "\CGQC\script_component.hpp"
// --- setPatch ----------------------------------------------------------
// Set player patch and keeps it set
LOG("[setPach] started");

//Set patch initially
player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;

//[] call CGQC_fnc_keepPatch;
LOG("[setPatch] done");