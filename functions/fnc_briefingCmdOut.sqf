//Force lower voice level on everyone outside zone

FW_Acre_Volume_Value = 0.25; 
[{call acre_api_fnc_isInitialized}, {
	[0.2] call acre_api_fnc_setSelectableVoiceCurve; 
	acre_sys_gui_volumeLevel = FW_Acre_Volume_Value;
}, player] call CBA_fnc_waitUntilAndExecute;
if (vehicle player == player && trgBriefCmd_player_lowered) then {
	acex_volume_reduction = trgBriefCmd_oldVolume;
	[] call ace_volume_fnc_restoreVolume;
	trgBriefCmd_player_lowered = false;
};
_txt = parseText ("Commanders Briefing in progress." + "<br/>" + "Your voice volume is reduced.");
hintSilent _txt; 