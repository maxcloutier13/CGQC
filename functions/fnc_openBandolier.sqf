// --- openBandolier ----------------------------------------------------------
// Open ammo bandoliers and deal with them
params ["_type"];
diag_log format ["[CGQC_FNC] openBandolier %1 started", _type];

switch (_type) do {
	case "ammo": {
		if !("cgqc_bandolier_ammo" in items player) exitWith{};

		// Start animation
		player playMove "AinvPknlMstpSnonWnonDnon_medic4";

		// Progress bar
		[15, [], {
			[ACE_player, "cgqc_bandolier_ammo"] call ace_common_fnc_useItem;
			_allMags = magazines ACE_player;
			_primaryMag = (primaryWeaponMagazine ACE_player) select 0;
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
				_primaryMags = {_x isEqualTo _primaryMag } count _allMags;
			};
			if !(isNil "_handgunMag") then {
				_handgunMags = {_x isEqualTo _handgunMag } count _allMags;
			};
			_grenades = ["rhs_mag_m67", "HandGrenade"] apply {toLower _x};
			_nade = {(toLower _x) in _grenades} count _allMags;
			_flash = ["ACE_M84", "ACE_CTS9"]  apply {toLower _x};
			_nadeFlash = {(toLower _x) in _flash} count _allMags;
			_smoke = {_x isEqualTo "SmokeShell" } count _allMags;

			// Add primary mags
			if !(isNil "_primaryMag") then {
				//hint format ["Mag: %1", _primaryMag];

				// Extract the magazine size from the class name
				_magSize = getNumber(configFile >> "CfgMagazines" >> _primaryMag >> "count");

				// Compare the magazine size
				_addMags = cgqc_config_ammo_primary;
				switch (true) do {
					case (_magSize > 50): {_addMags = 3; };
					case (_magSize > 30): {_addMags = 4; };
				};

				for "_i" from 1 to _addMags do {
					[ACE_player, "vest", _primaryMag, true] call cgqc_fnc_addItemWithOverflow;
					_primaryMagCount = _primaryMagCount + 1;
				};

			}else{hint "No primary weapon!";};

			// Refill handgun/throwables instead of adding more
			if (cgqc_config_ammo_refill) then {

				// Refill handgun
				if !(isNil "_handgunMag") then {
					//hint format ["HandgunMag: %1", _handgunMag];
					for "_i" from _handgunMags to (cgqc_config_sidearm_mag_nbr - 1) do {
						[ACE_player, "vest", _handgunMag, true] call cgqc_fnc_addItemWithOverflow;
						_handMagCount = _handMagCount + 1;
						};
				}else{hint "No Secondary weapon!";};

				// Refill throwables
				for "_i" from _nade to cgqc_config_ammo_nade - 1 do {[ACE_player, "vest", _grenadeType, true] call cgqc_fnc_addItemWithOverflow;_nadeCount = _nadeCount + 1};
				for "_i" from _nadeFlash to cgqc_config_ammo_flash - 1 do {[ACE_player, "vest", cgqc_config_ammo_flash_type, true] call cgqc_fnc_addItemWithOverflow; _nadeFlashCount = _nadeFlashCount +1};
				for "_i" from _smoke to cgqc_config_ammo_smoke - 1 do {[ACE_player, "vest", cgqc_config_ammo_smoke_type, true] call cgqc_fnc_addItemWithOverflow; _smokeCount = _smokeCount + 1};
			} else {
				// Add new mags/throwables regardless of current count
				if !(isNil "_handgunMag") then {
					//hint format ["HandgunMag: %1", _handgunMag];
					for "_i" from 1 to cgqc_config_ammo_handgun do {
						[ACE_player, "uniform", _handgunMag, true] call cgqc_fnc_addItemWithOverflow;
						_handMagCount = _handMagCount + 1;
						};
				}else{hint "No Secondary weapon!";};

				// Refill throwables
				for "_i" from 1 to cgqc_config_ammo_nade do {[ACE_player, "vest", _grenadeType, true] call cgqc_fnc_addItemWithOverflow;_nadeCount = _nadeCount + 1};
				for "_i" from 1 to cgqc_config_ammo_flash  do {[ACE_player, "vest", cgqc_config_ammo_flash_type, true] call cgqc_fnc_addItemWithOverflow; _nadeFlashCount = _nadeFlashCount +1};
				for "_i" from 1 to cgqc_config_ammo_smoke do {[ACE_player, "vest", cgqc_config_ammo_smoke_type, true] call cgqc_fnc_addItemWithOverflow; _smokeCount = _smokeCount + 1};
			};


			// Prep Message
			_throwables = "";
			_added = false;
			if (_nadeCount > 0) then {_throwables = _throwables + format ["%1 nades", _nadeCount]; _added = true;};
			if (_nadeFlashCount > 0) then {_throwables = _throwables + format ["/%1 bangs", _nadeFlashCount]; _added = true;};
			if (_smokeCount > 0) then {_throwables = _throwables + format ["/%1 smokes", _smokeCount]; _added = true;};
			if(_added)then {
				_throwables = "Grabbed: " + _throwables;
			};
			_text = parseText format [
				"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
				"- %1 primary mags added<br/>" +
				"- %2 handgun mags refilled<br/>" +
				"%3"
				, _primaryMagCount, _handMagCount, _throwables
				];
			[_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;
		}, {player switchMove "";hint "Aborted!";}, "Reloading from Bandolier"] call ace_common_fnc_progressBar;

	};
	default {diag_log format ["[CGQC_ERROR] openBandolier _type didn't match"];};
};
diag_log format ["[CGQC_FNC] openBandolier done"];