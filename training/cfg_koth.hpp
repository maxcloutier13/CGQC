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
