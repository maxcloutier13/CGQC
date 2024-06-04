// 2023 ***********************************************************************************
_action = [ "menu_2023", "2023", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Mk1 Loadout switcher ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2", "Loadouts/Rôles MK3", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Infanterie ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_inf", "Infanterie", "\cgqc\textures\cgqc_ace_rifle.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Rifleman mk18
//_action = [ "menu_mk2_inf_RFCQB", "Rifleman CQB mk18", "", {["2023_rifle_cqb"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Rifleman M4
_action = [ "menu_mk2_inf_RF", "Rifleman", "", {["2023_rifle_carb"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Rifleman M16
//_action = [ "menu_mk2_inf_RF_m16", "Rifleman Rifle M16a4", "", {["2023_rifle_rifle"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Grenadier
_action = [ "menu_mk2_inf_Grenadier", "Grenadier", "", {["2023_rifle_grenadier"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Junior specialists
// Sharpshooter
_action = [ "menu_mk2_inf_mrk", "Sharpshooter", "", {["2023_rifle_shoot"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Repair Engineer
_action = [ "menu_mk2_inf_eng", "Combat Engineer", "", {["2023_rifle_eng"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Combat Lifesaver
_action = [ "menu_mk2_inf_life", "Combat Lifesaver", "", {["2023_rifle_life"] spawn CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Specialists ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_spec", "Spécialistes", "\cgqc\textures\cgqc_ace_specialists", {""}, {player getVariable 'cgqc_player_rank' > 1 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Medic
_action = [ "menu_mk2_inf_medic", "Squad Medic", "", {["2023_medic"] spawn CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Engineer
_action = [ "menu_mk2_inf_eng", "Engineer", "", {["2023_eng"] spawn CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Saboteur
_action = [ "menu_mk2_inf_saboteur", "Saboteur", "", {["2023_eng_saboteur"] spawn CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Autorifleman
_action = [ "menu_mk2_inf_auto", "AutoRifleman (m27 - 5.56)", "", {["2023_autorifle"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// MG (Light)
_action = [ "menu_mk2_inf_LMG", "Light machinegun (mk46 - 5.56)", "", {["2023_lmg"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  MG (Heavy)
_action = [ "menu_mk2_inf_HMG", "Heavy machinegun (mk48 - 7.62)", "", {["2023_hmg"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// LWMMG
_action = [ "menu_mk2_inf_LWMMG", "LWMMG (.338)", "", {["2023_lwmmg"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Anti-Tank (MAAWS)
_action = [ "menu_mk2_inf_maaws", "Anti-Tank (MAAWS)", "", {["2023_at_maaws"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Anti-Tank (Javelin)
_action = [ "menu_mk2_inf_jav", "Anti-Tank (Javelin)", "", {["2023_at_javelin"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Recon ------------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_recon", "Recon", "\cgqc\textures\cgqc_ace_bino.paa", {""}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Sniper m200
_action = [ "menu_mk2_inf_snipe", "Sniper m200", "", {["2023_sniper"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Sniper m14 ebr
_action = [ "menu_mk2_inf_snipe", "Sniper EBR", "", {["2023_sniper_ebr"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Spotter
_action = [ "menu_mk2_inf_spotter", "Spotter", "", {["2023_spotter"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Drone Operator
_action = [ "menu_mk2_inf_drone", "Drone Operator", "", {["2023_drone"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
// JTAC
_action = [ "menu_mk2_inf_jtac", "FAC/JTAC", "", {["2023_jtac"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Pilotes ------------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_pilots", "Griffon", "\cgqc\textures\cgqc_ace_heli.paa", {""}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Helicopter pilot
_action = [ "menu_mk2_helipilot", "Helicopter pilot", "", {["2023_h_pilot"] spawn CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 4 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Helicopter crew
_action = [ "menu_mk2_helicrew", "Helicopter crew", "", {["2023_h_crew"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Drivers ------------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_driver", "Centaure", "\cgqc\textures\icon_tank.paa", {}, {player getVariable 'cgqc_player_rank' > 1 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Tank Driver
_action = [ "menu_mk2_tank", "Tank driver", "", {["2023_t_driver"] spawn CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_driver"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Tank Crew
_action = [ "menu_mk2_crew", "Tank Crew", "", {["2023_t_crew"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_driver"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Lead ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_lead", "Commandement", "\cgqc\textures\cgqc_ace_beret", {""}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Team Leader
_action = [ "menu_mk2_inf_TL", "Team Leader", "", {["2023_tl", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Team Leader CQB
//_action = [ "menu_mk2_inf_TLcqb", "Team Leader CQB", "", {["2023_tl", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Team Leader no GL
//_action = [ "menu_mk2_inf_TLnoGL", "Team Leader no GL", "", {["2023_tl", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// SL
_action = [ "menu_mk2_inf_sl", "Squad Leader", "", {["2023_sl"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_inf_xo", "Executive Officer/Sergent", "", {["2023_xo"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// HQ
_action = [ "menu_mk2_inf_hq", "HQ (Static)", "", {["2023_hq"] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;

/*
// AR
_action = [ "menu_mk2_inf_AR", "Auto-Rifleman", "", {["2023_tl", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Mortier léger
_action = [ "menu_mk2_inf_mortar", "Mortier Léger", "", {["2023_tl", 1, true] spawn CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Jet pilot
//_action = [ "menu_mk2_inf_jet", "Jet pilot", "", {["2023_tl", 1, true] spawn CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 4 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;

*/