// --- mapShare_list ----------------------------------------------------------
// Shows list of players close enough to share map markers
_nearbyEntities = [];
_players = "";
cgqc_zeus_mapRestricted_txt = "";

if (!cgqc_zeus_mapRestricted_txt_on && cgqc_intro_done) then {
	//Get list of players within 5m
	if (cgqc_zeus_briefing || cgqc_zeus_briefingCmd || !cgqc_zeus_mapRestricted) then {
		//Everyone sees your map.
		cgqc_zeus_mapRestricted_txt = parseText ("Map is shared"  + "<br/>" + "with everyone");
	}else{
		//Sharing is limited
		_nearbyEntities = player nearEntities ["CAManBase", 5]; // Find players
		_nearbyPlayers = _nearbyEntities  arrayIntersect allPlayers;
		if (count _nearbyPlayers > 1) then {
			cgqc_zeus_mapRestricted_txt = "-- Shared with --<br/>";
			{
				cgqc_zeus_mapRestricted_txt = cgqc_zeus_mapRestricted_txt + name _x + "<br/>";
			} forEach _nearbyPlayers;
			cgqc_zeus_mapRestricted_txt = parseText(cgqc_zeus_mapRestricted_txt);
		}else{
			cgqc_zeus_mapRestricted_txt = parseText ("Alone"  + "<br/>" + "Map Private");
		};
	}; 
	[cgqc_zeus_mapRestricted_txt, 0.9, 0.5, 5, 0] spawn BIS_fnc_dynamicText;
	[] spawn {
		sleep 5;
		cgqc_zeus_mapRestricted_txt_on = false;
	};
};