// Alternative Optics ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_optics", "Switch: Optics", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;
// Categories
_action = [ "menu_mk2_optics_night", "100% Night", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_day", "Day", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_special", "Special Purpose", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
// 100% night compatible optics
_action = [ "menu_mk2_optics_cmore", "RedDot - CMore Railway - 0x", "", {["optic_ACO_grn"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_eotech", "RedDot - Eotech - 0x", "", {["Tier1_Eotech553_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2", "RedDot - MicroT2 - 0x", "", {["Tier1_MicroT2_Leap_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2", "RedDot - MicroT2 Low- 0x", "", {["Tier1_MicroT2_Low_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_t2", "RedDot - MicroT2 Hi- 0x", "", {["Tier1_MicroT2_Leap_Riser_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_mk2_optics_t2", "RCO - Leupold Mk4 - 0/2x", "", {["optic_Hamr"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_bravo", "RCO - Sig Bravo4 - 0/2x", "", {["optic_ERCO_blk_F"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_acog", "RCO - ACOG - 0/2x", "", {["rhsusf_acc_ACOG_RMR"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_elcan", "RCO - Elcan SpecterDR - 0/1-2x", "", {["Tier1_Elcan_156_C2_Docter_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Day optics
_action = [ "menu_mk2_optics_eotech+", "RedELCAN - Eotech - 0/3x", "", {["Tier1_EXPS3_0_3xMag_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
//LPVO
_action = [ "menu_mk2_optics_gen2", "LPVO - GenII - 0/1-6x", "", {["Tier1_Razor_Gen2_16_Geissele_Docter"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_shortdot", "LPVO - ShortDot - 0/1-8x", "", {["Tier1_Shortdot_Geissele_Docter_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_gen3", "LPVO - GenIII - 0/1-10x", "", {["Tier1_Razor_Gen3_110_Geissele_Docter"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
//Sniper
_action = [ "menu_mk2_optics_shortdot", "Sniper - M8541A - 0/3-15x", "", {["rhsusf_acc_premier_mrds"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_gen3", "Sniper - Nightforce NXS - 0/5-22x", "", {["optic_lrps"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_121s", "Sniper - R-VPS - 4-20x ", "", {["121_USASOC_RVPS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_mk2_optics_121L", "Sniper - P-VPS - 7-35x", "", {["121_USASOC_PVPS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Special optics
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
