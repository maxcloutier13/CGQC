// Alternative Primaries ---------------------------------------------------------------------------------------------------------
_action = [ "menu_nam_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" ], _action ] call ace_interact_menu_fnc_addActionToObject;

// Carbines
_action = [ "menu_nam_alt_carbines", "Carbines", "", {["nam_car15"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_nam_alt_car15", "CAR 15", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_carbines"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_car15short", "CAR 15 Shorty", "", {["nam_car15_short"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_carbines"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_car15gl", "CAR 15 GL", "", {["nam_car15GL"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_carbines"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_aks", "AKS 47", "", {["nam_ak"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_carbines"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_m2", "M2 Carbine", "", {["nam_m2"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_carbines"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_m14", "M14", "", {["nam_m14"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_carbines"], _action ] call ace_interact_menu_fnc_addActionToObject;

// SMG's
_action = [ "menu_nam_alt_smg", "SMG", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_nam_alt_thompson", "Thompson", "", {["nam_thompson"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_smg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_greese", "Greese Gun (SD)", "", {["nam_greese"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_smg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_sten", "Sten (SD)", "", {["nam_sten"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_smg"], _action ] call ace_interact_menu_fnc_addActionToObject;

// MG"s
_action = [ "menu_nam_alt_mg", "mg", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_nam_alt_rpd", "RPD", "", {["nam_rpd"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_rpds", "RPD Shorty", "", {["nam_rpd_short"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_stoner", "Stoner", "", {["nam_stoner"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_stoners", "Stoner Shorty", "", {["nam_stoner_short"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Snipers
_action = [ "menu_nam_alt_sniper", "Sniper", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_nam_alt_m40", "M40", "", {["nam_m40"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_nam_alt_svd", "SVD", "", {["nam_svd"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" , "menu_nam_alt", "menu_nam_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;



