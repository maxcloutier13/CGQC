#include "\CGQC\script_component.hpp"
// --- loadout_leader ----------------------------------------------------------
// Vietnam Leader loadouts
params ["_type"];
LOG_1("[loadout_leader] %1 started", _type);
switch (_type) do {
    case "1-0": {
        ["vest", "UNS_M1956_S3"] call CGQC_fnc_switchStuff;
        ["backpack", "UNS_Alice_1"] call CGQC_fnc_switchStuff;
        ["nam_car15GL"] spawn CGQC_fnc_switchPrimary;
        player addItemToBackpack "UNS_TrapKit";
        player addItemToBackpack "KNB_PanelRed";
        player removeItem "ZSN_Whistle";
        player addItemToBackpack "ZSN_TrenchWhistle";
    };
    case "1-1": {
        ["vest", "UNS_M1956_S1"] call CGQC_fnc_switchStuff;
        ["backpack", "UNS_SF_RTO"] call CGQC_fnc_switchStuff;
        ["nam_car15"] spawn CGQC_fnc_switchPrimary;
        player addItemToBackpack "ACRE_PRC77";
    };
    case "1-2": {
        ["vest", "UNS_m1956_S4"] call CGQC_fnc_switchStuff;
        ["backpack", "uns_simc_pack_frem_med5"] call CGQC_fnc_switchStuff;
        ["nam_car15"] spawn CGQC_fnc_switchPrimary;
        player addItemToBackpack "cgqc_items_medkit";
    };
};

