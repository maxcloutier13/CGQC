// --- setTeamColorReloadAll ----------------------------------------------------------
// set player color
diag_log "[CGQC_FNC] setTeamColorReloadAll started";

[-1, {
	[] spawn CGQC_fnc_setTeamColorReload;
]}] call CBA_fnc_globalExecute;

diag_log "[CGQC_FNC] setTeamColorReloadAll done";