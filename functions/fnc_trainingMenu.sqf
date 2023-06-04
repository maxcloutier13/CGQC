// --- trainingMenu ----------------------------------------------------------
cgqc_training_mode = true;
// Add the training shit to the player 

// Training actions ---------------------------------------------------------------------------------
_action = [ "menu_self_training", "Training", "", {}, {cgqc_training_mode} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Utils
_action = [ "menu_self_utils", "Utils", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Quick Heal
_action = [ "menu_self_heal", "Quick heal", "", {["heal"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Get Crate
_action = [ "menu_self_training_crate", "Spawn: Arsenal mk3", "", {["crate"] execVM '\cgqc\loadouts\mk3_getStuff.sqf'}, {!cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_self_training_delcrate", "Delete Arsenal", "", {["del_crate"] execVM '\cgqc\loadouts\mk3_getStuff.sqf'}, {cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Skill switcher ========================================================================================================
_action = [ "menu_self_skill", "Skills", "CGQC\textures\icon_skills", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Medic
_action = [ "skill_self_medic", "Medic", "", {["medic"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Engineer
_action = [ "skill_self_eng", "Ingénieur", "", {["engineer"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// EOD
_action = [ "skill_self_eod", "EOD", "", {["eod"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Driver
_action = [ "skill_self_driver", "Driver", "", {["driver"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Pilot
_action = [ "skill_self_pilot", "Pilot", "", {["pilot"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Sniper
_action = [
	"skill_self_sniper", 
	"Sniper", 
	"", 
	{["recon"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"},
	{true} 
] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	

//Radios 
_action = [ "menu_items_radios", "Radios", "", {""}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items1", "Radio: 343", "", {["343"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items2", "Radio: 152", "", {["152"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items3", "Radio: 148", "", {["148"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items3", "Radio: 117f", "", {["117"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Radios Vietnam 
_action = [ "menu_items52", "Radio: Short-Range", "", {["52"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_hasUnsung} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items77", "Radio: Long-Range", "", {["77"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {!cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Earplugs
_action = [ "menu_items3", "Earplugs", "", {["earplugs"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Bandages
_action = [ "menu_items4", "Bandages x10", "", {["bandages"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Painkillers
_action = [ "menu_items5", "Painkillers x5", "", {["painkillers"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Kidnapping Kit
_action = [ "menu_items8", "Kidnaping Kit", "", {["kidnap"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Ammo
_action = [ "menu_items10", "5x Primary mags", "", {["mags_primary"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items11", "2x Secondary mags", "", {["mags_secondary"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	










// Time/weather 
_action = [ "menu_self_training_time", "Time/Weather", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// ------ Skip time

_action = [ "menu_self_training_skip", "Skip time", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_basic", "Skip 1h", "", {["skip", 1] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_orient_basic", "Skip 3h", "", {["skip", 3] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_orient_basic", "Skip 6h", "", {["skip", 6] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_orient_basic", "Skip 12h", "", {["skip", 12] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training",  "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

action = [ "menu_self_training_weather", "Change weather", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_weather_sun", "Sunny", "", {["nice", 0] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_weather"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_weather_rain", "Rain", "", {["rain", 0] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_weather"], _action ] call  ace_interact_menu_fnc_addActionToObject;   


//Change wind -----------------------------
/*_action = [ "menu_sniping_wind", "Change Wind", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_wind_low", "Low", "", {["cgqc_change_fucking_wind", ["wind_low"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_sniping_wind_mid", "Medium", "", {["cgqc_change_fucking_wind", ["wind_med"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_sniping_wind_hi", "High", "", {["cgqc_change_fucking_wind", ["wind_hi"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_sniping_wind_random", "Random", "", {["cgqc_change_fucking_wind", ["wind_random"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
*/

// Medical --------------------------------------------------------------------------------------
_action = [ "menu_medical", "Medical", "", {}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

_action = [ "menu_med_light", "Patient: Blessé Léger", "", {[1] execVM '\cgqc\functions\fnc_trainingMedical.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_med", "Patient: Blessé Moyen", "", {[2] execVM '\cgqc\functions\fnc_trainingMedical.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_heavy", "Patient: Blessé Grave", "", {[3] execVM '\cgqc\functions\fnc_trainingMedical.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_del", "Retirer tout les patients", "", {[0] execVM '\cgqc\functions\fnc_trainingMedical.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

// Sniping ---------------------------------------------------------------------------------------------------------
_action = [ "menu_sniping_on", "Sniping", "", {[1]execVM '\cgqc\functions\fnc_trainingSniping.sqf'}, {!cgqc_sniping} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

// Orienteering ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_orient", "Orientation", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_basic", "Basic Orientation->ON", "", {["basic_on"] execVM '\cgqc\functions\fnc_trainingOrient.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_orient_basic_off", "Basic Orientation->Off", "", {["basic_off"] execVM '\cgqc\functions\fnc_trainingOrient.sqf'}, {cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
// Options
_action = [ "menu_self_training_orient_options", "Options", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_patrols", "Add Patrols", "", {cgqc_orient_opt_patrols = true}, {!cgqc_orient_opt_patrols} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_patrols_off", "Remove Patrols", "", {cgqc_orient_opt_patrols = true}, {cgqc_orient_opt_patrols} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_snipers", "Add Hunters", "", {cgqc_orient_opt_snipers = true}, {!cgqc_orient_opt_snipers} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_snipers_off", "Remove Hunters", "", {cgqc_orient_opt_snipers = true}, {cgqc_orient_opt_snipers} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Parachute ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_para", "Parachute", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Jumping uniform 
_action = [ "menu_self_training_para_kit", "Kit: Parachutiste", "\CGQC\textures\cgqc_ace_para", {["para", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
// Jumps
_action = [ "menu_self_training_para_800", "Jump: 500m", "", {[800] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_1500", "Jump: 1 000m", "", {[1000] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 3 500m", "", {[3500] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 5 000m", "", {[5000] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 10 000m", "", {[10000] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

// KOTH ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_koth", "KOTH", "", {}, {false} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_koth_stop", "Stop KOTH", "", {["stop"] execVM '\cgqc\functions\fnc_trainingKoth.sqf'}, {cgqc_training_koth} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;    
// Options 
_action = [ "menu_self_training_koth_options", "Options", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Number of towers
_action = [ "menu_koth_towers", "Tower number", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth", "menu_self_training_koth_options"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_koth_tower+1", "+1", "", {cgqc_training_koth_towers_count = cgqc_training_koth_towers_count + 1;hint format["%1 towers", cgqc_training_koth_towers_count];}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth", "menu_self_training_koth_options","menu_koth_towers"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_koth_tower-1", "-1", "", {cgqc_training_koth_towers_count = cgqc_training_koth_towers_count - 1;hint format["%1 towers", cgqc_training_koth_towers_count];}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth", "menu_self_training_koth_options","menu_koth_towers"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_koth_diff", "Difficulty", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth", "menu_self_training_koth_options"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_koth_diff1", "Easy", "", {cgqc_training_koth_difficulty =  1;hint "Easy: Infantry only";}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth", "menu_self_training_koth_options", "menu_koth_diff"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_koth_diff2", "Normal", "", {cgqc_training_koth_difficulty =  2;hint "Normal: Statics and patrols";}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth", "menu_self_training_koth_options", "menu_koth_diff"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_koth_diff2", "Hard", "", {cgqc_training_koth_difficulty =  3;hint "Hard: QRFs and IEDs";}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth", "menu_self_training_koth_options", "menu_koth_diff"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_self_training_koth_1", "Start KOTH!", "", {["start"] execVM '\cgqc\functions\fnc_trainingKoth.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_koth"], _action ] call  ace_interact_menu_fnc_addActionToObject;


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

// Defense mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_defense", "Defense Training", "", {}, {!cgqc_training_defense} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_defense_on", "Start: Normal", "", {[1] execVM '\cgqc\functions\fnc_trainingDefense.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_defense"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_defense_off", "Defense Training-> OFF", "", {[0] execVM '\cgqc\functions\fnc_trainingDefense.sqf'}, {cgqc_training_defense} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Helicopter mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_heli", "Helicopter Training", "", {}, {!cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli", "Start: Easy (Invincible)", "", {["easy"] execVM '\cgqc\functions\fnc_trainingHeli.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli", "Start: Normal", "", {["normal"] execVM '\cgqc\functions\fnc_trainingHeli.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_off", "Helicopter Training-> OFF", "", {["stop"] execVM '\cgqc\functions\fnc_trainingHeli.sqf'}, {cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Mortar mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_mortar", "Mortar Training", "", {}, {!cgqc_training_mortar} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Easy", "", {["easy"] execVM '\cgqc\functions\fnc_trainingMortar.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Normal", "", {["normal"] execVM '\cgqc\functions\fnc_trainingMortar.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Hard", "", {["hard"] execVM '\cgqc\functions\fnc_trainingMortar.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;


_action = [ "menu_self_training_mortar_off", "Mortar Training - OFF", "", {["stop"] execVM '\cgqc\functions\fnc_trainingMortar.sqf'}, {cgqc_training_mortar} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
