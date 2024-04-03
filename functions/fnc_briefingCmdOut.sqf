//Force lower voice level on everyone outside zone

[player, "discreet"] call CGQC_fnc_setVoiceVolume;

if (vehicle player == player && trgBriefCmd_player_lowered) then {
	acex_volume_reduction = trgBriefCmd_oldVolume;
	[] call ace_volume_fnc_restoreVolume;
	trgBriefCmd_player_lowered = false;
};
_txt = parseText ("Leaders Briefing in progress." + "<br/>" + "Your voice volume is reduced.");
hintSilent _txt;