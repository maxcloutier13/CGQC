#include "\CGQC\script_component.hpp"
// --- setTeamColor ----------------------------------------------------------
// set player color
params [["_color", "MAIN"]];
LOG(" setTeamColor started");
LOG_1(" setTeamColor Color: %1", _color);
_name = name player;
player assignTeam _color;
player setVariable ["CGQC_player_teamColor", _color, true];
// Update the tracker if needed
cgqc_bft_forceUpdate = true;
publicVariable "cgqc_bft_forceUpdate";
LOG(" setTeamColor done");