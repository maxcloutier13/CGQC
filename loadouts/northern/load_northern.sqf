// --- loadNorthern ----------------------------------------------------------
// Handles the arsenal for Northern Front

_type = _this select 0;

[_type] spawn {
	params ["_type"];
	_zeus = false;
	_items = cgqc_northern_arsenal_1;
	_found = false;
	switch (_type) do {
		case 0: {
			hint "Arsenal: Complet";
			_items = cgqc_northern_arsenal_all;
			_found = true;
		};
		case 5: {
			hint "Arsenal: Zeus";
			_zeus = true;
			[player, player, true] call ace_arsenal_fnc_openBox;
		};
		default	{
			hintc "loadNorthern fucked up. ";
		};
	};
	if (!_zeus) then {
		// Init crate
		[player, _items] call ace_arsenal_fnc_initBox;
		// Open arsenal
		[player, player, false] call ace_arsenal_fnc_openBox;
	};
};