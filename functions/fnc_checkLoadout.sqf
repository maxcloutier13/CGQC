// --- checkLoadout ----------------------------------------------------------
// Check if a unit has a fixed loadout and sets it if it's the case
params [["_switch", true]];
_type = typeOf player;
diag_log format ["[CGQC_FNC] checkLoadout %1 started", _type];
_switchRole = "";
_section = 1;
_dive = false;

switch (_type) do {
	// == Training ================================================================
	case "CGQC_Soldat_Base";
	case "CGQC_Officer_Base": {[] call CGQC_fnc_initTraining;};
	// == Vanilla ================================================================
	case "CGQC_units_vanilla_rifleman":{_switchRole = "vanilla_rifleman";};
	case "CGQC_units_vanilla_tl":{_switchRole = "vanilla_tl";};
	// == 2023 ================================================================

    // == Training ================================================================
    case "cgqc_soldat_moderne";
    case "cgqc_officer_moderne": {[] spawn CGQC_fnc_initTraining;};

    // == Infantry ================================================================
    case "CGQC_units_mk1_1_Rifleman_Carbine":{_switchRole = "2023_rifle_carb"};
    case "CGQC_units_mk1_1_Rifleman_full":{_switchRole = "2023_rifle_rifle"};
    case "CGQC_units_mk1_1_Rifleman_grenadier":{_switchRole = "2023_rifle_grenadier"};
    // == Specialists ================================================================
    case "CGQC_units_mk1_3_AT_MAAWS":{_switchRole = "2023_at_maaws"};
    case "CGQC_units_mk1_3_AT_Javelin":{_switchRole = "2023_at_javelin"};
    case "CGQC_units_mk1_2_LMG":{_switchRole = "2023_lmg"};
    case "CGQC_units_mk1_2_HMG":{_switchRole = "2023_hmg"};
    case "CGQC_units_mk1_1_Engineer":{_switchRole = "2023_eng"};
    case "CGQC_units_mk1_1_Medic":{_switchRole = "2023_medic"};
    case "CGQC_units_mk1_2_Marksman":{_switchRole = "2023_marks"};
    // == Recon ================================================================
    case "CGQC_units_mk1_0_Drone_operator":{_switchRole = "2023_drone"};
    case "CGQC_units_mk1_0_JTAC":{_switchRole = "2023_jtac"};
    case "CGQC_units_mk1_2_Sniper":{_switchRole = "2023_sniper"};
    case "CGQC_units_mk1_2_Sniper_ebr":{_switchRole = "2023_sniper_ebr"};
    case "CGQC_units_mk1_2_Spotter":{_switchRole = "2023_spotter"};
    // == Pilots ================================================================
    case "CGQC_units_mk1_4_Pilot_heli":{_switchRole = "2023_h_pilot"};
    case "CGQC_units_mk1_4_crew_heli":{_switchRole = "2023_h_crew"};
    // == Drivers ================================================================
    case "CGQC_units_mk1_4_Tank_Driver":{_switchRole = "2023_t_driver"};
    case "CGQC_units_mk1_4_Tank_Crew":{_switchRole = "2023_t_crew"};
    // == Command ================================================================
    case "CGQC_units_mk1_0_HQ":{_switchRole = "2023_hq"};
    case "CGQC_units_mk1_0_SL":{_switchRole = "2023_sl"};
    case "CGQC_units_mk1_0_TeamLeader_Carbine":{_switchRole = "2023_tl"};
    // == Divers ================================================================
    case "CGQC_units_mk1_5_Diver_TL":{_switchRole = "2023_tl";_dive = true;};
    case "CGQC_units_mk1_5_Diver_sniper":{_switchRole = "2023_sniper";_dive = true;};
    case "CGQC_units_mk1_5_Diver_Spotter":{_switchRole = "2023_spotter";_dive = true;};
    case "CGQC_units_mk1_5_Diver_Engineer":{_switchRole = "2023_eng";_dive = true;};
};

if (_switchRole isNotEqualTo "" && _switch) then {
	diag_log format ["[CGQC_FNC] Loadout %1 found. Switching.", _switchRole];
	[_switchRole, _section, false]  call CGQC_fnc_switchRole;
} else {
	diag_log "[CGQC_FNC] Loadout not found. Skipping.";
};

if (_dive) then {
    ["diver", true] call CGQC_fnc_switchUniform;
};


diag_log "[CGQC_FNC] checkLoadout done";