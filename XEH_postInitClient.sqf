#include "\CGQC\script_component.hpp"
// --- postInitClient ----------------------------------------------------------
// Start everything player related

LOG("[CGQC_PostInitClient] === Started =====================================");

// Start with a silent black screen.
0 fadeSound 0;
0 fadeEnvironment 0;
ace_hearing_disableVolumeUpdate = true;
titleCut ["", "BLACK FADED", 999];

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
	[] spawn {
		1 fadeSound 1;
		sleep 5;
		titleCut ["", "BLACK IN", 1];
	};
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
[] call CGQC_fnc_findRank;
[] call CGQC_fnc_findPatch;
[] call CGQC_fnc_getRankedBeret;
[] call CGQC_fnc_setPatch;

// Dynamic group -------------------------------------------------------------------------------------------------
// ['InitializePlayer', [player]] call BIS_fnc_dynamicGroups;
cgqc_player_group = group player;
cgqc_player_groupID = groupId player;

// Briefing entry -------------------------------------------------------------------------------------------------
_brief = [] spawn CGQC_fnc_loadDiary;

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
	onMapSingleClick "call CGQC_fnc_mapShareList;false;";

	// Maximum mags event handler
	["ace_arsenal_displayClosed", {
		[] call CGQC_fnc_maxMags;
		[player, true] call ace_arsenal_fnc_removeBox;
		// Save player loadout
		[player, "save", "single", "auto"] spawn CGQC_fnc_snapshot;
	}] call CBA_fnc_addEventHandler;

	// Event if the player activates zeus through ACE interaction
	["ace_zeus_zeusCreated", {
		LOG("[ace_zeus_zeusCreated] Player became Zeus trough ACE");
		_curator = getAssignedCuratorLogic player;
		if (!isNil "_curator") then {
			LOG("[ace_zeus_zeusCreated] Adding Perks");
			["zeus"] spawn CGQC_fnc_addPerksSpecial;
			// Zeus controlling unit event
			[_curator, "curatorObjectRemoteControlled", {
				params ["_curator", "_player", "_unit", "_isRemoteControlled"];
				if (_isRemoteControlled) then {
					// Check if unit has radios
					if (cgqc_config_zeusRadios) then {
						LOG("[ace_zeus_zeusCreated] Adding Zeus radios");
						["zeus_radios", 0, _unit] spawn CGQC_fnc_perksZeus;
						hint "Zeus radios set";
					};
				};
				// _isRemoteControlled is true when entering remote control, false when exiting
			}] call BIS_fnc_addScriptedEventHandler;
		};
	}] call CBA_fnc_addEventHandler;
};

["ace_treatmentStarted", {
	params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];
	// Notify the victim of treatment
	["CGQC_event_receivingTreatment", [_medic, _patient, _classname, _bodyPart], _patient] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

["CGQC_event_receivingTreatment", {
	params ["_medic", "_patient", "_treatment", "_bodyPart"];
	LOG_4("[medical_receivingTreatment] - Med:%1/Patient:%2/Treat:%3/Part:%4", _medic, _patient, _treatment, _bodyPart);
	// Skip if patient is player, dead or corpse
	if (player == _medic || !(alive player) || player != _patient) exitWith {
		LOG("[medical_receivingTreatment] - Skipping");
	};
	// Check counciousness
	if (player getVariable ["ACE_isUnconscious", false]) then {
		LOG("[medical_receivingTreatment] - Victim unconcious. Vague message.");
		// Passed out, so can't tell details
		_name = "Someone";
		_text = format ["<br/><br/><br/><br/><br/><br/><br/><t size='2'>%1 is helping you</t>", _name];
		cutText [_text,"PLAIN", 2.5, false, true];
	};
	/* else{ // If councious, give details about what is happening
		_msg = [_treatment, _bodyPart] call CGQC_int_medical_treatmentMsg;
		cutText [format ["%1 %2", _name, _msg],"PLAIN DOWN", 2.5];
	};*/
}] call CBA_fnc_addEventHandler;

["CGQC_event_152PickedUp", {
	params ["_unit", "_container", "_item"];
	LOG_2("[152PickedUp] - Unit:%1/Container:%2", _unit, _container);
	// Check if player is admin or max
	if (serverCommandAvailable "#kick" || cgqc_player_max) then {
		_name = name _unit;
		_text = format ["<br/><br/><br/><br/><br/><br/><br/><t size='3'>%1 picked up 152!</t>", _name];
		cutText [_text,"PLAIN", 2.5, false, true];
	};
}] call CBA_fnc_addEventHandler;

["cgqc_event_skiptime", {
	params ["_year", "_month", "_day", "_hour", "_min"];
	LOG("[cgqc_event_skiptime] - Started");
	setDate [y_year, y_month, y_day, y_hour, y_min]
}] call CBA_fnc_addEventHandler;

// Player picks up something event
take_152 = player addEventHandler [	"Take", {
	params ["_unit", "_container", "_item"];
	if (_item isEqualTo "ACRE_PRC152") then {
		_txt = " picked up a 152 ;o)";
		[_unit, _txt] remoteExec ["globalChat",0];
		["CGQC_event_152PickedUp", [_unit, _container, _item]] call CBA_fnc_globalEvent;
	};
}];

// Save default volume
player setVariable ["cgqc_player_wakeup_volume", [] call acre_api_fnc_getGlobalVolume, true];

// Play global sound
["cgqc_event_playSound", {
    params ["_source", "_sound", "_range"];
    _source say3D [_sound, _range];
}] call CBA_fnc_addEventHandler;



cgqc_int_wakeup = {
	sleep 1;
	hint "Waking up";
	// Toggle UI
	["show"] spawn CGQC_fnc_toggleUI;
	// set volume back
	_vol = player getVariable "cgqc_player_wakeup_volume";
	[_vol] call acre_api_fnc_setGlobalVolume;
	// Turning radios back on
	_radioIdList = call acre_api_fnc_getCurrentRadioList;
	{
		_radioId = _x;
		[_radioId,0.8] call acre_sys_radio_fnc_setRadioVolume;
	} forEach _radioIdList;
};

// Unconcious event
["ace_unconscious", {
	params ["_unit", "_isUnconscious"];
	LOG_2("[Unconscious] - %1 is down? %2", name _unit, _isUnconscious);
	// Not Unconscious? Get out
	if (!_isUnconscious) exitWith {
		LOG("[Unconscious] - Not Unconscious. Getting out");
	};
	// Not a player? Get out
	_unitIsPlayer = hasInterface && {_unit == ace_player};
	if !(_unitIsPlayer) exitWith {
		LOG("[Unconscious] - Not a player. Getting out");
	};
	// If not local? Get out
	if !(local _unit) exitWith {
		LOG("[Unconscious] - Not Local. Getting out");
	};

	// All good. Falling asleep
	LOG("[Unconscious] - All good. Proceeding.");
	[] call CGQC_fnc_setTeamColorReload;
	["hide"] spawn CGQC_fnc_toggleUI;
	playSound3D [selectRandom cgqc_unconscious_sounds, _unit, false, getPosASL _unit, 2, 1, 30];
	_unit setVariable ["cgqc_player_wakeup_volume", [] call acre_api_fnc_getGlobalVolume, true];
	// Lower direct comms volume
	[0.2] call acre_api_fnc_setGlobalVolume;
	// Turning off radios temporaritly
	_radioIdList = call acre_api_fnc_getCurrentRadioList;
	{
		_radioId = _x;
		[_radioId,0] call acre_sys_radio_fnc_setRadioVolume;
	} forEach _radioIdList;
	LOG("[Unconscious] - Lowered volume");
	[] spawn {
		// Wait until dead or waking up
		waitUntil {!(player getVariable ["ACE_isUnconscious", false])};
		// Not asleep anymore, waking up
		[] spawn cgqc_int_wakeup;
	};
}] call CBA_fnc_addEventHandler;


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
	//LOG_4("[startedSpeaking] %1/%2/%3/%4 started", _unit, _onRadio, _radioId, _speakingType);

	// Volume is low: notify the player he is whispering
	if (!_onRadio) then {
		_txt = "";
		//LOG_1("[startedSpeaking] checking vol %1", _vol);
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
_perks = [] spawn CGQC_fnc_addPerks;
if (cgqc_player_max) then {
	// Cloutier perks
	["max", false] spawn CGQC_fnc_switchPerks;
};

// Ace auto self interaction perks
_perks = [] call CGQC_fnc_addPerksSwitch;

// Lower gun
LOG("[CGQC_INIT] gun lowered");
[player] call ace_weaponselect_fnc_putWeaponAway;

// Training menu if training is on
if (cgqc_flag_isTraining) then {
	if (cgqc_player_isVietnam) then {
		LOG("[CGQC_INIT] cgqc_flag_isTraining is true. Nam is true. Loading training menu");
		["nam"] spawn CGQC_fnc_trainingLoadMenu;
	} else {
		LOG("[CGQC_INIT] cgqc_flag_isTraining is true. Loading training menu");
		[] spawn CGQC_fnc_trainingLoadMenu;
	};

};

CGQC_int_setZeusRadios = {
	cgqc_current_unit = [] call CBA_fnc_currentUnit;
	_done = cgqc_current_unit getVariable ["cgqc_zeus_radios_set", false];
	if !(_done) then {
		// Switch backpack if needed
		if !(cgqc_current_unit canAdd ["ACRE_PRC152", 3]) then {
			["backpack", "cgqc_pack_mk1_magic_zeus"] call CGQC_fnc_switchStuff;
		};
		["zeus"] call CGQC_fnc_getRadioPresets;
		//[] call CGQC_int_setZeusRadios;
		cgqc_current_unit setVariable ["cgqc_zeus_radios_set", true, true];
		[["Zeus radio added", 1.5], false] call CBA_fnc_notify;
	};
};

player setVariable ["cgqc_player_original_unit", true];
// Event when control is switch to another unit
_id = ["unit", {
	[] spawn {
		_original_unit = player getVariable ["cgqc_player_original_unit", false];
		if (cgqc_config_zeusRadios && !_original_unit) then {
			sleep 1;
			[] call CGQC_int_setZeusRadios;
		};
	};
}] call CBA_fnc_addPlayerEventHandler;



// Zeus shenanigans... max - to review
//_zeus = [] spawn CGQC_fnc_setZeus;

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
if (_checkColor isNotEqualTo "MAIN" && _checkColor isNotEqualTo "") then {
	[_checkColor] call CGQC_fnc_setTeamColor;
};

_checkPerks = player getVariable ['cgqc_var_startingPerks', ""];
if (_checkPerks isNotEqualTo "") then {
	[_checkPerks, true, true] spawn CGQC_fnc_switchPerks;
};

// set back custom patch
[] call CGQC_fnc_setPatch;

// Custom items from settings: Smokes
[] spawn {
	waitUntil {sleep 1;CGQC_playerLoaded};
	if (cgqc_config_cigs) then {
		if !([player, "murshun_cigs_lighter"] call ace_common_fnc_hasItem) then {player addItem "murshun_cigs_lighter";};
		if !([player, "murshun_cigs_cigpack"] call ace_common_fnc_hasItem) then {player addItem "murshun_cigs_cigpack";};
	};
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
LOG("[CGQC_PostInitClient] - Starting color fix");
[] spawn {
	while { true } do {
		sleep cgqc_config_fix_colorFix_timer;
		if (cgqc_config_fix_colorFix) then {
			[] call CGQC_fnc_setTeamColorReload;
		}
	};
};

LOG("[CGQC_PostInitClient] - loading showObjectName");
// Display name function
[{
	[] call CGQC_fnc_showObjectName;
}, 1] call CBA_fnc_addPerframeHandler;

if (!cgqc_flag_isTraining) then {
	LOG("[CGQC_PostInitClient] - Not training. Setting up radios");
	[] call CGQC_fnc_setGroupRadios;
};

LOG("[CGQC_PostInitClient] - Stop time showing without watch");
// Player need a watch for the time to show on the map screen
player addEventHandler ["Put", {
if (_this select 2 == "ItemWatch") then {
	findDisplay 12 displayCtrl 101 ctrlShow (
		if (_this select 2 in assignedItems player) then [
			{true},
			{false}
		]
	)
}
}];
player addEventHandler ["Take", {
	if (_this select 2 == "ItemWatch") then {
		findDisplay 12 displayCtrl 101 ctrlShow (
			if (_this select 2 in assignedItems player) then [
				{true},
				{false}
			]
		)
	}
}];

// All done
cgqc_start_postInitClient_done = true;

sleep 5;
// Init the map centering function
LOG("[CGQC_PostInitClient] - Load center map setting");
["initial"] call CGQC_fnc_centerMap;

// If zeus, setup radios
LOG("[CGQC_postInitClient] Check if starting as zeus");
if ([player] call CGQC_fnc_checkZeus) then {
	LOG("[CGQC_postInitClient] Yes: Adding Zeus Perks");
	["zeus", false] spawn CGQC_fnc_switchPerks;
	// Zeus controlling unit event
	[_curator, "curatorObjectRemoteControlled", {
		params ["_curator", "_player", "_unit", "_isRemoteControlled"];
		if (_isRemoteControlled) then {
			LOG("[ZeusRemoteControl] Player controls new unit");
			// Check if unit has radios
			if (cgqc_config_zeusRadios) then {
				LOG("[ZeusRemoteControl] Set Zeusradio to new unit");
				["zeus_radios", 0, _unit] spawn CGQC_fnc_perksZeus;
				hint "Zeus radios set";
			};
		};
		// _isRemoteControlled is true when entering remote control, false when exiting
	}] call BIS_fnc_addScriptedEventHandler;

	if (cgqc_config_zeusRadios) then {
		LOG("[CGQC_PostInitClient] Player is Zeus-> Setting up Zeus Radios");
		[] call CGQC_int_setZeusRadios;
	};
};

// Player marker event
_map = (findDisplay 12 displayCtrl 51);
cgqc_map_playerPosition = _map ctrlAddEventHandler ["Draw", {
	// Player marker
	_itemsToCheck = ['ItemGPS', 'ItemAndroid', 'ACE_microDAGR', 'B_UavTerminal', 'O_UavTerminal', 'I_UavTerminal', 'C_UavTerminal', 'I_E_UavTerminal'];
	_hasGPS = false;
	{
		if (_x in assignedItems player) exitWith {
			_hasGPS = true;
		};
	} forEach _itemsToCheck;
	if (_hasGPS) then {
		//LOG("PlayerPosition: Player has GPS. Showing icon");
		// Show marker on player position
		_vicShowingAlready = vehicle player getVariable ["show_marker", false];
		if !(_vicShowingAlready) then {
			_this#0 drawIcon
			[
				"iconMan", [0,0.3,0.6,1], getPosASLVisual player, 24, 24, getDirVisual player, "", 1, 0.03, "TahomaB", "right"
			];
		};
	};
}];



sleep 25;
LOG("[CGQC_PostInitClient] - Checking for snapshots");
// Check if a snapshot exists
_snapshotFound = false;
_snapTxt = "";
_snapIntro = ["Saved loadout exists!", 1.5, [0.161, 0.502, 0.725, 1]];
if (MissionProfileNamespace getVariable "cgqc_player_snapshot_done") then {
	LOG("[CGQC_PostInitClient] - Manual snapshot exists");
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
	LOG("[CGQC_PostInitClient] - Auto snapshot exists");
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
	LOG("[CGQC_PostInitClient] - Start snapshot exists");
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
	LOG("[CGQC_PostInitClient] - Zeus snapshot exists");
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