#include "\CGQC\script_component.hpp"
// --- loadout_specialist ----------------------------------------------------------
// Vietnam Specialist loadouts
params ["_type"];
LOG_1("[loadout_specialist] %1 started", _type);

switch (_type) do {
    case "spec_pointman": {
        ["hat", "uns_H_Simc_nasi"] call CGQC_fnc_switchStuff;
        ["uniform", "UNS_VC_B"] call CGQC_fnc_switchStuff;
		["vest", "uns_V_Simc_mk56_sks"] call CGQC_fnc_switchStuff;
		["backpack", "uns_simc_pack_frem_qt"] call CGQC_fnc_switchStuff;
        [["uns_m1911", "uns_m1911mag", "uns_s_M1911"], 2] call CGQC_fnc_getCustomHandgun;
        player addItemToBackpack "UNS_TrapKit";
        ["nam_ak"] spawn CGQC_fnc_switchPrimary;
    };
    case "spec_marksman": {
		["vest", "uns_sas_web_3"] call CGQC_fnc_switchStuff;
		["backpack", "UNS_Alice_SOG2"] call CGQC_fnc_switchStuff;
        ["nam_m14_scope"] spawn CGQC_fnc_switchPrimary;
    };
    case "spec_mg": {
		["vest", "uns_Simc_56_60_doppel_ligt"] call CGQC_fnc_switchStuff;
		["backpack", "uns_simc_pack_frem_9"] call CGQC_fnc_switchStuff;
        ["nam_rpd_short"] spawn CGQC_fnc_switchPrimary;
        [["uns_m1911", "uns_m1911mag"], 2] call CGQC_fnc_getCustomHandgun;
    };
    case "spec_sniper": {
		["vest", "uns_simc_56_60"] call CGQC_fnc_switchStuff;
		["backpack", "uns_simc_USMC65_M68_Roll"] call CGQC_fnc_switchStuff;
		player addHandgunItem "uns_s_M1911";
        ["nam_m40"] spawn CGQC_fnc_switchPrimary;
    };
    case "spec_saboteur": {
		["vest", "uns_Simc_56_claymore_45_band"] call CGQC_fnc_switchStuff;
		["backpack", "uns_simc_pack_frem_med3"] call CGQC_fnc_switchStuff;
        ["nam_sten"] spawn CGQC_fnc_switchPrimary;
        player addItemToBackpack "UNS_TrapKit";
        player addItemToBackpack "ACE_Clacker";
        // Eplosives
        ["backpack", "uns_M118_mag_remote", 4] call CGQC_fnc_addItemWithOverflow;
        ["backpack", "uns_mine_m14_mag", 10] call CGQC_fnc_addItemWithOverflow;
    };
};

LOG_1("[loadout_specialist] %1 done", _type);