// SWAT ------------------------------------------
case "swat_assaulter":{
	[] call CGQC_ldt_swat_assault;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
};
case "swat_breacher":{
	[] call CGQC_ldt_swat_breacher;
	["eng"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Breacher";
	cgqc_player_roleType = "Engineer";
};
case "swat_sniper":{
	[] call CGQC_ldt_swat_sniper;
	["recon"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
};
case "swat_tl":{
	[] call CGQC_ldt_swat_tl;
	["tl"] spawn CGQC_fnc_switchPerks;
	["tl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Team Leader";
	cgqc_player_roleType = "HQ";
};