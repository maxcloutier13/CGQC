if (!trgBrief_player_lowered) then {
	trgBrief_oldVolume = acex_volume_reduction;
	acex_volume_reduction = 9.5;
	[] call ace_volume_fnc_lowerVolume;
	[0.7] call acre_api_fnc_setSelectableVoiceCurve;
};
trgBrief_player_lowered = true;
hintSilent "Briefing! Volume extérieur réduit.";