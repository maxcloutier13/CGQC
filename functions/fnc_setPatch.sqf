// --- setPatch ----------------------------------------------------------
// Set player patch and keeps it set

_this spawn {
	//Set patch initially
	[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
	// Ensure Zeus keeps slot, despite admin logging
	while { true } do {
		sleep 120;
		[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
	};
};