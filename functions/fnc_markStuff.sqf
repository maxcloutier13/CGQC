// --- markStuff ----------------------------------------------------------
// Mark dropped stuff
params ["_unit", "_container"];
diag_log format ["[CGQC_FNC] markStuff %1/%2 started", _unit, _container];

diag_log format ["[CGQC_FNC] markStuff container type: %1", typeOf _container];

if ((typeOf _container != "GroundWeaponHolder") || (!isNil{_container getVariable "CGQC_Name"})) exitWith {};

diag_log "[CGQC_FNC] markStuff - Good container kind";
//If the ground holder isn't empty I'll name it
if ((count itemCargo _container > 0) || (count magazineCargo _container > 0) || (count weaponCargo _container > 0) || (count backpackCargo _container  > 0)) then {
	diag_log "[CGQC_FNC] markStuff - Container not empty: Renaming";
	_container setVariable ["CGQC_Name",name player, true];
	_container setVariable ["CGQC_Side",cgqc_player_side, true];
	[_container, true, [0,0.9,1], 0] call ace_dragging_fnc_setCarryable;
} else {
	diag_log "[CGQC_FNC] markStuff - Container empty? Skipping";
};

diag_log "[CGQC_FNC] markStuff done";