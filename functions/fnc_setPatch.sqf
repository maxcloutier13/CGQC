// --- setPatch ----------------------------------------------------------
// Set player patch and keeps it set
diag_log "[CGQC_FNC] setPach started";

//Set patch initially
player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;

[] call CGQC_fnc_keepPatch;
diag_log "[CGQC_FNC] setPatch done";