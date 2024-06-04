#include "\CGQC\script_component.hpp"
// --- getKey ----------------------------------------------------------
// Get key to specified vehicle
params ["_target", ["_user", player]];
LOG_2("[getKey] %1/%2 started", _target, _user);
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
				LOG_1("[getKey] - sideKey: %1", _keyType);
				_user addItem _keyType;
			};
		};
	};
	case "master": {_user addItem "ACE_key_master";};
	case "lockpick": {_user addItem "ACE_key_lockpick";};
	default { //Specific target
		LOG_1("[getKey] - customKey: %1 started", _target);
		[_user, _target, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
	};
};

LOG("[getKey] done");