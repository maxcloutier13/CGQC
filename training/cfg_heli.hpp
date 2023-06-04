// Helicopter mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_heli", "Helicopter", "", {}, {!cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli", "Start: Easy (Invincible)", "", {["easy"] execVM '\cgqc\functions\fnc_trainingHeli.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli", "Start: Normal", "", {["normal"] execVM '\cgqc\functions\fnc_trainingHeli.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_off", "Helicopter Training-> OFF", "", {["stop"] execVM '\cgqc\functions\fnc_trainingHeli.sqf'}, {cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
