#include "script_component.hpp"
//   Reset voice
[player, "default"] call CGQC_fnc_setVoiceVolume;

//   Reset volume for players outside vics who are lowered.
if !(isNil "trgBriefCmd_player_lowered") then {
	if (vehicle player == player && trgBriefCmd_player_lowered) then {
		acex_volume_reduction = trgBriefCmd_oldVolume;
		[] call ace_volume_fnc_restoreVolume;
		trgBriefCmd_player_lowered = false;
	};
};
_txt = parseText ("Leaders Briefing finished." + "<br/>" + "Volume/Voice restored.");
hintSilent _txt;
sleep 5;
hintSilent "";