// --- postInit_client ----------------------------------------------------------
// Start everything player related

// Start with a silent black screen. 
0 fadeSound 0;
titleCut ["", "BLACK FADED", 999];

_version = "3.4.3.2";
// Client-side code
player setVariable ["cgqc_version_core", _version, true]; // Set the client's mod version

// Player identification --------------------------------------------------------------------------------------------
//Get some player info
cgqc_player_name = name player;
cgqc_player_steamid = getPlayerUID player;
cgqc_player_steamName = profileNameSteam;
cgqc_perks_basic = true;
cgqc_player_face = face player;

// Check if daytime
[] call CGQC_fnc_isDaytime;

//ID player and find patch
_rank = [] spawn CGQC_fnc_findRank;
_patch = [] spawn CGQC_fnc_findPatch;
_beret = [] spawn CGQC_fnc_getRankedBeret;

// Set and keep patch 
_set = [] spawn CGQC_fnc_setPatch;

// Dynamic group -------------------------------------------------------------------------------------------------
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;


// Briefing entry -------------------------------------------------------------------------------------------------
_brief = [] call CGQC_fnc_briefing; 

if (cgqc_player_loadAll) then {

	// Init arsenal ---------------------------------------------------------------------------------------------------
	if(cgqc_player_hasUnsung) then {
		cgqc_unsung_arsenal_1 = [];
		cgqc_unsung_arsenal_8 = [];
		#include "\cgqc\loadouts\unsung\all_items.sqf";
		cgqc_unsung_arsenal_8 = cgqc_unsung_arsenal_all;
		cgqc_unsung_arsenal_init_done = true;
	};
	if(cgqc_player_hasIfa3) then {
		cgqc_ifa3_arsenal_1 = [];
		cgqc_ifa3_arsenal_8 = [];
		#include "\cgqc\loadouts\ifa3\all_items.sqf";
		cgqc_ifa3_arsenal_8 = cgqc_ifa3_arsenal_all;
		cgqc_ifa3_arsenal_init_done = true;
	};

	// Event Handers ----------------
	//On map click (_pos, _units,_shift,_alt)
	onMapSingleClick "execVM '\cgqc\functions\fnc_mapShare_list.sqf';false;";

	//Respawn handler 
	player addMPEventHandler ["MPRespawn", {
		params ["_unit", "_corpse"];
		[_unit] spawn CGQC_fnc_playerRespawned;
	}];

	//Death handler 
	player addMPEventHandler ["MPKilled", {	
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[_unit, _killer] spawn CGQC_fnc_playerKilled;
	}];

	//Maximum mags event handler 
	["ace_arsenal_displayClosed", {
		[] spawn CGQC_fnc_maxMags;
		[player, true] call ace_arsenal_fnc_removeBox;
	}] call CBA_fnc_addEventHandler;

	//Unconcious event 
	["ace_unconscious", {
		params ["_unit", "_isUnconscious"];
	if (_isUnconscious) then {
			playSound3D [selectRandom cgqc_unconscious_sounds, _unit, false, getPosASL _unit, 2, 1, 30];
		};
	}] call CBA_fnc_addEventHandler;

	// Friendly fire fix - Prevent AI from shooting back
	player addEventHandler [ "HandleRating", {
			params["_player", "_rating"];
			_return = _rating;
			if(rating _player < 0) then {
				hint "Méchant garçon!";
				_return = abs rating _player;
			} else {
				if(_rating + rating _player < 0) then {
					hintSilent "Woops!!!!";
					_return = 0;
				};
			};
			_return
		}
	];
	_unit = typeOf player;
	switch (_unit) do {
		case "CGQC_Soldat_Base";
		case "CGQC_Officer_Base": {
			[] spawn CGQC_fnc_initTraining;
		};
	};

	// Give basic items to unit in case it's missing 
	// Admin stuff 
	_items = (items player);
	_mags = magazines player;
	if !("ACE_MapTools" in _items) then {player addItem "ACE_MapTools";};
	if !("acex_intelitems_notepad" in _mags) then {player addItem "acex_intelitems_notepad";};
};

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

//Switch beret to ready when getting inside vehicle
player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	["ready", false] spawn CGQC_fnc_perksBasic;
}];

// Shows intro screen with logo and stuff
[ "CBA_loadingScreenDone", {
	[] spawn CGQC_fnc_showIntro;
} ] call CBA_fnc_addEventHandler;

//Sets radio channel names 
[0] spawn CGQC_fnc_nameRadios;
["radio_init"] execVM "\cgqc\functions\fnc_setRadios.sqf";

// Boost dragging maximum 
ACE_maxWeightDrag = 3000;

// Ace self interaction perks
_perks = [] spawn CGQC_fnc_addPerks; 

// Ace auto self interaction perks
_perks = [] execVM "\cgqc\functions\fnc_addPerksSwitch.sqf"; 

// Zeus shenanigans... MAX - to review
_zeus = [] spawn CGQC_fnc_setZeus; 

// Lower gun 
player action ['SwitchWeapon', player, player, 250];

// Build a random welcome and shows it
_welcome = [] spawn CGQC_fnc_welcome; 

// Training menu if training is on
if (cgqc_flag_isTraining) then {
	execVM "\cgqc\functions\fnc_trainingMenu.sqf";
};


// Load loadouts if known unit  
_unit = typeOf player;
switch (_unit) do {
	// == Training ================================================================
	case "CGQC_Soldat_Base";
	case "CGQC_Officer_Base": {
		[] spawn CGQC_fnc_initTraining;
	};
	// == Command ================================================================
	//case "CGQC_units_mk1_0_HQ":{
	//	["hq", 1, true] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf";
	//};
	// == Infantry ================================================================
	case "CGQC_units_vanilla_rifleman":{
		["vanilla_rifleman", 1, false] execVM "\CGQC\loadouts\mk3_roleSwitch.sqf";
	};
};

cgqc_postInitClient_done = true;