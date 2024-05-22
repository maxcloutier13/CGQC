// Unsung Arsenal Complet
_action = [ "menu_unsung_complete", "Arsenal: Vietnam", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\unsung\load_unsung.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
