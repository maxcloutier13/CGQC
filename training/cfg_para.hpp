// Parachute ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_para", "Parachute", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Jumping uniform 
_action = [ "menu_self_training_para_kit", "Kit: Parachutiste", "\CGQC\textures\cgqc_ace_para", {["para", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
// Jumps
_action = [ "menu_self_training_para_800", "Jump: 500m", "", {[800] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_1500", "Jump: 1 000m", "", {[1000] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 3 500m", "", {[3500] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 5 000m", "", {[5000] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 10 000m", "", {[10000] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {!cgqc_training_orienteering} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
