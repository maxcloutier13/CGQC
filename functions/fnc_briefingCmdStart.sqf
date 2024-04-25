#include "script_component.hpp"
// --- Briefing Cone ----------------------------------------------------------
// Handles the cone of silence for briefings
trgBriefCmd_units = [];
trgBriefCmd_player_lowered = false;
publicVariable "trgBriefCmd_player_lowered";
while {missionNamespace getVariable "CGQC_gamestate_1_briefing_leaders"} do {
	{
		if (_x in list cgqc_briefingCmd_trg) then {
			trgBriefCmd_current = _x;
			// Player is in! Run that shit
			['\cgqc\functions\fnc_briefingCmdIn.sqf'] remoteExec ['execVM', vehicle _x];
		}else {
			//Remote this part
			['\cgqc\functions\fnc_briefingCmdOut.sqf'] remoteExec ['execVM', vehicle _x];
		};
	sleep 0.5;
	} forEach [] call CGQC_int_allHumanPlayers;
	sleep 1;
};