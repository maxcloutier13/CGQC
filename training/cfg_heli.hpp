// Helicopter mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_heli", "Helicopter", "\CGQC\textures\icon_helico", {}, {!cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli", "Start: Easy (Invincible)", "", {["easy"] call CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli", "Start: Normal", "", {["normal"] call CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_off", "Helicopter Training-> OFF", "", {["stop"] call CGQC_fnc_trainingHeli}, {cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
