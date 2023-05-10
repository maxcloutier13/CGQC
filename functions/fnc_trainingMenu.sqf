// --- trainingMenu ----------------------------------------------------------
cgqc_training_mode = true;
// Add the training shit to the player 
// Training actions ---------------------------------------------------------------------------------
_action = [ "menu_self_training", "Training", "", {}, {cgqc_training_mode} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Quick Heal
_action = [ "menu_self_heal", "Quick heal", "", {["heal"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Get Crate
_action = [ "menu_self_training_crate", "Spawn: Arsenal mk3", "", {["crate"] execVM '\cgqc\loadouts\mk3_getStuff.sqf'}, {!cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training"], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_self_training_delcrate", "Delete Arsenal", "", {["del_crate"] execVM '\cgqc\loadouts\mk3_getStuff.sqf'}, {cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Time/weather 
_action = [ "menu_self_training_time", "Time/Weather", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// ------ Skip time
_action = [ "menu_self_training_skip", "Skip time", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_basic", "Skip 1h", "", {["skip", 1] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_orient_basic", "Skip 3h", "", {["skip", 3] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_orient_basic", "Skip 6h", "", {["skip", 6] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_orient_basic", "Skip 12h", "", {["skip", 12] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
//Change wind -----------------------------
_action = [ "menu_sniping_wind", "Change Wind", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
/*_action = [ "menu_sniping_wind_low", "Low", "", {["cgqc_change_fucking_wind", ["wind_low"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_sniping_wind_mid", "Medium", "", {["cgqc_change_fucking_wind", ["wind_med"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_sniping_wind_hi", "High", "", {["cgqc_change_fucking_wind", ["wind_hi"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_sniping_wind_random", "Random", "", {["cgqc_change_fucking_wind", ["wind_random"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
*/
// Sniping ---------------------------------------------------------------------------------------------------------
_action = [ "menu_sniping_on", "Sniping On", "", {[1]execVM '\cgqc\functions\fnc_trainingSniping.sqf'}, {!cgqc_sniping} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

// Orienteering ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_orient", "Orientation", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_basic", "Basic Orientation->ON", "", {["basic_on"] execVM '\cgqc\functions\fnc_trainingOrient.sqf'}, {!cgqc_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_orient_basic_off", "Basic Orientation->Off", "", {["basic_off"] execVM '\cgqc\functions\fnc_trainingOrient.sqf'}, {cgqc_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
// Options
_action = [ "menu_self_training_orient_options", "Options", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_patrols", "Add Patrols", "", {cgqc_orient_opt_patrols = true}, {!cgqc_orient_opt_patrols} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_patrols_off", "Remove Patrols", "", {cgqc_orient_opt_patrols = true}, {cgqc_orient_opt_patrols} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_hunters", "Add Hunters", "", {cgqc_orient_opt_hunters = true}, {!cgqc_orient_opt_hunters} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_hunters_off", "Remove Hunters", "", {cgqc_orient_opt_hunters = true}, {cgqc_orient_opt_hunters} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// CQB ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_cqb", "CQB", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_clear", "Stop CQB", "", {[0] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;    

_action = [ "menu_cqb_option", "Options", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_nbr", "Target number", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbr5", "+5", "", {[40] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrm5", "-5", "", {[41] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbr10", "+10", "", {[42] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrm10", "-10", "", {[43] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbr20", "+20", "", {[44] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrm20", "-20", "", {[45] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrRdm1", "Random Small: 10-20", "", {[46] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrRdm2", "Random Medium: 20-30", "", {[47] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrRdm3", "Random Large: 30-50", "", {[47] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_static", "Target movement", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nomove", "All static", "", {[50] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_m10", "10% move", "", {[51] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_m25", "25% move", "", {[52] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_m10", "50% move", "", {[53] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_m25", "75% move", "", {[54] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_mRandom", "Random", "", {[55] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_civ", "Civilian presence", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_civ_on", "On", "", {[60] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_civ"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_civ_off", "Off", "", {[61] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_civ"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_gren", "Grenades on PAX", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_gren_on", "On", "", {[62] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_gren"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_gren_off", "Off", "", {[63] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_gren"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_timer", "Timer to release PAX", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timer0", "No release", "", {[70] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timer30", "+30secs", "", {[71] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timerm30", "-30secs", "", {[72] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timer30", "+60secs", "", {[73] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timerm30", "-60secs", "", {[74] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timermRandom", "Random", "", {[75] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_start", "Start CQB", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Pistols
//_action = [ "menu_cqb_easy", "Pistols: Won't shoot", "", {[1] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_hasRHS} ] call ace_interact_menu_fnc_createAction;       
//_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nrml", "Pistols: FIA", "", {[2] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// SMG
_action = [ "menu_cqb_med", "SMG: FIA", "", {[3] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_gendarme", "SMG: Gendarmerie", "", {[7] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Full Army
_action = [ "menu_cqb_hard", "Full: Wagner", "", {[4] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_csat", "Full: CSAT", "", {[5] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_viper", "Full: CSAT Viper", "", {[6] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_spetsnaz", "Full: Spetsnaz", "", {[8] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_ldf", "Full: LDF", "", {[9] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_looters", "Full: Looters", "", {[10] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_syndikat", "Full: Syndikat", "", {[11] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_aaf", "Full: AAF", "", {[12] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_vdv", "Full: VDV", "", {[13] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_dnsk", "Full: Donesk/Luhansk", "", {[14] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_hamas", "Full: Hamas", "", {[15] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_pmc", "Full: Ion PMC", "", {[16] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_isis", "Full: ISIS", "", {[17] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_cartel", "Full: Cartel", "", {[18] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Vietnam
_action = [ "menu_cqb_viet", "Full: Vietcongs", "", {[19] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_hasUnsung} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// WW2
_action = [ "menu_cqb_ww2", "Full: Soviets", "", {[20] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_hasIfa3} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Scandinavia
_action = [ "menu_cqb_scand", "Full: Nazis", "", {[21] execVM '\cgqc\functions\fnc_trainingCqb.sqf'}, {cgqc_player_hasScandinavia} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Vehicle spawner ---------------------------------------------------------------------------------
_action = [ "menu_self_training_spawn", "Vehicle spawner", "", {[] call CGQC_fnc_OpenVehUI}, {!cgqc_spawn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_spawn_del", "Delete Vehicle", "", {deleteVehicle cgqc_spawn_vic;cgqc_spawn=false;}, {cgqc_spawn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;