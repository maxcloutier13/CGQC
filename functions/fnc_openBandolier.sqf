#include "\CGQC\script_component.hpp"
// --- openBandolier ----------------------------------------------------------
// Open ammo bandoliers and deal with them
params [["_type", "ammo"]];
LOG_1(" openBandolier %1 started", _type);

// find primary mags
// Start animation
if (isNull objectParent player) then {
	LOG(" openBandolier - Player not in vehicle - animation");
	player playMove "AinvPknlMstpSnonWnonDnon_medic4";
} else {
	LOG(" openBandolier - Player in vehicle! Skip animation");
};
_showTxt = false;
_text = "";
_primaryMagCount = 0;
switch (_type) do {
	case "ammo": {
		if !("cgqc_bandolier_ammo" in items player) exitWith{};
		  // Progress bar
		[10, [], {
			[ACE_player, "cgqc_bandolier_ammo"] call ace_common_fnc_useItem;
			   // find primary mags
			_primaryMag = (primaryWeaponMagazine ACE_player) select 0;
			_allMags = magazines ACE_player;
			_handgunMag = (handgunMagazine ACE_player) select 0;
			_primaryMags = 0;
			_primaryMagCount = 0;
			_handgunMags = 0;
			_handMagCount = 0;
			_nade = 0;
			_nadeFlash = 0;
			_smoke = 0;
			_nadeCount = 0;
			_nadeFlashCount = 0;
			_smokeCount = 0;
			if !(isNil "_primaryMag") then {
				_primaryMags = {
					_x isEqualTo _primaryMag
				} count _allMags;
			};
			if !(isNil "_handgunMag") then {
				_handgunMags = {
					_x isEqualTo _handgunMag
				} count _allMags;
			};

			_grenades = ["HandGrenade"] apply {
				toLower _x
			};
			_flash = ["ACE_M84", "ACE_CTS9"] apply {
				toLower _x
			};
			_moke = ["SmokeShell"] apply {
				toLower _x
			};

			if (cgqc_player_has2023) then {
				_grenades = ["rhs_mag_m67", "HandGrenade"] apply {
					toLower _x
				};
				_flash = ["ACE_M84", "ACE_CTS9"] apply {
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

			   // Add primary mags
			if !(isNil "_primaryMag") then {
				// hint format ["Mag: %1", _primaryMag];

				// Extract the magazine size from the class name
				_magSize = getNumber(configFile >> "CfgMagazines" >> _primaryMag >> "count");
				LOG_2(" openBandolier Mag:%1/Size:%2", _primaryMag, _magSize);
				// Compare the magazine size
				_addMags = cgqc_config_ammo_primary;
				switch (true) do {
					case (_magSize < 20): {_addMags = _addMags * 1.6};
					case (_magSize == 20): {_addMags = _addMags * 1.5};
					case (_magSize > 30): {_addMags = _addMags * 0.6};
				};
				LOG_1(" openBandolier Adding %1 primary mags", _addMags);
				["vest", _primaryMag, _addMags] call cgqc_fnc_addItemWithOverflow;
				_primaryMagCount = _addMags;
			} else {
				hint "No primary weapon!";
				LOG(" openBandolier No primary weapon?");
			};

			   // Refill handgun/throwables instead of adding more
			if (cgqc_config_ammo_refill) then {
				LOG(" openBandolier Config in Refill mode");
				// Refill handgun
				if !(isNil "_handgunMag") then {
					// hint format ["HandgunMag: %1", _handgunMag];
					_handgunAdd = cgqc_config_sidearm_mag_nbr - _handgunMags;
					LOG_2(" openBandolier Adding %1/%2 handgun mags", _handgunAdd, _handgunMag);
					["vest", _handgunMag, _handgunAdd] call cgqc_fnc_addItemWithOverflow;
					_handMagCount = _handgunAdd;
				} else {
					hint "No Secondary weapon!";
					LOG(" openBandolier No Secondary weapon?");
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
				LOG_3(" openBandolier Refill %1/%2/%3", _nadeAdd, _smokeAdd, _flashAdd);

				["vest", cgqc_config_ammo_nade_type, _nadeAdd] call cgqc_fnc_addItemWithOverflow;
				_nadeCount = _nadeAdd;

				["vest", cgqc_config_ammo_smoke_type, _smokeAdd] call cgqc_fnc_addItemWithOverflow;
				_smokeCount = _smokeAdd;

				["vest", cgqc_config_ammo_flash_type, _flashAdd] call cgqc_fnc_addItemWithOverflow;
				_nadeFlashCount = _nadeFlashCount +1;
			} else {
				LOG(" openBandolier Config in Additional item mode");
				// Add new mags/throwables regardless of current count
				if !(isNil "_handgunMag") then {
					LOG_2(" openBandolier Adding %1/%2 handgun mags", cgqc_config_ammo_handgun, _handgunMag);
					// hint format ["HandgunMag: %1", _handgunMag];
					["uniform", _handgunMag, cgqc_config_ammo_handgun] call cgqc_fnc_addItemWithOverflow;
					_handMagCount = cgqc_config_ammo_handgun;
				} else {
					hint "No Secondary weapon!";
					LOG(" openBandolier No Secondary weapon?");
				};

				LOG_3(" openBandolier AddNades %1/%2/%3", cgqc_config_ammo_nade, cgqc_config_ammo_flash, cgqc_config_ammo_smoke);

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
			_text = parseText format [
				"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
				"- %1 primary mags added<br/>" +
				"- %2 handgun mags refilled<br/>" +
				"%3", _primaryMagCount, _handMagCount, _throwables
			];
			player switchMove "";
			[_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;
		}, {
			hint "Aborted!";
			if (isNull objectParent player) then {
				LOG(" openBandolier - Canceled");
				player switchMove "";
			};
		}, "Reloading from Bandolier - "] call ace_common_fnc_progressBar;
	};
	case "all": {
		if !("cgqc_bandolier_ammo" in items player) exitWith{
			player switchMove "";
		};
		[10, [], {
			// do stuff
			_primaryMag = (primaryWeaponMagazine ACE_player) select 0;
			_primaryMagCount = cgqc_config_ammo_primary;
			["vest", _primaryMag, _primaryMagCount] call cgqc_fnc_addItemWithOverflow;
			[ACE_player, "cgqc_bandolier_ammo"] call ace_common_fnc_useItem;
			LOG(" openBandolier - Grabbed all mags");
			_text = parseText format [
				"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
				"- Grabbed all primary mags: %1<br/>", _primaryMagCount
			];
			player switchMove "";
			[_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;
		}, {
			hint "Aborted!";
			if (isNull objectParent player) then {
				LOG(" openBandolier - Canceled");
				player switchMove "";
			};
		}, "Grabbing just the mags - "] call ace_common_fnc_progressBar;
	};
	case "half": {
		if !("cgqc_bandolier_ammo" in items player) exitWith{
			player switchMove "";
		};
		[5, [], {
			// do stuff
			_primaryMag = (primaryWeaponMagazine ACE_player) select 0;
			_primaryMagCount = cgqc_config_ammo_primary / 2;
			["vest", _primaryMag, _primaryMagCount] call cgqc_fnc_addItemWithOverflow;
			[ACE_player, "cgqc_bandolier_ammo"] call ace_common_fnc_useItem;
			["vest", "cgqc_bandolier_ammo_half", 1] call cgqc_fnc_addItemWithOverflow;
			LOG(" openBandolier - Grabbed half the mags and stripped the bandolier");
			_text = parseText format [
				"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
				"- Grabbed half primary mags: %1<br/>", _primaryMagCount
			];
			player switchMove "";
			[_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;
		}, {
			hint "Aborted!";
			if (isNull objectParent player) then {
				LOG(" openBandolier - Canceled");
				player switchMove "";
			};
		}, "Grabbing half the mags - "] call ace_common_fnc_progressBar;
	};
	case "last_half": {
		if !("cgqc_bandolier_ammo_half" in items player) exitWith{
			player switchMove "";
		};
		[5, [], {
			_primaryMag = (primaryWeaponMagazine ACE_player) select 0;
			_primaryMagCount = cgqc_config_ammo_primary / 2;
			["vest", _primaryMag, _primaryMagCount] call cgqc_fnc_addItemWithOverflow;
			[ACE_player, "cgqc_bandolier_ammo_half"] call ace_common_fnc_useItem;
			LOG(" openBandolier - Used up the last half of the stripped bandolier");
			_text = parseText format [
				"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
				"- Grabbed last half primary mags: %1<br/>", _primaryMagCount
			];
			player switchMove "";
			[_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;
		}, {
			hint "Aborted!";
			if (isNull objectParent player) then {
				LOG(" openBandolier - Canceled");
				player switchMove "";
			};
		}, "Grabbing mags - "] call ace_common_fnc_progressBar;
	};
	default {
		ERROR("[CGQC_ERROR] openBandolier _type didn't match");
	};
};

LOG(" openBandolier done");