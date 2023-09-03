diag_log "[CGQC_INIT] initTraining started";
waitUntil {!isNil "cgqc_start_postInitClient_done"};
waitUntil {cgqc_start_postInitClient_done};
['chill', false] spawn CGQC_fnc_perksBasic;
sleep 5;
["training"] call CGQC_fnc_setRadios;
