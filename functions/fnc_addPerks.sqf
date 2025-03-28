#include "\CGQC\script_component.hpp"
// --- addPerks ----------------------------------------------------------
// Add all perks to player and set defaults
LOG("[CGQC_INIT] addPerks started");

// --- Perks Menu  ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cgqc", "CGQC Perks", "CGQC\textures\cgqc_ace_icon", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Anti quick-jump
_action = [ "menu_self_para_quickMap", "QuickJump to map point", "\CGQC\textures\cgqc_ace_para", {[0, 0] call CGQC_fnc_trainingPara}, {cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Repos ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_chill", " au Repos", "CGQC\textures\cgqc_ace_beret", {["chill", true] spawn CGQC_fnc_perksBasic}, {!cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Ready ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_ready", " Prêt au Combat", "CGQC\textures\cgqc_ace_combat", {["ready", true] spawn CGQC_fnc_perksBasic}, {cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Outdoor Range =========================================================================================================

_action = [ "cgqc_perk_range", "Goto: Test Range", "", {cgqc_outdoor_range_pos = getPosATL player; player setpos getPosATL cgqc_outdoor_range_start;cgqc_outdoor_range_tp = true;}, {!cgqc_outdoor_range_hide} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_range_back", "Exit Test Range", "", {player setpos cgqc_outdoor_range_pos; cgqc_outdoor_range_tp = false;}, {cgqc_outdoor_range_tp} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Mark clear =========================================================================================================
_action = [ "cgqc_perk_mark", "Mark building cleared", "a3\ui_f\data\map\GroupIcons\badge_gs.paa", {[] spawn CGQC_fnc_markClear}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mark_clear", "Del last marker", "", {["last"] spawn CGQC_fnc_markClear}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_mark"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mark_clear", "Clear all markers", "a3\ui_f\data\map\markers\Military\objective_CA.paa", {["clear"] spawn CGQC_fnc_markClear}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_mark"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// FieldCraft =========================================================================================================
_action = [ "cgqc_perk_fieldcraft", "FieldCraft", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_cutgrass", "Coupe l'herbe", "CGQC\textures\cgqc_ace_grass", {["cut_grass"] spawn CGQC_fnc_perksFieldcraft}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_fieldcraft"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_camo", "Hide yourself", "", {["camo"] spawn CGQC_fnc_perksFieldcraft}, {!cgqc_perks_camo && vehicle player isEqualTo player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_fieldcraft"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_track_smell", "Smell", "", {["smell"] spawn CGQC_fnc_perksFieldcraft}, {vehicle player isEqualTo player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_fieldcraft"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_track_fire", "Make Campfire", "", {["fire"] spawn CGQC_fnc_perksFieldcraft}, {vehicle player isEqualTo player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_fieldcraft"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Personal stash =========================================================================================================
_action = [ "cgqc_perk_stash", " Personal Stash", "CGQC\textures\cgqc_ace_stash", {["stash", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && !cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_fieldcraft"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Add Delete stash option
_action = [ "cgqc_perk_stash_delete", " Delete Stash", "", {["del_stash", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_fieldcraft"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Quick State =========================================================================================================
_action = [ "cgqc_perk_state", "Quick State", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
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

// Radios =========================================================================================================
_action = [ "menu_self_radios", " Radio Presets", "CGQC\textures\radio.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set radios sides
_action = [ "self_radio1", "Flip radios Gauche/Droite", "", {["flipSides"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;


/*
// Set radio roles
// Spartan 1
_action = [ "menu_self_spartan1", "Spartan 1", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan1", "343", "", {["spartan", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_2", "343+152", "", {["spartan_2", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_1", "Team Leader", "", {["spartan_1", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan2", "Spartan 2", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan2", "343", "", {["spartan", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_2", "343+152", "", {["spartan2", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_1", "Team Leader", "", {["spartan1", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan3", "Spartan 3", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan3", "343", "", {["spartan", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan3_2", "343+152", "", {["spartan2", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan3_1", "Team Leader", "", {["spartan1", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Centaure
_action = [ "self_radio_centaure", "Centaure/Blindés", "", {["centaure"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Griffon
_action = [ "self_radio_griffon", "Griffon/Heli", "", {["griffon"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// JTAC
_action = [ "self_radio_jtac", "JTAC", "", {["jtac"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// HQ
_action = [ "self_radio_hq", "HQ", "", {["hq"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
*/

// Toggle Speaker 1
_action = [ "self_radio_speaker1", "Toggle Speaker 1", "", {["toggle_speaker"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Toggle Speaker 2
_action = [ "self_radio_speaker2", "Toggle Speaker 2", "", {["toggle_speaker_2"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Cone of silence   =========================================================================================================
_action = [ "menu_self_cone", "Cone de silence", "CGQC\textures\cgqc_ace_cone", {["cone", false] spawn CGQC_fnc_perksBasic}, {!cgqc_perks_silence} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_cone_off", "Cone de silence: Off", "CGQC\textures\cgqc_ace_cone", {["cone_off", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_silence} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Inspect   =========================================================================================================
_action = [ "menu_self_inspect", "Inspect/Visual", "CGQC\textures\search.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Show player
_action = [ "menu_self_cam", "Player Mirror", "CGQC\textures\cgqc_ace_mirror", {["cam", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Confirm self-loadout
_action = [ "menu_self_check", "Confirm Self Loadout", "CGQC\textures\search.paa", {["check", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect"], _action ] call  ace_interact_menu_fnc_addActionToObject;

//  Change Goggles =========================================================================================================
_action = [ "cgqc_perk_goggles", "Change Goggles", "CGQC\textures\cgqc_ace_goggles", {""}, {cgqc_player_has2023} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// ---- Types
_action = [ "cgqc_perk_goggles_clr", "Clear Glasses", "cgqc\textures\cgqc_ace_glasses", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_clr_msk", "Goggles/Masks", "CGQC\textures\cgqc_ace_mask", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_sun", "Sunglasses", "cgqc\textures\cgqc_ace_sunglasses", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_gas", "Gasmask", "cgqc\textures\cgqc_ace_gasmask", {["G_mas_can_gasmask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Clear glasses
_action = [ "cgqc_perk_goggles_base", "Ballistic Glasses", "", {["G_mas_can_gog"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_base_t", "Facewrap (Tan)", "", {["G_mas_can_wrap_gog_T"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_base_b", "Facewrap (Blk)", "", {["G_mas_can_wrap_gog_B"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_shem_down", "Shemagh Up", "", {["G_mas_can_shemag_gog_l"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_shem_up", "Shemagh Down", "", {["G_mas_can_shemag_gog"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Clear mask
_action = [ "cgqc_perk_mask_blk", "Mask (Black)", "", {["G_mas_can_mask_b"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_tan", "Mask (Tan)", "", {["G_mas_can_mask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_b_blk", "Balaclava (Blk)", "", {["G_mas_can_balaM_b"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_b_tan", "Balaclava (Tan)", "", {["G_mas_can_balaM_T"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_shemagh", "Shemagh Up", "", {["G_mas_can_shemag_mask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Sunglasses
_action = [ "cgqc_perk_sun_blk", "Dark Glasses", "", {["rhs_googles_black"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_mask", "Dark Mask", "", {["rhsusf_oakley_goggles_blk"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_shemagh", "Mask+Shemagh Up", "", {["rhsusf_shemagh_gogg_tan"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_shemagh_d", "Mask+Shemagh Down", "", {["rhsusf_shemagh2_gogg_tan"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_low", "Low Profile Goggles", "", {["G_Lowprofile"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Signals =========================================================================================================
_action = [ "menu_self_signals", "Signals", "CGQC\textures\cgqc_ace_chems", {""}, {cgqc_config_signals && cgqc_perks_chems > 0  } ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Criquet
_action = ["menu_self_criquet", "Criquet", "CGQC\textures\cgqc_ace_cricket", {["click", false] spawn CGQC_fnc_perksBasic;}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action] call ace_interact_menu_fnc_addActionToObject;
// Smokes
_action = [ "menu_self_smoke_blue", "Smoke: Blue", "", {["throw", "SmokeShellBlue"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_red", "Smoke: Red", "", {["throw", "SmokeShellRed"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_purple", "Smoke: Purple", "", {["throw", "SmokeShellPurple"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_yellow", "Smoke: Yellow", "", {["throw", "SmokeShellYellow"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Chemlights
_action = [ "menu_self_chem_green", "Chem Green", "CGQC\textures\cgqc_ace_chems", {["throw", "Chemlight_green"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_chem_ir", "Chem IR", "CGQC\textures\cgqc_ace_chems", {["throw", "ACE_Chemlight_IR"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
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

// Fixes =========================================================================================================
_action = [ "menu_self_fixes", "Fixes/Debug", "a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Panic
_action = [ "menu_self_panic", "PANIC! Fix all!", "", {["panic", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Fix Blackout
_action = [ "menu_self_blackout", "Fix Blackout", "", {["fix_blackout", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Fix Sound
_action = [ "menu_self_fix_sound", "Fix Sound", "a3\ui_f\data\IGUI\Cfg\simpleTasks\types\listen_ca.paa", {["fix", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
/// Set patch
_action = [ "menu_self_patch", "Remettre ta patch personelle", "\cgqc\textures\cgqc_ace_defend.paa", {[player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Reset teamColor
_action = [ "menu_self_color", "Reset Team Color", "", {[] call CGQC_fnc_setTeamColorReload}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Reset colors
_action = [ "menu_self_resetColors", "Restore all TeamColors", "", {[] call CGQC_setTeamColorReloadAll;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Restore backpack
_action = [ "menu_self_restore_pack", "Restore Lost Backpack", "", {["None", "restore"] spawn CGQC_fnc_dropStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Export custom pistol
_action = [ "menu_self_export_pistol", "Export Handgun to Clipboard", "", {[] spawn CGQC_fnc_exportPistol}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Fix stuck walk
_action = [ "menu_self_fixWalk", "Fix stuck walk", "", {[player, "forceWalk", "BackpackOnChest", false] call ace_common_fnc_statusEffect_set}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Dynamic group
//_action = [ "menu_self_group", "Activate Dynamic Groups", "", {["group", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Drop backpack
_action = [ "menu_self_drop", "Drop Backpack", "a3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa", {[backpack player, 'backpack'] spawn CGQC_fnc_dropStuff}, {backpack player != '' && isNull objectParent player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Pick backpack
_action = [ "menu_self_grab", "Pickup Backpack", "a3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa", {[player, 'backpack_pickup'] spawn CGQC_fnc_dropStuff}, {cgqc_backpack_dropped && (count nearestObjects [player, ["GroundWeaponHolder_Scripted"], 5]) > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Fix ARMA
_action = [ "menu_fix_arma", "ARMA?", "", {""}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_fix_arma_heal", "Magic Heal", "a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca", {["heal"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "menu_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

//_action = [ "menu_fix_arma_rejoin", "Rejoin after Disconnect", "", {["rejoin"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "menu_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_fix_arma_daf", "Remove Deafness", "a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca", {["deaf"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "menu_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_fix_arma_corpse", "Teleport to corpse", "", {["tp_corpse"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "menu_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_fix_arma_tp", "Teleport to Leader", "", {["tp_leader"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "menu_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Save individual snapshot
//_action = [ "menu_fix_arma_save", "Save Snapshot", "", {[player, "save"] spawn CGQC_fnc_snapshot;}, {true}] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "menu_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Load individual snapshot
//_action = [ "menu_fix_arma_load", "Load Snapshot", "", {[player, "load"] spawn CGQC_fnc_snapshot;}, {true}] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "menu_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Open items =========================================================================================================
// Open IFAK
_action = [ "menu_self_ifak", "Unpack: IFAK", "\CGQC\textures\icon_med", {["ifak", player, true] call CGQC_fnc_openMedical}, {[player, 'cgqc_items_ifak'] call BIS_fnc_hasItem} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Open Medic supply kit
_action = [ "menu_self_medkit", "Unpack: Medic supply kit", "\CGQC\textures\icon_med", {["medkit", player, true] call CGQC_fnc_openMedical}, {[player, 'cgqc_items_medkit'] call BIS_fnc_hasItem} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

/*
// Team management
_action = [ "CGQC_joinColor_red", "1-1 Rouge", "\z\ace\addons\interaction\UI\team\team_red_ca.paa", {['RED'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_Actions", "ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinColor_green", "1-2 Vert", "\z\ace\addons\interaction\UI\team\team_green_ca.paa", {['GREEN'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinColor_blue", "2-1 Bleu", "\z\ace\addons\interaction\UI\team\team_blue_ca.paa", {['BLUE'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinColor_yellow", "2-2 Jaune", "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa", {['YELLOW'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinColor_leave", "HQ Blanc", "\z\ace\addons\interaction\UI\team\team_white_ca.paa", {['RED'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "CGQC_joinGroup", "Join/Create Group", "\z\ace\addons\interaction\UI\team\team_management_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "CGQC_joinGroup_spartan", "Spartan", "", {['Spartan', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "CGQC_joinGroup_spartan_11", "1-1 Rouge", "\z\ace\addons\interaction\UI\team\team_red_ca.paa", {['Spartan', 'RED'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_spartan_12", "1-2 Vert", "\z\ace\addons\interaction\UI\team\team_green_ca.paa", {['Spartan', 'GREEN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_spartan_21", "2-1 Bleu", "\z\ace\addons\interaction\UI\team\team_blue_ca.paa", {['Spartan', 'BLUE'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_spartan_22", "2-2 Jaune", "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa", {['Spartan', 'YELLOW'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_spartan_0", "0 - Blanc", "\z\ace\addons\interaction\UI\team\team_white_ca.paa", {['Spartan', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "CGQC_joinGroup_hermes", "Hermes", "", {['Hermes', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_orion", "Orion", "", {['Orion', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_centaure", "Centaure", "", {['Centaure', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_griffon", "Griffon", "", {['Griffon', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_pegase", "Pegase", "", {['Pegase', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_hq", "HQ", "", {['HQ', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
*/

// Whistle ---------------------------------------------------------------------------------------------------------------
//_action = [ "menu_self_whistle", "Whistle", "\fox_whistle\ui\whistle.paa", {[player] call CGQC_fnc_whistle}, {!cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

LOG("[CGQC_INIT] --- addPerks done");