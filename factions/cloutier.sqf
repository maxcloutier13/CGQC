// Yeet
_action = [ "max_yeet", "Yeet target", "", {execVM "\cgqc\factions\yeet_target.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Get smokes 
// It's a Cloutier thang --------------------------------------------------------------------------------------------------------------
_action = [ "menu_cloutier", "Cloutier", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
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
// Get heli
_action = [ "max_getheli", "Get heli", "", {execVM "\cgqc\factions\get_heli.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Full arsenal 
_action = [ "max_arse", "Arsenal", "", {execVM "\cgqc\factions\arsenal.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Open target loadout 
_action = [ "max_arse_other", "Arsenal->Target", "", {execVM "\cgqc\factions\arsenal_target.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	


