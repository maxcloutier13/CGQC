#include "\CGQC\script_component.hpp"
// --- vanilla ladouts ----------------------------------------------------------
// Gets all vanilla loadout functions ready
LOG(" vanillaLoadouts started");
// Vanilla
["\CGQC\loadouts\vanilla\loadout_basic.sqf", "CGQC_loadout_vanillaBasic"] call CBA_fnc_compileFunction;
["\CGQC\loadouts\vanilla\loadout_rifleman.sqf", "CGQC_loadout_vanillaRifleman"] call CBA_fnc_compileFunction;
["\CGQC\loadouts\vanilla\loadout_tl.sqf", "CGQC_loadout_vanillaTL"] call CBA_fnc_compileFunction;

LOG(" vanillaLoadouts done");