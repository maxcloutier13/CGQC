// Orienteering ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_orient", "Land Navigation", "\CGQC\textures\icon_landnav", {}, {true} ] call ace_interact_menu_fnc_createAction;       
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
