// --- mapShare_list ----------------------------------------------------------
// Shows list of players close enough to share map markers
_nearbyEntities = [];
_players = "";
cgqc_zeus_mapRestricted_txt = "";

if (jib_restrictmarkers_enabled) then {
	if (!cgqc_zeus_mapRestricted_txt_on && cgqc_intro_done) then {
		if (vehicle player == player) then {
			//Get list of players within 5m
			if (cgqc_state_briefing || !cgqc_zeus_mapRestricted) then {
				//Everyone sees your map.
				cgqc_zeus_mapRestricted_txt = parseText ("Map is shared"  + "<br/>" + "with everyone");
			}else{
				//Sharing is limited
				_nearbyEntities = player nearEntities ["CAManBase", 5]; // Find players
				_nearbyEntities = _nearbyEntities - [player];
				_nearbyPlayers = _nearbyEntities  arrayIntersect [] call CGQC_int_allHumanPlayers;
				if (count _nearbyPlayers > 0) then {
					cgqc_zeus_mapRestricted_txt = "-- Shared with --<br/>";
					{
						cgqc_zeus_mapRestricted_txt = cgqc_zeus_mapRestricted_txt + name _x + "<br/>";
					} forEach _nearbyPlayers;
					cgqc_zeus_mapRestricted_txt = parseText(cgqc_zeus_mapRestricted_txt);
				}else{
					cgqc_zeus_mapRestricted_txt = parseText ("Alone"  + "<br/>" + "Map Private");
				};
			};
		} else {
			cgqc_zeus_mapRestricted_txt = parseText ("Map is Shared"  + "<br/>" + "in Vehicle");
		};
		[cgqc_zeus_mapRestricted_txt, 0.9, 0.5, 5, 0] spawn BIS_fnc_dynamicText;
		[] spawn {
			sleep 5;
			cgqc_zeus_mapRestricted_txt_on = false;
		};
	};
};