case "unsung_basic":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_unsungBasic;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Basic Soldier";

};
case "unsung_10":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_unsungBasic;
	[] call CGQC_loadout_unsung10;
	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-0 Team Leader";

};
case "unsung_11":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_unsungBasic;
	[] call CGQC_loadout_unsung11;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-1 Radio 2iC";

};
case "unsung_12":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_unsungBasic;
	[] call CGQC_loadout_unsung12;
	["medic"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-2 Medic";

};