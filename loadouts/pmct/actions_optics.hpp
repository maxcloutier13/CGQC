_action = [ "menu_pmct_optics", "Switch: Optics", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" ], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_t2", "Dot - 1p76 Bakur", "", {["rhs_acc_1p87"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2", "Dot - 1p87 Valday", "", {["rhs_acc_1p87"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2", "Dot - ekP8 Kobra", "", {["rhs_acc_ekp8_18"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2", "Dot - OKP-7", "", {["rhs_acc_okp7_picatinny"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2", "DMR - Burris XTRII", "", {["optic_DMS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2", "Sniper - DH5 4-14x", "", {["rhs_acc_dh520x56"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" , "menu_pmct_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;