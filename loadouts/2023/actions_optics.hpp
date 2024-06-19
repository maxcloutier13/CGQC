// Alternative Optics =======================================================================================================
_action = [ "menu_mk2_optics", "Switch: Optics", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;

// cgqc_config_scopeRestriction
// 0 - ironsight
// 1 - Dot only
// 2 - + Magnified/RCO
// 3 - Default role based
// 4 - Unlocked

//cgqc_player_role_optic
// 0 = ironsight
// 1 = dot
// 2 = magnified
// 3 = rco
// 4 = lpvo
// 5 = Sniper
// 6 = Special purpose



// Catégories =======================================================================================================
// Red dots ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_dot", "Red Dots", "", {""}, {!cgqc_mk2_arsenal_locked || cgqc_config_scopeRestriction > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Magnifiers ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_mag", "Magnifiers", "", {""}, {!cgqc_mk2_arsenal_locked || cgqc_config_scopeRestriction >= 2} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
// RCO ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_rco", "RCO", "", {""}, {!cgqc_mk2_arsenal_locked || cgqc_config_scopeRestriction >= 2} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
//LPVO ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_lpvo", "LPVO", "", {""}, {!cgqc_mk2_arsenal_locked || cgqc_config_scopeRestriction > 3 || (cgqc_config_scopeRestriction isEqualTo 3 && cgqc_player_role_optic > 3) } ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Sniper ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_sniper", "Marksman/Sniper", "", {""}, {!cgqc_mk2_arsenal_locked || cgqc_config_scopeRestriction > 3 || (cgqc_config_scopeRestriction isEqualTo 3 && cgqc_player_role_optic > 4)} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Special optics ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_special", "Special Purpose", "", {""}, {!cgqc_mk2_arsenal_locked || cgqc_config_scopeRestriction > 3 || (cgqc_config_scopeRestriction isEqualTo 3 && cgqc_player_role_optic > 5)} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Red dots ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_cmore", "CMore Railway Green", "", {["optic_ACO_grn"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_cmorer", "Red", "", {["optic_Aco"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_cmore"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_cmores", "SMG Green", "", {["optic_ACO_grn_smg"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_cmore"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_cmoresr", "SMG Red", "", {["optic_Aco_smg"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_cmore"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_eotech551", "Eotech 551", "", {["Tier1_Eotech551_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_eotech551h", "High", "", {["Tier1_Eotech551_Riser_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_eotech551"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_eotech553", "Eotech 553", "", {["Tier1_Eotech553_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_exps", "Eotech EXPS3", "", {["Tier1_EXPS3_0_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_expsh", "High", "", {["Tier1_EXPS3_0_Riser_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_exps"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_t1", "MicroT1", "", {["Tier1_MicroT1_Leap_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t1l", "Low", "", {["Tier1_MicroT1_Low_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_t1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t1h", "High", "", {["Tier1_MicroT1_Leap_Riser_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_t1"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_t2", "MicroT2", "", {["Tier1_MicroT2_Leap_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2l", "Low", "", {["Tier1_MicroT2_Low_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_t2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2h", "High", "", {["Tier1_MicroT2_Leap_Riser_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_t2"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_romeo", "Romeo4T", "", {["Tier1_Romeo4T_BCD_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_romeol", "Low", "", {["Tier1_Romeo4T_BCD_Low_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_romeo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_romeoh", "High", "", {["Tier1_Romeo4T_BCD_Riser_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_romeo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_romeocl", "CQB Reticle", "", {["Tier1_Romeo4T_BCQ_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_romeo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_romeoch", "Low", "", {["Tier1_Romeo4T_BCQ_Low_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_romeo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_romeocl", "High", "", {["Tier1_Romeo4T_BCQ_Riser_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_dot", "menu_mk2_optics_romeo"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Magnifiers ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_mag_551", "EoTech 551/3X", "", {["Tier1_Eotech551_3xMag_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_551l", "EoTech 551/L3", "", {["Tier1_Eotech551_L3_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_551"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_mag_553", "EoTech 553/3X", "", {["Tier1_Eotech553_3xMag_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_553l", "EoTech 553/L3", "", {["Tier1_Eotech553_L3_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_553"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_mag_esp", "Eotech ESPS3/3X", "", {["Tier1_EXPS3_0_3xMag_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_esph", "High", "", {["Tier1_EXPS3_0_3xMag_Riser_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_esp"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_espg33", "G33", "", {["Tier1_EXPS3_0_G33_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_esp"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_espgh", "G33 High", "", {["Tier1_EXPS3_0_G33_Riser_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_esp"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_mag_t2", "MicroT2/3X", "", {["Tier1_MicroT2_Leap_3xMag_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_t2h", "High", "", {["Tier1_MicroT2_Leap_3xMag_Riser_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_t2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_t2gl", "G33", "", {["Tier1_MicroT2_Leap_G33_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_t2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_t2gh", "G33 High", "", {["Tier1_MicroT2_Leap_G33_Riser_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_t2"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_mag_romeo", "Romeo4T/G33", "", {["Tier1_Romeo4T_BCD_G33_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_romeoh", "High", "", {["Tier1_Romeo4T_BCD_G33_Riser_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_romeo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_romeocl", "CQB Reticle", "", {["Tier1_Romeo4T_BCQ_G33_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_romeo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mag_romeoch", "High", "", {["Tier1_Romeo4T_BCQ_G33_Riser_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_mag", "menu_mk2_optics_mag_romeo"], _action ] call ace_interact_menu_fnc_addActionToObject;

// RCO ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_elcan", "Elcan SpecterOS - 0/1-2x", "", {["optic_Arco_blk_F"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_rco"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_elcandr", "Elcan SpecterDR - 0/1-2x", "", {["Tier1_Elcan_156_C2_Docter_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_rco", "menu_mk2_optics_elcan"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_bravo", "Sig Bravo4 - 0/2x", "", {["optic_ERCO_blk_F"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_rco"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_mk4", "Leupold Mk4 - 0/2x", "", {["optic_Hamr"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_rco"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_acog", "ACOG - 0/2x", "", {["rhsusf_acc_ACOG_RMR"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_rco"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_su", "SU-230A - 0/2.5x", "", {["rhsusf_acc_su230a_mrds"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_rco"], _action ] call ace_interact_menu_fnc_addActionToObject;

//LPVO ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_gen2", "Vortex GenII - 0/1-6x", "", {["Tier1_Razor_Gen2_16_Geissele_Docter"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_lpvo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_atacr", "Nightforce ATACR - 0/1-8x", "", {["Tier1_ATACR18_Geissele_Docter_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_lpvo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_shortdot", "ShortDot - 0/1-8x", "", {["Tier1_Shortdot_Geissele_Docter_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_lpvo"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_gen3", "Vortex GenIII - 0/1-10x", "", {["Tier1_Razor_Gen3_110_Geissele_Docter"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_lpvo"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Sniper ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_buris", "Buris XTRII - 0/1-4x", "", {["optic_DMS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_snipe_m3a", "Leupold M3A - 0/2-7x", "", {["Tier1_LeupoldM3A_Geissele_Docter_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_snipe_mr10", "MR-10 - 0/3-9x", "", {["optic_AMS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_snipe_mrds", "M8541A - 0/3-15x", "", {["rhsusf_acc_premier_mrds"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_snipe_nxs", "Nightforce NXS - 0/5-22x", "", {["optic_lrps"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_snipe_rvps", "R-VPS - 4-20x ", "", {["121_USASOC_RVPS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_snipe_pvps", "P-VPS - 7-35x", "", {["121_USASOC_PVPS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Special optics ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics_skeet", "SkeetIR - 1-2x", "", {["SkeetIR_TWS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_anpas", "AN/PAS - 1-2x", "", {["rhsusf_acc_anpas13gv1"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_nvs", "NVS - 5x", "", {["optic_NVS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_nightf", "Nightforce+SkeetIR - 0/1-8x", "", {["NForce_Atcr_RMR_Top_SkeetIR_Down"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_nights", "NightStalker - 0/5-22x", "", {["optic_Nightstalker"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_tws", "TWS - 4-10x", "", {["optic_tws"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_Nightpro", "Nightstalker Pro - 0/4-31x", "", {["SN_NS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_121ns", "R-PVS - 4-20x", "", {["121_USASOC_RVPS_ANPVS30"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_121nl", "P-PVS - 7-35x", "", {["121_USASOC_PVPS_ANPVS30"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;