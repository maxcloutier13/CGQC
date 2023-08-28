case "unsung_basic":{ 
	_loadoutBasic = [] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Basic Soldier";
	break;
};
case "unsung_10":{ 
	_loadoutBasic = [] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\unsung\loadout_1_0.sqf";
	waitUntil {scriptDone _loadoutRole};
	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-0 Team Leader";
	break;
};
case "unsung_11":{ 
	_loadoutBasic = [] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\unsung\loadout_1_1.sqf";
	waitUntil {scriptDone _loadoutRole};
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-1 Radio 2iC";
	break;
};
case "unsung_12":{ 
	_loadoutBasic = [] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\unsung\loadout_1_2.sqf";
	waitUntil {scriptDone _loadoutRole};
	["medic"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "1-2 Medic";
	break;
};