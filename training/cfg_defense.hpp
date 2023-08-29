// Defense mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_defense", "Defense", "CGQC\textures\cgqc_ace_defense", {}, {!cgqc_training_defense} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_defense_on", "Start: Normal", "", {["start"] call fnc_trainingDefense}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_defense"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_defense_off", "Defense Training-> OFF", "", {["stop"] call fnc_trainingDefense}, {cgqc_training_defense} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
