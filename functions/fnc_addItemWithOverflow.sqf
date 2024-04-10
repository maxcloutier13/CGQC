// --- addItemWithOverflow ----------------------------------------------------------
// Add item to player, handling overflow all the way to the ground if needed
// Overflow = drop the excess in the next bigger
// toGround will actually drop all the way to the ground if all is full
// example: [player, "uniform", "medkit", 1] call CGQC_fnc_addItemWithOverflow;
params [["_unit", player], ["_target", "uniform"], "_item", ["_amount", 1], ["_overflow", true], ["_toGround", false]];
diag_log format ["[CGQC_FNC] addItemWithOverflow %1/%2/%3/%4 started", _unit, _target, _item, _overflow];

// Lower string in case.
_item = toLower _item;
_unitID = owner _unit;


switch (_target) do {
	case "uniform": {
		[_unit, _target, _item, _amount, _overflow, _toGround] remoteExec ['CGQC_int_addItem_uniform', _unitID];
	};
	case "vest": {
		[_unit, _target, _item, _amount, _overflow, _toGround] remoteExec ['CGQC_int_addItem_vest', _unitID];
	};
	case "backpack": {
		[_unit, _target, _item, _amount, _overflow, _toGround] remoteExec ['CGQC_int_addItem_backpack', _unitID];
	};
	case "ground": {
		[_unit, _target, _item, _amount, _overflow, _toGround] remoteExec ['cgqc_int_addItem_ground', _unitID];
	};
};
diag_log "[CGQC_FNC] addItemWithOverflow done";

CGQC_int_addItem_uniform = {
	params ["_unit", "_target", "_item", "_amount", "_overflow", "_toGround"];
	diag_log "[CGQC_FNC] addItemWithOverflow - adding to uniform";
	_unitID = owner _unit;
	for "_i" from 1 to _amount do {
		if (_unit canAddItemToUniform _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			_unit addItemToUniform _item;
			_amount = _amount - 1;
		} else {
			if (_overflow) then {
				diag_log "[CGQC_FNC] addItemWithOverflow - Overflowing to vest";
				// Doesn't fit. Overflowing
				[_unit, _target, _item, _amount, _overflow, _toGround] remoteExec ['CGQC_int_addItem_vest', _unitID];
			};
			break;
		};
	};
};

CGQC_int_addItem_vest = {
	params ["_unit", "_target", "_item", "_amount", "_overflow", "_toGround"];
	diag_log "[CGQC_FNC] addItemWithOverflow - adding to vest";
	_unitID = owner _unit;
	for "_i" from 1 to _amount do {
		if (_unit canAddItemToVest _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			_unit addItemToVest _item;
			_amount = _amount - 1;
		} else {
			if (_overflow) then {
				diag_log "[CGQC_FNC] addItemWithOverflow - Overflowing to backpack";
				[_unit, _target, _item, _amount, _overflow, _toGround] remoteExec ['CGQC_int_addItem_backpack', _unitID];
			};
			break;
		};
	};
};

CGQC_int_addItem_backpack = {
	params ["_unit", "_target", "_item", "_amount", "_overflow", "_toGround"];
	diag_log "[CGQC_FNC] addItemWithOverflow - adding to backpack";
	_unitID = owner _unit;
	for "_i" from 1 to _amount do {
		if (_unit canAddItemToBackpack _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			_unit addItemToBackpack _item;
			_amount = _amount - 1;
		} else {
			if (_overflow) then {
				diag_log "[CGQC_FNC] addItemWithOverflow - Overflowing to ground";
				[_unit, _target, _item, _amount, _overflow, _toGround] remoteExec ['cgqc_int_addItem_ground', _unitID];
			};
			break;
		};
	};
};

cgqc_int_addItem_ground = {
	params ["_unit", "_target", "_item", "_amount", "_overflow", "_toGround"];
	_unitID = owner _unit;
	if (_toGround) then {
		hint "Inventory full: Dropping on ground";
		diag_log "[CGQC_FNC] addItemWithOverflow - Dropping on ground!";
		_itemPos = getPos player; // Get player's position
		_itemPos set [2, 0];      // set the height to 0 to place the item on the ground
		_groundItem = "GroundWeaponHolder" createVehicle _itemPos; // Create a ground weapon holder
		_groundItem addItemCargoGlobal [_item, _amount]; // Add the magazine to the holder
		// Optional: Name the weapon holder (you can replace "MyMagazineHolder" with your desired name)
		_name = format ["%1's gear", cgqc_custom_playername];
		_groundItem setVariable ["cgqc_object_name", _name, true];
	} else {
		diag_log "[CGQC_FNC] addItemWithOverflow - Setting says not to drop to ground. Skipping.";
	};
};
