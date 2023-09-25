// --- setRelations ----------------------------------------------------------
// Get radios and set everything
params ["_type"];
diag_log format ["[CGQC_FNC] setRelations %1", _type];

// Everyone is ennemy
east setFriend [west, 0];
west setFriend [east, 0];
resistance setFriend [west, 0];
west setFriend [resistance, 0];
resistance setFriend [east, 0];
east setFriend [resistance, 0];

switch (_type) do {
	case "indWest": {
		resistance setFriend [west, 1];
		west setFriend [resistance, 1];
	};
	case "indEast": {
		resistance setFriend [east, 1];
		east setFriend [resistance, 1];
	};
	case "indAll": {
		resistance setFriend [east, 1];
		east setFriend [resistance, 1];
		resistance setFriend [west, 1];
		west setFriend [resistance, 1];
	};

	default { };
};

diag_log "[CGQC_FNC] getRadioPresets done";