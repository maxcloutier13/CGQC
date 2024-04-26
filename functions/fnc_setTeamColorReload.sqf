#include "\CGQC\script_component.hpp"
// --- setTeamColorReload ----------------------------------------------------------
// set player color
LOG(" setTeamColorReload started");

_name = name player;
_color = player getVariable ["CGQC_player_teamColor", "MAIN"];
_team = assignedTeam player;
if (_color isNotEqualTo _team) then {
    LOG_3(" setTeamColorReload -> Color wrong!: %1 - %2 != %3", _name, _color, _team);
    hint "TeamColor wrong? Restoring";
    player assignTeam _color;
    player setVariable ["CGQC_player_teamColor", _color, true];
    LOG(" setTeamColorReload - Color reset.");
} else {
    LOG_1(" setTeamColorReload Color match. Skipping: %1", _name);
};

LOG(" setTeamColorReload done");