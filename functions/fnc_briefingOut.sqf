#include "\CGQC\script_component.hpp"
// --- Briefing out ----------------------------------------------------------
//Force lower voice level on everyone outside zone
LOG("briefingOut started");

[player, "discreet"] call CGQC_fnc_setVoiceVolume;

if (vehicle player == player && trgBrief_player_lowered) then {
	acex_volume_reduction = trgBrief_oldVolume;
	[] call ace_volume_fnc_restoreVolume;
	trgBrief_player_lowered = false;
};
_txt = parseText ("Briefing!!!" + "<br/>" + "You are too far.");
hintSilent _txt;

LOG("briefingOut done");