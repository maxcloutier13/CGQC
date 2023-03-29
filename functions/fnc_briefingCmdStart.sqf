// --- Briefing Cone ----------------------------------------------------------
// Handles the cone of silence for briefings
trgBriefCmd_units = [];
trgBriefCmd_player_lowered = false;
publicVariable "trgBriefCmd_player_lowered";
while {cgqc_zeus_briefingCmd} do {
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
	} forEach allPlayers;
	sleep 1;
}; 