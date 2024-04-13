// --- setTeamColorReload ----------------------------------------------------------
// set player color
params [["_color", "MAIN"]];
diag_log "[CGQC_FNC] setTeamColorReload started";

_name = name player;
_color = player getVariable ["CGQC_player_teamColor", "MAIN"];
_team = assignedTeam player;
if (_color isNotEqualTo _team) then {
    diag_log format ["[CGQC_FNC] setTeamColorReload -> Color wrong!: %1 - %2 != %3", _name, _color, _team];
    hint "TeamColor wrong? Restoring";
    player assignTeam _color;
    player setVariable ["CGQC_player_teamColor", _color, true];
    diag_log "[CGQC_FNC] setTeamColorReload - Color reset.";
} else {
    diag_log format ["[CGQC_FNC] setTeamColorReload Color match. Skipping: %1", _name];
};

diag_log "[CGQC_FNC] setTeamColorReload done";