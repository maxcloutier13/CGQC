// --- Ace actions ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cgqc", "CGQC Perks", "CGQC\textures\cgqc_ace_icon", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set patch 
_action = [ "menu_self_patch", "Remettre ta patch personelle", "", {["patch"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Radios ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_radios", "Radio Presets", "CGQC\textures\radio.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set radios sides
_action = [ "self_radio1", "SetRadio: Gauche/Droite", "", {["radio_sides"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Toggle Speakers
_action = [ "self_radio_speaker", "Toggle Speaker", "", {["toggle_speaker"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Set radio roles ---------------------------------------------------------------------------------------------------------------
// Spartan 1
_action = [ "menu_self_spartan1", "Spartan 1", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan1", "343", "", {["spartan", 1] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_2", "343+152", "", {["spartan_2", 1] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_1", "Team Leader", "", {["spartan_1", 1] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan2", "Spartan 2", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan2", "343", "", {["spartan", 2] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_2", "343+152", "", {["spartan2", 2] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_1", "Team Leader", "", {["spartan1", 2] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Centaure
_action = [ "self_radio_centaure", "Centaure/Blindés", "", {["centaure"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Griffon
_action = [ "self_radio_griffon", "Griffon/Heli", "", {["griffon"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// JTAC
_action = [ "self_radio_jtac", "JTAC", "", {["jtac"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// HQ
_action = [ "self_radio_hq", "HQ Mobile", "", {["hq"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
