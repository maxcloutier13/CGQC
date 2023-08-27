// --- postInit_server ----------------------------------------------------------
// Start everything server-side

// Check if dynamic group is initialized
_dynamic_group_check = ["IsInitialized"] call BIS_fnc_dynamicGroups;
if (!_dynamic_group_check) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};

cgqc_start_postInitServer_done = true;