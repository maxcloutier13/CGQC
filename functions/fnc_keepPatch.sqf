#include "\CGQC\script_component.hpp"
// --- keepPatch ----------------------------------------------------------
// Keep patch updated. Find better way...  but hey.
LOG(" keepPatch started");
[] spawn {
	_sleep = 120;
	while {alive player} do {
		sleep _sleep;
		// Delete patch
		player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
		// Reset patch
		[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
		LOG(" keepPatch activated. Resetting patch");
	};
};
LOG(" keepPatch done");