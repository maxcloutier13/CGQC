// It's a Cloutier thang --------------------------------------------------------------------------------------------------------------
_action = [ "menu_cloutier", "Cloutier", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// -- Fun stuff --------------------------------------------------------------------------------------------------------------
_action = [ "menu_fun", "FunStuff", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Cigs
_action = [ "max_getcigs", "Cigs", "", {["cigs"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_fun"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Chill
_action = [ "max_chill", "Chill", "", {["chill"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_fun"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Ready
_action = [ "max_chill", "Ready", "", {["ready"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_fun"], _action ] call ace_interact_menu_fnc_addActionToObject;	

// -- Animations -----------------------------------------------------------------------------------------------------------------
_action = [ "menu_animations", "Animations", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Stop
_action = [ "max_stop", "Stop", "", {["stop"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_animations"], _action ] call ace_interact_menu_fnc_addActionToObject;  
// ------ Dance
_action = [ "max_dance", "Dance 1", "", {["dance1"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_animations"], _action ] call ace_interact_menu_fnc_addActionToObject;  
// ------ Dance2
_action = [ "max_dance2", "Dance 2", "", {["dance2"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_animations"], _action ] call ace_interact_menu_fnc_addActionToObject;    

// -- Admin stuff --------------------------------------------------------------------------------------------------------------
_action = [ "menu_spawn", "Admin Stuff", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Delete all dead
_action = [ "max_delete", "Delete Dead", "", {["delete"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get micro drone + uav 
_action = [ "max_micro", "Microdrone", "", {["micro"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get darter + uav 
_action = [ "max_darter", "Darter", "", {["darter"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 343
_action = [ "max_343", "343", "", {["343"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get 152
_action = [ "max_152", "152", "", {["152"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Get Crate
_action = [ "max_getcrate", "Get crate", "", {["crate"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Get heli
_action = [ "max_getheli", "Get heli", "", {["heli"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Full arsenal 
_action = [ "max_arse", "Arsenal", "", {["arsenal"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Become medic/Eng/EOD
_action = [ "max_skills", "Medic/Engineer", "", {["skills"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Yeet
_action = [ "max_yeet", "Yeet target", "", {["yeet"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;			
