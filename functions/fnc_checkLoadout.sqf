#include "\CGQC\script_component.hpp"
// --- checkLoadout ----------------------------------------------------------
// Check if a unit has a fixed loadout and sets it if it's the case
params [["_switch", true]];
_type = typeOf player;
LOG_2(" checkLoadout %1/%2 started", _switch,_type);

_switchRole = "";
_section = 1;
_dive = false;
_load = false;
_return = false;

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
        case "CGQC_units_mk1_1_Saboteur":{_switchRole = "2023_eng_saboteur"};
        case "CGQC_units_mk1_1_Demolition":{_switchRole = "2023_eng_demo"};
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

        // == SWAT ===================================================================
        // == Operators
        case "CGQC_units_swat_assaulter":{_switchRole = "swat_assaulter_mp510";};
        /*
        case "CGQC_units_swat_assaulter_mp5k":{_switchRole = "swat_assaulter_mp5k";};
        case "CGQC_units_swat_assaulter_badger":{_switchRole = "swat_assaulter_badger";};
        case "CGQC_units_swat_assaulter_scar":{_switchRole = "swat_assaulter_scar";};
        case "CGQC_units_swat_assaulter_mp5":{_switchRole = "swat_assaulter_mp5";};
        case "CGQC_units_swat_assaulter_mp510":{_switchRole = "swat_assaulter_mp510";};
        case "CGQC_units_swat_assaulter_p90":{_switchRole = "swat_assaulter_p90";};
        case "CGQC_units_swat_assaulter_416":{_switchRole = "swat_assaulter_416";};
        */
        // == Command
        case "CGQC_units_swat_tl":{_switchRole = "swat_tl";};
        case "CGQC_units_swat_hq":{_switchRole = "swat_hq";};
        // == Specialists
        case "CGQC_units_swat_breacher":{_switchRole = "swat_breacher";};
        case "CGQC_units_swat_medic":{_switchRole = "swat_medic";};
        case "CGQC_units_swat_drone":{_switchRole = "swat_drone";};
        // == Snipers
        case "CGQC_units_swat_sniper":{_switchRole = "swat_sniper";};
        case "CGQC_units_swat_sniper_socom":{_switchRole = "swat_sniper_carbine";};
        case "CGQC_units_swat_sniper_psg1":{_switchRole = "swat_sniper_psg";};
        case "CGQC_units_swat_sniper_awm":{_switchRole = "swat_sniper_awm";};
        // == Others
        case "CGQC_units_swat_eod":{_switchRole = "swat_eod";};
        case "CGQC_units_swat_fto":{_switchRole = "swat_fto";};
        case "CGQC_units_swat_emt":{_switchRole = "swat_emt";};
        case "CGQC_units_swat_rcmp":{_switchRole = "swat_rcmp";};

        // == PMC-T ===================================================================
        case "CGQC_units_PMC_rifleman":{_switchRole = "pmct_rifle";};
        case "CGQC_units_PMC_0_SquadLeader":{_switchRole = "pmct_lead";};
        case "CGQC_units_PMC_0_TeamLeader":{_switchRole = "pmct_tl";};
        case "CGQC_units_PMC_0_Grenadier":{_switchRole = "pmct_gren";};
        case "CGQC_units_PMC_0_AutoRifleman":{_switchRole = "pmct_autorifleman";};
        case "CGQC_units_PMC_0_HeavyMachinegunner":{_switchRole = "pmct_mg";};
        case "CGQC_units_PMC_0_AntiTankRifleman":{_switchRole = "pmct_at";};
        case "CGQC_units_PMC_0_Engineer":{_switchRole = "pmct_eng";};
        case "CGQC_units_PMC_0_eod":{_switchRole = "pmct_eod";};
        case "CGQC_units_PMC_0_Medic":{_switchRole = "pmct_medic";};
        case "CGQC_units_PMC_lifesaver":{_switchRole = "pmct_lifesaver";};
        case "CGQC_units_PMC_0_DroneOperator":{_switchRole = "pmct_drone";};
        case "CGQC_units_PMC_0_Marksman1":{_switchRole = "pmct_marks";};
        case "CGQC_units_PMC_0_Marksman2":{_switchRole = "pmct_sniper";};
        case "CGQC_units_PMC_0_CrewCommander":{_switchRole = "pmct_driver";};
        case "CGQC_units_PMC_0_CrewMember":{_switchRole = "pmct_crew";};
        case "CGQC_units_PMC_0_GameMaster":{_switchRole = "pmct_zeus";};
    };
    if (_switchRole isNotEqualTo "") then {
        LOG_1(" Loadout %1 found. Switching.", _switchRole);
        [_switchRole, _section, false, false] spawn CGQC_fnc_switchRole;
        _return = true;
    } else {
        LOG("[checkLoadout] - Loadout not found. Skipping.");
         sleep 10;
        ["defaultLR"] call CGQC_fnc_setRadios;
    };

    if (_dive) then {
        sleep 1;
        ["diver", true] spawn CGQC_fnc_switchUniform;
        LOG("[checkLoadout] - Diver suit");
        _return = true;
    };

    _checkCamo = player getVariable ["cgqc_var_startingCamo", ""];
    if (_checkCamo isNotEqualTo "") then {
        [_checkCamo] call CGQC_fnc_switchUniform;
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
_return;