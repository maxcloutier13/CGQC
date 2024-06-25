#include "\CGQC\script_component.hpp"
// --- PMC-T loadouts ----------------------------------------------------------
// Gets all PMCT loadout functions ready
LOG("[PMCTLoadouts] started");
if (cgqc_player_has2023) then {
	// PMC-T CGQC Stuff
	["\CGQC\loadouts\pmct\ldt_pmct_basic.sqf", "CGQC_ldt_pmct_basic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\pmct\ldt_pmct_variants.sqf", "CGQC_ldt_pmct_variants"] call CBA_fnc_compileFunction;
	LOG("[PMCTLoadouts] loaded");
} else {
	LOG("[PMCTLoadouts] not loaded");
};