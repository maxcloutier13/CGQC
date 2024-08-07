#include "\CGQC\script_component.hpp"
// --- switchStuff ----------------------------------------------------------
// Change one thing for another
// Example ["backpack", "cgqc_pack_mk1_magic"] call CGQC_fnc_switchStuff

params ["_type", ["_newItem", ""]];
LOG_2("[switchStuff] %1/%2 started", _type, _newItem);

switch (_type) do {
	case "hat": {
		player addHeadgear _newItem;
	};
	case "uniform": {
		_items_uniform = uniformItems player;
		removeUniform player;
		player addUniform _newItem;
		_items_old = uniformItems player;
		{player removeItemFromUniform _x} forEach _items_old;
		{player addItemToUniform _x} forEach _items_uniform;
	};
	case "vest": {
		_items_vest = vestItems player;
		removeVest player;
		if (_newItem isEqualTo "cgqc_vest_swat_X") then {
			_checkColor = player getVariable ["cgqc_var_startingColorTeam", "MAIN"];
			switch (_checkColor) do {
				case "RED": {_newItem = "cgqc_vest_swat_red"};
				case "GREEN": {_newItem = "cgqc_vest_swat_red"};
				case "BLUE": {_newItem = "cgqc_vest_swat_blue"};
				case "YELLOW": {_newItem = "cgqc_vest_swat_blue"};
				case "MAIN": { _newItem = "cgqc_vest_swat_2"};
				case "": { _newItem = "cgqc_vest_swat_2"};
			};
		};
		player addVest _newItem;
		_items_old = vestItems player;
		{player removeItemFromVest _x} forEach _items_old;
		{player addItemToVest _x} forEach _items_vest;
	};
	case "backpack": {
		_items_pack = backpackItems player;
		removeBackpack player;
		player addBackpack _newItem;
		clearAllItemsFromBackpack player;
		{player addItemToBackpack _x} forEach _items_pack;
	};
	case "goggles": {
		removeGoggles player;
		player addGoggles _newItem;
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
		removeHeadgear player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeGoggles player;
		[player] call GRAD_slingHelmet_fnc_removeSlungHelmet;
		// Remove backpack on chest
		_chestPack = [player] call bocr_main_fnc_chestpack;
		waitUntil {!isNil "_chestPack"};
		if (_chestPack isNotEqualTo "") then {
			[player] call bocr_main_fnc_removeChestpack;
		};
		/*
		// Remove secondary weapon
		if (!(isNil {player getVariable "WBK_SecondWeapon"})) exitWith {
			player spawn WBK_CreateSwitchBetweenWeapons;
			sleep 0.1;
			player removeWeapon primaryWeapon player;
		};*/
	};
	default	{LOG("[CGQC_ERROR] switchStuff not matched");};
};
LOG("[switchStuff] done");