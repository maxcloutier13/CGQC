 case "swat_assaulter":{
	_loadoutBasic = [] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\2023\loadout_swat_assaulter.sqf";
	waitUntil {scriptDone _loadoutRole};

	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Assaulter";
	break;
};
case "swat_breacher":{
	_loadoutBasic = [] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\2023\loadout_swat_breacher.sqf";
	waitUntil {scriptDone _loadoutRole};

	["eng"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Breacher";
	break;
};
case "swat_sniper":{
	_loadoutBasic = [] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\2023\loadout_swat_sniper.sqf";
	waitUntil {scriptDone _loadoutRole};

	["recon"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Sniper";
	break;
};
case "swat_tl":{
	_loadoutBasic = [] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
	waitUntil {scriptDone _loadoutBasic};
	_loadoutRole = [] execVM "\CGQC\loadouts\2023\loadout_swat_tl.sqf";
	waitUntil {scriptDone _loadoutRole};

	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Team Leader";
	break;
};