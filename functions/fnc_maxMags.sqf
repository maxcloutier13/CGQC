#include "\CGQC\script_component.hpp"
// --- maxMags ----------------------------------------------------------
// Limit maximum mags
	[] spawn {
	if (cgqc_setting_limitMags && !cgqc_flag_isTraining) then {
		_primary = primaryWeapon player;
		_primary_mag = (primaryWeaponMagazine player) select 0;
		_compatibleMags = compatibleMagazines [_primary, _primary];
		_addMags = cgqc_setting_limitMags_max;
		_allMags = magazines player;

		// Find all compatible mags on player
		y_foundMags = [];
		{
			if(_x in _compatibleMags) then {
				y_foundMags pushBack _x;
			};
		}forEach _allMags;

		// Extract the magazine size from the class name
		_magSize = getNumber(configFile >> "CfgMagazines" >> _primary_mag >> "count");

		// Compare the magazine size
		switch (true) do {
			case (_magSize < 20): {_addMags = _addMags * 2; };
			case (_magSize == 20): {_addMags = _addMags * 1.5; };
			case (_magSize > 30): {_addMags = _addMags * 0.6; };
		};
			// Compare compatible mags to current mags
		_delta = cgqc_setting_limitMags_max - count y_foundMags;
		if (_delta < 0) then { //Too many mags mofo!
			_remove = (_delta * -1) - 1;
			for "_i" from 0 to _remove do {
				player removeMagazine (y_foundMags select _i); //Remove excess
			};
			sleep 3;
			_title = "MaxMags gotcha!";
			_txt = format ["Max: %1! Removed: %1", cgqc_setting_limitMags_max, _remove];
			[[_title, 1.5], [_txt], false] call CBA_fnc_notify;
		} else {
			hint "Mags: good";
		};
	};
};
	// does not prevent unit from pickup up more mags outside of arsenal.



