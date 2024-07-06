// SWAT ***********************************************************************************
_action = [ "menu_swat", "SWAT", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Loadout switcher ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_roles", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Operators ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_roles_operators", "Operators", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// -----------
_action = [ "menu_swat_roles_mp5sd6", "4.5in MP5K 9mm", "", {["swat_assaulter_mp5k", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_operators"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_mp5sd6", "6in HoneyBadger .300Blk", "", {["swat_assaulter_badger", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_operators"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_mp5sd6", "8in SCAR-SC 5.6mm", "", {["swat_assaulter_scar", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_operators"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_mp5sd6", "9in MP5sd6 9mm", "", {["swat_assaulter", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_operators"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_mp5sd6", "9in MP5A5 9mm", "", {["swat_assaulter_mp5", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_operators"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_mp5sd6", "9in MP5-10 10mm", "", {["swat_assaulter_mp510", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_operators"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_mp5sd6", "10in p90 5.7mm", "", {["swat_assaulter_p90", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_operators"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_mp5sd6", "10in HK416 5.6mm", "", {["swat_assaulter_416", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_operators"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Specialists ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_roles_specs", "Specialists", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// -----------
_action = [ "menu_swat_roles_breach", "Breacher", "", {["swat_breacher", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_specs"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_eod", "Explosives Expert", "", {["swat_eod", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_specs"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_medic", "Tactical Medic", "", {["swat_medic", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_specs"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_tech", "Technology Specialist", "", {["swat_drone", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_specs"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Snipers ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_roles_snipe", "Snipers", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// -----------
_action = [ "menu_swat_roles_sniper", "Semi Socom16 7.62mm", "", {["swat_sniper_carbine", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_snipe"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_sniper_1", "Semi PSG-1 7.62mm", "", {["swat_sniper_psg", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_snipe"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_sniper", "Bolt M24 .308", "", {["swat_sniper", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_snipe"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_sniper_1", "Bolt AWM .300WM", "", {["swat_sniper_awm", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_snipe"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// -----------
_action = [ "menu_swat_roles_tl", "Tactical Team Leader", "", {["swat_tl", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_command"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Commanding Officer
_action = [ "menu_swat_roles_tl", "Officer in Charge", "", {["swat_hq", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_command"], _action ] call  ace_interact_menu_fnc_addActionToObject;



// Support ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_roles_others", "Others", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_swat_roles_tl", "RCMP Police Officer", "", {["swat_rcmp", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_others"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_tl", "Paramedic/EMT", "", {["swat_emt", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_others"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_roles_tl", "Field Training Officer", "", {["swat_fto", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles", "menu_swat_roles_others"], _action ] call  ace_interact_menu_fnc_addActionToObject;
