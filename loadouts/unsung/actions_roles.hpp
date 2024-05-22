// Unsung ---------------------------------------------------------------------------------------------------------
_action = [ "menu_unsung", "Vietnam", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Unsung Loadout switcher ---------------------------------------------------------------------------------------------------------
_action = [ "menu_unsung_loadouts", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Infantry
_action = [ "menu_unsung_loadouts_inf", "Infantry", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_unsung_soldier", "Soldier (CAR-15)", "", {["unsung_car15", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Leadership
_action = [ "menu_unsung_loadouts_lead", "Leadership", "s", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call ace_interact_menu_fnc_addActionToObject;
// 1-0 - TL
_action = [ "menu_unsung_10", "1-0 Team Leader", "", {["unsung_10", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// 1-1 - 2iC
_action = [ "menu_unsung_11", "1-1 2iC", "", {["unsung_10", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// 1-2 - Radio man
_action = [ "menu_unsung_12", "1-2 Radio guy", "", {["unsung_11", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// 1-3 - Medic
_action = [ "menu_unsung_13", "1-3 Medic", "", {["unsung_12", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Specialists
_action = [ "menu_unsung_loadouts_spec", "Specialists", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_pointman", "Pointman (Sten)", "", {["unsung_pointman", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_mrks", "Marksman (M14)", "", {["unsung_m14", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_mgs", "MG (RPD)", "", {["unsung_rpd", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_snipe", "Sniper (M40)", "", {["unsung_m40", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_saboteur", "Saboteur (Sten)", "", {["unsung_saboteur", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Tank driver
// Helicopter pilot