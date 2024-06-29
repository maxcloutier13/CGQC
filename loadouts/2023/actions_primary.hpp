// Alternative Primaries ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;

// === 5.56 =========================================================================================================
_action = [ "menu_mk2_alt_556", "5.56", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
// CQB
_action = [ "menu_mk2_alt_cqb", "CQB / SBR", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk18", "10in Mk18", "", {["mk18_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_416", "10in HK416", "", {["416_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_acre", "10in ACRE", "", {["acre_sbr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_virtus", "11.5in Virtus", "", {["virtus_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sr16", "11.5in SR16", "", {["sr16_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctar21", "15in CTAR-21", "", {["CTAR21"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Carbines
_action = [ "menu_mk2_alt_carbine", "Carbine", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m4dot", "14in M4blkII", "", {["m4_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sr16dot", "14.5in SR16", "", {["sr16_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_416ELCAN", "14.5in HK416", "", {["hk416_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_416ELCAN", "14.5in ACRE", "", {["acre_carb"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctar21", "18in CTAR-21 ", "", {["TAR21"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Rifles
_action = [ "menu_mk2_alt_rifle", "Rifle / SPR", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m27", "16.5in M27", "", {["m27_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m27", "16.5in ACRE", "", {["acre_mid"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk12", "18in Mk12", "", {["mk12_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk12", "18in LAR-15 AMR", "", {["lar15"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m16lpvo", "20in M16a4 ShortDot", "", {["m16_shortdot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m27", "20in ACRE", "", {["acre_spr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_556", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;

// === 7.62 =========================================================================================================
_action = [ "menu_mk2_alt_762", "7.62", "", {""}, {player getVariable 'cgqc_player_rank' > 1 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

// CQB
_action = [ "menu_mk2_alt_762CQB", "CQB", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_scarHCqb", "11in SA-58", "", {["sa58"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_762CQB"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarHCqb", "13in H&K G3KA4", "", {["G3KA4"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_762CQB"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Rifle
_action = [ "menu_mk2_alt_762Rifles", "Rifle", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_m110k5", "16in SOCOM 16", "", {["socom16rifle"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_762Rifles"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m110k5", "18in M14", "", {["m14fiberglass"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_762Rifles"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m110k5", "18in M14 Sopmod", "", {["m14sopmodRifle"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_762Rifles"], _action ] call ace_interact_menu_fnc_addActionToObject;


// DMR
_action = [ "menu_mk2_alt_dmr", "DMR", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_m110k5", "14.5in M110k5", "", {["m110k5"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m110k5", "14.5in M110k5 6.5mm", "", {["m110k5_65"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_socom", "16in SOCOM16", "", {["socom16"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m110k5", "18in M14 Sopmod", "", {["m14sopmodDmr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m110", "20in SR25", "", {["SR25"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m110", "20in M110k1", "", {["m110_leupold"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_417", "20in HK417", "", {["417"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sig556", "20in SIG 556", "", {["sig556"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m14ebr", "22in M14 DMR", "", {["m14dmr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m14ebr", "22in M21", "", {["m21"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m14ebr", "22in M14EBR", "", {["m14ebr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_762", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;

//=== MG =========================================================================================================
_action = [ "menu_mk2_alt_mg", "MG", "", {""}, {player getVariable 'cgqc_player_rank' > 1 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_m27", "AutoRifle - m27 5.56", "", {["m27"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk46", "LMG - mk46 5.56", "", {["mk46"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_minimi", "LMG - Minimi 5.56", "", {["minimi"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_minimi", "LMG - M249 5.56", "", {["m249"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_stoner", "LG - Stoner 99 6.5", "", {["stoner"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk48", "HMG - mk48 7.62", "", {["mk48"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_lwmmg", "LWMMG - .338", "", {["lwmmg"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_hk121", "HK121 - 9.3mm", "", {["hk121"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;

//=== GL's =========================================================================================================
_action = [ "menu_mk2_alt_gl", "Grenade-Launchers", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_mk18gl", "10in Mk18 5.56", "", {["mk18_gl"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_gl"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m320", "14in M4blkII 5.56", "", {["m4_gl_m320"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_gl"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctar21gl", "18in GTAR-21 5.56", "", {["TAR21GL"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_gl"], _action ] call ace_interact_menu_fnc_addActionToObject;

//=== Sniper =========================================================================================================
_action = [ "menu_mk2_alt_sniper", "Sniper", "", {""}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_sniper_semi", "Semi-Auto", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sniper_bolt", "Bolt Action", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Semi auto
_action = [ "menu_mk2_alt_noreen", "20in Noreen .338", "", {["noreen"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_semi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_csr24", "25in QBU-88 6.5", "", {["qbu"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_semi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_csr24", "25in PSG1 7.62", "", {["psg1"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_semi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_csr24", "29in M107 12.7", "", {["m107"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_semi"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Bolt
_action = [ "menu_mk2_alt_csr24", "16in CSR16 .308", "", {["csr16"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m1a", "18in M1A EBR 7.62", "", {["m1aebr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctsr", "24in M24 SWS 7.62", "", {["m24"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctsr", "24in M2010 ESR .300WM", "", {["m2010"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_ctsr", "24in CTSR .300", "", {["ctsr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_csr24", "24in CSR24 .308", "", {["csr24"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mk22", "26in Mk22 .338", "", {["barrett_mk22"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_csr24", "27in AWC-M .300WM", "", {["awc"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_m200", "29in M200 .408", "", {["m200"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper", "menu_mk2_alt_sniper_bolt"], _action ] call ace_interact_menu_fnc_addActionToObject;


//=== Others =========================================================================================================
_action = [ "menu_mk2_alt_others", "Others", "", {""}, {player getVariable 'cgqc_player_rank' > 1 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

// === 300blk =========================================================================================================
_action = [ "menu_mk2_alt_blk", "Blackout", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;


_action = [ "menu_mk2_alt_mcx", "6in AAC Honey Badger", "", {["badger"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_blk"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mcx", "11in MCX Virtus", "", {["mcx_t2"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_blk"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mcx", "14in BCM BlackJack", "", {["blackjack"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_blk"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mcx", "16in AR15 Dissipator", "", {["dissipator"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_blk"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mcx", "16in Bushmaster", "", {["bushmaster"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_blk"], _action ] call ace_interact_menu_fnc_addActionToObject;

// === 6.8mm =========================================================================================================
_action = [ "menu_mk2_alt_68", "6.8mm", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_mcx", "10in ACRE", "", {["acre_68_sbr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_68"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mcx", "14in ACRE", "", {["acre_68_carb"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_68"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mcx", "16in ACRE", "", {["acre_68_mid"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_68"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mcx", "20in ACRE", "", {["acre_68_long"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_68"], _action ] call ace_interact_menu_fnc_addActionToObject;

// === AK style =========================================================================================================
_action = [ "menu_mk2_alt_ak", "AK style", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;


_action = [ "menu_mk2_alt_scarHStd", "8in slr107U", "", {["slr107u"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_ak"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarHStd", "13in AK-104", "", {["ak_104"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_ak"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarHStd", "14in SIG SG553R", "", {["sg553AK"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_ak"], _action ] call ace_interact_menu_fnc_addActionToObject;

// === SCAR style =========================================================================================================
_action = [ "menu_mk2_alt_scar", "SCAR style", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_scar556", "5.56", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_scar_l_cqb", "13in SCAR-L", "", {["scar_l_cqb"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scar_l_cqb", "13in SCAR-L GL", "", {["scar_l_cqb_gl"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarLStd", "14in SCAR-L", "", {["scar_l_std"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarLStd", "14in SCAR-L GL", "", {["scar_l_std_gl"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar556"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarLlong", "18in SCAR-L", "", {["scar_l_long"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar556"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_scar762", "7.62", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_scarHCqb", "13in SCAR-H", "", {["scar_h_cqb"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar762"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarHCqb", "13in SCAR-H GL", "", {["scar_h_cqb_gl"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar762"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarHStd", "16in SCAR-H", "", {["scar_h_std"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar762"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarHStd", "16in SCAR-H GL", "", {["scar_h_std_gl"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar762"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarDmr", "20in SCAR TPR", "", {["scar_dmr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scar762"], _action ] call ace_interact_menu_fnc_addActionToObject;


_action = [ "menu_mk2_alt_scarOther", "Other", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_alt_mcx", "13in SCAR .300Blk", "", {["scar_l_cqb_blackout"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scarOther"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_mcx", "14in SCAR .300Blk", "", {["scar_l_std_blackout"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scarOther"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scar_l_cqb", "14in SCAR GL .300Blk", "", {["scar_l_std_gl_blackout"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scarOther"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_scarHStd", "16in SCAR-AK 7.62", "", {["scar_ak"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others", "menu_mk2_alt_scar", "menu_mk2_alt_scarOther"], _action ] call ace_interact_menu_fnc_addActionToObject;


// === Specialised guns =========================================================================================================
_action = [ "menu_mk2_alt_p90", "P90 - 9mm", "", {["p90"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_sdar", "SDAR UnderWater", "", {["sdar"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;

// === Qualification
_action = [ "menu_mk2_alt_qual", "Qualification", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_alt_qual", "", "", {["sdar"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;


//=== Non-Lethal =========================================================================================================
_action = [ "menu_mk2_alt_nonLethal", "Setup your gun Non-Lethal", "", {[] spawn CGQC_fnc_switchNonLethal}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
