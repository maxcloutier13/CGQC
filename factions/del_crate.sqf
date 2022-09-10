deleteVehicle max_crate;
// Bring back add crate
_action = [ "max_getcrate", "Get crate", "", {execVM "\cgqc\factions\get_crate.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Remove del crate option
_remove = [ player, 1, ["ACE_SelfActions","menu_cloutier", "max_delcrate"]] call ace_interact_menu_fnc_removeActionFromObject;
