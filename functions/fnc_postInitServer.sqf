// --- postInitServer ----------------------------------------------------------
// Start everything server-side

// Check if dynamic group is initialized

/*
_dynamic_group_check = ["IsInitialized"] call BIS_fnc_dynamicGroups;
if (!_dynamic_group_check) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};*/

/*
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	true;
}];*/

cgqc_start_postInitServer_done = true;