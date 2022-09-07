// It's a Cloutier thang --------------------------------------------------------------------------------------------------------------
_action = [ "menu_cloutier", "Cloutier", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Get smokes 
_action = [ "max_getcigs", "Cigs", "", {execVM "\cgqc\factions\get_cigs.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Chill
_action = [ "max_chill", "Chill", "", {execVM "\cgqc\factions\get_chill.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Get micro drone + uav 
_action = [ "max_micro", "Microdrone", "", {execVM "\cgqc\factions\get_drone.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Get 152
_action = [ "max_152", "152", "", {execVM "\cgqc\factions\get_radio.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
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