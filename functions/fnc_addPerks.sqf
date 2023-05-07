// --- addPerks ----------------------------------------------------------
// Add all perks to player and set defaults

// --- Perks Menu  ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cgqc", "CGQC Perks", "CGQC\textures\cgqc_ace_icon", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Repos ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_chill", " au Repos", "CGQC\textures\cgqc_ace_beret", {["chill", true] spawn CGQC_fnc_perksBasic}, {!cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Ready ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_ready", " Prêt au Combat", "CGQC\textures\cgqc_ace_combat", {["ready", true] spawn CGQC_fnc_perksBasic}, {cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Drop parachute ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_dropPara", " Drop Parachute", "CGQC\textures\cgqc_ace_para", {["para", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_para && isTouchingGround player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Drop Diving suit ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_dropDiver", "Drop Habit de Plongée", "CGQC\textures\cgqc_ace_dive", {["diver", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_diver_suit_on && isTouchingGround player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Diver suit back on ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_kitDiver", "Plongeur: Suit up", "CGQC\textures\cgqc_ace_dive", {["diver", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {cgqc_perks_diver && isTouchingGround player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Chemlights ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_chemlights", "Drop Chemlight", "CGQC\textures\cgqc_ace_chems", {}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_chem_green", "Green", "", {["chem_green", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_chem_green > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_chemlights"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_chem_ir", "IR", "", {["chem_ir", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_chem_ir > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_chemlights"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_chem_green", "Ultra-hi Orange", "", {["chem_orange", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_chem_orange > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_chemlights"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// ------ Personal stash --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_stash", " Personal Stash", "CGQC\textures\cgqc_ace_stash", {["stash", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && !cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Add Delete stash option
_action = [ "cgqc_perk_stash_delete", " Delete Stash", "", {["del_stash", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Ghillie up --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_ghillie", " Ghillie up", "", {}, {cgqc_perks_recon && !cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
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
_action = [ "cgqc_perk_cutgrass", "Coupe l'herbe", "", {_ct = ["cut_grass"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_recon} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// ------ Fortify --------------------------------------------------------------------------------------
if (cgqc_config_fortify) then {
	fortify_list = format [
		"[
		['%1', 0],
		['%2', 0], 
		['%3', 0], 
		['%4', 0], 
		['%5', 0], 
		['%6', 0], 
		['%7', 0],
		['%8', 0], 
		['%9', 0], 
		['%10', 0]
		]", 
		cgqc_config_fortify_1, 
		cgqc_config_fortify_2, 
		cgqc_config_fortify_3, 
		cgqc_config_fortify_4,
		cgqc_config_fortify_5, 
		cgqc_config_fortify_6, 
		cgqc_config_fortify_7, 
		cgqc_config_fortify_8, 
		cgqc_config_fortify_9,
		cgqc_config_fortify_10
	];
	cgqc_config_fortify_list = parseSimpleArray fortify_list;
	[west, 0, cgqc_config_fortify_list] call ace_fortify_fnc_registerObjects;
	[east, 0, cgqc_config_fortify_list] call ace_fortify_fnc_registerObjects;
	[resistance, 0, cgqc_config_fortify_list] call ace_fortify_fnc_registerObjects;
};
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
//_action = [ "menu_self_patch", "Remettre ta patch personelle", "", {[player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia}, {true} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Radios ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_radios", " Radio Presets", "CGQC\textures\radio.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set radios sides
_action = [ "self_radio1", "Flip radios Gauche/Droite", "", {["radio_sides"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
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
_action = [ "self_radio_hq", "HQ", "", {_ct = ["hq"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Toggle Speaker 1
_action = [ "self_radio_speaker1", "Toggle Speaker 1", "", {["toggle_speaker"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Toggle Speaker 2
_action = [ "self_radio_speaker2", "Toggle Speaker 2", "", {["toggle_speaker_2"] execVM "\cgqc\functions\fnc_setRadios.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Zeus ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_zeus", "Zeus", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Briefing mode
_action = [ "zeus_briefing", "Briefing", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Commanders briefing
_action = [ "zeus_briefingCmd_start", "Start Commanders:Briefing", "", {["briefingCmd", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Commanders done 
_action = [ "zeus_briefingCmd_stop", "Stop Briefing", "", {["briefingCmd_stop", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// General briefing
_action = [ "zeus_briefing_start", "Start Gen:Briefing", "", {["briefing", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_briefing_start_2", "Start Briefing dans 2mins", "", {["briefing", 120] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_briefing_start_5", "Start Briefing dans 5mins", "", {["briefing", 300] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Briefing done
_action = [ "zeus_briefing_stop", "Stop Briefing", "", {["briefing_stop", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_briefing} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Map Sharing Restriction
_action = [ "zeus_mapSharing_on", "MapSharing Restriction: Turn on", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_mapRestricted} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_mapSharing_off", "MapSharing Restriction: Turn off", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_mapRestricted} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;


// ------ GRAD Persistence 
_action = [ "zeus_grad_persistence", "Persistence", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_save", "Save Mission", "", { [true, 10] remoteExec ["grad_persistence_fnc_saveMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_load", "Load Mission", "", {[] remoteExec ["grad_persistence_fnc_loadMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_load_players", "LoadPlayers", "", {[] remoteExec ["grad_persistence_fnc_loadAllPlayers",2,false];}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_clear", "Clear Data", "", {_x remoteExec ["grad_persistence_fnc_clearMissionData", 2]}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------- Utils ----------------
_action = [ "menu_self_utils", "Utils", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// ------ Animation on/off 
_action = [ "zeus_anim_on", "Animations: Lock", "", {["animation_on"] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_anim_off", "Animations: Unlock", "", {["animation_off"] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Delete all dead
_action = [ "zeus_delete", "Delete Dead", "", {["delete"] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 343
_action = [ "max_343", "get 343", "", {["343"] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get 152
_action = [ "max_152", "get 152", "", {["152"] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 152
_action = [ "max_117", "get 117f", "", {["117"] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get Crate
_action = [ "zeus_getcrate", "Spawn: Arsenal mk2", "", {["crate"] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;	
//  ------ Delete Crate 
_action = [ "zeus_delcrate", "Delete Arsenal", "", {["del_crate"] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get Cargo
_action = [ "zeus_getcargo", "get Cargo", "", {["cargo"] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;	
//  ------ Delete Cargo 
_action = [ "zeus_delcargo", "delete Cargo", "", {["del_cargo"] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;	

// Cone of silence   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cone", "Cone de silence", "CGQC\textures\cgqc_ace_cone", {["cone", false] spawn CGQC_fnc_perksBasic}, {!cgqc_perks_silence} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Cone of silence   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cone_off", "Cone de silence: Off", "CGQC\textures\cgqc_ace_cone", {["cone_off", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_silence} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Fix Sound   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cone_off", "Fix Sound", "", {["fix", false] spawn CGQC_fnc_perksBasic}, {} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Return true 
true