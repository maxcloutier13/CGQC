// --- addMags ----------------------------------------------------------
// Add the maximum allowed mag with overflow in backpack.
diag_log "[CGQC_FNC] addMags started";

// Primary ======================================================================
_mag = (primaryWeaponMagazine player) select 0;
if (isNil "_mag") then {
	diag_log "[CGQC_ERROR] addMags - can't ID mags";
} else {
	_vest = vest player;
	_addMags = cgqc_setting_limitMags_max;
	// max = 30Rnd
	// x1.5 for 20Rnd
	// x2 for smaller
	// /2 for bigger

	// Extract the magazine size from the class name
	_magSize = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");

	// Compare the magazine size
	switch (true) do {
		case (_magSize < 20): {_addMags = _addMags * 1.6};
		case (_magSize == 20): {_addMags = _addMags * 1.5};
		case (_magSize > 30): {_addMags = _addMags * 0.6};
	};

	// Add amount of mags
	diag_log format ["[CGQC_FNC] addMags - adding %1 mags", _addMags];
	if (_addMags <= 8) then {
		for "_i" from 1 to _addMags do {[player, "vest", _mag, false] call CGQC_fnc_addItemWithOverflow;};
	} else {
		_additional = _addMags - 8;
		for "_i" from 1 to 8 do {[player, "vest", _mag, false] call CGQC_fnc_addItemWithOverflow;};
		for "_i" from 1 to _additional do {[player, "backpack", _mag, false] call CGQC_fnc_addItemWithOverflow;};
	};
};

