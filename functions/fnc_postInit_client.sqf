// --- postInit_client ----------------------------------------------------------
// Start everything player related
diag_log "[CGQC_INIT] === postInit_client started =====================================";

_version = "3.7.2";
// Client-side code
player setVariable ["cgqc_version_core", _version, true]; // Set the client's mod version

if !(cgqc_mission_dro) then {
	// Start with a silent black screen. 
	0 fadeSound 0;
	titleCut ["", "BLACK FADED", 999];

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
_perks = [] execVM "\cgqc\functions\fnc_addPerksSwitch.sqf"; 

// Zeus shenanigans... MAX - to review
_zeus = [] call CGQC_fnc_setZeus; 

// Lower gun 
diag_log "[CGQC_INIT] gun lowered";
player action ['SwitchWeapon', player, player, 250];

diag_log "[CGQC_INIT] checking if intro/welcome should be shown";
if !(cgqc_mission_dro) then {
	diag_log "[CGQC_INIT] showing intro/welcome";
	// Show intro 
	_intro = [] spawn CGQC_fnc_showIntro;
	// Build a random welcome and shows it
	_welcome = [] spawn CGQC_fnc_welcome; 
};

// Training menu if training is on
if (cgqc_flag_isTraining) then {
	diag_log "[CGQC_INIT] cgqc_flag_isTraining is true. Loading training menu";
	call cgqc_fnc_trainingMenu;
};

// Load loadouts if known unit  
_unit = typeOf player;
diag_log format ["[CGQC_INIT] checking %1 unit for loadout", _unit];
[_unit] call CGQC_fnc_checkLoadout;

// All done
cgqc_start_postInitClient_done = true;
diag_log "[CGQC_INIT] === postInit_client done =====================================";