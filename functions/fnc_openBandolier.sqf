#include "\CGQC\script_component.hpp"
// --- openBandolier ----------------------------------------------------------
// Open ammo bandoliers and deal with them

CGQC_int_openBandolier = {
	params ["_type"];
	LOG_1(" [CGQC_int_openBandolier] type:%1 started", _type);
	switch (_type) do {
		case "all": {
			LOG("[CGQC_int_openBandolier] - Grabbing all mags");
			// Check if there's enough space for all magazines
			cgqc_bandolier_primaryMagCount = cgqc_config_ammo_primary;
		};
		case "half": {
			LOG("[CGQC_int_openBandolier] - Grabbing half mags");
			cgqc_bandolier_primaryMagCount = cgqc_config_ammo_primary / 2;
		};
		case "lasthalf": {
			LOG("[CGQC_int_openBandolier] - Grabbing remaining mags");
			cgqc_bandolier_primaryMagCount = cgqc_config_ammo_primary / 2;
		};
	};
	cgqc_bandolier_halfMagCount = floor (cgqc_bandolier_primaryMagCount / 2);
	LOG_1("[CGQC_int_openBandolier] primaryCount:%1 halfcount: %2", cgqc_bandolier_primaryMagCount, cgqc_bandolier_halfMagCount);

	// Get primary weapon
	_primaryWeapon = primaryWeapon ACE_player;

	// Check if player has a primary weapon
	if (_primaryWeapon == "") exitWith {
		hint "You need a primary weapon to use this bandolier!";
		LOG("[fnc_openBandolier] No main gun?. Exit. ");
	};

	// Get compatible magazines for the primary weapon
	_compatibleMags = compatibleMagazines [_primaryWeapon, "this"];

	// Filter OUT grenade launcher magazines by checking magazine classnames
	_riflemags = _compatibleMags select {
		private _magName = toLower _x;
		// ONLY exclude mags with these patterns (grenades)
		!(_magName find "1rnd" >= 0 || _magName find "grenade" >= 0 || _magName find "flare" >= 0 || _magName find "smoke" >= 0)
	};

	// Try to get current mag - but only if it's a rifle mag, not grenade
	_primaryMag = "";
	_currentMags = primaryWeaponMagazine ACE_player;
	{
		if (_x in _riflemags) exitWith {
			_primaryMag = _x;
		};
	} forEach _currentMags;

	// If no rifle mag found in weapon, pick one
	if (_primaryMag == "") then {
		LOG("[CGQC_int_openBandolier] No mag found. Checking inventory");
		// First try to find a mag the player already has in inventory
		_inventoryMags = magazines ACE_player;
		{
			if (_x in _riflemags) exitWith {
				_primaryMag = _x;
			};
		} forEach _inventoryMags;

		// If player doesn't have any, use first from compatible list
		if (_primaryMag == "" && count _riflemags > 0) then {
			LOG("[CGQC_int_openBandolier] No inventory mag found. Using default list");
			_primaryMag = _riflemags select 0;
		};
	};

	// Final check - if still no valid mag found, keep bandolier
	if (_primaryMag == "") exitWith {
		hint "No compatible magazines found for your weapon!";
		LOG("[CGQC_int_openBandolier] No possible mag found. Exit");
	};

	// Check how many mags can actually fit
	_canFitAll = true;
	_testUnit = ACE_player;

	// Test if we can add all magazines
	for "_i" from 1 to cgqc_bandolier_primaryMagCount do {
		if !(_testUnit canAddItemToVest _primaryMag || _testUnit canAddItemToUniform _primaryMag || _testUnit canAddItemToBackpack _primaryMag) then {
			_canFitAll = false;
		};
	};

	// Determine how many to give
	_magsToGive = cgqc_bandolier_primaryMagCount;
	_giveHalfBandolier = false;

	if (!_canFitAll) then {
		LOG("[CGQC_int_openBandolier] Mags don't fit. Getting half");
		_magsToGive = cgqc_bandolier_halfMagCount;
		_giveHalfBandolier = true;
	};

	cgqc_bandolier_text = parseText format [
		"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
		"- Grabbed primary mags: %1<br/>", _magsToGive
	];

	// Give magazines
	["vest", _primaryMag, _magsToGive] call cgqc_fnc_addItemWithOverflow;

	switch (_type) do {
		case "all": {
			// Remove the bandolier
			[ACE_player, "cgqc_bandolier_ammo"] call ace_common_fnc_useItem;
				// If only gave half, give back a half bandolier
			if (_giveHalfBandolier) then {
				["vest", "cgqc_bandolier_ammo_half", 1] call cgqc_fnc_addItemWithOverflow;
				LOG("[CGQC_int_openBandolier] - Not enough space, gave half and returned half bandolier");
				cgqc_bandolier_text = parseText format [
					"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
					"- Not enough space!<br/>" +
					"- Grabbed half primary mags: %1<br/>" +
					"- Returned half bandolier<br/>", _magsToGive
				];
			};
		};
		case "half": {
			// Remove the bandolier
			[ACE_player, "cgqc_bandolier_ammo"] call ace_common_fnc_useItem;
			// Add a half version
			["vest", "cgqc_bandolier_ammo_half", 1] call cgqc_fnc_addItemWithOverflow;
		};
		case "lasthalf": {
			// Remove the half bandolier
			[ACE_player, "cgqc_bandolier_ammo_half"] call ace_common_fnc_useItem;
		};
	};

	player switchMove "";
	[cgqc_bandolier_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;

};

params [["_type", "ammo"]];
LOG_1("[fnc_openBandolier] %1 started", _type);

// find primary mags
// Start animation
if (isNull objectParent player) then {
	LOG("[fnc_openBandolier] - Player not in vehicle -Unpacking animation");
	player playMove "AinvPknlMstpSnonWnonDnon_medic4";
} else {
	LOG("[fnc_openBandolier] - Player in vehicle! Skip animation");
};
_showTxt = false;
cgqc_bandolier_text = "";
cgqc_bandolier_primaryMagCount = 0;
switch (_type) do {
	case "ammo": {
		if !("cgqc_bandolier_ammo" in items player) exitWith{player switchMove "";};
		  // Progress bar
		[10, [], {
			// find primary mags
			_allMags = magazines ACE_player;
			_handgunMag = (handgunMagazine ACE_player) select 0;
			_primaryMags = 0;
			cgqc_bandolier_primaryMagCount = 0;
			_handgunMags = 0;
			_handMagCount = 0;
			_nade = 0;
			_nadeFlash = 0;
			_smoke = 0;
			_nadeCount = 0;
			_nadeFlashCount = 0;
			_smokeCount = 0;
			if !(isNil "_handgunMag") then {
				_handgunMags = {
					_x isEqualTo _handgunMag
				} count _allMags;
			};

			_grenades = ["HandGrenade"] apply {
				toLower _x
			};
			_flash = ["ACE_M84", "tsp_flashbang_cts"] apply {
				toLower _x
			};
			_moke = ["SmokeShell"] apply {
				toLower _x
			};

			if (cgqc_player_has2023) then {
				_grenades = ["rhs_mag_m67", "HandGrenade"] apply {
					toLower _x
				};
				_flash = ["ACE_M84", "tsp_flashbang_cts"] apply {
					toLower _x
				};
				_moke = ["SmokeShell"] apply {
					toLower _x
				};
			};

			_nade = {
				toLower _x in _grenades
			} count _allMags;
			_nadeFlash = {
				toLower _x in _flash
			} count _allMags;
			_smoke = {
				toLower _x in _moke
			} count _allMags;

			["all"] call CGQC_int_openBandolier;

			   // Refill handgun/throwables instead of adding more
			if (cgqc_config_ammo_refill) then {
				LOG("[fnc_openBandolier] Config in Refill mode");
				// Refill handgun
				if !(isNil "_handgunMag") then {
					// hint format ["HandgunMag: %1", _handgunMag];
					_handgunAdd = cgqc_config_ammo_handgun - _handgunMags;
					LOG_2("[fnc_openBandolier] Adding %1/%2 handgun mags", _handgunAdd, _handgunMag);
					["vest", _handgunMag, _handgunAdd] call cgqc_fnc_addItemWithOverflow;
					_handMagCount = _handgunAdd;
				} else {
					hint "No Secondary weapon!";
					LOG("[fnc_openBandolier] No Secondary weapon?");
				};

				// Refill throwables
				_nadeAdd = 0;
				if (_nade < cgqc_config_ammo_nade) then {
					_nadeAdd = cgqc_config_ammo_nade - _nade;
				};
				_smokeAdd = 0;
				if (_smoke < cgqc_config_ammo_smoke) then {
					_smokeAdd = cgqc_config_ammo_smoke - _smoke;
				};
				_flashAdd = 0;
				if (_nadeFlash < cgqc_config_ammo_flash) then {
					_flashAdd = cgqc_config_ammo_flash - _nadeFlash;
				};
				LOG_3("[fnc_openBandolier] Refill %1/%2/%3", _nadeAdd, _smokeAdd, _flashAdd);

				["vest", cgqc_config_ammo_nade_type, _nadeAdd] call cgqc_fnc_addItemWithOverflow;
				_nadeCount = _nadeAdd;

				["vest", cgqc_config_ammo_smoke_type, _smokeAdd] call cgqc_fnc_addItemWithOverflow;
				_smokeCount = _smokeAdd;

				["vest", cgqc_config_ammo_flash_type, _flashAdd] call cgqc_fnc_addItemWithOverflow;
				_nadeFlashCount = _nadeFlashCount +1;
			} else {
				LOG("[fnc_openBandolier] Config in Additional item mode");
				// Add new mags/throwables regardless of current count
				if !(isNil "_handgunMag") then {
					LOG_2("[fnc_openBandolier] Adding %1/%2 handgun mags", cgqc_config_ammo_handgun, _handgunMag);
					// hint format ["HandgunMag: %1", _handgunMag];
					["uniform", _handgunMag, cgqc_config_ammo_handgun] call cgqc_fnc_addItemWithOverflow;
					_handMagCount = cgqc_config_ammo_handgun;
				} else {
					hint "No Secondary weapon!";
					LOG("[fnc_openBandolier] No Secondary weapon?");
				};

				LOG_3("[fnc_openBandolier] AddNades %1/%2/%3", cgqc_config_ammo_nade, cgqc_config_ammo_flash, cgqc_config_ammo_smoke);

				// Refill throwables
				["vest", cgqc_config_ammo_nade_type, cgqc_config_ammo_nade] call cgqc_fnc_addItemWithOverflow;
				_nadeCount = cgqc_config_ammo_nade;

				["vest", cgqc_config_ammo_flash_type, cgqc_config_ammo_flash] call cgqc_fnc_addItemWithOverflow;
				_nadeFlashCount = cgqc_config_ammo_flash;

				["vest", cgqc_config_ammo_smoke_type, cgqc_config_ammo_smoke] call cgqc_fnc_addItemWithOverflow;
				_smokeCount = cgqc_config_ammo_smoke;
			};
			   // Prep Message
			_throwables = "";
			_added = false;
			if (_nadeCount > 0) then {
				_throwables = _throwables + format ["%1 nades", _nadeCount];
				_added = true;
			};
			if (_nadeFlashCount > 0) then {
				_throwables = _throwables + format ["/%1 bangs", _nadeFlashCount];
				_added = true;
			};
			if (_smokeCount > 0) then {
				_throwables = _throwables + format ["/%1 smokes", _smokeCount];
				_added = true;
			};
			if (_added) then {
				_throwables = "Grabbed: " + _throwables;
			};
			cgqc_bandolier_text = parseText format [
				"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
				"- %1 primary mags added<br/>" +
				"- %2 handgun mags refilled<br/>" +
				"%3", cgqc_bandolier_primaryMagCount, _handMagCount, _throwables
			];
			player switchMove "";
			[cgqc_bandolier_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;
		}, {
			hint "Aborted!";
			if (isNull objectParent player) then {
				LOG("[fnc_openBandolier] - Canceled");
				player switchMove "";
			};
		}, "Reloading from Bandolier - "] call ace_common_fnc_progressBar;
	};
	case "all": {
		if !("cgqc_bandolier_ammo" in items player) exitWith{player switchMove "";};
		[10, [], {
			["all"] call CGQC_int_openBandolier;
		}, {
			hint "Aborted!";
			if (isNull objectParent player) then {
				LOG("[fnc_openBandolier] - Canceled");
				player switchMove "";
			};
		}, "Grabbing all the mags - "] call ace_common_fnc_progressBar;
	};
	case "half": {
		if !("cgqc_bandolier_ammo" in items player) exitWith{player switchMove "";};
		[5, [], {
			["half"] call CGQC_int_openBandolier;
		}, {
			hint "Aborted!";
			if (isNull objectParent player) then {
				LOG("[fnc_openBandolier] - Canceled");
				player switchMove "";
			};
		}, "Grabbing half the mags - "] call ace_common_fnc_progressBar;
	};
	case "last_half": {
		if !("cgqc_bandolier_ammo_half" in items player) exitWith{player switchMove "";};
		[5, [], {
			["lasthalf"] call CGQC_int_openBandolier;
		}, {
			hint "Aborted!";
			if (isNull objectParent player) then {
				LOG("[fnc_openBandolier] - Canceled");
				player switchMove "";
			};
		}, "Grabbing mags - "] call ace_common_fnc_progressBar;
	};
	default {
		ERROR("[CGQC_ERROR] openBandolier _type didn't match");
	};
};

LOG("[fnc_openBandolier] done");