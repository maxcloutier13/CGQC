// --- trainingMenu ----------------------------------------------------------
cgqc_training_mode = true;
// Add the training shit to the player 

// Training actions ---------------------------------------------------------------------------------
_action = [ "menu_self_training", "Training", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa", {}, {cgqc_training_mode} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Quick Heal
_action = [ "menu_self_heal", "Quick heal", "", {["heal"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training"], _action ] call ace_interact_menu_fnc_addActionToObject;	

#include "\cgqc\training\cfg_utils.hpp"
#include "\cgqc\training\cfg_cqb.hpp"
#include "\cgqc\training\cfg_defense.hpp"
#include "\cgqc\training\cfg_heli.hpp"
#include "\cgqc\training\cfg_koth.hpp"
#include "\cgqc\training\cfg_landnav.hpp"
#include "\cgqc\training\cfg_med.hpp"
#include "\cgqc\training\cfg_mortar.hpp"
#include "\cgqc\training\cfg_para.hpp"
#include "\cgqc\training\cfg_sniping.hpp"
#include "\cgqc\training\cfg_vic.hpp"

// ------ Get Crate
_action = [ "menu_self_training_crate", "Spawn: Arsenal mk3", "", {["crate"] execVM '\cgqc\loadouts\mk3_getStuff.sqf'}, {!cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_training"], _action ] call ace_interact_menu_fnc_addActionToObject;	
_action = [ "menu_self_training_delcrate", "Delete Arsenal", "", {["del_crate"] execVM '\cgqc\loadouts\mk3_getStuff.sqf'}, {cgqc_player_crate} ] call ace_interact_menu_fnc_createAction;
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
