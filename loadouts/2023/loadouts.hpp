// --- 2023 loadouts ----------------------------------------------------------
// Gets all 2023 loadout functions ready
diag_log "[CGQC_FNC] 2023Loadouts started";
if (cgqc_player_has2023) then {
	// Swat stuff 
	["\CGQC\loadouts\2023\loadout_swat_basic.sqf", "CGQC_loadout_2023Swatbasic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\loadout_swat_assaulter.sqf", "CGQC_loadout_2023SwatAssault"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\loadout_swat_tl.sqf", "CGQC_loadout_2023SwatTL"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\loadout_swat_breacher.sqf", "CGQC_loadout_2023SwatBreacher"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\2023\loadout_swat_sniper.sqf", "CGQC_loadout_2023SwatSniper"] call CBA_fnc_compileFunction;
	diag_log "[CGQC_FNC] 2023Loadouts loaded";
} else {
	diag_log "[CGQC_FNC] 2023Loadouts not loaded";
};