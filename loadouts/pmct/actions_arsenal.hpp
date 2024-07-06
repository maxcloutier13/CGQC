// PMC-T Arsenal Complet
_action = [ "menu_pmct_complete", "Arsenal: PMC-T", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\pmct\load_pmct.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_pmct" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
