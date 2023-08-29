// Medical --------------------------------------------------------------------------------------
_action = [ "menu_medical", "Medical", "\CGQC\textures\icon_med", {}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

_action = [ "menu_med_light", "Patient: Blessé Léger", "", {[1] call CGQC_fnc_trainingMedical}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_med", "Patient: Blessé Moyen", "", {[2] call CGQC_fnc_trainingMedical}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_heavy", "Patient: Blessé Grave", "", {[3] call CGQC_fnc_trainingMedical}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_medical"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_med_del", "Retirer tout les patients", "", {[0] call CGQC_fnc_trainingMedical}, {!isNil "pat1"} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;   