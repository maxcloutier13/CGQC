case "unsung_basic":{

	[] call CGQC_loadout_unsungBasic;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Basic Soldier";
	cgqc_player_roleType = "Infantry";
};
case "unsung_10":{

	[] call CGQC_loadout_unsungBasic;
	[] call CGQC_loadout_unsung10;
	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-0 Team Leader";
	cgqc_player_roleType = "HQ";
};
case "unsung_11":{

	[] call CGQC_loadout_unsungBasic;
	[] call CGQC_loadout_unsung11;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-1 Radio 2iC";
	cgqc_player_roleType = "Infantry";
};
case "unsung_12":{

	[] call CGQC_loadout_unsungBasic;
	[] call CGQC_loadout_unsung12;
	["medic"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-2 Medic";
	cgqc_player_roleType = "Medic";
};