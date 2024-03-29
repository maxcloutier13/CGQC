// CQB ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_cqb", "CQB", "CGQC\textures\cgqc_ace_cqb", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Pause/Unpause
_action = [ "menu_cqb_pause", "Pause CQB", "", {[500] spawn CGQC_fnc_trainingCqb}, {cgqc_cqb_on && !cgqc_cqb_paused} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_unpause", "Unpause CQB", "", {[501] spawn CGQC_fnc_trainingCqb}, {cgqc_cqb_on && cgqc_cqb_paused} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Stop
_action = [ "menu_cqb_clear", "Stop CQB", "", {[0] spawn CGQC_fnc_trainingCqb}, {cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;


_action = [ "menu_cqb_option", "Options", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_nbr", "Target number", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbr5", "+5", "", {[40] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrm5", "-5", "", {[41] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbr10", "+10", "", {[42] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrm10", "-10", "", {[43] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbr20", "+20", "", {[44] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrm20", "-20", "", {[45] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrRdm1", "Random Small: 10-20", "", {[46] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrRdm2", "Random Medium: 20-30", "", {[47] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nbrRdm3", "Random Large: 30-50", "", {[47] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_static", "Target movement", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nomove", "All static", "", {[50] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_m10", "10% move", "", {[51] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_m25", "25% move", "", {[52] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_m10", "50% move", "", {[53] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_m25", "75% move", "", {[54] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_mRandom", "Random", "", {[55] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_civ", "Civilian presence", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_civ_on", "On", "", {[60] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_civ"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_civ_off", "Off", "", {[61] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_civ"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_gren", "Grenades on PAX", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_gren_on", "On", "", {[62] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_gren"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_gren_off", "Off", "", {[63] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_gren"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_timer", "Timer to release PAX", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timer0", "No release", "", {[70] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timer30", "+30secs", "", {[71] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timerm30", "-30secs", "", {[72] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timer30", "+60secs", "", {[73] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timerm30", "-60secs", "", {[74] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_timermRandom", "Random", "", {[75] spawn CGQC_fnc_trainingCqb}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_option", "menu_cqb_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_cqb_start", "Start CQB", "", {}, {!cgqc_cqb_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Pistols
//_action = [ "menu_cqb_easy", "Pistols: Won't shoot", "", {[1] spawn CGQC_fnc_trainingCqb}, {cgqc_player_hasRHS} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_nrml", "Pistols: FIA", "", {[2] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// SMG
_action = [ "menu_cqb_med", "SMG: FIA", "", {[3] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_gendarme", "SMG: Gendarmerie", "", {[7] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Full Army
_action = [ "menu_cqb_hard", "Full: Wagner", "", {[4] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_csat", "Full: CSAT", "", {[5] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_viper", "Full: CSAT Viper", "", {[6] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_spetsnaz", "Full: Spetsnaz", "", {[8] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_ldf", "Full: LDF", "", {[9] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_looters", "Full: Looters", "", {[10] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_syndikat", "Full: Syndikat", "", {[11] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_aaf", "Full: AAF", "", {[12] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_vdv", "Full: VDV", "", {[13] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_dnsk", "Full: Donesk/Luhansk", "", {[14] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_hamas", "Full: Hamas", "", {[15] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_isis", "Full: ISIS", "", {[17] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_cqb_cartel", "Full: Cartel", "", {[18] spawn CGQC_fnc_trainingCqb}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Vietnam
_action = [ "menu_cqb_viet", "Full: Vietcongs", "", {[19] spawn CGQC_fnc_trainingCqb}, {cgqc_player_hasUnsung} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// WW2
_action = [ "menu_cqb_ww2", "Full: Soviets", "", {[20] spawn CGQC_fnc_trainingCqb}, {cgqc_player_hasIfa3 && !cgqc_player_hasNorthern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Scandinavia
_action = [ "menu_cqb_scand", "Full: Nazis", "", {[21] spawn CGQC_fnc_trainingCqb}, {cgqc_player_hasNorthern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_cqb", "menu_cqb_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
