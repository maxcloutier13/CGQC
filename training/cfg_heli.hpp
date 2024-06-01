// Helicopter mode ---------------------------------------------------------------------------------
_action = [ "menu_self_training_heli", "Helicopter", "\CGQC\textures\icon_helico", {}, {!cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli", "Start: Easy (Invincible)", "", {["easy"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli", "Start: Normal", "", {["normal"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_self_training_heli_off", "Helicopter Training-> OFF", "", {["stop"] spawn CGQC_fnc_trainingHeli}, {cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_lz", "Helicopter Training-> New Random LZ", "", {["newlz"] spawn CGQC_fnc_trainingHeli}, {cgqc_training_heli} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_self_training_heli_nam", "Start: Vietnam Random", "", {["nam"] spawn CGQC_fnc_trainingHeli}, {cgqc_player_isVietnam} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_self_training_heli_nam_0", "LZ Ember", "", {["nam", "cgqc_lz_ember"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli", "menu_self_training_heli_nam"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_nam_1", "LZ Fer de Lance", "", {["nam", "cgqc_lz_fer"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli", "menu_self_training_heli_nam"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_nam_2", "LZ Boa", "", {["nam", "cgqc_lz_boa"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli", "menu_self_training_heli_nam"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_nam_2", "LZ Habu", "", {["nam", "cgqc_lz_habu"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli", "menu_self_training_heli_nam"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_nam_2", "LZ Adder", "", {["nam", "cgqc_lz_adder"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli", "menu_self_training_heli_nam"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_nam_2", "LZ Viper", "", {["nam", "cgqc_lz_viper"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli", "menu_self_training_heli_nam"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_nam_2", "LZ Cobra", "", {["nam", "cgqc_lz_cobra"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli", "menu_self_training_heli_nam"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_heli_nam_2", "LZ Krait", "", {["nam", "cgqc_lz_krait"] spawn CGQC_fnc_trainingHeli}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_heli", "menu_self_training_heli_nam"], _action ] call  ace_interact_menu_fnc_addActionToObject;