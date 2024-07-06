// SWAT Arsenal Complet
_action = [ "menu_swat_complete", "Arsenal: SWAT", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\swat\load_swat.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
