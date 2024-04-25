#include "script_component.hpp"
// --- setTeamColor ----------------------------------------------------------
// set player color
params [["_color", "MAIN"]];
diag_log "[CGQC_FNC] setTeamColor started";
diag_log format ["[CGQC_FNC] setTeamColor Color: %1", _color];
_name = name player;
player assignTeam _color;
player setVariable ["CGQC_player_teamColor", _color, true];
// Update the tracker if needed
cgqc_bft_forceUpdate = true;
publicVariable "cgqc_bft_forceUpdate";
diag_log "[CGQC_FNC] setTeamColor done";