#include "\CGQC\script_component.hpp"
// --- Briefing in ----------------------------------------------------------
// Handles the cone of silence for briefings
LOG("briefingIn started");

if (!trgBrief_player_lowered) then {
	trgBrief_oldVolume = acex_volume_reduction;
	acex_volume_reduction = 9.5;
	[] call ace_volume_fnc_lowerVolume;
	[player, "default"] call CGQC_fnc_setVoiceVolume;
};
trgBrief_player_lowered = true;
[format["<img size= '1' style='vertical-align:bottom' shadow='false' image='\cgqc\textures\icon_sound_off.paa'/>"]
		, 1.05, 0.2, 4, 2] spawn BIS_fnc_dynamicText;
_txt = parseText ("Briefing in progress..." + "<br/>" + "External volume reduced.");
hintSilent _txt;

LOG("briefingIn done");