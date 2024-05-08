// SWAT ***********************************************************************************
_action = [ "menu_swat", "SWAT", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Loadout switcher ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_roles", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Assaulter
_action = [ "menu_swat_roles_mp5sd6", "Assaulter", "", {["swat_assaulter", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Breacher Shotgun
_action = [ "menu_swat_roles_breach", "Breacher", "", {["swat_breacher", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Sniper
_action = [ "menu_swat_roles_sniper", "Sniper", "", {["swat_sniper", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Team leader
_action = [ "menu_swat_roles_tl", "Team Leader", "", {["swat_tl", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;