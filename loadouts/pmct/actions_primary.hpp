// Alternative Primaries ---------------------------------------------------------------------------------------------------------
_action = [ "menu_pmct_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" ], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_pmct_alt_1", "AK-12", "", {["ak12"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_pmct_alt_2", "AK-12 GL", "", {["ak12_gl"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_pmct_alt_3", "AK-12 Short", "", {["ak12_s"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_pmct_alt_4", "RPK-12", "", {["rpk12"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_pmct_alt_5", "MG3", "", {["mg3"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_pmct_alt_6", "SVD", "", {["svd"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_pmct_alt_7", "AWM", "", {["awm"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;