// Mortar mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_mortar", "Mortar", "CGQC\textures\cgqc_ace_mortar", {}, {!cgqc_training_mortar} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Easy", "", {["easy"] execVM '\cgqc\functions\fnc_trainingMortar.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Normal", "", {["normal"] execVM '\cgqc\functions\fnc_trainingMortar.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Hard", "", {["hard"] execVM '\cgqc\functions\fnc_trainingMortar.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_off", "Mortar Training - OFF", "", {["stop"] execVM '\cgqc\functions\fnc_trainingMortar.sqf'}, {cgqc_training_mortar} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
