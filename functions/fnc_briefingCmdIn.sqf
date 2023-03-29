if (!trgBriefCmd_player_lowered) then {
	trgBriefCmd_oldVolume = acex_volume_reduction;
	acex_volume_reduction = 9;
	[] call ace_volume_fnc_lowerVolume;
	[0.7] call acre_api_fnc_setSelectableVoiceCurve;
};
trgBriefCmd_player_lowered = true;
hintSilent "Commanders Briefing"; 