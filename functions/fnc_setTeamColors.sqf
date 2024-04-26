#include "\CGQC\script_component.hpp"
// --- setTeamColors ----------------------------------------------------------
// set player default team colors
params [["_color", "NONE"], ["_target", player], ["_type", "SINGLE"], ["_delay", 0]];
LOG_4(" setTeamColors color:%1/Target:%2/Type:%3/Delay:%4 started", _color, _target, _type, _delay);



switch (_type) do {
	case "SINGLE": {
		LOG(" setTeamColors SingleMode running");
		_targetId = owner _target;
		[_color,  _delay] remoteExec ['CGQC_int_setSingleColor', _targetId];
	};
	case "ALL": {
		_players =  [] call CGQC_int_allHumanPlayers;
		LOG(" setTeamColors AllMode running");
		{
			_targetId = owner _x;
			["NONE",  _delay] remoteExec ['CGQC_int_setSingleColor', _targetId];
		} forEach _players;
	};
};

LOG(" setTeamColors done");

CGQC_int_setSingleColor = {
	params [["_color", "NONE"], ["_delay", 0]];
	[_color, _delay] spawn {
		params [["_color", "NONE"], ["_delay", 0]];
		sleep _delay;
		if (_color isEqualTo "NONE") then {
			LOG(" setTeamColors - Color not provided. Loading from variable");
			_name = name player;
			_color = player getVariable ["CGQC_player_teamColor", "MAIN"];
			_team = assignedTeam player;
			if (_color isNotEqualTo _team) then {
				LOG_3(" setTeamColors Color wrong!: %1:%2/%3", _name, _color, _team);
				hint "TeamColor wrong? Restoring";
				player assignTeam _color;
				player setVariable ["CGQC_player_teamColor", _color, true];
				LOG(" setTeamColors - Color reset.");
			} else {
				LOG_1(" setTeamColors Color match. Skipping: %1", _name);
			};
		} else {
			LOG(" setTeamColors - Color provided. Setting up.");
			player assignTeam _color;
			player setVariable ["CGQC_player_teamColor", _color, true];
		};
	};
};