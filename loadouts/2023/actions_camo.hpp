// Mk1 Camo Switcher ---------------------------------------------------------------------------------------------------------
_action = [ "menu_mk2_camo", "Switch: Uniforme", "CGQC\textures\icon_camo", {""}, {!cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;
// Base/Training uniform
_action = [ "menu_mk2_camo_base", "Training - Vert", "", {["tan", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Desert uniform
_action = [ "menu_mk2_camo_desert", "Desert", "", {["desert", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Multicam uniform
_action = [ "menu_mk2_camo_multicam", "Multicam", "", {["mcam", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Woodland uniform
_action = [ "menu_mk2_camo_woodland", "Cadpat", "", {["cadpat", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Black uniform
_action = [ "menu_mk2_camo_black", "Black", "", {["black", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Winter uniform
_action = [ "menu_mk2_camo_winter", "Winter", "", {["white", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Jumping uniform
_action = [ "menu_mk2_camo_para_std", "Kit: Parachutiste", "\CGQC\textures\cgqc_ace_para", {["para", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Diving uniform
_action = [ "menu_mk2_camo_diver_std", "Kit: Plongeur", "\CGQC\textures\cgqc_ace_dive", {["diver", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
