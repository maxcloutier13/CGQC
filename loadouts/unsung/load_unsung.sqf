// --- loadUnsung ----------------------------------------------------------
// Handles the arsenal for Unsung

_type = _this select 0;

[_type] spawn {
	params ["_type"];
	_zeus = false;
	_items = cgqc_unsung_arsenal_1;
	_found = false;
	switch (_type) do {
		case 0: {
			hint "Arsenal: Complet";
			_items = cgqc_unsung_arsenal_8;
			_found = true;
		};
		case 5: {
			hint "Arsenal: Zeus";
			_zeus = true;
			[player, player, true] call ace_arsenal_fnc_openBox;
		};
		default	{
			hintc "loadUnsung fucked up. ";
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