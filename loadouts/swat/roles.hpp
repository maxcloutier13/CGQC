// SWAT ------------------------------------------

case "swat_assaulter":{
	[player, "assault", "swat_mp5sd6"] call CGQC_ldt_swat_variants;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};
case "swat_assaulter_badger":{
	[player, "assault", "swat_blk"] call CGQC_ldt_swat_variants;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};
case "swat_assaulter_mp5k":{
	[player, "assault", "swat_mp5k"] call CGQC_ldt_swat_variants;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};
case "swat_assaulter_scar":{
	[player, "assault", "swat_scarsc"] call CGQC_ldt_swat_variants;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};
case "swat_assaulter_mp5":{
	[player, "assault", "swat_mp5a5"] call CGQC_ldt_swat_variants;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};
case "swat_assaulter_mp510":{
	[player, "assault", "swat_mp510"] call CGQC_ldt_swat_variants;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};
case "swat_assaulter_p90":{
	[player, "assault", "swat_p90"] call CGQC_ldt_swat_variants;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};
case "swat_assaulter_416":{
	[player, "assault", "swat_416"] call CGQC_ldt_swat_variants;
	["inf"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Assaulter";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};

case "swat_medic":{
	[player, "medic", "swat_mp7"] call CGQC_ldt_swat_variants;
	["med"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Medic";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 2;
};
case "swat_breacher":{
	[player, "breacher", "swat_shotgun"] call CGQC_ldt_swat_variants;
	["eng"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Breacher";
	cgqc_player_roleType = "Engineer";
	cgqc_player_role_optic = 2;
};
case "swat_eod":{
	[player, "eod", "swat_mp5a5"] call CGQC_ldt_swat_variants;
	["eng"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Breacher";
	cgqc_player_roleType = "Engineer";
	cgqc_player_role_optic = 2;
};

case "swat_sniper_carbine":{
	[player, "sniper", "swat_socom"] call CGQC_ldt_swat_variants;
	["recon"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
	cgqc_player_role_optic = 5;
};
case "swat_sniper":{
	[player, "sniper", "swat_m24"] call CGQC_ldt_swat_variants;
	["recon"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
	cgqc_player_role_optic = 5;
};
case "swat_sniper_psg":{
	[player, "sniper", "swat_psg1"] call CGQC_ldt_swat_variants;
	["recon"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
	cgqc_player_role_optic = 5;
};
case "swat_sniper_awm":{
	[player, "sniper", "swat_awm"] call CGQC_ldt_swat_variants;
	["recon"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
	cgqc_player_role_optic = 5;
};


case "swat_drone":{
	[player, "drone", "swat_mp5k"] call CGQC_ldt_swat_variants;
	["recon"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Drone Operator";
	cgqc_player_roleType = "Recon";
	cgqc_player_role_optic = 5;
};
case "swat_tl":{
	[player, "tl", "swat_mp5n"] call CGQC_ldt_swat_variants;
	["tl"] spawn CGQC_fnc_switchPerks;
	["tl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Tactical Team Leader";
	cgqc_player_roleType = "TL";
	cgqc_player_role_optic = 6;
};
case "swat_hq":{
	[player, "hq", "swat_p90"] call CGQC_ldt_swat_variants;
	["hq"] spawn CGQC_fnc_switchPerks;
	["hq"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Officer in Command";
	cgqc_player_roleType = "HQ";
	cgqc_player_role_optic = 6;
};
case "swat_rcmp":{
	[player, "rcmp", "none"] call CGQC_ldt_swat_others;
	cgqc_player_role = "RCMP Officer";
	cgqc_player_roleType = "TL";
	cgqc_player_role_optic = 6;
};
case "swat_emt":{
	[player, "emt", "none"] call CGQC_ldt_swat_others;
	["med"] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Paramedic";
	cgqc_player_roleType = "TL";
	cgqc_player_role_optic = 6;
};
case "swat_fto":{
	[player, "fto", "none"] call CGQC_ldt_swat_others;
	["HQ"] spawn CGQC_fnc_switchPerks;
	["HQ"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Field Training Officer";
	cgqc_player_roleType = "HQ";
	cgqc_player_role_optic = 6;
};