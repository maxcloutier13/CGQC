diag_log "[CGQC_INIT] initTraining started";
['chill', false] spawn CGQC_fnc_perksBasic;
[player, "all"] call CGQC_fnc_removeRadios;
["training"] call CGQC_fnc_getRadioPresets;
// Add side keys to player
["side", player] call CGQC_fnc_getKey;