case "unsung_basic":{
	[] call CGQC_loadout_unsungBasic;
	["inf"] spawn CGQC_fnc_switchPerks;
	["nam_basic", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Basic Soldier";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 1;
};
// Command
case "unsung_10":{
	[] call CGQC_loadout_unsungBasic;
	["1-0"] call CGQC_loadout_unsungLeader;
	["tl", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-0 Team Leader";
	cgqc_player_roleType = "HQ";
	cgqc_player_role_optic = 6;
};
case "unsung_11":{
	[] call CGQC_loadout_unsungBasic;
	["1-1"] call CGQC_loadout_unsungLeader;
	["mg", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-1 Radio Operator";
	cgqc_player_roleType = "HQ";
	cgqc_player_role_optic = 1;
};
case "unsung_12":{
	[] call CGQC_loadout_unsungBasic;
	["1-2"] call CGQC_loadout_unsungLeader;
	["medic", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-2 Medic";
	cgqc_player_roleType = "Medic";
	cgqc_player_role_optic = 1;
};
// Infantry
case "inf_car15":{
	[] call CGQC_loadout_unsungBasic;
	["inf_car15"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: CAR15";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 1;
};

case "inf_car15_short":{
	[] call CGQC_loadout_unsungBasic;
	["inf_car15_short"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: CAR15 Shorty";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 1;
};

case "inf_ak":{
	[] call CGQC_loadout_unsungBasic;
	["inf_ak"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: AK";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 1;
};
case "inf_m2":{
	[] call CGQC_loadout_unsungBasic;
	["inf_m2"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: M2";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 1;
};
case "inf_m14":{
	[] call CGQC_loadout_unsungBasic;
	["inf_m14"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: M14";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 1;
};
case "inf_thom":{
	[] call CGQC_loadout_unsungBasic;
	["inf_thom"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: Thompson";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 1;
};

// Specialists
case "spec_pointman":{
	[] call CGQC_loadout_unsungBasic;
	["spec_pointman"] call CGQC_loadout_unsungSpecialist;
	["nam_recon", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Pointman";
	cgqc_player_roleType = "Recon";
	cgqc_player_role_optic = 1;
};
case "spec_mg":{
	[] call CGQC_loadout_unsungBasic;
	["spec_mg"] call CGQC_loadout_unsungSpecialist;
	["mg", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "MG: RPD";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 1;
};
case "spec_marksman":{
	[] call CGQC_loadout_unsungBasic;
	["spec_marksman"] call CGQC_loadout_unsungSpecialist;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Marksman";
	cgqc_player_roleType = "Infantry";
	cgqc_player_role_optic = 5;
};
case "spec_sniper":{
	[] call CGQC_loadout_unsungBasic;
	["spec_sniper"] call CGQC_loadout_unsungSpecialist;
	["nam_recon", false, true] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
	cgqc_player_role_optic = 5;
};
case "spec_saboteur":{
	[] call CGQC_loadout_unsungBasic;
	["spec_saboteur"] call CGQC_loadout_unsungSpecialist;
	["eng", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Saboteur";
	cgqc_player_roleType = "Engineer";
	cgqc_player_role_optic = 1;
};

// Driver/pilots
case "vic_driver":{
	[] call CGQC_loadout_unsungBasic;
	["vic_driver"] call CGQC_loadout_unsungVehicles;
	["driver", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Tank Driver";
	cgqc_player_roleType = "Armor";
	cgqc_player_role_optic = 1;
};
case "vic_crew":{
	[] call CGQC_loadout_unsungBasic;
	["vic_crew"] call CGQC_loadout_unsungVehicles;
	["tank_crew", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Tank Driver";
	cgqc_player_roleType = "Armor";
	cgqc_player_role_optic = 1;
};
case "vic_helipilot":{
	[] call CGQC_loadout_unsungBasic;
	["vic_helipilot"] call CGQC_loadout_unsungVehicles;
	["heli", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	gqc_player_role = "Helicopter Pilot";
	cgqc_player_roleType = "Air";
	cgqc_player_role_optic = 1;
};
case "vic_helicrew":{
	[] call CGQC_loadout_unsungBasic;
	["vic_helicrew"] call CGQC_loadout_unsungVehicles;
	["heli_crew", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Helicopter Crew";
	cgqc_player_roleType = "Air";
	cgqc_player_role_optic = 1;
};
case "vic_covey":{
	[] call CGQC_loadout_unsungBasic;
	["vic_covey"] call CGQC_loadout_unsungVehicles;
	["heli", false] spawn CGQC_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Covey Rider";
	cgqc_player_roleType = "Air";
	cgqc_player_role_optic = 6;
};