//   Reset voice
FW_Acre_Volume_Value = 0.5; 
[{call acre_api_fnc_isInitialized}, {
	[0.7] call acre_api_fnc_setSelectableVoiceCurve; 
	acre_sys_gui_volumeLevel = FW_Acre_Volume_Value;
}, player] call CBA_fnc_waitUntilAndExecute;
//   Reset volume for players outside vics who are lowered.
if !(isNil "trgBriefCmd_player_lowered") then {
	if (vehicle player == player && trgBriefCmd_player_lowered) then {
		acex_volume_reduction = trgBriefCmd_oldVolume;
		[] call ace_volume_fnc_restoreVolume;
		trgBriefCmd_player_lowered = false;
	};
};
_txt = parseText ("Briefing finished." + "<br/>" + "Volume/Voice restored.");
cgqc_zeus_game_started = true;
hintSilent _txt;
sleep 5;
hintSilent ""; 