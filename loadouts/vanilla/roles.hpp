case "vanilla_rifleman":{ 
	[] execVM "\CGQC\loadouts\vanilla\loadout_basic.sqf";
	[] execVM "\CGQC\loadouts\vanilla\loadout_rifleman.sqf";
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Vanilla Rifleman";
	break;
};
case "vanilla_tl":{ 
	[] execVM "\CGQC\loadouts\vanilla\loadout_basic.sqf";
	[] execVM "\CGQC\loadouts\vanilla\loadout_tl.sqf";
	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Vanilla TeamLeader";
	break;
};