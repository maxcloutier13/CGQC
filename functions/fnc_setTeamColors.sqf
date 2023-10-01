// --- setTeamColors ----------------------------------------------------------
// Set player default team colors
diag_log "[CGQC_FNC] setTeamColors started";

_playerCount = count units group player;
_half = _playerCount / 2;
_id = groupID cgqc_player_group;
_lastChar = _id select [count _id - 1];
_lastDigit = parseNumber _lastChar;
_color1 = "RED";
_color2 = "BLUE";
if (_lastDigit % 2 == 0) then {
	_color1 = "GREEN";
	_color2 = "YELLOW";
};

if (cgqc_player_groupID <= _half) then {
	player assignTeam _color1;
} else {
	player assignTeam _color2;
};

diag_log "[CGQC_FNC] setTeamColors done";