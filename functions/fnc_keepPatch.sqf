// --- keepPatch ----------------------------------------------------------
// Keep patch updated. Find better way...  but hey.
diag_log "[CGQC_FNC] keepPatch started";
[] spawn {
	_count = 0;
	_sleep = 60;
	_previous = [player ]call BIS_fnc_getUnitInsignia;
	while {alive player} do {
		sleep _sleep;
		_count = _count + 1;
		_current = [player ]call BIS_fnc_getUnitInsignia;
		if (_previous isNotEqualTo _current) then {
			// Delete patch
			player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
			// Reset patch
			[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
			diag_log "[CGQC_FNC] keepPatch activated. Resetting patch";
		};
		if (_count > 40) then { //Change timer after initial 30 mins 
			//hintc "Timer change";
			_sleep = 300; // Set patch every 5mins
		};
	};
};
diag_log "[CGQC_FNC] keepPatch done";