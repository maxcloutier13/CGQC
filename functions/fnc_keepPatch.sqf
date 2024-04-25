#include "script_component.hpp"
// --- keepPatch ----------------------------------------------------------
// Keep patch updated. Find better way...  but hey.
diag_log "[CGQC_FNC] keepPatch started";
[] spawn {
	_sleep = 120;
	while {alive player} do {
		sleep _sleep;
		// Delete patch
		player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
		// Reset patch
		[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
		diag_log "[CGQC_FNC] keepPatch activated. Resetting patch";
	};
};
diag_log "[CGQC_FNC] keepPatch done";