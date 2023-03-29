//   Reset voice
[0.7] call acre_api_fnc_setSelectableVoiceCurve;
//   Reset volume for players outside vics who are lowered.
if !(isNil "trgBrief_player_lowered") then {
	if (vehicle player == player && trgBrief_player_lowered) then {
		acex_volume_reduction = trgBrief_oldVolume;
		[] call ace_volume_fnc_restoreVolume;
		trgBrief_player_lowered = false;
	};
};
hint "Briefing terminé. Volume/Voix normal.";
sleep 5;
hintSilent "";