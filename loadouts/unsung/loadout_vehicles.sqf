#include "\CGQC\script_component.hpp"
// --- loadout_vehicles ----------------------------------------------------------
// Vietnam Vehicle loadouts
params ["_type"];
LOG_1("[loadout_vehicles] %1 started", _type);

cgqc_int_addVicStuff = {
    player removeItem "ACE_EntrenchingTool";
    player removeItem "KNB_PanelRed";
    player removeItem "taro_tripwire_spool";
    player removeMagazines "uns_m67gren";
    player removeMagazines "uns_v40gren";
    [["uns_mkvFlarePistol", "uns_40mm_mkv_Red"], 4] call CGQC_fnc_getCustomHandgun;
    player addItemToVest "KNB_PanelRed";
};

switch (_type) do {
    case "vic_driver": {
        ["hat", "UNS_TC_2"] call CGQC_fnc_switchStuff;
        player addGoggles "G_Aviator";
        ["uniform", "UNS_ARMY_BDU_S"] call CGQC_fnc_switchStuff;
		["vest", "uns_simc_flak_open"] call CGQC_fnc_switchStuff;
        ["backpack", "uns_claymore_sack_flak"] call CGQC_fnc_switchStuff;
        ["nam_swedishk"] spawn CGQC_fnc_switchPrimary;
        [] call cgqc_int_addVicStuff;
        player addItemToBackpack "ToolKit";
    };
    case "vic_crew": {
        ["hat", "UNS_TC_1"] call CGQC_fnc_switchStuff;
        player addGoggles "UNS_Goggles_NVA";
        ["uniform", "UNS_ARMY_BDU_S"] call CGQC_fnc_switchStuff;
		["vest", "uns_simc_flak_open"] call CGQC_fnc_switchStuff;
        ["backpack", "uns_claymore_sack_flak"] call CGQC_fnc_switchStuff;
        ["nam_swedishk"] spawn CGQC_fnc_switchPrimary;
        [] call cgqc_int_addVicStuff;
    };
    case "vic_helipilot": {
        ["hat", "UNS_HP_Helmet_1MD"] call CGQC_fnc_switchStuff;
        ["uniform", "UNS_Pilot_BDU"] call CGQC_fnc_switchStuff;
		["vest", "uns_simc_flak_M69"] call CGQC_fnc_switchStuff;
		["backpack", "ACE_NonSteerableParachute"] call CGQC_fnc_switchStuff;
        ["nam_pdw"] spawn CGQC_fnc_switchPrimary;
        [] call cgqc_int_addVicStuff;
    };
    case "vic_helicrew": {
        ["hat", "UNS_HP_Helmet_11AC"] call CGQC_fnc_switchStuff;
        ["uniform", "UNS_Pilot_BDU"] call CGQC_fnc_switchStuff;
		["vest", "uns_simc_flak_M69"] call CGQC_fnc_switchStuff;
		["backpack", "ACE_NonSteerableParachute"] call CGQC_fnc_switchStuff;
        ["nam_pdw"] spawn CGQC_fnc_switchPrimary;
        [] call cgqc_int_addVicStuff;
    };
    case "vic_covey": {
        ["hat", "UNS_HP_Helmet_TIGER"] call CGQC_fnc_switchStuff;
		["vest", "uns_simc_flak_M69_alt"] call CGQC_fnc_switchStuff;
		["backpack", "ACE_NonSteerableParachute"] call CGQC_fnc_switchStuff;
        ["nam_car15_short"] spawn CGQC_fnc_switchPrimary;
        [] call cgqc_int_addVicStuff;
    };
};

LOG_1("[loadout_vehicles] %1 done", _type);