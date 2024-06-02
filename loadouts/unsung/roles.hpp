case "unsung_basic":{
	[] call CGQC_loadout_unsungBasic;
	["inf"] call cgqc_fnc_switchPerks;
	["nam_basic", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Basic Soldier";
	cgqc_player_roleType = "Infantry";
};
// Command
case "unsung_10":{
	[] call CGQC_loadout_unsungBasic;
	["1-0"] call CGQC_loadout_unsungLeader;
	["tl", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-0 Team Leader";
	cgqc_player_roleType = "HQ";
};
case "unsung_11":{
	[] call CGQC_loadout_unsungBasic;
	["1-1"] call CGQC_loadout_unsungLeader;
	["mg", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-1 Radio Operator";
	cgqc_player_roleType = "HQ";
};
case "unsung_12":{
	[] call CGQC_loadout_unsungBasic;
	["1-2"] call CGQC_loadout_unsungLeader;
	["medic", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "1-2 Medic";
	cgqc_player_roleType = "Medic";
};
// Infantry
case "inf_car15":{
	[] call CGQC_loadout_unsungBasic;
	["inf_car15"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: CAR15";
	cgqc_player_roleType = "Infantry";
};

case "inf_car15_short":{
	[] call CGQC_loadout_unsungBasic;
	["inf_car15_short"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: CAR15 Shorty";
	cgqc_player_roleType = "Infantry";
};

case "inf_ak":{
	[] call CGQC_loadout_unsungBasic;
	["inf_ak"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: AK";
	cgqc_player_roleType = "Infantry";
};
case "inf_m2":{
	[] call CGQC_loadout_unsungBasic;
	["inf_m2"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: M2";
	cgqc_player_roleType = "Infantry";
};
case "inf_m14":{
	[] call CGQC_loadout_unsungBasic;
	["inf_m14"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: M14";
	cgqc_player_roleType = "Infantry";
};
case "inf_thom":{
	[] call CGQC_loadout_unsungBasic;
	["inf_thom"] call CGQC_loadout_unsungInfantry;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Rifleman: Thompson";
	cgqc_player_roleType = "Infantry";
};

// Specialists
case "spec_pointman":{
	[] call CGQC_loadout_unsungBasic;
	["spec_pointman"] call CGQC_loadout_unsungSpecialist;
	["nam_recon", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Pointman";
	cgqc_player_roleType = "Recon";
};
case "spec_mg":{
	[] call CGQC_loadout_unsungBasic;
	["spec_mg"] call CGQC_loadout_unsungSpecialist;
	["mg", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "MG: RPD";
	cgqc_player_roleType = "Infantry";
};
case "spec_marksman":{
	[] call CGQC_loadout_unsungBasic;
	["spec_marksman"] call CGQC_loadout_unsungSpecialist;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Marksman";
	cgqc_player_roleType = "Infantry";
};
case "spec_sniper":{
	[] call CGQC_loadout_unsungBasic;
	["spec_sniper"] call CGQC_loadout_unsungSpecialist;
	["nam_recon", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Sniper";
	cgqc_player_roleType = "Recon";
};
case "spec_saboteur":{
	[] call CGQC_loadout_unsungBasic;
	["spec_saboteur"] call CGQC_loadout_unsungSpecialist;
	["eng", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Saboteur";
	cgqc_player_roleType = "Engineer";
};

// Driver/pilots
case "vic_driver":{
	[] call CGQC_loadout_unsungBasic;
	["vic_driver"] call CGQC_loadout_unsungVehicles;
	["driver", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Tank Driver";
	cgqc_player_roleType = "Armor";
};
case "vic_crew":{
	[] call CGQC_loadout_unsungBasic;
	["vic_crew"] call CGQC_loadout_unsungVehicles;
	["tank_crew", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Tank Driver";
	cgqc_player_roleType = "Armor";
};
case "vic_helipilot":{
	[] call CGQC_loadout_unsungBasic;
	["vic_helipilot"] call CGQC_loadout_unsungVehicles;
	["heli", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	gqc_player_role = "Helicopter Pilot";
	cgqc_player_roleType = "Air";
};
case "vic_helicrew":{
	[] call CGQC_loadout_unsungBasic;
	["vic_helicrew"] call CGQC_loadout_unsungVehicles;
	["heli_crew", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Helicopter Crew";
	cgqc_player_roleType = "Air";
};
case "vic_covey":{
	[] call CGQC_loadout_unsungBasic;
	["vic_covey"] call CGQC_loadout_unsungVehicles;
	["heli", false] call cgqc_fnc_switchPerks;
	["defaultLR"] call CGQC_fnc_setRadios;
	cgqc_player_role = "Covey Rider";
	cgqc_player_roleType = "Air";
};