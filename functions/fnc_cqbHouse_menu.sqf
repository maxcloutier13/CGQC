waitUntil {!isNil "cgqc_postInitClient_done"};
waitUntil {cgqc_postInitClient_done};
_type = _this select 0;
cqb_house1_list = [];
cqb_house1_list_moving = [];
cqb_house1_list_static = [];
cqb_house1_list_civ = [];
cgqc_house1_on = false;
cqb_house1_target_nbr = 10;
cqb_house1_move = 0;
cqb_house1_timer = 0;
cqb_house1_civ = false;
cqb_house1_nade = false;
cqb_house1_tgt_move = 0;
cqb_house1_tgt_static = 0;
cqb_house1_hostile_class = ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F"];
cqb_house1_civ_class = ["C_journalist_F", "C_Journalist_01_War_F"];
if (hasInterface) then {   
    _action = [ "menu_house1_clear", "Stop CQB", "", {[0] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;    

    _action = [ "menu_house1_option", "Options", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    
    _action = [ "menu_house1_nbr", "Target number", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_nbr5", "+5", "", {[40] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_nbrm5", "-5", "", {[41] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_nbr10", "+10", "", {[42] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_nbrm10", "-10", "", {[43] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_nbr20", "+20", "", {[44] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_nbrm20", "-20", "", {[45] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;

    _action = [ "menu_house1_static", "Target movement", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_nomove", "All static", "", {[50] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_m10", "10% move", "", {[51] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_m25", "25% move", "", {[52] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_m10", "50% move", "", {[53] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_m25", "75% move", "", {[54] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;

    _action = [ "menu_house1_civ", "Civilian presence", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_civ_on", "On", "", {[60] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_civ"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_civ_off", "Off", "", {[61] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_civ"], _action ] call  ace_interact_menu_fnc_addActionToObject;

    _action = [ "menu_house1_gren", "Grenades on PAX", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_gren_on", "On", "", {[62] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_gren"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_gren_off", "Off", "", {[63] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_gren"], _action ] call  ace_interact_menu_fnc_addActionToObject;

     _action = [ "menu_house1_timer", "Timer to release PAX", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_timer0", "No release", "", {[70] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_timer30", "+30secs", "", {[71] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_timerm30", "-30secs", "", {[72] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_timer30", "+60secs", "", {[73] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_timerm30", "-60secs", "", {[74] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    
    _action = [ "menu_house1_start", "Start CQB", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    
    // Pistols
    //_action = [ "menu_house1_easy", "Pistols: Won't shoot", "", {[1] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasRHS} ] call ace_interact_menu_fnc_createAction;       
    //_adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_nrml", "Pistols: FIA", "", {[2] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    // SMG
    _action = [ "menu_house1_med", "SMG: FIA", "", {[3] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_gendarme", "SMG: Gendarmerie", "", {[7] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    // Full Army
    _action = [ "menu_house1_hard", "Full: Wagner", "", {[4] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_csat", "Full: CSAT", "", {[5] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_viper", "Full: CSAT Viper", "", {[6] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_spetsnaz", "Full: Spetsnaz", "", {[8] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_ldf", "Full: LDF", "", {[9] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_looters", "Full: Looters", "", {[10] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_syndikat", "Full: Syndikat", "", {[11] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_aaf", "Full: AAF", "", {[12] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_vdv", "Full: VDV", "", {[13] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_dnsk", "Full: Donesk/Luhansk", "", {[14] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_hamas", "Full: Hamas", "", {[15] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_pmc", "Full: Ion PMC", "", {[16] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_isis", "Full: ISIS", "", {[17] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_cartel", "Full: Cartel", "", {[18] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    //Rearm-Ressupply
    _action = [ "menu_house1_supplies", "Rearm/Ressuply", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_supplies_heal", "Quick heal", "", {[-1] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_supplies_bandage", "10x bandages", "", {[-2] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_supplies_primary", "10x Primary mags", "", {[-3] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_supplies_secondary", "5x Secondary mags", "", {[-4] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_supplies_bangs", "5x Flashbangs m84", "", {[-5] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    _action = [ "menu_house1_supplies_9bangs", "5x 9-bangs", "", {[-6] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
    _adding = [ _type, 0, ["ACE_MainActions", "menu_house1_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
    
};