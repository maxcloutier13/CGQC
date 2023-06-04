// Sniping ---------------------------------------------------------------------------------------------------------
_action = [ "menu_sniping_on", "Sniping", "", {[1]execVM '\cgqc\functions\fnc_trainingSniping.sqf'}, {!cgqc_sniping} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
