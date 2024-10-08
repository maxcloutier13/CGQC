#include "\CGQC\script_component.hpp"
// --- 2023 loadouts ----------------------------------------------------------
// Gets all 2023 loadout functions ready
LOG(" 2023Loadouts started");
if (cgqc_player_has2023) then {
	// 2023 Ranked arsenal
	["\CGQC\loadouts\2023\load_2023.sqf", "CGQC_ldt_2023_arsenal"] call CBA_fnc_compileFunction;
	// 2023 CGQC Stuff
	["\CGQC\loadouts\2023\ldt_2023_basic.sqf", "CGQC_ldt_2023_basic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_camo.sqf", "CGQC_ldt_camo"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_command.sqf", "CGQC_ldt_2023_command"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_rifleman.sqf", "CGQC_ldt_2023_rifleman"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_at.sqf", "CGQC_ldt_2023_at"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_eng.sqf", "CGQC_ldt_2023_eng"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_medic.sqf", "CGQC_ldt_2023_medic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_mg.sqf", "CGQC_ldt_2023_mg"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_recon.sqf", "CGQC_ldt_2023_recon"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_pilot.sqf", "CGQC_ldt_2023_pilot"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_driver.sqf", "CGQC_ldt_2023_driver"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2024_qualification.sqf", "CGQC_ldt_2024_qualification"] call CBA_fnc_compileFunction;

	LOG(" 2023Loadouts loaded");
} else {
	LOG(" 2023Loadouts not loaded");
};