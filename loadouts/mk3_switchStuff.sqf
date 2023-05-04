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
	};
	case "backpack":	{
		_items_pack = backpackItems player;
		removeBackpack player;
		player addBackpack _arg;
		clearAllItemsFromBackpack player;
		{player addItemToBackpack _x} forEach _items_pack;
		cgqc_mk3_switching_backpack = true;
	};
	default	{
		hint "switchStuff error";
		sleep 3;
	};
};





	