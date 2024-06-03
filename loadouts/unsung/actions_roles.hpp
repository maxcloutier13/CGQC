// Unsung ---------------------------------------------------------------------------------------------------------
_action = [ "menu_unsung", "Vietnam", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Unsung Loadout switcher ---------------------------------------------------------------------------------------------------------
_action = [ "menu_unsung_loadouts", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Infantry
_action = [ "menu_unsung_loadouts_inf", "Infantry", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_unsung_soldier", "Soldier (CAR-15)", "", {["inf_car15", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_soldier", "Soldier (CAR-15 Shorty)", "", {["inf_car15_short", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;

/*
_action = [ "menu_unsung_soldier", "Soldier (AK)", "", {["inf_ak", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_soldier", "Soldier (M2)", "", {["inf_m2", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_soldier", "Soldier (M14)", "", {["inf_m14", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_soldier", "Soldier (Thompson)", "", {["inf_thom", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
*/

// Leadership
_action = [ "menu_unsung_loadouts_lead", "Leadership", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call ace_interact_menu_fnc_addActionToObject;
// 1-0 - TL
_action = [ "menu_unsung_10", "1-0 Team Leader", "", {["unsung_10", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// 1-1 - Radio man
_action = [ "menu_unsung_12", "1-1 Radio guy", "", {["unsung_11", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// 1-2 - Medic
_action = [ "menu_unsung_13", "1-2 Medic", "", {["unsung_12", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Specialists
_action = [ "menu_unsung_loadouts_spec", "Specialists", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_spec_pointman", "Pointman (AK)", "", {["spec_pointman", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_mrks", "Marksman (M14)", "", {["spec_marksman", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_mgs", "MG (RPD)", "", {["spec_mg", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_snipe", "Sniper (M40)", "", {["spec_sniper", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_spec_saboteur", "Saboteur (Sten)", "", {["spec_saboteur", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Vehicles
_action = [ "menu_unsung_loadouts_drive", "Driver/Pilots", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_unsung_driver", "Tank Driver", "", {["vic_driver", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_drive"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_crew", "Tank Crew", "", {["vic_crew", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_drive"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_pilot", "Heli Pilot", "", {["vic_helipilot", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_drive"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_hcrew", "Heli Crew", "", {["vic_helicrew", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_drive"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_unsung_covey", "Covey Rider", "", {["vic_covey", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts", "menu_unsung_loadouts_drive"], _action ] call  ace_interact_menu_fnc_addActionToObject;