// Utils
_action = [ "menu_self_utils", "Utils", "\CGQC\textures\icon_maintenance", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Quick Heal
_action = [ "menu_self_heal", "Quick heal", "\CGQC\textures\icon_med", {["heal"] call CGQC_fnc_getStuff}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;	


// Quick paradrop ========================================================================================================
//_action = [ "menu_self_para_quick", "QuickJump", "\CGQC\textures\cgqc_ace_para", {}, {[player] call CGQC_fnc_checkZeus || cgqc_player_max || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;     
//_adding = [ player, 1, ["ACE_SelfActions","menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;  
_action = [ "menu_self_para_quickMap", "QuickJump", "\CGQC\textures\cgqc_ace_para", {[0, 0] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils"], _action ] call  ace_interact_menu_fnc_addActionToObject;  

// Teleport to player
//#include "\cgqc\training\cfg_dropToPlayer.hpp"

// Time/weather ========================================================================================================
_action = [ "menu_self_training_time", "Time/Weather", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils"], _action ] call  ace_interact_menu_fnc_addActionToObject;

//  Skip time ========================================================================================================
_action = [ "menu_self_training_skip", "Skip Time", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_skip_sunrise", "Skip to Sunrise", "", {["sunrise", 0] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training",  "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_skip_sunset", "Skip to Sunset", "", {["sunrise", 1] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training",  "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_skip_1", "Skip 1h", "", {["skip", 1] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_skip_3", "Skip 3h", "", {["skip", 3] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_skip_6", "Skip 6h", "", {["skip", 6] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_skip_12", "Skip 12h", "", {["skip", 12] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training",  "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_skip_100", "Skip Random", "", {["skip", 100] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training",  "menu_self_utils", "menu_self_training_time", "menu_self_training_skip"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

// Weather ========================================================================================================
_action = [ "menu_self_training_weather", "Change Weather", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_weather_sun", "Sunny", "", {["nice", 0] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_weather"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_weather_rain", "Rain", "", {["rain", 0] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_weather"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_weather_random", "Random", "", {["random", 0] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_weather"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

// Skip random time/weather 
_action = [ "menu_self_training_skip_random", "Randomize Time+Weather", "", {["random_all", 0] call CGQC_fnc_training}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Skill switcher ========================================================================================================
_action = [ "menu_self_skill", "Skills", "CGQC\textures\icon_skills", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Medic
_action = [ "skill_self_medic", "Medic", "", {["medic"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Engineer
_action = [ "skill_self_eng", "Ingénieur", "", {["engineer"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// EOD
_action = [ "skill_self_eod", "EOD", "", {["eod"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Driver
_action = [ "skill_self_driver", "Driver", "", {["driver"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Pilot
_action = [ "skill_self_pilot", "Pilot", "", {["pilot"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Sniper
_action = [
	"skill_self_sniper", 
	"Sniper", 
	"", 
	{["recon"] call CGQC_fnc_getStuff},
	{true} 
] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_self_skill" ], _action ] call ace_interact_menu_fnc_addActionToObject;	

//Radios 
_action = [ "menu_items_radios", "Radios", "", {""}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items1", "Radio: 343", "", {["343"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items2", "Radio: 152", "", {["152"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items3", "Radio: 148", "", {["148"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items3", "Radio: 117f", "", {["117"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Radios Vietnam 
_action = [ "menu_items52", "Radio: Short-Range", "", {["52"] call CGQC_fnc_getStuff}, {cgqc_player_hasUnsung} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items77", "Radio: Long-Range", "", {["77"] call CGQC_fnc_getStuff}, {!cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils", "menu_items_radios" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Earplugs
_action = [ "menu_items3", "Earplugs", "", {["earplugs"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Bandages
_action = [ "menu_items4", "Bandages x10", "", {["bandages"] call CGQC_fnc_getStuff}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Painkillers
_action = [ "menu_items5", "Painkillers x5", "", {["painkillers"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Kidnapping Kit
_action = [ "menu_items8", "Kidnaping Kit", "", {["kidnap"] call CGQC_fnc_getStuff}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
//Ammo
_action = [ "menu_items10", "5x Primary mags", "", {["mags_primary"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_items11", "2x Secondary mags", "", {["mags_secondary"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
