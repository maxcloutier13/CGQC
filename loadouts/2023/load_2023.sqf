#include "\CGQC\script_component.hpp"
// --- load_2023 ----------------------------------------------------------
// Open up the arsenal according to rank

params ["_type"];
LOG(" load_2023 started");

[_type] spawn {
	params ["_type"];
	_zeus = false;
	_items = cgqc_mk2_arsenal_1;
	_found = false;
	switch (_type) do {
		case 0: {
			hint "Arsenal: Complet";
			_items = cgqc_mk2_arsenal_8;
			_found = true;
		};
		case 1: {
			hint "Arsenal: Soldat";
			_items = cgqc_mk2_arsenal_1;
			_found = true;
		};
		case 2: {
			hint "Arsenal: Caporal";
			_items = cgqc_mk2_arsenal_2;
			_found = true;
		};
		case 3: {
			hint "Arsenal: Caporal-Chef";
			_items = cgqc_mk2_arsenal_3;
			_found = true;
		};
		case 4: {
			hint "Arsenal: Sergent";
			_items = cgqc_mk2_arsenal_4;
			_found = true;
		};
		case 5: {
			hint "Arsenal: Zeus";
			_zeus = true;
			[player, player, true] call ace_arsenal_fnc_openBox;
		};
		default	{
			hintc "fnc_loadMk2 fucked up. ";
		};
	};
	if (!_zeus) then {
		// Init crate
		[player, _items] call ace_arsenal_fnc_initBox;
		// Open arsenal
		[player, player, false] call ace_arsenal_fnc_openBox;
	};
};

LOG(" load_2023 started");