#include "\CGQC\script_component.hpp"
// --- Swat loadouts ----------------------------------------------------------
// Gets all 2023 loadout functions ready
LOG(" SWATLoadouts started");
if (cgqc_player_has2023) then {

	// Swat stuff
	["\CGQC\loadouts\swat\ldt_swat_basic.sqf", "CGQC_ldt_swat_basic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\swat\ldt_swat_assaulter.sqf", "CGQC_ldt_swat_assault"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\swat\ldt_swat_tl.sqf", "CGQC_ldt_swat_tl"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\swat\ldt_swat_breacher.sqf", "CGQC_ldt_swat_breacher"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\swat\ldt_swat_sniper.sqf", "CGQC_ldt_swat_sniper"] call CBA_fnc_compileFunction;
	LOG(" SWATLoadouts loaded");
} else {
	LOG(" SWATLoadouts not loaded");
};