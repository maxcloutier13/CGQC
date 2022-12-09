// --- postInit ----------------------------------------------------------
// Start everything player related

_this spawn {
	cgqc_player_rank = 0;
	cgqc_player_known = false;

	// Dynamic groups ------------------------------------------------------------------------------------------------
	// Check if dynamic group is initialized
	dynamic_group_check = ["IsInitialized"] call BIS_fnc_dynamicGroups;
	if (!dynamic_group_check) then {
		["Initialize"] call BIS_fnc_dynamicGroups;
	};

	// Add player to dynamic group 
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

	// Respawn event handlers ----------------------------------------------------------------------------------------
	//Respawn handler 
	player addMPEventHandler ["MPRespawn", {
		params ["_unit", "_corpse"];
		[0, _unit] execVm "\cgqc\factions\player_killed.sqf";
		
	}];

	//Death handler 
	player addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[1, _unit, _killer] execVm "\cgqc\factions\player_killed.sqf";
	}];

	// Shows intro screen with logo and stuff
	[ "CBA_loadingScreenDone", {
		null = execVM "\cgqc\factions\intro.sqf";
	} ] call CBA_fnc_addEventHandler;

	//Maximum mags event handler 
	["ace_arsenal_displayClosed", {
		//hint "Arsenal closed";
		execVm "\cgqc\factions\max_mags.sqf";
	}] call CBA_fnc_addEventHandler;

	//Lock channels by default 
	["init"] execVm "\cgqc\factions\channels_lock.sqf";

	//Sets radio channel names 
	[0] execVm "\cgqc\factions\set_radios.sqf";

	// Boost dragging maximum 
	ACE_maxWeightDrag = 3000;


	// Briefing entry -------------------------------------------------------------------------------------------------
	#include "\cgqc\factions\briefing.sqf"

	// Player identification --------------------------------------------------------------------------------------------
	//ID player
	cgqc_player_name = name player;
	cgqc_player_steamid = getPlayerUID player;
	cgqc_player_rank = 1;


	//Find rank
	#include "\cgqc\factions\find_rank.sqf"
	// Build a random welcome
	#include "\cgqc\factions\welcome.sqf"
	// Assign patch based on name  
	#include "\cgqc\factions\find_patch.sqf"

	// ----- Set and keep patch --------------------------------------------------------------------------------------
	_setPatch = [] spawn CGQC_fnc_setPatch;

	// Fix friendly fire --------------------------------------------------------------------------------------------
	#include "\cgqc\factions\fix_friendlyfire.sqf"

	// Ace self interaction for players
	#include "\cgqc\factions\cgqc_perks.sqf"

	// Zeus shenanigans... MAX - to review
	#include "\cgqc\factions\zeus.sqf"

	// Lower gun 
	player action ['SwitchWeapon', player, player, 100];

	sleep 3;
	// Set default left/right radios
	["radio_sides"] execVM "\cgqc\factions\stuff_player.sqf";

	// Welcome screen avec la patch et le message random
	if (cgqc_setting_show_welcome) then {
		sleep 20;
		[ cgqc_welcome_text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
	};

	// Player init is complete!
	cgqc_player_init = 1;
	sleep 5;
};
