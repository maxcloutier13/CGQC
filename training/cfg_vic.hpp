// Vehicle spawner ---------------------------------------------------------------------------------
_action = [ "menu_self_training_spawn", "Vehicle spawner", "CGQC\textures\cgqc_ace_vic", {[] call CGQC_fnc_OpenVehUI}, {!cgqc_spawn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_training_spawn_del", "Delete Vehicle", "", {deleteVehicle cgqc_spawn_vic;cgqc_spawn=false;}, {cgqc_spawn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
