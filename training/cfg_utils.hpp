// Utils
_action = [ "menu_self_utils", "Utils", "\CGQC\textures\icon_maintenance", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Quick Heal
_action = [ "menu_self_heal", "Quick heal", "", {["heal"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Get Crate
_action = [ "menu_self_training_crate", "Spawn: Arsenal mk3", "", {["crate"] execVM '\cgqc\loadouts\mk3_getStuff.sqf'}, {!cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training", "menu_self_utils" ], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_self_training_delcrate", "Delete Arsenal", "", {["del_crate"] execVM '\cgqc\loadouts\mk3_getStuff.sqf'}, {cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

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

_action = [ "menu_self_training_weather", "Change weather", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_weather_sun", "Sunny", "", {["nice", 0] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_weather"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_weather_rain", "Rain", "", {["rain", 0] execVM '\cgqc\functions\fnc_training.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_utils", "menu_self_training_time", "menu_self_training_weather"], _action ] call  ace_interact_menu_fnc_addActionToObject;   


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
