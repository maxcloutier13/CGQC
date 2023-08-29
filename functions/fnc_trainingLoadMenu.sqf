// --- trainingLoadMenu ----------------------------------------------------------
// Add the training shit to the player

[] spawn {
	diag_log "[CGQC_FNC] trainingLoadMenu started";
	cgqc_training_mode = true;
	// Training actions ---------------------------------------------------------------------------------
	_action = [ "menu_self_training", "Training", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa", {}, {cgqc_training_mode} ] call ace_interact_menu_fnc_createAction;
	_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

	#include "\cgqc\training\cfg_utils.hpp"
	#include "\cgqc\training\cfg_cqb.hpp"
	#include "\cgqc\training\cfg_defense.hpp"
	#include "\cgqc\training\cfg_heli.hpp"
	#include "\cgqc\training\cfg_koth.hpp"
	// LandNav ---------------------------------------------------------------------------------------------------------
	_action = [ "menu_self_training_orient", "Land Navigation", "\CGQC\textures\icon_landnav", {[] call CGQC_fnc_landNav_openUI}, {!cgqc_training_landnav} ] call ace_interact_menu_fnc_createAction;       
	_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	_action = [ "menu_self_training_orient_basic_off", "Stop Land Navigation Training", "", {[] call CGQC_fnc_landnav_off;}, {cgqc_training_landnav} ] call ace_interact_menu_fnc_createAction;     
	_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	// Convoy ---------------------------------------------------------------------------------------------------------
	_action = [ "menu_self_training_convoy", "Convoy Ambush", "", {[] call CGQC_fnc_convoy_start}, {!cgqc_training_convoy} ] call ace_interact_menu_fnc_createAction;       
	_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	_action = [ "menu_self_training_convoy_off", "Stop Convoy Ambush", "", {[] call CGQC_fnc_convoy_off;}, {cgqc_training_convoy} ] call ace_interact_menu_fnc_createAction;     
	_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;      

	#include "\cgqc\training\cfg_med.hpp"
	#include "\cgqc\training\cfg_mortar.hpp"
	#include "\cgqc\training\cfg_para.hpp"
	#include "\cgqc\training\cfg_sniping.hpp"
	#include "\cgqc\training\cfg_vic.hpp"

	// ------ Get Crate
	_action = [ "menu_self_training_crate", "Spawn: Arsenal mk3", "", {["crate"] call CGQC_fnc_getStuff}, {!cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
	_adding = [ player, 1, ["ACE_SelfActions","menu_self_training"], _action ] call ace_interact_menu_fnc_addActionToObject;	
	_action = [ "menu_self_training_delcrate", "Delete Arsenal", "", {["del_crate"] call CGQC_fnc_getStuff}, {cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
	_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;


	//Change wind -----------------------------
	/*_action = [ "menu_sniping_wind", "Change Wind", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
	_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	_action = [ "menu_sniping_wind_low", "Low", "", {["cgqc_change_fucking_wind", ["wind_low"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
	_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
	_action = [ "menu_sniping_wind_mid", "Medium", "", {["cgqc_change_fucking_wind", ["wind_med"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
	_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
	_action = [ "menu_sniping_wind_hi", "High", "", {["cgqc_change_fucking_wind", ["wind_hi"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
	_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
	_action = [ "menu_sniping_wind_random", "Random", "", {["cgqc_change_fucking_wind", ["wind_random"]] call CBA_fnc_globalEvent;}, {true} ] call ace_interact_menu_fnc_createAction;     
	_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_time", "menu_sniping_wind"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
	*/
	diag_log "[CGQC_FNC] trainingLoadMenu done";
};
