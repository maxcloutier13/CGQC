// --- addItemWithOverflow ----------------------------------------------------------
// Add item to player, handling overflow all the way to the ground if needed
// Overflow = drop the excess in the next bigger
// toGround will actually drop all the way to the ground if all is full
// example: [player, "uniform", "medkit", 1] call CGQC_fnc_addItemWithOverflow;
params [["_target", "uniform"], "_item", ["_amount", 1], ["_overflow", true], ["_toGround", false]];
diag_log format ["[CGQC_FNC] addItemWithOverflow %1/%2/%3/%4 started", _target, _item, _overflow];

cgqc_int_addItem_ground = {
	params ["_target", "_item", "_amount", "_overflow", "_toGround"];
	if (_toGround) then {
			hint "Inventory full: Dropping on ground";
			diag_log "[CGQC_FNC] addItemWithOverflow - Dropping on ground!";
		for "_i" from 1 to _amount do {
			[_item, "items"] call CGQC_fnc_dropStuff;
		};
	} else {
		diag_log "[CGQC_FNC] addItemWithOverflow - Setting says not to drop to ground. Skipping.";
	};
};

CGQC_int_addItem_backpack = {
	params ["_target", "_item", "_amount", "_overflow", "_toGround"];
	diag_log "[CGQC_FNC] addItemWithOverflow - adding to backpack";
	for "_i" from 1 to _amount do {
		if (player canAddItemToBackpack _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			player addItemToBackpack _item;
			_amount = _amount - 1;
		} else {
			if (_overflow) then {
				diag_log "[CGQC_FNC] addItemWithOverflow - Overflowing to ground";
				[_target, _item, _amount, _overflow, _toGround] call cgqc_int_addItem_ground;
			};
			break;
		};
	};
};

CGQC_int_addItem_vest = {
	params ["_target", "_item", "_amount", "_overflow", "_toGround"];
	diag_log "[CGQC_FNC] addItemWithOverflow - adding to vest";
	for "_i" from 1 to _amount do {
		if (player canAddItemToVest _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			player addItemToVest _item;
			_amount = _amount - 1;
		} else {
			if (_overflow) then {
				diag_log "[CGQC_FNC] addItemWithOverflow - Overflowing to backpack";
				[_target, _item, _amount, _overflow, _toGround] call CGQC_int_addItem_backpack;
			};
			break;
		};
	};
};

CGQC_int_addItem_uniform = {
	params ["_target", "_item", "_amount", "_overflow", "_toGround"];
	diag_log "[CGQC_FNC] addItemWithOverflow - adding to uniform";
	for "_i" from 1 to _amount do {
		if (player canAddItemToUniform _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			player addItemToUniform _item;
			_amount = _amount - 1;
		} else {
			if (_overflow) then {
				diag_log "[CGQC_FNC] addItemWithOverflow - Overflowing to vest";
				// Doesn't fit. Overflowing
				[_target, _item, _amount, _overflow, _toGround] call CGQC_int_addItem_vest;
			};
			break;
		};
	};
};

// Lower string in case.
_item = toLower _item;

switch (_target) do {
	case "uniform": {
		[_target, _item, _amount, _overflow, _toGround] call CGQC_int_addItem_uniform;
	};
	case "vest": {
		[_target, _item, _amount, _overflow, _toGround] call CGQC_int_addItem_vest;
	};
	case "backpack": {
		[_target, _item, _amount, _overflow, _toGround] call CGQC_int_addItem_backpack;
	};
	case "ground": {
		[_target, _item, _amount, _overflow, _toGround] call cgqc_int_addItem_ground;
	};
};
diag_log "[CGQC_FNC] addItemWithOverflow done";