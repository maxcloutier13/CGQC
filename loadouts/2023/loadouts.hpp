// --- 2023 loadouts ----------------------------------------------------------
// Gets all 2023 loadout functions ready
diag_log "[CGQC_FNC] 2023Loadouts started";
if (cgqc_player_has2023) then {

	// 2023 CGQC Stuff
	["\CGQC\loadouts\2023\ldt_2023_basic.sqf", "CGQC_ldt_2023_basic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_c_hq.sqf", "CGQC_ldt_2023_hq"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_c_sl.sqf", "CGQC_ldt_2023_sl"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\ldt_2023_c_tl.sqf", "CGQC_ldt_2023_tl"] call CBA_fnc_compileFunction;

	// Swat stuff
	["\CGQC\loadouts\2023\loadout_swat_basic.sqf", "CGQC_ldt_swat_basic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\loadout_swat_assaulter.sqf", "CGQC_ldt_swat_assault"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\loadout_swat_tl.sqf", "CGQC_ldt_swat_tl"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\loadout_swat_breacher.sqf", "CGQC_ldt_swat_breacher"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\loadout_swat_sniper.sqf", "CGQC_ldt_swat_sniper"] call CBA_fnc_compileFunction;
	diag_log "[CGQC_FNC] 2023Loadouts loaded";
} else {
	diag_log "[CGQC_FNC] 2023Loadouts not loaded";
};