// --- setTeamColor ----------------------------------------------------------
// set player color
params [["_color", "MAIN"]];
diag_log "[CGQC_FNC] setTeamColor started";

_name = name player;
diag_log format ["[CGQC_FNC] setTeamColor Color wrong!: %1:%2/%3", _name, _color];
player assignTeam _color;
player setVariable ["CGQC_player_teamColor", _color, true];

diag_log "[CGQC_FNC] setTeamColor done";