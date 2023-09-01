// 2023 ------------------------------------------
case "2023_hq":{
	[] call CGQC_ldt_2023_hq;
	["hq"] call cgqc_fnc_switchPerks;
	["hq"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "HeadQuarters";
	cgqc_player_roleType = "Command";
	break;
};
case "2023_sl":{
	[] call CGQC_ldt_2023_sl;
	["sl"] call cgqc_fnc_switchPerks;
	["sl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Squad Leader";
	cgqc_player_roleType = "Command";
	break;
};
case "2023_tl":{
	[] call CGQC_ldt_2023_tl;
	["tl"] call cgqc_fnc_switchPerks;
	["tl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Team Leader";
	cgqc_player_roleType = "Command";
	break;
};
// SWAT ------------------------------------------
case "swat_assaulter":{
	[] call CGQC_ldt_swat_assault;
	["inf"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Swat - Assaulter";
	break;
};
case "swat_breacher":{
	[] call CGQC_ldt_swat_breacher;
	["eng"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Swat - Breacher";
	break;
};
case "swat_sniper":{
	[] call CGQC_ldt_swat_sniper;
	["recon"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Swat - Sniper";
	break;
};
case "swat_tl":{
	[] call CGQC_ldt_swat_tl;
	["tl"] call cgqc_fnc_switchPerks;
	["tl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Swat - Team Leader";
	break;
};

