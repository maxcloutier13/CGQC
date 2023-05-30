// --- tableSetup ----------------------------------------------------------
// Vehicles definition. Yeah I know. 

waitUntil {!isNil "cgqc_postInitClient_done"};
waitUntil {cgqc_postInitClient_done};
_crate = (_this select 0) select 0;
_type = _this select 1;

// Skill switcher ========================================================================================================
_action = [ "menu_skill", "Skills", "CGQC\textures\icon_skills", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call  ace_interact_menu_fnc_addActionToObject;


_action = [ "menu_switch", "Change Map", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_vr", "VR Hub", "", {["END1"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_mald", "Malden", "", {["END2"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_tak", "Takistan", "", {["END3"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_novo", "Novogorsk", "", {["END4"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_boz", "Bozcaada", "", {["END5"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;