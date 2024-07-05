#include "\CGQC\script_component.hpp"
// --- Swat loadouts ----------------------------------------------------------
// Gets all 2023 loadout functions ready
LOG(" SWATLoadouts started");
if (cgqc_player_has2023) then {
	// Swat stuff
	["\CGQC\loadouts\swat\ldt_swat_basic.sqf", "CGQC_ldt_swat_basic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\swat\ldt_swat_variants.sqf", "CGQC_ldt_swat_variants"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\swat\ldt_swat_others.sqf", "CGQC_ldt_swat_others"] call CBA_fnc_compileFunction;
	LOG(" SWATLoadouts loaded");
} else {
	LOG(" SWATLoadouts not loaded");
};