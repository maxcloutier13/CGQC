// --- postInit_client ----------------------------------------------------------
// Start everything player related

// Start with a silent black screen. 
0 fadeSound 0;
titleCut ["", "BLACK FADED", 999];

// Player identification --------------------------------------------------------------------------------------------
//Get some player info
cgqc_player_name = name player;
cgqc_player_steamid = getPlayerUID player;
cgqc_player_steamName = profileNameSteam;
cgqc_perks_basic = true;

//ID player and find patch
_rank = [] spawn CGQC_fnc_findRank;
_patch = [] spawn CGQC_fnc_findPatch;
_beret = [] spawn CGQC_fnc_getRankedBeret;

// Set and keep patch 
_set = [] spawn CGQC_fnc_setPatch;

// Dynamic group -------------------------------------------------------------------------------------------------
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Init arsenal ---------------------------------------------------------------------------------------------------
if(cgqc_player_hasUnsung) then {
	cgqc_unsung_arsenal_1 = [];
	cgqc_unsung_arsenal_8 = [];
	#include "\cgqc\loadouts\unsung\all_items.sqf";
	cgqc_unsung_arsenal_8 = cgqc_unsung_arsenal_all;
	cgqc_unsung_arsenal_init_done = true;
};


// Briefing entry -------------------------------------------------------------------------------------------------
_brief = [] call CGQC_fnc_briefing; 

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

//Switch beret to ready when getting inside vehicle
player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	["ready", false] spawn CGQC_fnc_perksBasic;
}];

// Shows intro screen with logo and stuff
[ "CBA_loadingScreenDone", {
	[] spawn CGQC_fnc_showIntro;
} ] call CBA_fnc_addEventHandler;

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

//Sets radio channel names 
[0] spawn CGQC_fnc_nameRadios;

// Boost dragging maximum 
ACE_maxWeightDrag = 3000;

// Ace self interaction perks
_perks = [] spawn CGQC_fnc_addPerks; 

// Zeus shenanigans... MAX - to review
_zeus = [] spawn CGQC_fnc_setZeus; 

// Lower gun 
player action ['SwitchWeapon', player, player, 250];

// Build a random welcome and shows it
_welcome = [] spawn CGQC_fnc_welcome; 

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
if !("ACE_MapTools" in _items) then {player addItem "ACE_MapTools";};
if !("acex_intelitems_notepad" in _items) then {player addItem "acex_intelitems_notepad";};
cgqc_postInitClient_done = true;