// Base stuff --------------------------------------------------------------------------------------------------------------
_action = [ "menu_cloutier", "Cloutier", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Get smokes
_action = [ "max_getcigs", "Get cigs", "", {execVM "\cgqc\factions\get_cigs.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Get Crate
_action = [ "max_getcrate", "Get crate", "", {execVM "\cgqc\factions\get_crate.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Delete Crate
_action = [ "max_delcrate", "Delete crate", "", {execVM "\cgqc\factions\del_crate.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Get heli
_action = [ "max_getheli", "Get heli", "", {execVM "\cgqc\factions\get_heli.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Delete heli
_action = [ "max_delheli", "Delete heli", "", {execVM "\cgqc\factions\del_heli.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	