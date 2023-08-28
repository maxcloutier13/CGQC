// --- addPerks ----------------------------------------------------------
// Add all perks to player and set defaults
diag_log "[CGQC_INIT] addPerks started";

// --- Perks Menu  ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cgqc", "CGQC Perks", "CGQC\textures\cgqc_ace_icon", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Anti quick-jump
_action = [ "menu_self_para_quickMap", "QuickJump to map point", "\CGQC\textures\cgqc_ace_para", {[0, 0] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {cgqc_player_hasAnti || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;  

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
_action = [ "menu_self_kitDiver", "Plongeur: Suit up", "CGQC\textures\cgqc_ace_dive", {["diver", false] call CGQC_fnc_switchUniform}, {cgqc_perks_diver && isTouchingGround player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// ------ Change Goggles --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_goggles", "Change Goggles", "CGQC\textures\cgqc_ace_goggles", {}, {cgqc_player_has2023} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// ---- Types
_action = [ "cgqc_perk_goggles_clr", "Clear Glasses", "cgqc\textures\cgqc_ace_glasses", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_clr_msk", "Goggles/Masks", "CGQC\textures\cgqc_ace_mask", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_sun", "Sunglasses", "cgqc\textures\cgqc_ace_sunglasses", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_gas", "Gasmask", "cgqc\textures\cgqc_ace_gasmask", {["G_mas_can_gasmask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Clear glasses
_action = [ "cgqc_perk_goggles_base", "Ballistic Glasses", "", {["G_mas_can_gog"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_base_t", "Facewrap (Tan)", "", {["G_mas_can_wrap_gog_T"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_base_b", "Facewrap (Blk)", "", {["G_mas_can_wrap_gog_B"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_shem_down", "Shemagh Up", "", {["G_mas_can_shemag_gog_l"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_shem_up", "Shemagh Down", "", {["G_mas_can_shemag_gog"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Clear mask 
_action = [ "cgqc_perk_mask_blk", "Mask (Black)", "", {["G_mas_can_mask_b"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_tan", "Mask (Tan)", "", {["G_mas_can_mask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_b_blk", "Balaclava (Blk)", "", {["G_mas_can_balaM_b"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_b_tan", "Balaclava (Tan)", "", {["G_mas_can_balaM_T"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_shemagh", "Shemagh Up", "", {["G_mas_can_shemag_mask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Sunglasses
_action = [ "cgqc_perk_sun_blk", "Dark Glasses", "", {["rhs_googles_black"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_mask", "Dark Mask", "", {["rhsusf_oakley_goggles_blk"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_shemagh", "Mask+Shemagh Up", "", {["rhsusf_shemagh_gogg_tan"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_shemagh_d", "Mask+Shemagh Down", "", {["rhsusf_shemagh2_gogg_tan"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_low", "Low Profile Goggles", "", {["G_Lowprofile"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// ------ Ghillie up --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_ghillie", " Ghillie up", "cgqc\textures\cgqc_ace_ghillie", {}, {cgqc_perks_recon && !cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
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

// Quick State
_action = [ "cgqc_perk_state", "Quick State", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Stealth 
_action = [ "cgqc_perk_state_stealth", "Stealth", "", {["stealth", false] spawn CGQC_fnc_perksBasic}, {cgqc_player_state > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_state"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Overt 
_action = [ "cgqc_perk_state_normal", "Normal", "", {["normal", false] spawn CGQC_fnc_perksBasic}, {cgqc_player_state != 1} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_state"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Battle 
_action = [ "cgqc_perk_state_battle", "Battle", "", {["battle", false] spawn CGQC_fnc_perksBasic}, {cgqc_player_state < 2} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_state"], _action ] call  ace_interact_menu_fnc_addActionToObject;



// ------ Cut Grass --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_cutgrass", "Coupe l'herbe", "CGQC\textures\cgqc_ace_grass", {_ct = ["cut_grass"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
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
_action = [ "cgqc_perk_heli_getCrew", "Spawn Crew", "", {["getCrew"] spawn CGQC_fnc_perksPilot}, {
	cgqc_perks_pilot && 
	!cgqc_perks_pilot_hasCrew &&
	(vehicle player isKindOf "Helicopter")
} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_heli_delCrew", "Delete Crew", "", {["delCrew"] spawn CGQC_fnc_perksPilot}, {cgqc_perks_pilot && cgqc_perks_pilot_hasCrew} ] call ace_interact_menu_fnc_createAction;
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

// Camo Faces ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_camo", " Camo Faces", "", {""}, {cgqc_player_max} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_0", " Remove Camo", "", {["face_0"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_1", " Camo 01", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_2", " Camo 02", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_3", " Camo 03", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_4", " Camo 04", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_5", " Camo 05", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_6", " Camo 06", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_7", " Camo 07", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_8", " Camo 08", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_9", " Camo 09", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_10", " Camo 10", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_11", " Camo 11", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_12", " Camo 12", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_13", " Camo 13", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_14", " Camo 14", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_15", " Camo 15", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo_16", " Camo 16", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Radios ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_radios", " Radio Presets", "CGQC\textures\radio.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set radios sides
_action = [ "self_radio1", "Flip radios Gauche/Droite", "", {["flipSides"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Set radio roles 
// Spartan 1
_action = [ "menu_self_spartan1", "Spartan 1", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan1", "343", "", {_ct = ["spartan", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_2", "343+152", "", {_ct = ["spartan_2", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_1", "Team Leader", "", {_ct = ["spartan_1", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan2", "Spartan 2", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan2", "343", "", {_ct = ["spartan", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_2", "343+152", "", {_ct = ["spartan2", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_1", "Team Leader", "", {_ct = ["spartan1", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan3", "Spartan 3", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan3", "343", "", {_ct = ["spartan", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan3_2", "343+152", "", {_ct = ["spartan2", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan3_1", "Team Leader", "", {_ct = ["spartan1", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Centaure
_action = [ "self_radio_centaure", "Centaure/Blindés", "", {_ct = ["centaure"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Griffon
_action = [ "self_radio_griffon", "Griffon/Heli", "", {_ct = ["griffon"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// JTAC
_action = [ "self_radio_jtac", "JTAC", "", {_ct = ["jtac"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// HQ
_action = [ "self_radio_hq", "HQ", "", {_ct = ["hq"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Toggle Speaker 1
_action = [ "self_radio_speaker1", "Toggle Speaker 1", "", {["toggle_speaker"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Toggle Speaker 2
_action = [ "self_radio_speaker2", "Toggle Speaker 2", "", {["toggle_speaker_2"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Cone of silence   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cone", "Cone de silence", "CGQC\textures\cgqc_ace_cone", {["cone", false] spawn CGQC_fnc_perksBasic}, {!cgqc_perks_silence} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Cone of silence   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cone_off", "Cone de silence: Off", "CGQC\textures\cgqc_ace_cone", {["cone_off", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_silence} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Fixes
_action = [ "menu_self_fixes", "Fixes", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Fix Sound   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_fix_sound", "Fix Sound", "", {["fix", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Fix Blackout   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_blackout", "Fix Blackout", "", {["fix_blackout", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set patch ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_patch", "Remettre ta patch personelle", "\cgqc\textures\cgqc_ace_defend.paa", {[player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// inspect   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_inspect", "Inspect", "CGQC\textures\search.paa", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Show player   ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cam", "Player Mirror", "CGQC\textures\cgqc_ace_mirror", {["cam", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Confirm self-loadout  ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_check", "Confirm Self Loadout", "CGQC\textures\search.paa", {["check", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Signals ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_signals", "Signals", "CGQC\textures\cgqc_ace_chems", {}, {cgqc_perks_chems > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Criquet 
_action = ["menu_self_criquet", "Criquet", "CGQC\textures\cgqc_ace_cricket", {["click", false] spawn CGQC_fnc_perksBasic;}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action] call ace_interact_menu_fnc_addActionToObject;
// Smokes
_action = [ "menu_self_smoke_blue", "Smoke: Blue", "", {["throw", "SmokeShellBlue"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_red", "Smoke: Red", "", {["throw", "SmokeShellRed"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_purple", "Smoke: Purple", "", {["throw", "SmokeShellPurple"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_yellow", "Smoke: Yellow", "", {["throw", "SmokeShellYellow"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Chemlights
_action = [ "menu_self_chem_green", "Chem Green", "", {["throw", "Chemlight_green"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_chem_ir", "Chem IR", "", {["throw", "ACE_Chemlight_IR"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Strobes 
_action = [ "menu_self_strobe1", "Strobe 1", "", {["throw", "MS_Strobe_Mag_1"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_strobe2", "Strobe 2", "", {["throw", "MS_Strobe_Mag_2"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Flares
_action = [ "menu_self_flare_green", "Flare: Green", "", {["throw", "ACE_HandFlare_Green"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_flare_red", "Flare: Red", "", {["throw", "ACE_HandFlare_Red"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_flare_white", "Flare: White", "", {["throw", "ACE_HandFlare_White"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Panels
_action = [ "menu_self_panel_r", "Panel: Red", "", {["panel", "RED"] call CGQC_fnc_dropChem}, {!cgqc_perks_panel} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_panel_y", "Panel: Yellow", "", {["panel", "YELLOW"] call CGQC_fnc_dropChem}, {!cgqc_perks_panel} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_panel_g", "Panel: Green", "", {["panel", "GREEN"] call CGQC_fnc_dropChem}, {!cgqc_perks_panel} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_panel_b", "Panel: Black", "", {["panel", "BLACK"] call CGQC_fnc_dropChem}, {!cgqc_perks_panel} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;



// ------ Personal stash --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_stash", " Personal Stash", "CGQC\textures\cgqc_ace_stash", {["stash", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && !cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// Add Delete stash option
_action = [ "cgqc_perk_stash_delete", " Delete Stash", "", {["del_stash", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Open IFAK 
_action = [ "menu_self_ifak", "Unpack: IFAK", "\CGQC\textures\icon_med", {["ifak", player, true] call CGQC_fnc_openMedical}, {[player, 'cgqc_items_ifak'] call BIS_fnc_hasItem} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_medkit", "Unpack: MediKit", "\CGQC\textures\icon_med", {["medkit", player, true] call CGQC_fnc_openMedical}, {[player, 'cgqc_items_medkit'] call BIS_fnc_hasItem} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Bandoliers 
_action = [ "menu_self_bandolier", "Unpack: Ammo Bandolier", "\CGQC\textures\rearm.paa", {["ammo"] call CGQC_fnc_openBandolier}, {[player, 'cgqc_bandolier_ammo'] call BIS_fnc_hasItem} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Zeus ===================================================================================================
_action = [ "menu_self_zeus", "Zeus", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// ------ Pause AI
_action = [ "zeus_pause", "Pause AI", "", {[0,{["pause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute}, {!cgqc_zeus_paused} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_unpause", "Unpause AI", "", {[0,{["unpause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {cgqc_zeus_paused} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Delete all dead
_action = [ "zeus_delete", "Delete Dead", "", {["delete", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Invincible
_action = [ "zeus_invincible", "God Mode", "", {["god", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_god} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_mortal", "God Mode->Off", "", {["mortal", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_god} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Invisible
_action = [ "zeus_invisible", "Turn Invisible", "", {["ghost", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_ghost} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_visible", "Invisible->Off", "", {["visible", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_ghost} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;



// Players stuff 
//_action = [ "zeus_players", "Players", "", {""}, {count AllPlayers > 1} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Yeet
//#include "\cgqc\functions\cfg_yeetPlayer.hpp"

// Teleport to player
//#include "\cgqc\functions\cfg_teleportPlayer.hpp"

// AttachTo player
//#include "\cgqc\functions\cfg_attachPlayer.hpp"

// Blackout player
//#include "\cgqc\functions\cfg_blackoutPlayer.hpp"

// Wakeup player 
//_action = [ "zeus_wakeup", "Wakeup player", "", {["wakeup", 0] spawn CGQC_fnc_perksZeus}, {cgqc_blackout_player_on} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Detach from player
//_action = [ "zeus_detach", "Detach from player", "", {["detach", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_attached} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Briefing mode
_action = [ "zeus_briefing", "Briefing", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Commanders briefing
_action = [ "zeus_briefingCmd_start", "Start Mini Briefing", "", {["briefingCmd", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_state_briefing} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Commanders done 
_action = [ "zeus_briefingCmd_stop", "Stop Leader's Briefing", "", {["briefingCmd_stop", 0] spawn CGQC_fnc_perksZeus}, {[player] call CGQC_fnc_checkZeus && cgqc_state_briefing_leaders} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// General briefing
_action = [ "zeus_briefing_start", "Start Full Briefing", "", {["briefing", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_state_briefing} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_briefing_start_2", "Start Briefing dans 2mins", "", {["briefing", 120] spawn CGQC_fnc_perksZeus}, {!cgqc_state_briefing} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_briefing_start_5", "Start Briefing dans 5mins", "", {["briefing", 300] spawn CGQC_fnc_perksZeus}, {!cgqc_state_briefing} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Briefing done
_action = [ "zeus_briefing_stop", "Stop Briefing", "", {["briefing_stop", 0] spawn CGQC_fnc_perksZeus}, {[player] call CGQC_fnc_checkZeus && cgqc_state_briefing_full} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Options
_action = [ "zeus_options", "Options", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Zeus radios on/off 
_action = [ "zeus_radios_on", "Zeus Radios: Turn On", "", {cgqc_config_zeusRadios = true;["zeus_radios", 0, player] spawn CGQC_fnc_perksZeus;}, {!cgqc_config_zeusRadios} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_radios_off", "Zeus Radios: Turn Off", "", {cgqc_config_zeusRadios = false}, {cgqc_config_zeusRadios }] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Map Sharing Restriction
_action = [ "zeus_mapSharing_on", "MapSharing: Turn off", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_mapSharing_off", "MapSharing: Turn on", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Animation on/off 
_action = [ "zeus_anim_on", "Animations: Turn off", "", {["animation_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_anim_off", "Animations: Turn on", "", {["animation_off", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Punching on/off 
_action = [ "zeus_punch_on", "Punching: Turn On", "", {["punch_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!BRIDGE_KPU_MasterSetting} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_punch_off", "Punching: Turn Off", "", {["punch_off", 0, ""] spawn CGQC_fnc_perksZeus}, {BRIDGE_KPU_MasterSetting }] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;


// ------ GRAD Persistence 
_action = [ "zeus_grad_persistence", "Persistence", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_save", "Save Mission", "", { [true, 10] remoteExec ["grad_persistence_fnc_saveMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_load", "Load Mission", "", {[] remoteExec ["grad_persistence_fnc_loadMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_load_players", "LoadPlayers", "", {[] remoteExec ["grad_persistence_fnc_loadAllPlayers",2,false];}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_clear", "Clear Data", "", {_x remoteExec ["grad_persistence_fnc_clearMissionData", 2]}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------- Utils ----------------
_action = [ "menu_self_utils", "Utilities", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Check player mod versions
_action = [ "zeus_checkMods", "Check Player mods", "", {["check_mods", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 343
_action = [ "max_343", "get 343", "", {["343", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get 152
_action = [ "max_152", "get 152", "", {["152", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 117
_action = [ "max_117", "get 117f", "", {["117", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;		
// ------ Get Crate
_action = [ "zeus_getcrate", "Spawn: Arsenal mk3", "", {["crate", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;	
//  ------ Delete Crate 
_action = [ "zeus_delcrate", "Delete Arsenal", "", {["del_crate", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get Cargo
_action = [ "zeus_getcargo", "get Cargo", "", {["cargo", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;	
//  ------ Delete Cargo 
_action = [ "zeus_delcargo", "delete Cargo", "", {["del_cargo", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;	
// ------ Export Loadout  
_action = [ "zeus_export", "Loadout to Clipboard", "", {[] execVM "\cgqc\functions\fnc_getLoadout.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Other actions ================================================================================

// Refuel actions ---------------------------------------------------------------------------------
_action = [ "menu_self_rrr", "Maintenance Véhicule", "CGQC\textures\icon_maintenance", {['normal'] execVM "\cgqc\functions\fnc_refuel.sqf"}, {cgqc_flag_supply && (vehicle player != player) && (driver vehicle player isEqualTo player)} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Fast refuel
_action = [ "menu_self_rrr_short", "Maintenance Rapide", "CGQC\textures\icon_maintenance", {['short'] execVM "\cgqc\functions\fnc_refuel.sqf"}, {cgqc_flag_supply_rapide && (vehicle player != player) && (driver vehicle player isEqualTo player)} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Actual Zeus perks ================================================================================
_action = [ "menu_zeus_trg", "CGQC Triggers", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {false} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

_action = [ "menu_zeus_trg_1", "Activate 1", "", {hint "Trigger 1"}, {!isNil "cgqc_trg_1"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_2", "Activate 2", "", {hint "Trigger 2"}, {!isNil "cgqc_trg_2"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_3", "Activate 3", "", {hint "Trigger 3"}, {!isNil "cgqc_trg_3"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_4", "Activate 4", "", {hint "Trigger 4"}, {!isNil "cgqc_trg_4"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_5", "Activate 5", "", {hint "Trigger 5"}, {!isNil "cgqc_trg_5"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_6", "Activate 6", "", {hint "Trigger 6"}, {!isNil "cgqc_trg_6"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_7", "Activate 7", "", {hint "Trigger 7"}, {!isNil "cgqc_trg_7"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_8", "Activate 8", "", {hint "Trigger 8"}, {!isNil "cgqc_trg_8"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

// ------ Pause AI
_action = [ "zeus_pause", "Pause AI", "", {[0,{["pause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute}, {!cgqc_zeus_paused} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "zeus_unpause", "Unpause AI", "", {[0,{["unpause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {cgqc_zeus_paused} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

// ------ Delete all dead
_action = [ "zeus_delete", "Delete Dead", "", {["delete", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
	
// Options
_action = [ "zeus_options", "Zeus Options", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
// Map Sharing Restriction
_action = [ "zeus_mapSharing_on", "MapSharing: Turn off", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "zeus_mapSharing_off", "MapSharing: Turn on", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
// ------ Animation on/off 
_action = [ "zeus_anim_on", "Animations: Turn off", "", {["animation_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "zeus_anim_off", "Animations: Turn on", "", {["animation_off", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
// ------ Punching on/off 
_action = [ "zeus_punch_on", "Punching: Turn On", "", {["punch_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!BRIDGE_KPU_MasterSetting} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "zeus_punch_off", "Punching: Turn Off", "", {["punch_off", 0, ""] spawn CGQC_fnc_perksZeus}, {BRIDGE_KPU_MasterSetting }] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

// Grenade selector -------------------------------------------------------------------------------------------------
private _childrenStatements = {
	private _actions = [];

	private _loadout  = getUnitLoadout player;
	private _allItems = [];
	for "_i" from 3 to 5 do
	{
		_slotLoadout = _loadout select _i;
		if ( count _slotLoadout > 1  ) then
		{
		_allItems append (_slotLoadout select 1);
		}
	};

	// Get player's throwables
	private _seenThrowables = [];
	private _allThrowables  = [];
	{
		_itemClassName = _x select 0;
		if (!(_itemClassName in _seenThrowables) && (_itemClassName call BIS_fnc_isThrowable)) then
		{
		_seenThrowables pushBack _itemClassName;
		_picture	 = (getText (configFile >> 'CfgMagazines' >> _itemClassName >> 'picture'));
		_displayName = (getText (configFile >> 'CfgMagazines' >> _itemClassName >> 'displayName'));
		_allThrowables append [[_itemClassName, _picture, _displayName]]; // use pushBack
		}
	} forEach _allItems;
	_allThrowables sort true;


	// Add children actions
	{
		private _action = [format ["NFST_GSW_%1", _x select 0], _x select 2, _x select 1, {
		_selectedGrenade = _this select 2;
		// Get all player grenades
		private _uniformGrenades  = uniformItems  player select {_x call BIS_fnc_isThrowable && _x != _selectedGrenade};
		private _vestGrenades	 = vestItems	 player select {_x call BIS_fnc_isThrowable && _x != _selectedGrenade};
		private _backpackGrenades = backpackItems player select {_x call BIS_fnc_isThrowable && _x != _selectedGrenade};
		
		// Remove all grenades not of the desired type
		{player removeItemFromUniform  _x; false} count _uniformGrenades ;
		{player removeItemFromVest	 _x; false} count _vestGrenades	;
		{player removeItemFromBackpack _x; false} count _backpackGrenades;
		
		// Put them all back
		{player addItemToUniform  _x; false} count _uniformGrenades ;
		{player addItemToVest	 _x; false} count _vestGrenades	;
		{player addItemToBackpack _x; false} count _backpackGrenades; 
		
		// Pull out grenade? 
		
		}, {true}, {}, _x select 0] call ace_interact_menu_fnc_createAction;
		_actions pushBack [_action, [], objNull];
	} forEach _allThrowables;

	_actions
};

_action = ["cgqc_menu_grenades", "Grenade selector", "\cgqc\textures\cgqc_ace_grenade", {}, {true}, _childrenStatements] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action] call ace_interact_menu_fnc_addActionToObject;

// Shooting range 
_action = [ "menu_self_range", "Shooting Range WIP", "", {
	["spawn_range", true] spawn CGQC_fnc_perksBasic
	}, {!cgqc_state_started || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;  

// Grenade in hatch -----------------------------------------------------------------------------------
Grenade_Drop_Types = cgqc_config_grenade_types splitString ",";
compatibleGrenades = [];
compatibleGrenades = Grenade_Drop_Types;

_condition = {
  (player distance _target < cgqc_config_grenade_distance  && count (compatibleGrenades arrayIntersect magazines _player) > 0) && (side _target != side _player);
};

_statement = {
  //playSound3D ["A3\Sounds_F\weapons\Grenades\handgrenade_drops\handg_drop_Metal_2.wss", _target];

	[1, _target, {
		params ["_target"];
		[_target] spawn {
			params ["_target"];
			_player = player;
			_nade = (compatibleGrenades arrayIntersect magazines _player) select 0;
			_nadeAmmo = getText (configFile >> "CfgMagazines" >> "HandGrenade" >> "ammo");
			_fuse = getNumber (configFile >> "CfgAmmo" >> _nadeAmmo >> "explosionTime");
			_player removeItem (_nade);
			// Check if anyone is alive
			y_aliveCrew = false;
			{if (alive _x) exitWith { y_aliveCrew = true; };} forEach (crew _target); 
			_crewThrowBack = selectRandom [false, false, false, false, false, true];
			if (y_aliveCrew && _crewThrowBack) then {
				//hint "They're throwing it back!";
				// Need a panicking but glorious yell
				_targetPos = getPos _target;
				_offsetDir = random 360;
				_offsetDistance = selectRandom[3,4,5,6];
				_offsetX = _offsetDistance * sin(_offsetDir);
				_offsetY = _offsetDistance * cos(_offsetDir);
				_offsetPos = [_offsetX, _offsetY, 0] vectorAdd _targetPos;
				bomb = _nadeAmmo createVehicle _offsetPos;
				//bomb attachTo [_target, [0,0,-1]];
				sleep _fuse;
			} else {
				//hint "Good nade!";
				// Need a panicking yell
				bomb = _nadeAmmo createVehicle (getPos _target);
				bomb attachTo [_target, [0,0,-1]];
				sleep _fuse;
				//bomb setDamage 1;
				_randomEngine = selectRandom [0.4, 0.5,  0.6, 0.7, 0.8, 0.9, 1];
				_randomHull = selectRandom [0.4, 0.5,  0.6, 0.7, 0.8, 0.9, 1];
				_randomTurret = selectRandom [0.4, 0.5,  0.6, 0.7, 0.8, 0.9, 1];
				_engine = _randomEngine + (_target gethitPointDamage  "hitEngine"); 
				_hull = _randomHull + (_target gethitPointDamage  "hitHull"); 
				_turret = _randomTurret + (_target gethitPointDamage  "hitTurret"); 
				_target setHitPointDamage ["hitEngine", _engine];
				_target setHitPointDamage ["hitHull", _hull];
				_target setHitPointDamage ["hitTurret", _turret];
				_randomCrew = [0.9,1,1,1,1,1];
				{ _x setDamage (selectRandom _randomCrew);} forEach crew _target;
				_randomTime = [1,2];
				sleep 1;
				{if (alive _x) then{
					_survivor = _x;
					_x allowFleeing 1;
					{
						_survivor setSkill [_x, (_survivor skill _x) / 50];
					} forEach cgqc_subskills;
					_x setSkill ["aimingAccuracy", 0.1];
					_x setSkill ["aimingSpeed", 0.1];
					_x setSkill ["spotTime", 0.1];
					_x setSkill ["aimingShake", 0.1];
					_x setSkill ["courage", 0.1];
					_x leaveVehicle _target;
					_x moveOut _target;
					sleep selectRandom _randomTime;
				};} forEach crew _target;
			};
		};
	}, {}, "Dropping Grenade", {true}] call ace_common_fnc_progressBar ;
};

_action = ["Drop Grenade", "Drop Grenade in Hatch", "",_statement,_condition] call ace_interact_menu_fnc_createAction;
["Tank", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

diag_log "[CGQC_INIT] --- addPerks done";