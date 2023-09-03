// Mortar mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_mortar", "Mortar", "CGQC\textures\cgqc_ace_mortar", {}, {!cgqc_training_mortar} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Easy", "", {["easy"] call CGQC_fnc_trainingMortar}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Normal", "", {["normal"] call CGQC_fnc_trainingMortar}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_on", "Start->Hard", "", {["hard"] call CGQC_fnc_trainingMortar}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_mortar"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_mortar_off", "Mortar Training - OFF", "", {["stop"] call CGQC_fnc_trainingMortar}, {cgqc_training_mortar} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
