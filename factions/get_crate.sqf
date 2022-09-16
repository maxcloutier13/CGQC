max_crate="cgqc_box_mk1_plus_plus_green" createvehicle (position player);
// Add Delete Crate option
_action = [ "max_delcrate", "Delete crate", "", {execVM "\cgqc\factions\del_crate.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Remove add crate option
_remove = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn", "max_getcrate"]] call ace_interact_menu_fnc_removeActionFromObject;