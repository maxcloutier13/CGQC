#include "\CGQC\script_component.hpp"
// --- loadMk3Menu ----------------------------------------------------------
// Ace menu for mk3 sheeits
 params ["_crate_array", ["_type", "default"]];
 LOG_2("[loadMk3Menu] %1/%2 started", _crate_array, _type);
//_crate = (_this select 0) select 0;
//_type = _this select 1;
_crate = _crate_array;
if ( typeName _crate_array isEqualTo "ARRAY") then {
	_crate = _crate_array select 0;
};

LOG_2("[loadMk3Menu] Crate:%1", _crate);

LOG("[loadMk3Menu] - waiting for postInit to finish");
waitUntil {!isNil "cgqc_start_postInitClient_done"};
waitUntil {cgqc_start_postInitClient_done};
LOG("[loadMk3Menu] - postInit finished!");
waitUntil{ !isNull (findDisplay 46) };
LOG("[loadMk3Menu] - Checking for Interface");
if (hasInterface) then {
	LOG("[loadMk3Menu] - hasInterface - loading menu");
	// Unlock arsenal when training is on
	cgqc_mk2_arsenal_locked = !cgqc_flag_isTraining;
	switch (_type) do {
		case "swat":{
			// SWAT Stuff
			#include "\CGQC\loadouts\swat\actions_role.hpp"
			#include "\CGQC\loadouts\swat\actions_primary.hpp"
			#include "\CGQC\loadouts\swat\actions_arsenal.hpp"
			#include "\CGQC\loadouts\swat\actions_optics.hpp"
			// Snapshots
			#include "\CGQC\loadouts\actions_snapshots.hpp"
			// Empty the weird shit
			clearWeaponCargoGlobal _crate;
			clearItemCargoGlobal _crate;
			clearMagazineCargoGlobal _crate;
			// Set vic as medical station
			_crate setVariable ["ace_medical_isMedicalVehicle", true, true];
		};
		case "para":{
			// Jumping uniform
			LOG("[loadMk3Menu] - para menu");
			_action = [ "menu_mk2_camo_para_std", "Kit: Parachutiste", "\CGQC\textures\cgqc_ace_para", {["para", false] spawn CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
		};
		case "dive":{
			// Diving uniform
			LOG("[loadMk3Menu] - diving menu");
			_action = [ "menu_mk2_camo_diver_std", "Kit: Plongeur", "\CGQC\textures\cgqc_ace_dive", {["diver", false] spawn CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
		};
		default	{ // Normal mk3 Arsenal
			if (cgqc_flag_isTraining && cgqc_training_spawnpoints) then {
				LOG("[loadMk3Menu] - training mode: adding respawn point");
				// Respawn point in front of Arsenal
				cgqc_mk2_arsenal_ctr = cgqc_mk2_arsenal_ctr + 1;
				[west, getPosATL _crate, format["Arsenal West %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
				[east, getPosATL _crate, format["Arsenal East %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
				[independent, getPosATL _crate, format["Arsenal Independant %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
			};
			// Zeus Options
			_action = [ "menu_zeus_options", "Zeus Options", "", {hint 'Arsenal Options';}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Zeus lock toggle ===============================================================================================
			_action = [ "menu_zeus_lock", "Lock Arsenal by Rank", "", {hint 'Arsenal lock!'; cgqc_mk2_arsenal_locked = true; publicVariable "cgqc_mk2_arsenal_locked"}, {!cgqc_mk2_arsenal_locked && [player] call CGQC_fnc_checkZeus && !cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_unlock", "Unlock Arsenal. Ignore Rank", "", {hint 'Arsenal unlocked!'; cgqc_mk2_arsenal_locked = false; publicVariable "cgqc_mk2_arsenal_locked"}, {cgqc_mk2_arsenal_locked && [player] call CGQC_fnc_checkZeus && !cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options" ], _action ] call ace_interact_menu_fnc_addActionToObject;

			// Max Mags  ===============================================================================================
			_action = [ "menu_zeus_maxMags", "Max Mags", "", {hint 'Limit Maximum Mags'}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// on/off
			_action = [ "menu_zeus_maxMags_on", "Limit: ON", "", {cgqc_setting_limitMags = true; publicVariable "cgqc_setting_limitMags";hint "Mags Limited"}, {!cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_maxMags_off", "Limit: OFF", "", {cgqc_setting_limitMags = false; publicVariable "cgqc_setting_limitMags";hint "Mags Unlimited"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Numbers
			_action = [ "menu_zeus_maxMags_6", "SetMax: 6", "", {cgqc_setting_limitMags_max = 6; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 6"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_maxMags_8", "SetMax: 8", "", {cgqc_setting_limitMags_max = 8; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 8"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_maxMags_12", "SetMax: 12", "", {cgqc_setting_limitMags_max = 12; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 12"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "15", "SetMax: 15", "", {cgqc_setting_limitMags_max = 15; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 15"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_maxMags_20", "SetMax: 20", "", {cgqc_setting_limitMags_max = 20; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 20"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;

			/*
			// Flag that arsenal is unlocked or in training mode
			_normalTxt = format["--- Arsenal Normal: %1 ---", cgqc_player_rank_name];
			_modifierFunc = {
				params ["_target", "_player", "_params", "_actionData"];
				LOG_3("loadMk3: _modifierFunc [%1, %2, %3, %4]", _target, _player, _params, _actionData);
				// Modify the action - index 1 is the display name, 2 is the icon...
				_actionData set [1, format["--- Arsenal Normal: %1 ---", cgqc_player_rank_name]];
			};
			// "Name", "ShownName", "icon", {statement}, {condition}, {childrenCode}, [actionParameter], "Position", Distance, [OtherParams], {ModifierCode}
			_action = [ "mode_training", _normalTxt, "", {""}, {!cgqc_flag_isTraining && cgqc_mk2_arsenal_locked}, {},[],"",4,[false, false, false, false, false], _modifierFunc] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
			*/
			_action = [ "mode_unlocked", "--- UNLOCKED ---", "", {""}, {!cgqc_mk2_arsenal_locked && !cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

			_action = [ "mode_training", "--- TRAINING MODE ---", "", {""}, {cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

			if (!cgqc_player_has2023 && !cgqc_player_hasUnsung && !cgqc_player_hasIfa3) then {
				LOG("[loadMk3Menu] - loading vanilla stuff");
				//waitUntil {sleep 1; cgqc_mk2_arsenal_init_done};
				// Vanilla ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_vanilla", "Vanilla", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_side isEqualTo WEST} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				//  Loadout switcher
				_action = [ "menu_loadouts", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla"], _action ] call ace_interact_menu_fnc_addActionToObject;
				//  Arsenal Complet
				_action = [ "menu_vanilla_complete", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\vanilla\load_vanilla.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Infanterie ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_loadout_inf", "Infanterie", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Rifleman Carbine hk416
				_action = [ "menu_inf_RFcarbine", "Rifleman Carbine 416", "", {["vanilla_rifleman", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts", "menu_loadout_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Lead ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_loadout_lead", "Commandement", "", {""}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Team Leader
				_action = [ "menu_loadout_inf_TL", "Team Leader", "", {["vanilla_tl", 1, true] spawn CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts", "menu_loadout_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			};
			// Vietnam arsenal if Unsung is pressent ===============================================================================================
			if (cgqc_player_hasUnsung) then {
				LOG("[loadMk3Menu] - loading unsung stuff");
				// Spawnmodule faction
				//cgqc_spawn_module setVariable ["VehicleFactions", "UNSUNG_W"];
				#include "\CGQC\loadouts\unsung\actions_roles.hpp"
				#include "\CGQC\loadouts\unsung\actions_primary.hpp"
				#include "\CGQC\loadouts\unsung\actions_arsenal.hpp"
			};
			// Mk2 Arsenal if 2023 mod is present  ===============================================================================================
			if (cgqc_player_has2023) then {
				LOG("[loadMk3Menu] - loading 2023 stuff");
				// 2023 Stuff
				#include "\CGQC\loadouts\2023\actions_role.hpp"
				#include "\CGQC\loadouts\2023\actions_camo.hpp"
				#include "\CGQC\loadouts\2023\actions_primary.hpp"
				#include "\CGQC\loadouts\2023\actions_optics.hpp"
				#include "\CGQC\loadouts\2023\actions_arsenal.hpp"
				// PMC-T
				#include "\CGQC\loadouts\pmct\actions_role.hpp"
				#include "\CGQC\loadouts\pmct\actions_primary.hpp"
				#include "\CGQC\loadouts\pmct\actions_optics.hpp"
				#include "\CGQC\loadouts\pmct\actions_arsenal.hpp"
			};
			if (cgqc_player_hasSWAT) then {
				// SWAT Stuff
				#include "\CGQC\loadouts\swat\actions_role.hpp"
				#include "\CGQC\loadouts\swat\actions_primary.hpp"
				#include "\CGQC\loadouts\swat\actions_arsenal.hpp"
			};
			// WW2 shit ===============================================================================================
			if (cgqc_player_hasIfa3) then {
				LOG("[loadMk3Menu] - loading IFA3 stuff");
				// Main Menu ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_ifa3", "WW2", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_hasIfa3} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// ifa3 Arsenal Complet
				_action = [ "menu_ifa3_complete", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\ifa3\load_ifa3.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_ifa3" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

			};
			// Scandinavia shit ===============================================================================================
			if (cgqc_player_hasNorthern) then {
				LOG("[loadMk3Menu] - loading Scandinavia stuff");
				// Main Menu ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_scandinavia", "Northern Front", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_hasNorthern} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Scandinavia Arsenal Complet
				_action = [ "menu_scandinavia_complete", "Arsenal: Northern", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\northern\load_northern.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_scandinavia" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

			};

			LOG("[loadMk3Menu] - loading general stuff");

			// Quick Items/Skills and such
			#include "\CGQC\loadouts\actions_quickStuff.hpp"

			// Snapshots
			#include "\CGQC\loadouts\actions_snapshots.hpp"


			// Zeus Arsenal ========================================================================================================
			_action = [ "menu_zeus", "Arsenal: Zeus", "CGQC\textures\icon_arsenal", {[player, player, true] call ace_arsenal_fnc_openBox;}, {[player] call CGQC_fnc_checkZeus || !cgqc_mk2_arsenal_locked || player getVariable 'cgqc_player_rank' > 7} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		};
	};
} else {
	LOG("[loadMk3Menu] - NO INTERFACE - skipping");
};

LOG("[loadMk3Menu] done");


/*

_condition = {
    true
};
_statement = {
    params ["_target", "_player", "_params"];
    diag_log format ["_statement [%1, %2, %3]", _target, _player, _params];

    // Run on hover:
    ["ace_common_displayTextStructured", ["someone is thinking of giving you items", 1.5, _target], [_target]] call CBA_fnc_targetEvent;
};
_insertChildren = {
    params ["_target", "_player", "_params"];
    diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

    // Add children to this action
    private _actions = [];
    {
        private _childStatement = {diag_log format ["givingItem %1", _this]; _target addItem (_this select 2);};
        private _action = [format ["item:%1",_x], _x, "", _childStatement, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
    } forEach (items _player);

    _actions
};
_modifierFunc = {
    params ["_target", "_player", "_params", "_actionData"];
    diag_log format ["_modifierFunc [%1, %2, %3]", _target, _player, _params];

    // Modify the action - index 1 is the display name, 2 is the icon...
    _actionData set [1, format ["Give Items: %1", count (items player)]];
};

_action = ["GiveItems", "?","",_statement,_condition,_insertChildren,[123],"",4,[false, false, false, true, false], _modifierFunc] call ace_interact_menu_fnc_createAction;
[q3, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


*/