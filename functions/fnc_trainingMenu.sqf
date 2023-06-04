// --- trainingMenu ----------------------------------------------------------
cgqc_training_mode = true;
// Add the training shit to the player 

// Training actions ---------------------------------------------------------------------------------
_action = [ "menu_self_training", "Training", "", {}, {cgqc_training_mode} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

#include "training\cfg_utils.hpp"
#include "training\cfg_cqb.hpp"
#include "training\cfg_defense.hpp"
#include "training\cfg_heli.hpp"
#include "training\cfg_koth.hpp"
#include "training\cfg_landnav.hpp"
#include "training\cfg_med.hpp"
#include "training\cfg_mortar.hpp"
#include "training\cfg_para.hpp"
#include "training\cfg_sniping.hpp"
#include "training\cfg_vic.hpp"



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
