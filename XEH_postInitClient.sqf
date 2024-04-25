#include "script_component.hpp"
// --- postInitClient ----------------------------------------------------------
// Start everything player related

[] spawn {
	LOG("[CGQC_PostInitClient] === Started =====================================");
	// set side
	cgqc_player_side = side player;

	// set version variable
	player setVariable ["cgqc_version_core", core_version, true]; // Set the client's mod version
	// get server versio
	_checkVersion = missionNamespace getVariable ["cgqc_version_server_core", "ERROR"];

	_name = name player;
	if (core_version isNotEqualTo _checkVersion) then {
		_msg = format ["Player %1 connected - CoreCheck %2/%3", _name, core_version, _checkVersion];
		[_msg] remoteExec ["systemChat", 0];
		LOG_1("[CGQC_INIT] === Wrong Version!", _msg);
		// Popup if version mismatch
		_msg = format ["Mod version mismatch! <br/> -- Tes mods:%1<br/> -Serveur:%2 <br/> Ferme le jeux pis sync Swifty <br/>ALWAYS Sync ton swifty avant de partir le jeux!", core_version, _checkVersion];
		private _result = [_msg, "Confirm", true, true] call BIS_fnc_guiMessage;
		if (_result) then {
			hint "Sérieux... reboot!";
		};
	} else {
		hint "Mods up to date. Good job.";
		LOG("Mods up to date");
	};

	/*
	// set language and radio channels
		["side"] call CGQC_fnc_setACRE;

	// Reset radios in case.
		_radios = call acre_api_fnc_getCurrentRadioList;
		{
			player unassignItem _x;
			player removeItem _x;
		} forEach _radios;

		waitUntil {
			sleep 0.5; cgqc_player_acre_setup;
		};
		waitUntil {
			sleep 0.5; cgqc_player_radio_names;
		};
	*/

	// Client-side code
	LOG("Checking if intro/welcome should be shown");
	if !(cgqc_mission_dro) then {
		LOG("[CGQC_INIT] showing intro/welcome");
		// Show intro
		_intro = [] spawn CGQC_fnc_showIntro;
		// Build a random welcome and shows it
		_welcome = [] spawn CGQC_fnc_showWelcome;

		LOG("[CGQC_INIT] loading custom death/respawn");
		// Respawn handler
		player addMPEventHandler ["MPRespawn", {
			params ["_unit", "_corpse"];
			[_unit, _corpse] call CGQC_fnc_playerRespawned;
		}];

		// Death handler
		player addMPEventHandler ["MPKilled", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			[_unit, _killer, _instigator, _useEffects] call CGQC_fnc_playerKilled;
		}];
	} else {
		1 fadeSound 1;
		titleCut ["", "BLACK IN", 1];
	};

	// player identification --------------------------------------------------------------------------------------------
	// get some player info
	cgqc_player_name = name player;
	cgqc_player_steamid = getPlayerUID player;
	cgqc_player_steamName = profileNameSteam;
	cgqc_perks_basic = true;
	cgqc_player_face = face player;

	// Check if dayTime
	[] call CGQC_fnc_isDaytime;

	// ID player and find patch
	_rank = [] call CGQC_fnc_findRank;
	_patch = [] call CGQC_fnc_findPatch;
	_beret = [] call CGQC_fnc_getRankedBeret;

	// set and keep patch
	_set = [] call CGQC_fnc_setPatch;

	// Dynamic group -------------------------------------------------------------------------------------------------
	// ['InitializePlayer', [player]] call BIS_fnc_dynamicGroups;
	cgqc_player_group = group player;
	cgqc_player_groupID = groupId player;

	// Briefing entry -------------------------------------------------------------------------------------------------
	_brief = [] call CGQC_fnc_loadDiary;

	if (cgqc_player_loadAll) then {
		// Init arsenal ---------------------------------------------------------------------------------------------------
		if (cgqc_player_has2023) then {
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
		if (cgqc_player_hasUnsung) then {
			cgqc_unsung_arsenal_1 = [];
			cgqc_unsung_arsenal_8 = [];
			#include "\cgqc\loadouts\unsung\all_items.hpp";
			cgqc_unsung_arsenal_8 = cgqc_unsung_arsenal_all;
			cgqc_unsung_arsenal_init_done = true;
		};
		if (cgqc_player_hasIfa3) then {
			cgqc_ifa3_arsenal_1 = [];
			cgqc_ifa3_arsenal_8 = [];
			#include "\cgqc\loadouts\ifa3\all_items.hpp";
			cgqc_ifa3_arsenal_8 = cgqc_ifa3_arsenal_all;
			cgqc_ifa3_arsenal_init_done = true;
		};
		if (cgqc_player_hasNorthern) then {
			cgqc_northern_arsenal_1 = [];
			cgqc_northern_arsenal_8 = [];
			#include "\cgqc\loadouts\northern\all_items.hpp";
			cgqc_northern_arsenal_8 = cgqc_northern_arsenal_all;
			cgqc_northern_arsenal_init_done = true;
		};

		// Event Handers -----------------------------------------------------------------------
		// On map click (_pos, _units, _shift, _alt)
		onMapSingleClick "call CGQC_fnc_mapShareList;
		false;
		";

		// Maximum mags event handler
		["ace_arsenal_displayClosed", {
			[] call CGQC_fnc_maxMags;
			[player, true] call ace_arsenal_fnc_removeBox;
			// Save player loadout
			[player, "save", "single", "auto"] spawn CGQC_fnc_snapshot;
		}] call CBA_fnc_addEventHandler;

		// Unconcious event
		["ace_unconscious", {
			params ["_unit", "_isUnconscious"];
			if (isPlayer _unit) then {
				[] call setTeamColorReload;
				/*
				if (_isUnconscious) then {
					playSound3D [selectRandom cgqc_unconscious_sounds, _unit, false, getPosASL _unit, 2, 1, 30];
					_unit setVariable ["cgqc_player_wakeup_volume", [] call acre_api_fnc_getGlobalVolume, true];
					[0.2] call acre_api_fnc_setGlobalVolume;
					LOG("[CGQC_FNC] Unconscious - Lowered volume");
				} else {
					// set volume back
					_vol = _unit getVariable "cgqc_player_wakeup_volume";
					[_vol] call acre_api_fnc_setGlobalVolume;
					LOG("[CGQC_FNC] Unconscious - Volume restored");
				};*/
			};
		}] call CBA_fnc_addEventHandler;
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

	// switch beret to ready when getting inside vehicle
	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		["ready", false] call CGQC_fnc_perksBasic;
	}];

	// Friendly fire fix - Prevent AI from shooting back
	player addEventHandler [ "HandleRating", {
		params["_player", "_rating"];
		_return = _rating;
		if (rating _player < 0) then {
			_return = abs rating _player;
		} else {
			if (_rating + rating _player < 0) then {
				_return = 0;
			};
		};
		_return
	}
	];

	// Whisper/Yelling event
	cgqc_event_talk = ["acre_startedSpeaking", {
		params ["_unit", "_onRadio", "_radioId", "_speakingType"];
		// if volume is low and player is not talking on radio
		_vol = [] call acre_api_fnc_getSelectableVoiceCurve;
		LOG_4("[CGQC_FNC] startedSpeaking %1/%2/%3/%4 started", _unit, _onRadio, _radioId, _speakingType);

		// Volume is low: notify the player he is whispering
		if (!_onRadio) then {
			_txt = "";
			LOG_1("[CGQC_FNC] startedSpeaking checking vol %1", _vol);
			if (_vol < 0.3) then {
				_txt = parseText("<t color='#006400'>Whispering</t>");
			} else {
				if (_vol < 0.5) then {
					_txt = parseText("<t color='#4169e1'>Talking</t>");
				};
			};
			if (_vol isEqualTo 0.7) then {
				_txt = parseText("<t color='#4169e1'>Speaking Loud</t>");
			};
			if (_vol isEqualTo 1.0) then {
				_txt = parseText("<t color='#ff8c00'>Shouting</t>");
			};
			if (_vol isEqualTo 1.3) then {
				_txt = parseText("<t color='#b10000'>Yelling</t>");
			};
			if (_txt isNotEqualTo "") then {
				[ _txt, 0, 1.15, 1, 0.8 ] spawn BIS_fnc_dynamicText;
			};
		};
	}] call CBA_fnc_addEventHandler;

	// Team switched
	addMissionEventHandler ["TeamSwitch", {
		params ["_previousUnit", "_newUnit"];
		_text = ("<br/>" + "<br/>" + "<br/>" +"<t size='1' >TEAMSWITCHED!</t><br/>");
		[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
		// Reset patch
		[] call CGQC_fnc_setPatch;
	}];

	// Boost dragging maximum
	ACE_maxWeightDrag = 5000;
	ACE_maxWeightCarry = 2000;

	// Ace self interaction perks
	_perks = [] call CGQC_fnc_addPerks;
	if (cgqc_player_max) then {
		// Cloutier perks
		["max", false] call CGQC_fnc_switchPerks;
	};

	// Ace auto self interaction perks
	_perks = [] call CGQC_fnc_addPerksSwitch;

	// Lower gun
	LOG("[CGQC_INIT] gun lowered");
	[player] call ace_weaponselect_fnc_putWeaponAway;

	// Training menu if training is on
	if (cgqc_flag_isTraining) then {
		LOG("[CGQC_INIT] cgqc_flag_isTraining is true. Loading training menu");
		[] call CGQC_fnc_trainingLoadMenu;
	};

	// Zeus shenanigans... max - to review
	_zeus = [] spawn CGQC_fnc_setZeus;

	// Check if unit has an auto-switch loadout
	[] call CGQC_fnc_checkLoadout;

	// RHS fix to remove chatter
	profileNamespace setVariable ['rhs_vehicleRadioChatter', 0];

	[] spawn {
		// switch map to topo by default
		waitUntil {
			!isNull (findDisplay 12)
		};
		private _map = findDisplay 12;
		ctrlActivate (_map displayCtrl 107); // Toggle map textures off
	};

	// Create/join initial group
	// [groupId (group player)] spawn CGQC_fnc_joinGroup;
	sleep 1;
	_checkColor = player getVariable ["cgqc_var_startingColorTeam", "MAIN"];
	if (_checkColor isNotEqualTo "MAIN") then {
		[_checkColor] call CGQC_fnc_setTeamColor;
	};
	// set back custom patch
	[] call CGQC_fnc_setPatch;
	if (!cgqc_flag_isTraining) then {
		[] call CGQC_fnc_setGroupRadios;
	};
	// set default voice volume
	[player, "talk"] call CGQC_fnc_setVoiceVolume;
	// Save initial volume
	cgqc_acre_previousVolume = [] call acre_api_fnc_getSelectableVoiceCurve;

	// Setup default groups colors
	["HQ", [1.0, 0.38, 0, 1], [1.0, 0.38, 0, 0.7]] call ace_map_gestures_fnc_addGroupColorMapping; // Purple
	["Spartan-1", [1.0, 0.5, 0.5, 1], [1.0, 0.5, 0.5, 0.7]] call ace_map_gestures_fnc_addGroupColorMapping;
	["Spartan-2", [0.5, 0.5, 1.0, 1], [0.5, 0.5, 1.0, 0.7]] call ace_map_gestures_fnc_addGroupColorMapping;
	["Spartan-3", [0.5, 1.0, 0.5, 1], [0.5, 1.0, 0.5, 0.7]] call ace_map_gestures_fnc_addGroupColorMapping;

	// Pause the AI if the config says so
	if (cgqc_config_state_pause) then {
		[0, {
			["pause", 0, ""] spawn CGQC_fnc_perksZeus
		}] call CBA_fnc_globalExecute;
		hint "AI Paused!";
	};

	// Fix for dropped teamcolors
	[] spawn {
		while { true } do {
			sleep cgqc_config_fix_colorFix_timer;
			if (cgqc_config_fix_colorFix) then {
				[] call CGQC_fnc_setTeamColorReload;
			}
		};
	};

	// Show current phase initially
	[] spawn {
		waitUntil {
			sleep 1, cgqc_intro_done
		};
		_phase = missionNamespace getVariable "CGQC_gamestate_current";
		_phaseName = "";
		_phaseTxt = "";
		switch (_phase) do {
			case "training": {
				_phaseName = "Training";
				_phaseTxt = "Have fun!";
			};
			case "staging": {
				_phaseName = "Staging";
				_phaseTxt = "Get ready!";
			};
			case "mission": {
				_phaseName = "Mission";
				_phaseTxt = "Here we go!";
			};
		};
		sleep 5;
		[
			[
				[_phaseName, "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
				["", "<br/>"], // line break
				[_phaseTxt, "align = 'center' shadow = '1' size = '1.0'"]
			]
		] spawn BIS_fnc_typeText2;
	};

	// Display name function
	[{
		[] call CGQC_fnc_showObjectName
	}, 1] call CBA_fnc_addPerframeHandler;

	// All done
	cgqc_start_postInitClient_done = true;

	sleep 30;
	// Check if a snapshot exists
	_snapshotFound = false;
	_snapTxt = "";
	_snapIntro = ["Saved loadout exists!", 1.5, [0.161, 0.502, 0.725, 1]];
	if (MissionProfileNamespace getVariable "cgqc_player_snapshot_done") then {
		_snapshotFound = true;
		cgqc_snapshot_check = MissionProfileNamespace getVariable "cgqc_player_snapshot";
		_time = cgqc_snapshot_check select 1;
		_team = cgqc_snapshot_check select 2;
		_color = cgqc_snapshot_check select 3;
		_role = cgqc_snapshot_check select 4;
		_txt = format ["<br/>-Manual: %1/%2/%3 @ %4", _role, _team, _color, _time];
		_snapTxt = _snapTxt + _txt;
	};
	if (MissionProfileNamespace getVariable "cgqc_player_snapshot_auto_done") then {
		_snapshotFound = true;
		cgqc_snapshot_check_auto = MissionProfileNamespace getVariable "cgqc_player_snapshot_auto";
		_time = cgqc_snapshot_check_auto select 1;
		_team = cgqc_snapshot_check_auto select 2;
		_color = cgqc_snapshot_check_auto select 3;
		_role = cgqc_snapshot_check_auto select 4;
		_txt = format ["<br/>-Auto: %1/%2/%3 @ %4", _role, _team, _color, _time];
		_snapTxt = _snapTxt + _txt;
	};
	if (MissionProfileNamespace getVariable "cgqc_player_snapshot_start_done") then {
		_snapshotFound = true;
		cgqc_snapshot_check_start = MissionProfileNamespace getVariable "cgqc_player_snapshot_start";
		_time = cgqc_snapshot_check_start select 1;
		_team = cgqc_snapshot_check_start select 2;
		_color = cgqc_snapshot_check_start select 3;
		_role = cgqc_snapshot_check_start select 4;
		_txt = format ["<br/>-Start: %1/%2/%3 @ %4", _role, _team, _color, _time];
		_snapTxt = _snapTxt + _txt;
	};
	if (MissionProfileNamespace getVariable "cgqc_player_snapshot_zeus_done") then {
		_snapshotFound = true;
		cgqc_snapshot_check_zeus = MissionProfileNamespace getVariable "cgqc_player_snapshot_zeus";
		_time = cgqc_snapshot_check_zeus select 1;
		_team = cgqc_snapshot_check_zeus select 2;
		_color = cgqc_snapshot_check_zeus select 3;
		_role = cgqc_snapshot_check_zeus select 4;
		_txt = format ["<br/>-Zeus: %1/%2/%3 @ %4", _role, _team, _color, _time];
		_snapTxt = _snapTxt + _txt;
	};

	if (_snapshotFound) then {
		[_snapIntro, [_snapTxt], ["--- Check Arsenal to Load ---", 1.1], false] call CBA_fnc_notify;
	};

	LOG("[CGQC_PostInitClient] === Done =====================================");
};