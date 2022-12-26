// --- addPerks ----------------------------------------------------------
// Add all perks to player and set defaults

// --- Perks Menu  ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cgqc", "CGQC Perks", "CGQC\textures\cgqc_ace_icon", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Repos ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_chill", "au Repos", "", {["chill"] spawn CGQC_fnc_perksBasic}, {!cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Ready ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_ready", "Ready to rock", "", {["ready"] spawn CGQC_fnc_perksBasic}, {cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// ------ Personal stash --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_stash", "Personal Stash", "", {_ct = ["stash"] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && !cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Add Delete stash option
_action = [ "cgqc_perk_stash_delete", "Delete Stash", "", {_ct = ["del_stash"] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Ghillie up --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_ghillie", "Ghillie up", "", {}, {cgqc_perks_recon && !cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//All types 
_action = [ "cgqc_perk_ghillie_arid", "Arid", "", {_ct = ["arid"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_recon && !cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_ghillie_sarid", "Semi-Arid", "", {_ct = ["sarid"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_recon && !cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_ghillie_lush", "Lush", "", {_ct = ["lush"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_recon && !cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_ghillie_jungle", "Jungle", "", {_ct = ["jungle"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_recon && !cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Uniform
_action = [ "cgqc_perk_ghillie_uniform", "Ghillie-> Uniforme", "", {_ct = ["uniform"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_recon && cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// ------ Cut Grass --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_cutgrass", "Cut grass", "", {_ct = ["cut_grass"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_recon} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// ------ Fortify --------------------------------------------------------------------------------------
[west, 500, [
	["Land_BagFence_Short_F", 5],
	["Land_BagFence_Long_F", 5], 
	["Land_BagFence_Round_F", 5], 
	["Land_Plank_01_4m_F", 5], 
	["Land_Plank_01_8m_F", 5], 
	["Land_CamoNetVar_NATO", 5], 
	["Land_fortified_nest_small_EP1", 50]
]] call ace_fortify_fnc_registerObjects;

// ------ Heli pilot --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_heli_pilot_getCrew", "Spawn Crew", "", {["getCrew"] spawn CGQC_fnc_perksPilot}, {
	cgqc_perks_pilot && 
	!cgqc_perks_pilot_hasCrew &&
	(vehicle player isKindOf "Helicopter")
} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_heli_pilot_delCrew", "Delete Crew", "", {["delCrew"] spawn CGQC_fnc_perksPilot}, {cgqc_perks_pilot && cgqc_perks_pilot_hasCrew} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// ------ Tank driver --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_driver_getDriver", "Spawn Driver", "", {["getDriver"] spawn CGQC_fnc_perksPilot}, {
	cgqc_perks_driver && 
	!cgqc_perks_driver_hasDriver &&
	(vehicle player isKindOf "LandVehicle")
} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_driver_delDriver", "Delete Driver", "", {["delDriver"] spawn CGQC_fnc_perksPilot}, {cgqc_perks_driver && cgqc_perks_driver_hasDriver} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Set patch ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_patch", "Remettre ta patch personelle", "", {[player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Radios ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_radios", "Radio Presets", "CGQC\textures\radio.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set radios sides
_action = [ "self_radio1", "Flip radios Gauche/Droite", "", {["radio_sides"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Toggle Speaker 1
_action = [ "self_radio_speaker1", "Toggle Speaker 1", "", {["toggle_speaker"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Toggle Speaker 2
_action = [ "self_radio_speaker2", "Toggle Speaker 2", "", {["toggle_speaker_2"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Set radio roles 
// Spartan 1
_action = [ "menu_self_spartan1", "Spartan 1", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan1", "343", "", {_ct = ["spartan", 1] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_2", "343+152", "", {_ct = ["spartan_2", 1] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_1", "Team Leader", "", {_ct = ["spartan_1", 1] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan2", "Spartan 2", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan2", "343", "", {_ct = ["spartan", 2] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_2", "343+152", "", {_ct = ["spartan2", 2] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_1", "Team Leader", "", {_ct = ["spartan1", 2] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Centaure
_action = [ "self_radio_centaure", "Centaure/Blindés", "", {_ct = ["centaure"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Griffon
_action = [ "self_radio_griffon", "Griffon/Heli", "", {_ct = ["griffon"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// JTAC
_action = [ "self_radio_jtac", "JTAC", "", {_ct = ["jtac"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// HQ
_action = [ "self_radio_hq", "HQ Mobile", "", {_ct = ["hq"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Zeus ---------------------------------------------------------------------------------------------------------------
// ------ Delete all dead
_action = [ "zeus_delete", "Delete Dead", "", {["delete"] spawn CGQC_fnc_perksZeus}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 343
_action = [ "max_343", "get 343", "", {["343"] spawn CGQC_fnc_perksZeus}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get 152
_action = [ "max_152", "get 152", "", {["152"] spawn CGQC_fnc_perksZeus}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 152
_action = [ "max_117", "get 117f", "", {["117"] spawn CGQC_fnc_perksZeus}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get Crate
_action = [ "zeus_getcrate", "get crate", "", {["crate"] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_crate && [player] call CGQC_fnc_checkZeus;} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;	
//  ------ Delete Crate 
_action = [ "zeus_delcrate", "delete crate", "", {["del_crate"] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_crate && [player] call CGQC_fnc_checkZeus;} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get Cargo
_action = [ "zeus_getcargo", "get Cargo", "", {["cargo"] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_cargo && [player] call CGQC_fnc_checkZeus;} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;	
//  ------ Delete Cargo 
_action = [ "zeus_delcargo", "delete Cargo", "", {["del_cargo"] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_cargo && [player] call CGQC_fnc_checkZeus;} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;	


// Return true 
true