//Force lower voice level on everyone outside zone
[0.2] call acre_api_fnc_setSelectableVoiceCurve;
if (vehicle player == player && trgBriefCmd_player_lowered) then {
	acex_volume_reduction = trgBriefCmd_oldVolume;
	[] call ace_volume_fnc_restoreVolume;
	trgBriefCmd_player_lowered = false;
};
_txt = parseText ("Commanders Briefing in progress." + "<br/>" + "Voice volume is reduced.");
hintSilent _txt; 