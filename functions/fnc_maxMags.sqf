// --- maxMags ----------------------------------------------------------
// Limit maximum mags
	[] spawn {
	if (cgqc_setting_limitMags && !cgqc_flag_isTraining) then {
		_primary_mag = (primaryWeaponMagazine player) select 0;
		_compatibleMags = compatibleMagazines primaryWeapon player;
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
			hint format["Too many mags mofo!! Max: %1!", cgqc_setting_limitMags_max];
			_remove = (_delta * -1) - 1;
			for "_i" from 0 to _remove do {
				player removeMagazine (y_foundMags select _i); //Remove excess
			};
			sleep 3;
			hint format ["Removed: %1 mags",_remove];
		} else {
			hint "Mags: good";
		};
	};
};
	// does not prevent unit from pickup up more mags outside of arsenal.



