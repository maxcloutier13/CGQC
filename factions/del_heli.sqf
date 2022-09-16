// Delete heli
deleteVehicle max_vic;
// Get heli
_action = [ "max_getheli", "Get heli", "", {execVM "\cgqc\factions\get_heli.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Remove delete heli option
_remove = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn", "max_delheli"]] call ace_interact_menu_fnc_removeActionFromObject;
