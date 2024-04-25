#include "\CGQC\script_component.hpp"
// --- preInitServer ----------------------------------------------------------
// Set everything that needs to be there before editor/menu/briefing server side
LOG("[CGQC_preInitServer] === Started =====================================");

// Check if dynamic group is initialized
if !(["IsInitialized"] call BIS_fnc_dynamicGroups) then {
	["Initialize", [true, 20, false, "cgqc_patch_logo"]] call BIS_fnc_dynamicGroups;
};

// Initialize gamestate variables
["init"] call CGQC_fnc_gamestate;

LOG("[CGQC_preInitServer] === Done =====================================");