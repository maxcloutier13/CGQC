// Defense mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_defense", "Defense Training", "", {}, {!cgqc_training_defense} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_defense_on", "Start: Normal", "", {[1] execVM '\cgqc\functions\fnc_trainingDefense.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_defense"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_defense_off", "Defense Training-> OFF", "", {[0] execVM '\cgqc\functions\fnc_trainingDefense.sqf'}, {cgqc_training_defense} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
