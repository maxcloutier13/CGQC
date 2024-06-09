#include "\CGQC\script_component.hpp"
// --- getRandomOptic ----------------------------------------------------------
// Get a relatively random optic of the right category

params [["_type", "dot"], ["_modpack", "2023"]];
LOG_1("[getRandomOptic] %1 started", _type);

// Completely unlocked, so use as called
// !cgqc_mk2_arsenal_locked || cgqc_config_scopeRestriction > 3;
//

// Skip if unlocked
if (cgqc_mk2_arsenal_locked) then {
    LOG("[getRandomOptic] Arsenal locked: checking");
    // Get out if locked to Ironsight
    if (cgqc_config_scopeRestriction isEqualTo 0) exitWith {};
    // Downgrade the optic if locked to red-dot
    if (cgqc_config_scopeRestriction isEqualTo 1) then {
        LOG("[getRandomOptic] Locked to dot");
        if (_type isEqualTo "magnified" || _type isEqualTo "rco" || _type isEqualTo "lpvo") then {
            LOG("[getRandomOptic] Downgrading to dot");
            _type = "dot";
        };
    };
    // Locked to RCO/magnified
    if (cgqc_config_scopeRestriction isEqualTo 2) then {
        LOG("[getRandomOptic] Locked to RCO");
        if (_type isEqualTo "lpvo") then {
            LOG("[getRandomOptic] Downgrading to RCO");
            _type = "rco";
        };
    };
};

_choices = [];
switch (_modpack) do {
    case "2023": {
        switch (_type) do {
            case "dot": {
                _choices = ["Tier1_Eotech553_Black", "Tier1_EXPS3_0_Black", "Tier1_MicroT2_Leap_Black", "Tier1_Romeo4T_BCD_Black"];
            };
            case "magnified": {
                _choices = ["Tier1_Eotech553_3xMag_Black_Up", "Tier1_EXPS3_0_3xMag_Black_Up", "Tier1_MicroT2_Leap_3xMag_Black_Up", "Tier1_Romeo4T_BCD_G33_Black_Up"];
            };
            case "rco": {
                _choices = ["optic_Arco_blk_F", "optic_ERCO_blk_F", "optic_Hamr", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230a_mrds"];
            };
            case "lpvo": {
                _choices = ["Tier1_Razor_Gen2_16_Geissele_Docter", "Tier1_ATACR18_Geissele_Docter_Black", "Tier1_Shortdot_Geissele_Docter_Black", "Tier1_Razor_Gen3_110_Geissele_Docter"];
            };
        };
    };
};
_pick = selectRandom _choices;
[_pick] call CGQC_fnc_switchOptics;

LOG("[getRandomOptic] done");