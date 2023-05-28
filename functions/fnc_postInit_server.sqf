// --- postInit_server ----------------------------------------------------------
// Start everything server-side

// Check if dynamic group is initialized
_dynamic_group_check = ["IsInitialized"] call BIS_fnc_dynamicGroups;
if (!_dynamic_group_check) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};

// Backpack lock
player setVariable ["diwako_lockbackpack_locked",true];

cgqc_postInitServer_done = true;