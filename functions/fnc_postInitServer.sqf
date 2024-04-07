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
[] spawn {
	while {true} do {
		sleep cgqc_player_teamcolor_delay;
		['NONE', player, 'ALL'] call CGQC_fnc_setTeamColors;
		diag_log "TeamColors Reset";
	};
};

cgqc_start_postInitServer_done = true;

diag_log "[CGQC_PREINIT] === postInitServer started =====================================";