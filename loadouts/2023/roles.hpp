#include "\CGQC\script_component.hpp"
// 2023 ------------------------------------------

// Infantry ===============================================================
case "2023_rifle_cqb":{
	[player, "rifleman", "cqb"] call CGQC_ldt_2023_rifleman;
	["inf", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Rifleman";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};

case "2023_rifle_carb":{
	[player, "rifleman", "carbine"] call CGQC_ldt_2023_rifleman;
	["inf", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Rifleman";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};

case "2023_rifle_rifle":{
	[player, "rifleman", "rifle"] call CGQC_ldt_2023_rifleman;
	["inf", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Rifleman";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 3;
};

case "2023_rifle_grenadier":{
	[player, "grenadier", "grenade"] call CGQC_ldt_2023_rifleman;
	["inf", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Grenadier";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 2;
};

// Junior Specialists ===============================================================
case "2023_rifle_shoot":{
	[player, "sharpshooter", "mk12"] call CGQC_ldt_2023_rifleman;
	["inf", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sharpshooter";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 4;
};

case "2023_rifle_life":{
	[player, "lifesaver", "carbine"] call CGQC_ldt_2023_rifleman;
	["lifesaver", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Combat Lifesaver";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 2;
};

case "2023_rifle_eng":{
	[player, "engineer", "carbine"] call CGQC_ldt_2023_rifleman;
	["eng", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Combat Engineer";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};

// Medic ===============================================================
case "2023_medic":{
	[player, "medic", "carbine"] call CGQC_ldt_2023_medic;
	["med", true, true] spawn CGQC_fnc_switchPerks;
	["medic"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Team Medic";
	player setVariable ["cgqc_player_roleType", "Medic", true];
	cgqc_player_role_optic = 3;
};

// Engineer ===============================================================
case "2023_eng":{
	[player, "engineer", "carbine"] call CGQC_ldt_2023_eng;
	["eng", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Engineer";
	player setVariable ["cgqc_player_roleType", "Engineer", true];
	cgqc_player_role_optic = 2;
};

case "2023_eng_saboteur":{
	[player, "saboteur", "carbine"] call CGQC_ldt_2023_eng;
	["eng", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Demolition Specialist";
	player setVariable ["cgqc_player_roleType", "Engineer", true];
	cgqc_player_role_optic = 2;
};

// MG ===============================================================
case "2023_lmg":{
	[player, "lmg", "mk46"] call CGQC_ldt_2023_mg;
	["mg", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "LMG";
	player setVariable ["cgqc_player_roleType", "MG", true];
	cgqc_player_role_optic = 2;
};

case "2023_hmg":{
	[player, "hmg", "mk48"] call CGQC_ldt_2023_mg;
	["mg", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "HMG";
	player setVariable ["cgqc_player_roleType", "MG", true];
	cgqc_player_role_optic = 2;
};

case "2023_autorifle":{
	[player, "autorifle", "m27"] call CGQC_ldt_2023_mg;
	["mg", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Autorifleman";
	player setVariable ["cgqc_player_roleType", "MG", true];
	cgqc_player_role_optic = 2;
};

case "2023_lwmmg":{
	[player, "lwmmg", "lwmmg"] call CGQC_ldt_2023_mg;
	["mg", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "LWMMG";
	player setVariable ["cgqc_player_roleType", "MG", true];
	cgqc_player_role_optic = 3;
};

// AT ===============================================================
case "2023_at_maaws":{
	[player, "maaws", "m4_elcan"] call CGQC_ldt_2023_at;
	["at", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "AT/MAAWS";
	player setVariable ["cgqc_player_roleType", "AT", true];
	cgqc_player_role_optic = 1;
};

case "2023_at_javelin":{
	[player, "javelin", "m4_elcan"] call CGQC_ldt_2023_at;
	["at", true, true] spawn CGQC_fnc_switchPerks;
	["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "AT/Javelin";
	player setVariable ["cgqc_player_roleType", "AT", true];
	cgqc_player_role_optic = 1;
};

// Recon ===============================================================

case "2023_sniper":{
	[player, "sniper", "m200"] call CGQC_ldt_2023_recon;
	["sniper", true, true] spawn CGQC_fnc_switchPerks;
	["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 5;
};

case "2023_sniper_ebr":{
	[player, "sniper", "m1aebr"] call CGQC_ldt_2023_recon;
	["sniper", true, true] spawn CGQC_fnc_switchPerks;
	["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 5;
};

case "2023_spotter":{
	[player, "spotter", "mk12"] call CGQC_ldt_2023_recon;
	["sniper", true, true] spawn CGQC_fnc_switchPerks;
	["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Spotter";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 5;
};

case "2023_drone":{
	[player, "drone", "hk416_elcan"] call CGQC_ldt_2023_recon;
	["drone", true, true] spawn CGQC_fnc_switchPerks;
	["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Drone Operator";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 5;
};

// Pilot ===============================================================
case "2023_h_pilot":{
	[player, "h_pilot", "p90"] call CGQC_ldt_2023_pilot;
	["heli", true, true] spawn CGQC_fnc_switchPerks;
	["pilot"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Helicopter Pilot";
	player setVariable ["cgqc_player_roleType", "Air", true];
	cgqc_player_role_optic = 1;
};

case "2023_h_crew":{
	[player, "h_crew", "p90"] call CGQC_ldt_2023_pilot;
	["heli_crew", true, true] spawn CGQC_fnc_switchPerks;
	["pilot"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Helicopter Crew";
	player setVariable ["cgqc_player_roleType", "Air", true];
	cgqc_player_role_optic = 1;
};

// Driver ===============================================================
case "2023_t_driver":{
	[player, "t_driver", "p90"] call CGQC_ldt_2023_driver;
	["driver", true, true] spawn CGQC_fnc_switchPerks;
	["driver"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Tank Driver";
	player setVariable ["cgqc_player_roleType", "Armor", true];
	cgqc_player_role_optic = 1;
};

case "2023_t_crew":{
	[player, "t_crew", "p90"] call CGQC_ldt_2023_driver;
	["tank_crew", true, true] spawn CGQC_fnc_switchPerks;
	["driver"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Tank Crew";
	player setVariable ["cgqc_player_roleType", "Armor", true];
	cgqc_player_role_optic = 1;
};

// Command ===============================================================
case "2023_hq":{
	[player, "hq", "m4"] call CGQC_ldt_2023_command;
	["hq", true, true] spawn CGQC_fnc_switchPerks;
	["hq"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "HeadQuarters";
	player setVariable ["cgqc_player_roleType", "HQ", true];
	cgqc_player_role_optic = 6;
};

case "2023_sl":{
	[player, "sl", "carbine"] call CGQC_ldt_2023_command;
	["sl", true, true] spawn CGQC_fnc_switchPerks;
	["sl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Squad Leader";
	player setVariable ["cgqc_player_roleType", "HQ", true];
	cgqc_player_role_optic = 6;
};
case "2023_xo":{
	[player, "xo", "carbine"] call CGQC_ldt_2023_command;
	["sl", true, true] spawn CGQC_fnc_switchPerks;
	["sl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Exective Officer";
	player setVariable ["cgqc_player_roleType", "HQ", true];
	cgqc_player_role_optic = 6;
};

case "2023_tl":{
	[player, "tl", "carbine"] call CGQC_ldt_2023_command;
	["tl", true, true] spawn CGQC_fnc_switchPerks;
	["tl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Team Leader";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 4;
};

case "2023_jtac":{
	[player, "jtac", "mk12"] call CGQC_ldt_2023_command;
	["recon", true, true] spawn CGQC_fnc_switchPerks;
	["jtac"] call CGQC_fnc_getRadioPresets;
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 6;
};