#include "\CGQC\script_component.hpp"
// PMC-T ------------------------------------------
// Command ===============================================================
case "pmct_zeus":{
	[player, "pmct_zeus", "ak12zeus"] call CGQC_ldt_pmct_variants;
	["hq", true, true] spawn CGQC_fnc_switchPerks;
	//["hq"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Zeus";
	player setVariable ["cgqc_player_roleType", "None", true];
	cgqc_player_role_optic = 6;
};
case "pmct_lead":{
	[player, "pmct_lead", "ak12gl"] call CGQC_ldt_pmct_variants;
	["hq", true, true] spawn CGQC_fnc_switchPerks;
	//["hq"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Squad Leader";
	player setVariable ["cgqc_player_roleType", "HQ", true];
	cgqc_player_role_optic = 6;
};
case "pmct_tl":{
	[player, "pmct_tl", "ak12gl"] call CGQC_ldt_pmct_variants;
	["tl", true, true] spawn CGQC_fnc_switchPerks;
	//["tl"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Team Leader";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 4;
};

// Infantry ===============================================================
case "pmct_rifle":{
	[player, "pmct_rifle", "ak12"] call CGQC_ldt_pmct_variants;
	["inf", true, true] spawn CGQC_fnc_switchPerks;
	//["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Rifleman";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 3;
};

case "pmct_gren":{
	[player, "pmct_gren", "ak12gl"] call CGQC_ldt_pmct_variants;
	["inf", true, true] spawn CGQC_fnc_switchPerks;
	//["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Grenadier";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 2;
};


// Junior Specialists ===============================================================
case "pmct_lifesaver":{
	[player, "pmct_lifesaver", "ak12"] call CGQC_ldt_pmct_variants;
	["lifesaver", true, true] spawn CGQC_fnc_switchPerks;
    //["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Combat Lifesaver";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 2;
};


// Medic/Eng ===============================================================
case "pmct_medic":{
	[player, "pmct_medic", "ak12"] call CGQC_ldt_pmct_variants;
	["med", true, true] spawn CGQC_fnc_switchPerks;
	//["medic"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Team Medic";
	player setVariable ["cgqc_player_roleType", "Medic", true];
	cgqc_player_role_optic = 3;
};

case "pmct_eng":{
	[player, "pmct_eng", "ak12"] call CGQC_ldt_pmct_variants;
	["eng", true, true] spawn CGQC_fnc_switchPerks;
	//["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Engineer";
	player setVariable ["cgqc_player_roleType", "Engineer", true];
	cgqc_player_role_optic = 2;
};
case "pmct_eod":{
	[player, "pmct_eod", "ak12short"] call CGQC_ldt_pmct_variants;
	["eng", true, true] spawn CGQC_fnc_switchPerks;
	//["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "EOD";
	player setVariable ["cgqc_player_roleType", "Engineer", true];
	cgqc_player_role_optic = 2;
};

// MG ===============================================================
case "pmct_mg":{
	[player, "pmct_mg", "mg3"] call CGQC_ldt_pmct_variants;
	["mg", true, true] spawn CGQC_fnc_switchPerks;
	//["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "HMG";
	player setVariable ["cgqc_player_roleType", "MG", true];
	cgqc_player_role_optic = 2;
};

case "pmct_autorifleman":{
	[player, "pmct_autorifleman", "rpk12"] call CGQC_ldt_pmct_variants;
	["mg", true, true] spawn CGQC_fnc_switchPerks;
	//["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Autorifleman";
	player setVariable ["cgqc_player_roleType", "MG", true];
	cgqc_player_role_optic = 2;
};

// AT ===============================================================
case "pmct_at":{
	[player, "pmct_at", "ak12"] call CGQC_ldt_pmct_variants;
	["at", true, true] spawn CGQC_fnc_switchPerks;
	//["inf"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "AT RPG7";
	player setVariable ["cgqc_player_roleType", "AT", true];
	cgqc_player_role_optic = 1;
};

// Recon ===============================================================
case "pmct_sniper":{
	[player, "pmct_sniper", "awm"] call CGQC_ldt_pmct_variants;
	["recon", true, true] spawn CGQC_fnc_switchPerks;
	//["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Sniper";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 5;
};

case "pmct_marks":{
	[player, "pmct_marks", "svd"] call CGQC_ldt_pmct_variants;
	["recon", true, true] spawn CGQC_fnc_switchPerks;
	//["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Marksman";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 5;
};

case "pmct_drone":{
	[player, "pmct_drone", "ak12"] call CGQC_ldt_pmct_variants;
	["drone", true, true] spawn CGQC_fnc_switchPerks;
	//["recon"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Drone Operator";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 5;
};

// Pilot ===============================================================

// Driver ===============================================================
case "pmct_driver":{
	[player, "pmct_driver", "ak12short"] call CGQC_ldt_pmct_variants;
	["driver", true, true] spawn CGQC_fnc_switchPerks;
	//["driver"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Tank Driver";
	player setVariable ["cgqc_player_roleType", "Armor", true];
	cgqc_player_role_optic = 1;
};
case "pmct_crew":{
	[player, "pmct_crew", "ak12short"] call CGQC_ldt_pmct_variants;
	["tank_crew", true, true] spawn CGQC_fnc_switchPerks;
	//["driver"] call CGQC_fnc_getRadioPresets;
	cgqc_player_role = "Tank Crew";
	player setVariable ["cgqc_player_roleType", "Armor", true];
	cgqc_player_role_optic = 1;
};