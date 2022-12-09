// --- postInit ----------------------------------------------------------
// stuff that runs on both server and clients

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
}] call CBA_fnc_addEventHandler;

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

