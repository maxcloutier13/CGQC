// --- switchStuff ----------------------------------------------------------
// Change one thing for another
// Example ["backpack", "cgqc_pack_mk1_magic"] call CGQC_fnc_switchStuff

params ["_type", ["_arg", ""]];
diag_log format ["[CGQC_FNC] switchStuff %1/%2 started", _type, _arg];

switch (_type) do {
	case "uniform": {
		_items_uniform = uniformItems player;
		removeUniform player;
		player addUniform _arg;
		_items_old = uniformItems player;
		{player removeItemFromUniform _x} forEach _items_old;
		{player addItemToUniform _x} forEach _items_uniform;
	};
	case "vest": {
		_items_vest = vestItems player;
		removeVest player;
		player addVest _arg;
		_items_old = vestItems player;
		{player removeItemFromVest _x} forEach _items_old;
		{player addItemToVest _x} forEach _items_vest;
	};
	case "backpack": {
		_items_pack = backpackItems player;
		removeBackpack player;
		player addBackpack _arg;
		clearAllItemsFromBackpack player;
		{player addItemToBackpack _x} forEach _items_pack;
	};
	case "prep": {
		// Current soldier equipment
		player_helmet_old = headgear player;
		player_uniform_old = uniform player;
		player_vest_old = vest player;
		player_backpack_old = backpack player;
		player_goggles_old = goggles player;
		// Save inventory
		player_items_uniform = uniformItems player;
		player_items_vest = vestItems player;
		player_items_pack = backpackItems player;
		// Delete old stuff
		[] call CGQC_fnc_removeAll;
	};
	default	{diag_log "[CGQC_ERROR] switchStuff not matched";};
};
diag_log "[CGQC_FNC] switchStuff done";