case "vanilla_rifleman":{ 
	_loadoutBasic = [] execVM "\CGQC\loadouts\vanilla\loadout_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\vanilla\loadout_rifleman.sqf";
	waitUntil {scriptDone _loadoutRole};
	
	["inf"] spawn cgqc_fnc_switchPerks;
	cgqc_player_role = "Vanilla Rifleman";
	break;
};
case "vanilla_tl":{ 
	_loadoutBasic = [] execVM "\CGQC\loadouts\vanilla\loadout_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\vanilla\loadout_tl.sqf";
	waitUntil {scriptDone _loadoutRole};

	["tl"] spawn cgqc_fnc_switchPerks;
	cgqc_player_role = "Vanilla TeamLeader";
	break;
};