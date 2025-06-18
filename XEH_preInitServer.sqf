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

// Server FPS functions
[] spawn {
    while {true} do {
        serverFPS = diag_fps;
        publicVariable "serverFPS";
        sleep 10;
    };
};

// add peoples steamID64 (Dec) to this list to allow them access to the menu.
// use a website like https://www.steamidfinder.com to find a players UID to add to the list.

SevFPS_allowedUIDs = [
    "70000000000000000",    // Placeholder
    "70000000000000001",    // Placeholder
    "70000000000000002"     // Placeholder
];
publicVariable "SevFPS_allowedUIDs";

SevFPS_globalAllow = true; // change this value to allow any player to view the server FPS.
publicVariable "SevFPS_globalAllow";


LOG("[CGQC_preInitServer] === Done =====================================");