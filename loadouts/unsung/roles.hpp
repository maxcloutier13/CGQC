case "unsung_basic":{ 
	[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Basic Soldier";
	break;
};
case "unsung_10":{ 
	[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
	[] execVM "\CGQC\loadouts\unsung\loadout_1_0.sqf";
	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-0 Team Leader";
	break;
};
case "unsung_11":{ 
	[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
	[] execVM "\CGQC\loadouts\unsung\loadout_1_1.sqf";
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-1 Radio 2iC";
	break;
};
case "unsung_12":{ 
	[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
	[] execVM "\CGQC\loadouts\unsung\loadout_1_2.sqf";
	["medic"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-2 Medic";
	break;
};