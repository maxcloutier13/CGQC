// 2023 arsenal ---------------------------------------------------------------------------------------------------

// Unlocked version
_action = [
    "menu_mk2_unlocked",
    "Arsenal: Unlocked",
    "CGQC\textures\icon_arsenal",
    {[0] call CGQC_ldt_2023_arsenal},
    {!cgqc_mk2_arsenal_locked}
] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Soldier - 1
_action = [ "menu_mk2_1", "Arsenal: Soldat", "CGQC\textures\icon_arsenal", {[1] call CGQC_ldt_2023_arsenal}, {(cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 1)} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Caporal - 2
_action = [ "menu_mk2_2", "Arsenal: Caporal", "CGQC\textures\icon_arsenal", {[2] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 2} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// CaporalC - 3
_action = [ "menu_mk2_3", "Arsenal: Caporal-Chef", "CGQC\textures\icon_arsenal", {[3] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 3} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Sergent - 4
_action = [ "menu_mk2_4", "Arsenal: Sergent", "CGQC\textures\icon_arsenal", {[4] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 4} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Adjudent - 5
_action = [ "menu_mk2_5", "Arsenal: Adjudent", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 5} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Sous-Lieutenant - 6
_action = [ "menu_mk2_6", "Arsenal: Sous-Lieutenant", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 6} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Lieutenant - 7
_action = [ "menu_mk2_7", "Arsenal: Lieutenant", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 7} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Capitaine - 8
_action = [ "menu_mk2_8", "Arsenal: Capitaine", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 8} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Major - 9
_action = [ "menu_mk2_9", "Arsenal: Major", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 9} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  Lieutenant-Colonel- 10
_action = [ "menu_mk2_10", "Arsenal: Lieutenant-Colonel", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 10} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Colonel - 11
_action = [ "menu_mk2_11", "Arsenal: Colonel", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 11} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Complet -
_action = [ "menu_mk2_5", "Arsenal: CGQC Complet", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
