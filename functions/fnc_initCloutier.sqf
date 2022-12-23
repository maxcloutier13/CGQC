// --- initCloutier ----------------------------------------------------------
// It's a Cloutier thang
cgqc_cloutier_chill = false;
cgqc_cloutier_ah6 = false;
cgqc_cloutier_mh6 = false;
cgqc_cloutier_crate = false;
cgqc_cloutier_dancing = false;
cgqc_dancing_target = false;
cgqc_dancing_all = false;
cgqc_dancing_all_move = false;



// It's a Cloutier thang --------------------------------------------------------------------------------------------------------------
_action = [ "menu_cloutier", "Cloutier", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Zeus
_action = [ "max_zeus", "Zeus", "", {_ct = ["zeus"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	

// -- Fun stuff --------------------------------------------------------------------------------------------------------------
_action = [ "menu_fun", "FunStuff", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Cigs
_action = [ "max_getcigs", "Cigs", "", {_ct = ["cigs"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_fun"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Chill
_action = [ "max_chill", "Chill", "", {_ct = ["chill"] spawn CGQC_fnc_stuffCloutier}, {!cgqc_cloutier_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_fun"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Ready
_action = [ "max_chill", "Ready", "", {_ct = ["ready"] spawn CGQC_fnc_stuffCloutier}, {cgqc_cloutier_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_fun"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Radiopack
_action = [ "max_radiopack", "RadioPack", "", {_ct = ["radiopack"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_fun"], _action ] call ace_interact_menu_fnc_addActionToObject;	



// -- Animations -----------------------------------------------------------------------------------------------------------------
_action = [ "menu_animations", "Animations", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Stop
_action = [ "max_stop", "Stop", "", {["stop"] spawn CGQC_fnc_stuffCloutier}, {cgqc_cloutier_dancing} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;  
// ------ Dance
_action = [ "max_dance", "Dance 1", "", {["dance1"] spawn CGQC_fnc_stuffCloutier}, {!cgqc_cloutier_dancing} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_animations"], _action ] call ace_interact_menu_fnc_addActionToObject;  
// ------ Dance2
_action = [ "max_dance2", "Dance 2", "", {["dance2"] spawn CGQC_fnc_stuffCloutier}, {!cgqc_cloutier_dancing} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_animations"], _action ] call ace_interact_menu_fnc_addActionToObject;    
// ------ Traget: dance
_action = [ "max_dance_target", "Target: Dance", "", {["dance_target"] spawn CGQC_fnc_stuffCloutier}, {!cgqc_dancing_target} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_animations"], _action ] call ace_interact_menu_fnc_addActionToObject;  
// ------ Traget: stop dancing
_action = [ "max_dance_target_stop", "Target: Stop", "", {["dance_target_stop"] spawn CGQC_fnc_stuffCloutier}, {cgqc_dancing_target} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;  

// ------ Everybody: dance!
_action = [ "max_dance_all", "EVERYONE DANCE!", "", {["dance_all"] spawn CGQC_fnc_stuffCloutier}, {!cgqc_dancing_all} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_animations"], _action ] call ace_interact_menu_fnc_addActionToObject;  
// ------ Everybody: stop dance!
_action = [ "max_dance_all_stop", "EVERYONE STOP!", "", {["dance_all"] spawn CGQC_fnc_stuffCloutier}, {cgqc_dancing_all} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;  


// -- Admin stuff --------------------------------------------------------------------------------------------------------------
_action = [ "menu_spawn", "Admin Stuff", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Delete all dead
_action = [ "max_delete", "Delete Dead", "", {_ct = ["delete"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get micro drone + uav 
_action = [ "max_micro", "Microdrone", "", {_ct = ["micro"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get darter + uav 
_action = [ "max_darter", "Darter", "", {_ct = ["darter"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 343
_action = [ "max_343", "343", "", {_ct = ["343"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get 152
_action = [ "max_152", "152", "", {_ct = ["152"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 152
_action = [ "max_117", "117f", "", {_ct = ["117"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get Crate
_action = [ "max_getcrate", "Get crate", "", {_ct = ["crate"] spawn CGQC_fnc_stuffCloutier}, {!cgqc_cloutier_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
//  ------ Delete Crate 
_action = [ "max_delcrate", "Delete crate", "", {["del_crate"] spawn CGQC_fnc_stuffCloutier}, {cgqc_cloutier_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Get mh6
_action = [ "max_getmh6", "Get mh6", "", {_ct = ["mh6"] spawn CGQC_fnc_stuffCloutier}, {!cgqc_cloutier_mh6} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Delete mh6
_action = [ "max_delmh6", "Delete mh6", "", {["del_mh6"] spawn CGQC_fnc_stuffCloutier}, {cgqc_cloutier_mh6} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Get ah6
_action = [ "max_getah6", "Get ah6", "", {_ct = ["ah6"] spawn CGQC_fnc_stuffCloutier}, {!cgqc_cloutier_ah6} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Delete ah6
_action = [ "max_delah6", "Delete ah6", "", {["del_ah6"] spawn CGQC_fnc_stuffCloutier}, {cgqc_cloutier_ah6} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Full arsenal 
_action = [ "max_arse", "Arsenal", "", {_ct = ["arsenal"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Become medic/Eng/EOD
_action = [ "max_skills", "Medic/Engineer", "", {["skills"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;

// --- Stuffs -------------------------------------------
// Yeet
_action = [ "max_yeet", "Yeet target", "", {["yeet"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Grief
_action = [ "max_grief", "Grief", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Fuck off
_action = [ "max_foff", "Fuck Off", "", {["fuckoff"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "max_grief"], _action ] call ace_interact_menu_fnc_addActionToObject;			
// Passout
_action = [ "max_pout", "Pass out", "", {["passout"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "max_grief"], _action ] call ace_interact_menu_fnc_addActionToObject;			
// wake up
_action = [ "max_wup", "Wake up", "", {["wakeup"] spawn CGQC_fnc_stuffCloutier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "max_grief"], _action ] call ace_interact_menu_fnc_addActionToObject;		
