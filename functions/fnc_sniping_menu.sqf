waitUntil {!isNil "cgqc_postInitClient_done"};
waitUntil {cgqc_postInitClient_done};
_type = _this select 0;
cgqc_sniping_on = false;

_action = [ "menu_sniping_on", "Advanced sniping mode->ON", "", {[0] execVM '\cgqc\functions\fnc_sniping.sqf'}, {!cgqc_sniping_on} ] call ace_interact_menu_fnc_createAction;     
_adding = [ _type, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_sniping_off", "Advanced sniping mode->OFF", "", {[1] execVM '\cgqc\functions\fnc_sniping.sqf'}, {cgqc_sniping_on} ] call ace_interact_menu_fnc_createAction;     
_adding = [ _type, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;   