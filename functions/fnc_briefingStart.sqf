// --- Briefing Cone ----------------------------------------------------------
// Handles the cone of silence for briefings
trgBrief_units = [];
trgBrief_player_lowered = false;
publicVariable "trgBrief_player_lowered";
while {cgqc_zeus_briefing} do {
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
	} forEach allPlayers;
	sleep 1;
};
//Briefing is done

//['\cgqc\functions\fnc_briefingStop.sqf'] remoteExec ['execVM', vehicle _x];
