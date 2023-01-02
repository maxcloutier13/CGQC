// --- postInit_client ----------------------------------------------------------
// Start everything player related

// Player identification --------------------------------------------------------------------------------------------
//Get some player info
cgqc_player_name = name player;
cgqc_player_steamid = getPlayerUID player;
cgqc_player_steamName = profileNameSteam;
cgqc_perks_basic = true;

// Check what DLC the player owns 
//cgqc_player_ownedDLCs = getDLCs 1;
//cgqc_player_hasContact = (1021790 in cgqc_player_ownedDLCs);

//ID player and find patch
_rank = [] spawn CGQC_fnc_findRank;
_patch = [] spawn CGQC_fnc_findPatch;

// Set and keep patch 
_set = [] spawn CGQC_fnc_setPatch;


// Dynamic group -------------------------------------------------------------------------------------------------
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Briefing entry -------------------------------------------------------------------------------------------------
_brief = [] call CGQC_fnc_briefing; 

// Event Handers ----------------
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
	["ready"] spawn CGQC_fnc_perksBasic;
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

//Lock channels by default 
["init"] spawn CGQC_fnc_lockChannels;

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

// Set default left/right radios
_radios = ["radio_sides"] execVM "\cgqc\functions\fnc_setRadios.sqf"; 

cgqc_postInitClient_done = true;