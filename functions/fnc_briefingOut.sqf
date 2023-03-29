//Force lower voice level on everyone outside zone
[0.2] call acre_api_fnc_setSelectableVoiceCurve;
if (vehicle player == player && trgBrief_player_lowered) then {
	acex_volume_reduction = trgBrief_oldVolume;
	[] call ace_volume_fnc_restoreVolume;
	trgBrief_player_lowered = false;
};
hintSilent "Briefing en cours. Votre volume de voix est réduit.";