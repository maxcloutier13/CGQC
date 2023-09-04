// --- postInitClient ----------------------------------------------------------
// Start everything player related
diag_log "[CGQC_INIT] === postInitClient started =====================================";

_version = "4.0.1";
player setVariable ["cgqc_version_core", _version, true]; // Set the client's mod version


// Client-side code
diag_log "[CGQC_INIT] checking if intro/welcome should be shown";
if !(cgqc_mission_dro) then {

	diag_log "[CGQC_INIT] showing intro/welcome";
	// Show intro
	_intro = [] spawn CGQC_fnc_showIntro;
	// Build a random welcome and shows it
	_welcome = [] spawn CGQC_fnc_showWelcome;

	diag_log "[CGQC_INIT] loading custom death/respawn";
	//Respawn handler
	player addMPEventHandler ["MPRespawn", {
		params ["_unit", "_corpse"];
		[_unit] call CGQC_fnc_playerRespawned;
	}];

	//Death handler
	player addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[_unit, _killer] call CGQC_fnc_playerKilled;
	}];
} else {
	1 fadeSound 1;
	titleCut ["", "BLACK IN", 1];

	if (userInputDisabled) then {};
};

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
_rank = [] call CGQC_fnc_findRank;
_patch = [] call CGQC_fnc_findPatch;
_beret = [] call CGQC_fnc_getRankedBeret;

// Set and keep patch
_set = [] call CGQC_fnc_setPatch;

// Dynamic group -------------------------------------------------------------------------------------------------
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;


// Briefing entry -------------------------------------------------------------------------------------------------
_brief = [] call CGQC_fnc_loadDiary;

if (cgqc_player_loadAll) then {
	// Init arsenal ---------------------------------------------------------------------------------------------------
	if(cgqc_player_has2023) then {
		cgqc_mk2_arsenal_1 = [];
		cgqc_mk2_arsenal_2 = [];
		cgqc_mk2_arsenal_3 = [];
		cgqc_mk2_arsenal_4 = [];
		cgqc_mk2_arsenal_5 = [];
		cgqc_mk2_arsenal_8 = [];
		// Prep les variables de l'arsenal dynamique
		#include "\cgqc\loadouts\2023\arsenal\init_arsenal.sqf";
		cgqc_2023_arsenal_init_done = true;
	};
	if(cgqc_player_hasUnsung) then {
		cgqc_unsung_arsenal_1 = [];
		cgqc_unsung_arsenal_8 = [];
		#include "\cgqc\loadouts\unsung\all_items.hpp";
		cgqc_unsung_arsenal_8 = cgqc_unsung_arsenal_all;
		cgqc_unsung_arsenal_init_done = true;
	};
	if(cgqc_player_hasIfa3) then {
		cgqc_ifa3_arsenal_1 = [];
		cgqc_ifa3_arsenal_8 = [];
		#include "\cgqc\loadouts\ifa3\all_items.hpp";
		cgqc_ifa3_arsenal_8 = cgqc_ifa3_arsenal_all;
		cgqc_ifa3_arsenal_init_done = true;
	};

	// Event Handers ----------------
	//On map click (_pos, _units,_shift,_alt)
	onMapSingleClick "call CGQC_fnc_mapShareList;false;";

	// Whisper/Yelling event
	cgqc_event_talk = ["acre_startedSpeaking", {
		params ["_unit", "_onRadio", "_radioId", "_speakingType"];
		//If volume is low and player is not talking on radio
		_vol = [] call acre_api_fnc_getSelectableVoiceCurve;
		//hint format ["Speaking %1", _vol];
		if (!_onRadio && _vol < 0.4) then {
			_txt = parseText( "Whispering...");
			[ _txt, 0, 1, 2, 1 ] spawn BIS_fnc_dynamicText;
		};
	}] call CBA_fnc_addEventHandler;

	//Maximum mags event handler
	["ace_arsenal_displayClosed", {
		[] call CGQC_fnc_maxMags;
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
				_return = abs rating _player;
			} else {
				if(_rating + rating _player < 0) then {
					_return = 0;
				};
			};
			_return
		}
	];
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
	["ready", false] call CGQC_fnc_perksBasic;
}];

//Sets radio channel names
[0] call CGQC_fnc_nameRadios;
["defaultLR"] call CGQC_fnc_setRadios;

// Boost dragging maximum
ACE_maxWeightDrag = 3000;

// Ace self interaction perks
_perks = [] call CGQC_fnc_addPerks;

// Ace auto self interaction perks
_perks = [] call CGQC_fnc_addPerksSwitch;

// Lower gun
diag_log "[CGQC_INIT] gun lowered";
[player] call ace_weaponselect_fnc_putWeaponAway;

// Training menu if training is on
if (cgqc_flag_isTraining) then {
	diag_log "[CGQC_INIT] cgqc_flag_isTraining is true. Loading training menu";
	[] call CGQC_fnc_trainingLoadMenu;
};

/*
// Zeus shenanigans... MAX - to review
_zeus = [] call CGQC_fnc_setZeus;

diag_log "[CGQC_INIT] === postInitClient - checkLoadout";
// Load loadouts if known unit
_switch = player getVariable "cgqc_var_skipLoadoutSwitch";
if (isNil "_switch") then {
	diag_log "[CGQC_INIT] postInitClient - Loading custom loadouts";
	[] call CGQC_fnc_checkLoadout;
} else {
	if !(_switch) then {
		diag_log "[CGQC_INIT] postInitClient - Loading custom loadouts";
		[] call CGQC_fnc_checkLoadout;
	};
};*/

// All done
cgqc_start_postInitClient_done = true;
diag_log "[CGQC_INIT] === postInitClient done =====================================";