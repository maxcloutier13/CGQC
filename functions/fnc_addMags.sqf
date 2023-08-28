// --- addMags ----------------------------------------------------------
// Add the maximum allowed mag with overflow in backpack.
diag_log "[CGQC_FNC] addMags started";

_mag = (primaryWeaponMagazine player) select 0;
if (isNil "_mag") then {
	hint "Error: Can't ID mags...";
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
		case (_magSize < 20): {_addMags = _addMags * 2};
		case (_magSize == 20): {_addMags = _addMags * 1.5};
		case (_magSize > 30): {_addMags = _addMags * 0.6};
	};

	_countVest = 0;
	_countPack = 0;
	// Add amount of mags
	diag_log format ["[CGQC_FNC] addMags - adding %1 mags", _addMags];
	for "_i" from 1 to _addMags do {
		if (player canAddItemToVest _mag) then {
			player addItemToVest _mag;
			_countVest = _countVest + 1;
		} else { // No space, adding to pack
			player addItemToBackpack _mag;
			_countPack = _countPack + 1;
		};		
	};
	diag_log format ["[CGQC_FNC] addMags - added %1/vest %2/backpack ", _countVest, _countPack];
	//hint format ["Vest: +%1 - Pack: +%2", _countVest, _countPack];
};
diag_log "[CGQC_FNC] addMags done";