#include "\CGQC\script_component.hpp"
// --- unsung loadouts ----------------------------------------------------------
// Gets all unsung loadout functions ready
LOG(" [unsungLoadouts] started");
if (cgqc_player_hasUnsung) then {
	// Swat stuff
	["\CGQC\loadouts\unsung\loadout_basic.sqf", "CGQC_loadout_unsungBasic"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\unsung\loadout_infantry.sqf", "CGQC_loadout_unsungInfantry"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\unsung\loadout_specialist.sqf", "CGQC_loadout_unsungSpecialist"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\unsung\loadout_vehicles.sqf", "CGQC_loadout_unsungVehicles"] call CBA_fnc_compileFunction;
	["\CGQC\loadouts\unsung\loadout_leader.sqf", "CGQC_loadout_unsungLeader"] call CBA_fnc_compileFunction;
	LOG(" unsungLoadouts loaded");
} else {
	LOG(" [unsungLoadouts] not loaded");
};