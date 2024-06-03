#include "\CGQC\script_component.hpp"
// --- checkLoadout ----------------------------------------------------------
// Check if a unit has a fixed loadout and sets it if it's the case
params [["_switch", true]];
_type = typeOf player;
LOG_1(" checkLoadout %1/%2 started", _switch,_type);

_switchRole = "";
_section = 1;
_dive = false;

_load = false;
_switch = player getVariable "cgqc_var_skipLoadoutSwitch";
if (isNil "_switch") then {
	LOG("[checkLoadout] Loading custom loadouts");
	_load = true;
} else {
	if !(_switch) then {
		LOG("[checkLoadout] Loading custom loadouts");
		_load = true;
    } else {
        hint "Skipping loadout";
        LOG("[checkLoadout] NOT loading custom loadout");
    };
};

if (_load) then {
    switch (_type) do {
        // == Training ================================================================
        case "CGQC_Soldat_Base":{_switchRole = "training"};
        case "CGQC_Officer_Base":{_switchRole = "training"};
        // == Vanilla ================================================================
        case "CGQC_units_vanilla_rifleman":{_switchRole = "vanilla_rifleman";};
        case "CGQC_units_vanilla_tl":{_switchRole = "vanilla_tl";};

        // == 2023 ================================================================
        // == Training
        case "cgqc_soldat_moderne":{_switchRole = "training"};
        case "cgqc_officer_moderne":{_switchRole = "training"};
        // == Infantry
        case "CGQC_units_mk1_1_Rifleman_CQB":{_switchRole = "2023_rifle_cqb"};
        case "CGQC_units_mk1_1_Rifleman_Carbine":{_switchRole = "2023_rifle_carb"};
        case "CGQC_units_mk1_1_Rifleman_full":{_switchRole = "2023_rifle_rifle"};
        case "CGQC_units_mk1_1_Rifleman_grenadier":{_switchRole = "2023_rifle_grenadier"};
        case "CGQC_units_mk1_2_Marksman":{_switchRole = "2023_rifle_shoot"};
        case "CGQC_units_mk1_2_repair":{_switchRole = "2023_rifle_eng"};
        case "CGQC_units_mk1_2_lifesaver":{_switchRole = "2023_rifle_life"};
        // == Specialists
        case "CGQC_units_mk1_3_AT_MAAWS":{_switchRole = "2023_at_maaws"};
        case "CGQC_units_mk1_3_AT_Javelin":{_switchRole = "2023_at_javelin"};
        case "CGQC_units_mk1_2_LMG":{_switchRole = "2023_lmg"};
        case "CGQC_units_mk1_2_HMG":{_switchRole = "2023_hmg"};
        case "CGQC_units_mk1_2_autorifleman":{_switchRole = "2023_autorifle"};
        case "CGQC_units_mk1_2_LWMMG":{_switchRole = "2023_lwmmg"};
        case "CGQC_units_mk1_1_Engineer":{_switchRole = "2023_eng"};
        case "CGQC_units_mk1_1_Medic":{_switchRole = "2023_medic"};
        // == Recon
        case "CGQC_units_mk1_0_Drone_operator":{_switchRole = "2023_drone"};
        case "CGQC_units_mk1_0_JTAC":{_switchRole = "2023_jtac"};
        case "CGQC_units_mk1_2_Sniper":{_switchRole = "2023_sniper"};
        case "CGQC_units_mk1_2_Sniper_ebr":{_switchRole = "2023_sniper_ebr"};
        case "CGQC_units_mk1_2_Spotter":{_switchRole = "2023_spotter"};
        // == Pilots
        case "CGQC_units_mk1_4_Pilot_heli":{_switchRole = "2023_h_pilot"};
        case "CGQC_units_mk1_4_crew_heli":{_switchRole = "2023_h_crew"};
        // == Drivers
        case "CGQC_units_mk1_4_Tank_Driver":{_switchRole = "2023_t_driver"};
        case "CGQC_units_mk1_4_Tank_Crew":{_switchRole = "2023_t_crew"};
        // == Command
        case "CGQC_units_mk1_0_HQ":{_switchRole = "2023_hq"};
        case "CGQC_units_mk1_0_SL":{_switchRole = "2023_sl"};
        case "CGQC_units_mk1_0_XO":{_switchRole = "2023_xo"};
        case "CGQC_units_mk1_0_TeamLeader_Carbine":{_switchRole = "2023_tl"};
        // == Divers
        case "CGQC_units_mk1_5_Diver_TL":{_switchRole = "2023_tl";_dive = true;};
        case "CGQC_units_mk1_5_Diver_sniper":{_switchRole = "2023_sniper";_dive = true;};
        case "CGQC_units_mk1_5_Diver_Spotter":{_switchRole = "2023_spotter";_dive = true;};
        case "CGQC_units_mk1_5_Diver_Engineer":{_switchRole = "2023_eng";_dive = true;};

        // == Nam ===================================================================
        case "CGQC_soldat_vietnam_car15":{_switchRole = "inf_car15";};
        case "CGQC_soldat_vietnam_car15s":{_switchRole = "inf_car15_short";};
        // == Leadership
        case "CGQC_soldat_vietnam_tl":{_switchRole = "unsung_10";};
        case "CGQC_soldat_vietnam_rto":{_switchRole = "unsung_11";};
        case "CGQC_soldat_vietnam_medic":{_switchRole = "unsung_12";};
        // == Specialists
        case "CGQC_soldat_vietnam_pointman":{_switchRole = "spec_pointman";};
        case "CGQC_soldat_vietnam_marksman":{_switchRole = "spec_marksman";};
        case "CGQC_soldat_vietnam_mg":{_switchRole = "spec_mg";};
        case "CGQC_soldat_vietnam_sniper":{_switchRole = "spec_sniper";};
        case "CGQC_soldat_vietnam_saboteur":{_switchRole = "spec_saboteur";};
        // == Vehicle crew
        case "CGQC_soldat_vietnam_driver":{_switchRole = "vic_driver";};
        case "CGQC_soldat_vietnam_crew":{_switchRole = "vic_crew";};
        case "CGQC_soldat_vietnam_helipilot":{_switchRole = "vic_helipilot";};
        case "CGQC_soldat_vietnam_helicrew":{_switchRole = "vic_helicrew";};
        case "CGQC_soldat_vietnam_covey":{_switchRole = "vic_covey";};

    };
    if (_switchRole isNotEqualTo "") then {
        LOG_1(" Loadout %1 found. Switching.", _switchRole);
        [_switchRole, _section, false, false] call CGQC_fnc_switchRole;
    } else {
        LOG("[checkLoadout] - Loadout not found. Skipping.");
         sleep 10;
        ["defaultLR"] call CGQC_fnc_setRadios;
    };

    if (_dive) then {
        sleep 1;
        ["diver", true] spawn CGQC_fnc_switchUniform;
        LOG("[checkLoadout] - Diver suit");
    };
} else {
    LOG("[checkLoadout] - Unit switch is OFF Skipping");
    [] spawn {
        sleep 10;
        ["defaultLR"] call CGQC_fnc_setRadios;
        // Add side keys to player
        ["side", player] call CGQC_fnc_getKey;
    };
};

LOG("[checkLoadout] done");