// --- loadIfa3 ----------------------------------------------------------
// Handles the arsenal for ifa3

_type = _this select 0;

[_type] spawn { 
	params ["_type"];
	if (isNil "loadMk2_lastRun") then {
		loadMk2_lastRun = 25;
	};
	loadMk2_firstRun = true;
	_zeus = false;
	_items = cgqc_ifa3_arsenal_1;
	_found = false;
	switch (_type) do {
		case 0: { 
			hint "Arsenal: Complet";
			_items = cgqc_ifa3_arsenal_8;
			_found = true;
		    break;
		};
		case 5: { 
			hint "Arsenal: Zeus";
			_zeus = true;
			[player, player, true] call ace_arsenal_fnc_openBox;
		    break;
		};
		default	{
			hintc "loadIfa3 fucked up. ";
		};
	};
	if (!_zeus) then {
		//hintc "Not Zeus: Pop box";
		waitUntil {_found}; 
		// Init crate
		[player, _items] call ace_arsenal_fnc_initBox;
		// Open arsenal
		[player, player, false] call ace_arsenal_fnc_openBox;
	};
};