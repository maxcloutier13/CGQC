case "unsung_basic":{
	[] call CGQC_loadout_unsungBasic;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Basic Soldier";
	cgqc_player_roleType = "Infantry";
};
case "unsung_10":{
	[] call CGQC_loadout_unsungBasic;
	["1-0"] call CGQC_loadout_unsungLeader;
	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-0 Team Leader";
	cgqc_player_roleType = "HQ";
};
case "unsung_11":{
	[] call CGQC_loadout_unsungBasic;
	["1-1"] call CGQC_loadout_unsungLeader;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-1 Radio 2iC";
	cgqc_player_roleType = "Infantry";
};
case "unsung_12":{
	[] call CGQC_loadout_unsungBasic;
	["1-2"] call CGQC_loadout_unsungLeader;
	["medic"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-2 Medic";
	cgqc_player_roleType = "Medic";
};
case "unsung_car15":{

	[] call CGQC_loadout_unsungBasic;
	["unsung_car15"] call CGQC_loadout_unsungInfantry;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Rifleman: CAR15";
	cgqc_player_roleType = "Infantry";
};
case "unsung_m14":{
	[] call CGQC_loadout_unsungBasic;
	["unsung_m14"] call CGQC_loadout_unsungInfantry;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Marksman";
	cgqc_player_roleType = "Infantry";
};
case "unsung_rpd":{
	[] call CGQC_loadout_unsungBasic;
	["unsung_rpd"] call CGQC_loadout_unsungInfantry;
	["mg"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "MG: RPD";
	cgqc_player_roleType = "Infantry";
};
case "unsung_m40":{
	[] call CGQC_loadout_unsungBasic;
	["unsung_m40"] call CGQC_loadout_unsungInfantry;
	["recon"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
};
case "unsung_sab":{
	[] call CGQC_loadout_unsungBasic;
	["unsung_sab"] call CGQC_loadout_unsungInfantry;
	["eng"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Saboteur";
	cgqc_player_roleType = "Engineer";
};