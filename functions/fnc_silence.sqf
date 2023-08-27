// --- silence ----------------------------------------------------------
// Creates a cone of silence around the player 
diag_log format ["[CGQC_FNC] silence started"];

trg_test_units = [];
trg_player_lowered = false;
trg_test_oldVolume = acex_volume_reduction;
hintSilent "Salle de classe. Volume extérieur réduit";
while {triggerActivated trg_training} do {
	if (player in list trg_training) then {
		trg_units_in = list trg_training;
		if (!trg_player_lowered) then {
			acex_volume_reduction = 9;
			[] call ace_volume_fnc_lowerVolume;	
		};
		trg_player_lowered = true;
	}else {
		if (vehicle player == player && trg_player_lowered) then {
			hint "Volume Normal";
			acex_volume_reduction = trg_test_oldVolume;
			[] call ace_volume_fnc_restoreVolume;
			trg_player_lowered = false;
			sleep 5;
		};
	};
	sleep 2;
	hintSilent "";
};
if (vehicle player == player && trg_player_lowered) then {
	hint "Volume Normal";
	acex_volume_reduction = trg_test_oldVolume;
	[] call ace_volume_fnc_restoreVolume;
	trg_player_lowered = false;
	sleep 5;
};

diag_log "[CGQC_FNC] silence done";