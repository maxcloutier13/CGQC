// --- getKey ----------------------------------------------------------
// Get key to specified vehicle
params ["_target", ["_user", player]];
diag_log format ["[CGQC_FNC] getKey %1/%2 started", _target, _user];
_keyType = "";
_side = side _user;
switch (_target) do {
	case "side": { // Get side keys
		if (cgqc_config_sideKeys) then {
			switch (_side) do {
				case WEST: { _keyType = "ACE_key_west"};
				case EAST: { _keyType = "ACE_key_east"};
				case INDEPENDENT: { _keyType = "ACE_key_indp"};
			};
			if (_keyType isNotEqualTo "") then {
				diag_log format ["[CGQC_FNC] getKey - sideKey: %1", _keyType];
				_user addItem _keyType;
			};
		};
	};
	case "master": {_user addItem "ACE_key_master";};
	case "lockpick": {_user addItem "ACE_key_lockpick";};
	default { //Specific target
		diag_log format ["[CGQC_FNC] getKey - customKey: %1 started", _target];
		[_user, _target, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
	};
};

diag_log "[CGQC_FNC] --- getKey done";