// --- postInitServer ----------------------------------------------------------
// Start everything server-side

diag_log "[CGQC_PREINIT] === postInitServer started =====================================";


addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	// Save unit stuff in the snapshot
	//[_unit, "save"] spawn CGQC_fnc_snapshot;
	false; //Prevents from turning into AI
}];

// Fix for dropped teamcolors
/*
[] spawn {
	sleep 300;
	while {true} do {
		sleep cgqc_player_teamcolor_delay;
		['NONE', player, 'ALL'] call CGQC_fnc_setTeamColors;
		diag_log "TeamColors Reset";
	};
};*/

// Gamephase start
if (cgqc_flag_isTraining) then {
	["training"] call CGQC_fnc_gamestate;
} else {
	["staging"] call CGQC_fnc_gamestate;
};

cgqc_start_postInitServer_done = true;

diag_log "[CGQC_PREINIT] === postInitServer started =====================================";