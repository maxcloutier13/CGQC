// --- preInitServer ----------------------------------------------------------
// Set everything that needs to be there before editor/menu/briefing server side
diag_log "[CGQC_PREINIT] === preInitServer started =====================================";

// Check if dynamic group is initialized
if !(["IsInitialized"] call BIS_fnc_dynamicGroups) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};

diag_log "[CGQC_PREINIT] === preInitServer done =====================================";