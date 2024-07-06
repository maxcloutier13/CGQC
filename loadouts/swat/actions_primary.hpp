// Alternative Primaries ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" ], _action ] call ace_interact_menu_fnc_addActionToObject;

// Low Pen ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_alt_low", "Low Penetration", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_swat_alt_p90", "4.5in MP5K 9mm", "", {["swat_mp5k", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_blk", "6in HoneyBadger .300Blk", "", {["swat_blk", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_mp5", "9in MP5sd6 9mm", "", {["swat_mp5sd6", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_mp5", "9in MP5A5 9mm", "", {["swat_mp5a5", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_mp5", "9in MP5N GL 9mm", "", {["swat_mp5n", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_mp5", "9in MP5-10 10mm", "", {["swat_mp510", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_socom", "16in Socom16 7.62mm", "", {["swat_socom", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_m24", "25in PSG-1 7.62mm", "", {["swat_psg1", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_m24", "26in AWM .300WM", "", {["swat_awm", 8] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_low"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Full Power ---------------------------------------------------------------------------------------------------------
_action = [ "menu_swat_alt_hi", "Full Power", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_swat_alt_mp7", "7in MP7 4.6mm", "", {["swat_mp7", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_mp7", "8in SCAR-SC 5.6mm", "", {["swat_scarsc", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_p90", "10in p90 5.7mm", "", {["swat_p90", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_p90", "10in HK416 5.6mm", "", {["swat_416", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_p90", "11.5in SR-16 5.6mm", "", {["swat_sr16", 4] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_m24", "16in CSR16 .338Lapua", "", {["swat_csr16", 8] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_m24", "24in M24 .308", "", {["swat_m24", 8] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_m24", "24in CSR16 .338Lapua", "", {["swat_csr24", 8] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_swat_alt_m24", "M4 Benelli Shotgun", "", {["swat_shotgun", 8] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt", "menu_swat_alt_hi"], _action ] call ace_interact_menu_fnc_addActionToObject;



//=== Non-Lethal =========================================================================================================
_action = [ "menu_swat_alt_nonLethal", "Setup your gun Non-Lethal", "", {[] spawn CGQC_fnc_switchNonLethal}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
