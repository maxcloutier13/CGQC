// --- setTeamColors ----------------------------------------------------------
// set player default team colors
params [["_color", "NONE"], ["_target", player], ["_type", "SINGLE"], ["_delay", 0]];
diag_log format ["[CGQC_FNC] setTeamColors color:%1/Target:%2/Type:%3 started", _color, _target, _type];

_targetId = owner _target;
_players =  [] call CGQC_int_allHumanPlayers;
switch (_type) do {
	case "AUTO";
	case "SINGLE": {
		[_color,  _delay] remoteExec ['CGQC_int_setSingleColor', _targetId];
	};
	case "ALL": {
		{
			["NONE",  _delay] remoteExec ['CGQC_int_setSingleColor', _targetId];
		} forEach _players;
	};
};

diag_log "[CGQC_FNC] setTeamColors done";

CGQC_int_setSingleColor = {
	params [["_color", "NONE"], ["_delay", 0]];
	[_color, _delay] spawn {
		params [["_color", "NONE"], ["_delay", 0]];
		sleep _delay;
		if (_color isEqualTo "NONE") then {
			diag_log "[CGQC_FNC] setTeamColors - Color not provided. Loading from variable";
			_name = name player;
			_color = player getVariable ["CGQC_teamColor", "MAIN"];
			_team = assignedTeam player;
			if (_color isNotEqualTo _team) then {
				diag_log format ["[CGQC_FNC] setTeamColors Color wrong!: %1:%2/%3", _name, _color, _team];
				hint "TeamColor wrong? Restoring";
				player assignTeam _color;
				player setVariable ["CGQC_teamColor", _color, true];
				diag_log "[CGQC_FNC] setTeamColors - Color reset.";
			} else {
				diag_log format ["[CGQC_FNC] setTeamColors Color match. Skipping: %1", _name];
			};
		} else {
			diag_log "[CGQC_FNC] setTeamColors - Color provided. Setting up.";
			player assignTeam _color;
			player setVariable ["CGQC_teamColor", _color, true];
		};
	};
};