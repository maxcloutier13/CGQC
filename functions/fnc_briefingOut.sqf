//Force lower voice level on everyone outside zone
FW_Acre_Volume_Value = 0.25; 
[{call acre_api_fnc_isInitialized}, {
	[0.2] call acre_api_fnc_setSelectableVoiceCurve; 
	acre_sys_gui_volumeLevel = FW_Acre_Volume_Value;
}, player] call CBA_fnc_waitUntilAndExecute;
if (vehicle player == player && trgBrief_player_lowered) then {
	acex_volume_reduction = trgBrief_oldVolume;
	[] call ace_volume_fnc_restoreVolume;
	trgBrief_player_lowered = false;
};
_txt = parseText ("Briefing!!!" + "<br/>" + "You are too far.");
hintSilent _txt;