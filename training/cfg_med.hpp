// Medical --------------------------------------------------------------------------------------
_action = [ "menu_medical", "Medical", "\CGQC\textures\icon_med", {}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

_action = [ "menu_med_light", "Patient: Blessé Léger", "", {[1] execVM '\cgqc\functions\fnc_trainingMedical.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_med", "Patient: Blessé Moyen", "", {[2] execVM '\cgqc\functions\fnc_trainingMedical.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_heavy", "Patient: Blessé Grave", "", {[3] execVM '\cgqc\functions\fnc_trainingMedical.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_del", "Retirer tout les patients", "", {[0] execVM '\cgqc\functions\fnc_trainingMedical.sqf'}, {!isNil "pat1"} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;   