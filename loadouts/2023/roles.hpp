// 2023 ------------------------------------------



// Infantry ===============================================================


case "2023_rifle_cqb":{
	[player, "rifleman", "cqb"] call CGQC_ldt_2023_rifleman;
	["inf"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Rifleman";
	cgqc_player_roleType = "Infantry";
};

case "2023_rifle_carb":{
	[player, "rifleman", "carbine"] call CGQC_ldt_2023_rifleman;
	["inf"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Rifleman";
	cgqc_player_roleType = "Infantry";
};

case "2023_rifle_rifle":{
	[player, "rifleman", "rifle"] call CGQC_ldt_2023_rifleman;
	["inf"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Rifleman";
	cgqc_player_roleType = "Infantry";
};

case "2023_rifle_grenadier":{
	[player, "grenadier", "grenade"] call CGQC_ldt_2023_rifleman;
	["inf"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Grenadier";
	cgqc_player_roleType = "Infantry";
};

// Junior Specialists ===============================================================
case "2023_rifle_shoot":{
	[player, "sharpshooter", "417"] call CGQC_ldt_2023_rifleman;
	["recon"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sharpshooter";
	cgqc_player_roleType = "Infantry";
};

case "2023_rifle_life":{
	[player, "lifesaver", "carbine"] call CGQC_ldt_2023_rifleman;
	["lifesaver"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Combat Lifesaver";
	cgqc_player_roleType = "Infantry";
};

case "2023_rifle_eng":{
	[player, "engineer", "carbine"] call CGQC_ldt_2023_rifleman;
	["eng"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Combat Engineer";
	cgqc_player_roleType = "Infantry";
};

// Medic ===============================================================
case "2023_medic":{
	[player, "medic", "carbine"] call CGQC_ldt_2023_medic;
	["med"] call cgqc_fnc_switchPerks;
	["medic"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Team Medic";
	cgqc_player_roleType = "Medic";
};

// Engineer ===============================================================
case "2023_eng":{
	[player, "engineer", "carbine"] call CGQC_ldt_2023_eng;
	["eng"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Engineer";
	cgqc_player_roleType = "Engineer";
};

case "2023_eng_saboteur":{
	[player, "saboteur", "carbine"] call CGQC_ldt_2023_eng;
	["eng"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Demolition Specialist";
	cgqc_player_roleType = "Engineer";
};

// MG ===============================================================
case "2023_lmg":{
	[player, "lmg", "mk46"] call CGQC_ldt_2023_mg;
	["mg"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "LMG";
	cgqc_player_roleType = "Infantry";
};

case "2023_hmg":{
	[player, "hmg", "mk48"] call CGQC_ldt_2023_mg;
	["mg"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "HMG";
	cgqc_player_roleType = "Infantry";
};

case "2023_autorifle":{
	[player, "autorifle", "m27"] call CGQC_ldt_2023_mg;
	["mg"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Autorifleman";
	cgqc_player_roleType = "Infantry";
};

case "2023_lwmmg":{
	[player, "lwmmg", "lwmmg"] call CGQC_ldt_2023_mg;
	["mg"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "LWMMG";
	cgqc_player_roleType = "Infantry";
};

// AT ===============================================================
case "2023_at_maaws":{
	[player, "maaws", "m4_elcan"] call CGQC_ldt_2023_at;
	["at"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "AT/MAAWS";
	cgqc_player_roleType = "Infantry";
};

case "2023_at_javelin":{
	[player, "javelin", "m4_lpvo"] call CGQC_ldt_2023_at;
	["at"] call cgqc_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "AT/Javelin";
	cgqc_player_roleType = "Infantry";
};

// Recon ===============================================================

case "2023_sniper":{
	[player, "sniper", "m200"] call CGQC_ldt_2023_recon;
	["recon"] call cgqc_fnc_switchPerks;
	["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
};

case "2023_sniper_ebr":{
	[player, "sniper", "m14ebr"] call CGQC_ldt_2023_recon;
	["recon"] call cgqc_fnc_switchPerks;
	["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
};

case "2023_spotter":{
	[player, "spotter", "mk12"] call CGQC_ldt_2023_recon;
	["recon"] call cgqc_fnc_switchPerks;
	["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Spotter";
	cgqc_player_roleType = "Recon";
};

case "2023_drone":{
	[player, "drone", "lpvo"] call CGQC_ldt_2023_recon;
	["recon"] call cgqc_fnc_switchPerks;
	["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Drone Operator";
	cgqc_player_roleType = "Recon";
};

// Pilot ===============================================================
case "2023_h_pilot":{
	[player, "h_pilot", "p90"] call CGQC_ldt_2023_pilot;
	["heli"] call cgqc_fnc_switchPerks;
	["pilot"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Helicopter Pilot";
	cgqc_player_roleType = "Air";
};

case "2023_h_crew":{
	[player, "h_crew", "p90"] call CGQC_ldt_2023_pilot;
	["heli_crew"] call cgqc_fnc_switchPerks;
	["pilot"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Helicopter Crew";
	cgqc_player_roleType = "Air";
};

// Driver ===============================================================
case "2023_t_driver":{
	[player, "t_driver", "p90"] call CGQC_ldt_2023_driver;
	["driver"] call cgqc_fnc_switchPerks;
	["driver"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Tank Driver";
	cgqc_player_roleType = "Armor";
};

case "2023_t_crew":{
	[player, "t_crew", "p90"] call CGQC_ldt_2023_driver;
	["tank_crew"] call cgqc_fnc_switchPerks;
	["driver"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Tank Crew";
	cgqc_player_roleType = "Armor";
};

// Command ===============================================================
case "2023_hq":{
	[player, "hq", "lpvo"] call CGQC_ldt_2023_command;
	["hq"] call cgqc_fnc_switchPerks;
	["hq"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "HeadQuarters";
	cgqc_player_roleType = "HQ";
};

case "2023_sl":{
	[player, "sl", "carbine"] call CGQC_ldt_2023_command;
	["sl"] call cgqc_fnc_switchPerks;
	["sl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Squad Leader";
	cgqc_player_roleType = "HQ";
};
case "2023_xo":{
	[player, "xo", "carbine"] call CGQC_ldt_2023_command;
	["sl"] call cgqc_fnc_switchPerks;
	["sl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Exective Officer";
	cgqc_player_roleType = "HQ";
};

case "2023_tl":{
	[player, "tl", "carbine"] call CGQC_ldt_2023_command;
	["tl"] call cgqc_fnc_switchPerks;
	["tl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Team Leader";
	cgqc_player_roleType = "Infantry";
};

case "2023_jtac":{
	[player, "jtac", "mk12"] call CGQC_ldt_2023_command;
	["recon"] call cgqc_fnc_switchPerks;
	["jtac"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "JTAC";
	cgqc_player_roleType = "Recon";
};