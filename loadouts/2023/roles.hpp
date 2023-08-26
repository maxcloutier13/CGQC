 case "swat_assaulter":{
	[] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
	[] execVM "\CGQC\loadouts\2023\loadout_swat_assaulter.sqf";
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Assaulter";
	break;
};
case "swat_breacher":{
	[] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
	[] execVM "\CGQC\loadouts\2023\loadout_swat_breacher.sqf";
	["eng"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Breacher";
	break;
};
case "swat_sniper":{
	[] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
	[] execVM "\CGQC\loadouts\2023\loadout_swat_sniper.sqf";
	["recon"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Sniper";
	break;
};
case "swat_tl":{
	[] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
	[] execVM "\CGQC\loadouts\2023\loadout_swat_tl.sqf";
	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Team Leader";
	break;
};