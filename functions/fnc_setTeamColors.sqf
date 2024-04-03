// --- setTeamColors ----------------------------------------------------------
// Set player default team colors
params [["_color", "NONE"], ["_target", player]];
diag_log format ["[CGQC_FNC] setTeamColors color:%1/Target:%2 started", _color, _target];

if (_color isEqualTo "NONE") then {
	diag_log "[CGQC_FNC] setTeamColors - Color not provided. Loading from variable";
	_color = _target getVariable "CGQC_teamColor";
	diag_log format ["[CGQC_FNC] setTeamColors color found:%1 ", _color];
} else {
	diag_log "[CGQC_FNC] setTeamColors - Color provided. Setting up.";
	if !(_color isEqualTo "UNSET") then {
		diag_log "[CGQC_FNC] setTeamColors - Setting color and variable";
		_target assignTeam _color;
		_target setVariable ["CGQC_teamColor", _color];
	};
};

diag_log "[CGQC_FNC] setTeamColors done";