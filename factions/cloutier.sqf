// Base stuff --------------------------------------------------------------------------------------------------------------
_action = [ "menu_cloutier", "Cloutier", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Get smokes
_action = [ "meds_getcigs", "Get cigs", "", {execVM "\cgqc\factions\get_cigs.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	