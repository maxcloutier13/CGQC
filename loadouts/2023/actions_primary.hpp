// Alternative Primaries ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;

// === 5.56 =========================================================================================================
_action = [ "menu_mk2_alt_556", "5.56", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_cqb", "CQB", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_carbine", "Carbine", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_rifle", "Full Rifle", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556"], _action ] call ace_interact_menu_fnc_addActionToObject;
// CQB
_action = [ "menu_mk2_alt_scarCQC", "7.5in SCAR-L", "", {["scar_l_short"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk18", "10in Mk18", "", {["mk18_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk18gl", "10in Mk18 GL", "", {["mk18_gl"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_GL"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_416", "10in HK416", "", {["416_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_virtus", "11.5in Virtus", "", {["virtus_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sr16", "11.5in SR16", "", {["sr16_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctar21", "15in CTAR-21", "", {["CTAR21"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Carbines
_action = [ "menu_mk2_alt_m4dot", "14in M4blkII ELCAN", "", {["m4_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m4lpvo", "14in M4blkII LPVO", "", {["m4_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m320", "14in M4blkII GL", "", {["m4_gl_m320"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_GL"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sr16dot", "14.5in SR16 ELCAN", "", {["sr16_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sr16lpvo", "14.5in SR16 LPVO", "", {["sr16_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_416ELCAN", "14.5in HK416 ELCAN", "", {["sr16_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_416lpvo", "14.5in HK416 LPVO", "", {["sr16_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctar21", "18in CTAR-21 ", "", {["TAR21"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctar21gl", "18in GTAR-21 GL", "", {["TAR21GL"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Rifles
_action = [ "menu_mk2_alt_m27", "16.5in M27 LPVO", "", {["m27_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk12", "18in Mk12 LPVO", "", {["mk12_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m16lpvo", "20in M16a4 ShortDot", "", {["m16_shortdot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;


// === 7.62 =========================================================================================================
_action = [ "menu_mk2_alt_762", "7.62", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_dmr", "DMR 7.62", "", {""}, {player getVariable 'cgqc_player_rank' > 1 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762"], _action ] call ace_interact_menu_fnc_addActionToObject;

// DMR 7.62
_action = [ "menu_mk2_alt_m110k5", "14.5in M110k5", "", {["m110k5"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_socom", "16in SOCOM16", "", {["socom16"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m110", "20in M110", "", {["m110_leupold"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_417", "20in HK417", "", {["417"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sig556", "20in SIG 556", "", {["sig556"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m14ebr", "22in M14EBR", "", {["m14ebr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;

//=== Sniper =========================================================================================================
_action = [ "menu_mk2_alt_sniper", "Sniper", "", {""}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_noreen", "20in Noreen .338", "", {["noreen"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m200", "29in M200 .408", "", {["m200"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;

//=== MG =========================================================================================================
_action = [ "menu_mk2_alt_mg", "MG", "", {""}, {player getVariable 'cgqc_player_rank' > 1 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_m27", "AutoRifle - m27", "", {["m27"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk46", "LightMG - mk46", "", {["mk46"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk48", "HeavyMG - mk48", "", {["mk48"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_lwmmg", "LWMMG - .338", "", {["lwmmg"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;

//=== Others =========================================================================================================
_action = [ "menu_mk2_alt_others", "Others", "", {""}, {player getVariable 'cgqc_player_rank' > 1 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_p90", "P90 - 9mm", "", {["p90"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_blck", "MCX - 300BLK", "", {["mcx_t2"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;

//=== Non-Lethal =========================================================================================================
_action = [ "menu_mk2_alt_nonLethal", "Non-Lethal", "", {[] spawn CGQC_fnc_switchNonLethal}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
