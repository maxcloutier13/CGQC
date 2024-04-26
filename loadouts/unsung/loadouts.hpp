#include "\CGQC\script_component.hpp"
// --- unsung loadouts ----------------------------------------------------------
// Gets all unsung loadout functions ready
LOG(" unsungLoadouts started");
if (cgqc_player_hasUnsung) then {
	// Swat stuff
	["\CGQC\loadouts\unsung\loadout_basic.sqf", "CGQC_loadout_unsungBasic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\unsung\loadout_1_0.sqf", "CGQC_loadout_unsung10"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\unsung\loadout_1_1.sqf", "CGQC_loadout_unsung11"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\unsung\loadout_1_2.sqf", "CGQC_loadout_unsung12"] call CBA_fnc_compileFunction;
	LOG(" unsungLoadouts loaded");
} else {
	LOG(" unsungLoadouts not loaded");
};