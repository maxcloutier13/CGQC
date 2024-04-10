//   Reset voice
[player, "default"] call CGQC_fnc_setVoiceVolume;
//   Reset volume for players outside vics who are lowered.
if !(isNil "trgBrief_player_lowered") then {
	if (vehicle player == player && trgBrief_player_lowered) then {
		acex_volume_reduction = trgBrief_oldVolume;
		[] call ace_volume_fnc_restoreVolume;
		trgBrief_player_lowered = false;
	};
};
_txt = parseText ("Briefing finished." + "<br/>" + "Volume/Voice restored.");
hintSilent _txt;
sleep 5;
hintSilent "";