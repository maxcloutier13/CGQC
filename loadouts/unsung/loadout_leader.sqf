#include "\CGQC\script_component.hpp"
// --- loadout_leader ----------------------------------------------------------
// Vietnam Leader loadouts
params ["_type"];
LOG_1("[loadout_leader] %1 started", _type);

switch (_type) do {
    case "1-0": {
        ["vest", "uns_Simc_56_claymore_45"] call CGQC_fnc_switchStuff;
        ["backpack", "uns_simc_pack_trop_flak_3"] call CGQC_fnc_switchStuff;
        [["uns_m1911", "uns_m1911mag"], 2] call CGQC_fnc_getCustomHandgun;
        ["nam_car15GL"] spawn CGQC_fnc_switchPrimary;
        player addWeapon "uns_m127a1_flare";
        player addSecondaryWeaponItem "uns_1Rnd_M127_mag";
        player addItemToUniform "uns_1Rnd_M127_mag";
        player addItemToBackpack "uns_1Rnd_M127_mag";
        player addItemToBackpack "uns_1Rnd_M127_mag";
        player addItemToBackpack "uns_1Rnd_M127_mag";
        // Items
        player removeItem "ZSN_Whistle";
        player addItemToBackpack "ZSN_TrenchWhistle";
        player removeItem "ACE_EntrenchingTool";
        player addItemToBackpack "ACE_Clacker";
    };
    case "1-1": {
        ["vest", "uns_v_simc_67"] call CGQC_fnc_switchStuff;
        ["backpack", "UNS_SF_RTO"] call CGQC_fnc_switchStuff;
        [["uns_m1911", "uns_m1911mag"], 2] call CGQC_fnc_getCustomHandgun;
        ["nam_car15_short"] spawn CGQC_fnc_switchPrimary;
        player removeItem "ACE_EntrenchingTool";
        player addItemToBackpack "ACRE_PRC77";
    };
    case "1-2": {
        ["vest", "uns_Simc_56_med_side_ass"] call CGQC_fnc_switchStuff;
        ["backpack", "uns_simc_pack_frem_med5"] call CGQC_fnc_switchStuff;
        [["uns_m1911", "uns_m1911mag"], 2] call CGQC_fnc_getCustomHandgun;
        ["nam_car15_short"] spawn CGQC_fnc_switchPrimary;
        player removeItem "ACE_EntrenchingTool";
        player addItemToBackpack "cgqc_items_medkit";
    };
};

