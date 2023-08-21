// LandNav ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_orient", "Land Navigation", "\CGQC\textures\icon_landnav", {[] call CGQC_fnc_landNav_openUI}, {!cgqc_training_landnav} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Quit orienteering
_action = [ "menu_self_training_orient_basic_off", "Stop Land Navigation Training", "", {[] call CGQC_fnc_training_landnav_off;}, {cgqc_training_landnav} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

/*
_action = [ "menu_self_training_orient_basic", "Basic Orientation->ON", "", {["basic_on"] execVM '\cgqc\functions\fnc_trainingLandnav.sqf'}, {!cgqc_training_landnav} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

// Options
_action = [ "menu_self_training_orient_options", "Options", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_patrols", "Add Patrol around target", "", {cgqc_training_landnav_patrols = true}, {!cgqc_training_landnav_patrols} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_patrols_off", "Remove Patrols", "", {cgqc_training_landnav_patrols = true}, {cgqc_training_landnav_patrols} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_snipers", "Add Hunter team", "", {cgqc_training_landnav_hunters = true}, {!cgqc_training_landnav_hunters} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_orient_options_snipers_off", "Remove Hunters", "", {cgqc_training_landnav_hunters = true}, {cgqc_training_landnav_hunters} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
*/