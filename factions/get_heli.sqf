// Spawn vic
max_vic ="cgqc_heli_dickforce" createvehicle (position player);
// Add Delete heli
_action = [ "max_delheli", "Delete heli", "", {execVM "\cgqc\factions\del_heli.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Remove add heli option
_remove = [ player, 1, ["ACE_SelfActions","menu_cloutier", "max_getheli"]] call ace_interact_menu_fnc_removeActionFromObject;