// --- setTeamColors ----------------------------------------------------------
// Set player default team colors
params [["_color", "NONE"], ["_target", player], ["_type", "SINGLE"]];
diag_log format ["[CGQC_FNC] setTeamColors color:%1/Target:%2/Type:%3 started", _color, _target, _type];

switch (_type) do {
	case "AUTO";
	case "SINGLE": {
		if (_color isEqualTo "NONE") then {
			diag_log "[CGQC_FNC] setTeamColors - Color not provided. Loading from variable";
			_name = name _x;
			_color = _target getVariable "CGQC_teamColor";
			_team = assignedTeam _x;
			if (_color isNotEqualTo _team) then {
				diag_log format ["[CGQC_FNC] setTeamColors Color wrong!: %1:%2/%3", _name, _color, _team];
				_target assignTeam _color;
				_target setVariable ["CGQC_teamColor", _color, true];
				diag_log "[CGQC_FNC] setTeamColors - Color reset.";
			} else {
				diag_log format ["[CGQC_FNC] setTeamColors Color match. Skipping: %1", _name];
			};
		} else {
			diag_log "[CGQC_FNC] setTeamColors - Color provided. Setting up.";
			_target assignTeam _color;
			_target setVariable ["CGQC_teamColor", _color, true];
		};

	};
	case "ALL": {
		{
			_name = name _x;
			_color = _x getVariable ["CGQC_teamColor", "MAIN"];
			_team = assignedTeam _x;
			if (_color isNotEqualTo _team) then {
				// Fucking color has reset
				diag_log format ["[CGQC_FNC] setTeamColors Color wrong!: %1:%2/%3", _name, _color, _team];
				_x assignTeam _color;
				diag_log "[CGQC_FNC] setTeamColors - Color reset.";
			} else {
				// All good!
				diag_log format ["[CGQC_FNC] setTeamColors Color good. Skipping: %1", _name];
			};
		} forEach allPlayers;
	};
};

diag_log "[CGQC_FNC] setTeamColors done";