// --- switchStuff ----------------------------------------------------------
// Change one thing for another
_type = _this select 0;
_arg = _this select 1;

switch (_type)
do
{
	case "vest":	{
		_items_vest = vestItems player;
		removeVest player;
		player addVest _arg;
		_items_old = vestItems player;
		{player removeItemFromVest _x} forEach _items_old;
		{player addItemToVest _x} forEach _items_vest;
		cgqc_mk3_switching_vest = true;
		break;
	};
	case "backpack":	{
		_items_pack = backpackItems player;
		removeBackpack player;
		player addBackpack _arg;
		clearAllItemsFromBackpack player;
		{player addItemToBackpack _x} forEach _items_pack;
		cgqc_mk3_switching_backpack = true;
		break;
	};
	case "prep":{
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
		break;
	};
	default	{
		hint "switchStuff error";
		sleep 3;
	};
};





	