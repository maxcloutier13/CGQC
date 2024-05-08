// Alternative Primaries ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" ], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_p90", "p90", "", {["swat_p90"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_mp5", "MP5sd6", "", {["swat_mp5sd6"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_blk", ".300 Blackout", "", {["swat_blk"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_mp7", "MP7 AP", "", {["swat_mp7"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_socom", "Socom 16", "", {["swat_socom"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_m24", "M24", "", {["swat_m24"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;