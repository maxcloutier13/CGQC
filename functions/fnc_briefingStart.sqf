// --- Briefing Cone ----------------------------------------------------------
// Handles the cone of silence for briefings
trgBrief_units = [];
trgBrief_player_lowered = false;
publicVariable "trgBrief_player_lowered";
while {missionNamespace getVariable "CGQC_gamestate_briefing_full"} do {
	{
		if (_x in list cgqc_briefing_trg) then {
			trgBrief_current = _x;
			// Player is in! Run that shit
			['\cgqc\functions\fnc_briefingIn.sqf'] remoteExec ['execVM', vehicle _x];
		}else {
			//Remote this part
			['\cgqc\functions\fnc_briefingOut.sqf'] remoteExec ['execVM', vehicle _x];
		};
	sleep 0.5;
	} forEach [] call CGQC_int_allHumanPlayers;
	sleep 1;
};
//Briefing is done

//['\cgqc\functions\fnc_briefingStop.sqf'] remoteExec ['execVM', vehicle _x];
