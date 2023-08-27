// --- addItemWithOverflow ----------------------------------------------------------
// Add item to player, handling overflow all the way to the ground if needed 
params ["_unit", "_target", "_item", "_overflow"];
diag_log format ["[CGQC_FNC] addItemWithOverflow %1/%2/%3/%4 started", _unit, _target, _item, _overflow];

switch (_target) do {
	case "uniform": { 
		if (_unit canAddItemToUniform _item) then {
			_unit addItemToUniform _item;
		} else {
			if (_unit canAddItemToVest _item) then {
				_unit addItemToVest _item;
			} else {
				if (_unit canAddItemToBackpack _item) then {
					_unit addItemToBackpack _item;
				}else {
					if (_overflow) then {
						hint "Not enough spac... Dropping on ground";
						_itemPos = getPos player; // Get player's position
						_itemPos set [2, 0];      // Set the height to 0 to place the item on the ground

						_groundItem = "GroundWeaponHolder" createVehicle _itemPos; // Create a ground weapon holder
						_groundItem addItemCargoGlobal [_item, 1]; // Add the magazine to the holder

						// Optional: Name the weapon holder (you can replace "MyMagazineHolder" with your desired name)
						_name = format ["%1's gear", cgqc_custom_playername];
						_groundItem setVariable ["BIS_displayName", _name];
					};
				};
			};
		};
	};
	case "vest": { 
		if (_unit canAddItemToVest _item) then {
			_unit addItemToVest _item;
		} else {
			if (_unit canAddItemToBackpack _item) then {
				_unit addItemToBackpack _item;
			} else {
				if (_overflow) then {
					hint "Not enough spac... Dropping on ground";
					_itemPos = getPos player; // Get player's position
					_itemPos set [2, 0];      // Set the height to 0 to place the item on the ground

					_groundItem = "GroundWeaponHolder" createVehicle _itemPos; // Create a ground weapon holder
					_groundItem addItemCargoGlobal [_item, 1]; // Add the magazine to the holder

					// Optional: Name the weapon holder (you can replace "MyMagazineHolder" with your desired name)
					_name = format ["%1's gear", cgqc_custom_playername];
					_groundItem setVariable ["BIS_displayName", _name];
				};
			};
		};
	};
	case "backpack": {
		if (_unit canAddItemToBackpack _item) then {
			_unit addItemToBackpack _item;
		}else{
			if (_overflow) then {
				hint "Not enough spac... Dropping on ground";
				_itemPos = getPos player; // Get player's position
				_itemPos set [2, 0];      // Set the height to 0 to place the item on the ground

				_groundItem = "GroundWeaponHolder" createVehicle _itemPos; // Create a ground weapon holder
				_groundItem addItemCargoGlobal [_item, 1]; // Add the magazine to the holder

				// Optional: Name the weapon holder (you can replace "MyMagazineHolder" with your desired name)
				_name = format ["%1's gear", cgqc_custom_playername];
				_groundItem setVariable ["BIS_displayName", _name];
			};
		};
	};
};
diag_log "[CGQC_FNC] addItemWithOverflow done";