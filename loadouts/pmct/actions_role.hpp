// PMC-T ***********************************************************************************
_action = [ "menu_pmct", "PMC-T", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

//Loadout switcher ---------------------------------------------------------------------------------------------------------
_action = [ "menu_pmct_roles", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_inf_RF", "Rifleman", "", {["pmct_rifle"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "Grenadier", "", {["pmct_gren"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "Combat Lifesaver", "", {["pmct_lifesaver"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "Engineer", "", {["pmct_eng"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_inf_RF", "AutoRifleman", "", {["pmct_autorifleman"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "HMG", "", {["pmct_mg"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "AT", "", {["pmct_at"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_inf_RF", "Sniper", "", {["pmct_sniper"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "Marksman", "", {["pmct_marks"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "Drone Operator", "", {["pmct_drone"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_inf_RF", "Tank Driver", "", {["pmct_driver"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "Tank Crew", "", {["pmct_crew"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_inf_RF", "Squad Medic", "", {["pmct_medic"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "Explosives Expert", "", {["pmct_eod"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_inf_RF", "Squad Leader", "", {["pmct_lead"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_RF", "Team Leader", "", {["pmct_tl"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct", "menu_pmct_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
