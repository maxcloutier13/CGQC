case "unsung_basic":{
	[] call CGQC_loadout_unsungBasic;
	["inf"] spawn CGQC_fnc_switchPerks;
	["nam_basic", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Basic Soldier";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};
// Command
case "unsung_10":{
	[] call CGQC_loadout_unsungBasic;
	["1-0"] call CGQC_loadout_unsungLeader;
	["tl", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-0 Team Leader";
	player setVariable ["cgqc_player_roleType", "HQ", true];
	cgqc_player_role_optic = 6;
};
case "unsung_11":{
	[] call CGQC_loadout_unsungBasic;
	["1-1"] call CGQC_loadout_unsungLeader;
	["mg", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-1 Radio Operator";
	player setVariable ["cgqc_player_roleType", "HQ", true];
	cgqc_player_role_optic = 1;
};
case "unsung_12":{
	[] call CGQC_loadout_unsungBasic;
	["1-2"] call CGQC_loadout_unsungLeader;
	["medic", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-2 Medic";
	player setVariable ["cgqc_player_roleType", "Medic", true];
	cgqc_player_role_optic = 1;
};
// Infantry
case "inf_car15":{
	[] call CGQC_loadout_unsungBasic;
	["inf_car15"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: CAR15";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};

case "inf_car15_short":{
	[] call CGQC_loadout_unsungBasic;
	["inf_car15_short"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: CAR15 Shorty";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};

case "inf_ak":{
	[] call CGQC_loadout_unsungBasic;
	["inf_ak"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: AK";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};
case "inf_m2":{
	[] call CGQC_loadout_unsungBasic;
	["inf_m2"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: M2";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};
case "inf_m14":{
	[] call CGQC_loadout_unsungBasic;
	["inf_m14"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: M14";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};
case "inf_thom":{
	[] call CGQC_loadout_unsungBasic;
	["inf_thom"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: Thompson";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 1;
};

// Specialists
case "spec_pointman":{
	[] call CGQC_loadout_unsungBasic;
	["spec_pointman"] call CGQC_loadout_unsungSpecialist;
	["nam_recon", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Pointman";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 1;
};
case "spec_mg":{
	[] call CGQC_loadout_unsungBasic;
	["spec_mg"] call CGQC_loadout_unsungSpecialist;
	["mg", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "MG: RPD";
	player setVariable ["cgqc_player_roleType", "MG", true];
	cgqc_player_role_optic = 1;
};
case "spec_marksman":{
	[] call CGQC_loadout_unsungBasic;
	["spec_marksman"] call CGQC_loadout_unsungSpecialist;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Marksman";
	player setVariable ["cgqc_player_roleType", "Infantry", true];
	cgqc_player_role_optic = 5;
};
case "spec_sniper":{
	[] call CGQC_loadout_unsungBasic;
	["spec_sniper"] call CGQC_loadout_unsungSpecialist;
	["nam_recon", false, true] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Sniper";
	player setVariable ["cgqc_player_roleType", "Recon", true];
	cgqc_player_role_optic = 5;
};
case "spec_saboteur":{
	[] call CGQC_loadout_unsungBasic;
	["spec_saboteur"] call CGQC_loadout_unsungSpecialist;
	["eng", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Saboteur";
	player setVariable ["cgqc_player_roleType", "Engineer", true];
	cgqc_player_role_optic = 1;
};

// Driver/pilots
case "vic_driver":{
	[] call CGQC_loadout_unsungBasic;
	["vic_driver"] call CGQC_loadout_unsungVehicles;
	["driver", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Tank Driver";
	player setVariable ["cgqc_player_roleType", "Armor", true];
	cgqc_player_role_optic = 1;
};
case "vic_crew":{
	[] call CGQC_loadout_unsungBasic;
	["vic_crew"] call CGQC_loadout_unsungVehicles;
	["tank_crew", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Tank Driver";
	player setVariable ["cgqc_player_roleType", "Armor", true];
	cgqc_player_role_optic = 1;
};
case "vic_helipilot":{
	[] call CGQC_loadout_unsungBasic;
	["vic_helipilot"] call CGQC_loadout_unsungVehicles;
	["heli", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	gqc_player_role = "Helicopter Pilot";
	player setVariable ["cgqc_player_roleType", "Air", true];
	cgqc_player_role_optic = 1;
};
case "vic_helicrew":{
	[] call CGQC_loadout_unsungBasic;
	["vic_helicrew"] call CGQC_loadout_unsungVehicles;
	["heli_crew", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Helicopter Crew";
	player setVariable ["cgqc_player_roleType", "Air", true];
	cgqc_player_role_optic = 1;
};
case "vic_covey":{
	[] call CGQC_loadout_unsungBasic;
	["vic_covey"] call CGQC_loadout_unsungVehicles;
	["heli", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Covey Rider";
	player setVariable ["cgqc_player_roleType", "Air", true];
	cgqc_player_role_optic = 6;
};