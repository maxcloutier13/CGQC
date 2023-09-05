if (!trgBriefCmd_player_lowered) then {
	trgBriefCmd_oldVolume = acex_volume_reduction;
	acex_volume_reduction = 9;
	[] call ace_volume_fnc_lowerVolume;
	[player, "normal"] call CGQC_fnc_setVoiceVolume;
trgBriefCmd_player_lowered = true;
[format["<img size= '1' style='vertical-align:bottom' shadow='false' image='\cgqc\textures\icon_sound_off.paa'/>"]
		, 1.05, 0.2, 4, 2] spawn BIS_fnc_dynamicText;
hintSilent "Commanders Briefing";