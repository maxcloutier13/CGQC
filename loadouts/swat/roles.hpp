// SWAT ------------------------------------------
case "swat_assaulter":{
	[] call CGQC_ldt_swat_assault;
	["inf"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Swat - Assaulter";

};
case "swat_breacher":{
	[] call CGQC_ldt_swat_breacher;
	["eng"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Swat - Breacher";

};
case "swat_sniper":{
	[] call CGQC_ldt_swat_sniper;
	["recon"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Swat - Sniper";

};
case "swat_tl":{
	[] call CGQC_ldt_swat_tl;
	["tl"] call cgqc_fnc_switchPerks;
	["tl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Swat - Team Leader";

};