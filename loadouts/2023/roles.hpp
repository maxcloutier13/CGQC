 case "swat_assaulter":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_2023Swatbasic;
	[] call CGQC_loadout_2023SwatAssault;
	["inf"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Assaulter";
	break;
};
case "swat_breacher":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_2023Swatbasic;
	[] call CGQC_loadout_2023SwatBreacher;
	["eng"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Breacher";
	break;
};
case "swat_sniper":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_2023Swatbasic;
	[] call CGQC_loadout_2023SwatSniper;
	["recon"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Sniper";
	break;
};
case "swat_tl":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_2023Swatbasic;
	[] call CGQC_loadout_2023SwatTL;
	["tl"] call cgqc_fnc_switchPerks;
	cgqc_player_role = "Swat - Team Leader";
	break;
};