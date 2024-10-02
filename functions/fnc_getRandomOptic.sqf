#include "\CGQC\script_component.hpp"
// --- getRandomOptic ----------------------------------------------------------
// Get a relatively random optic of the right category

params [["_type", "dot"], ["_modpack", "2023"]];
LOG_1("[getRandomOptic] %1 started", _type);

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

switch (cgqc_customLoadout) do {
	case "afg": {
		switch (_type) do {
            case "dot": {
                _choices = ["Tier1_MicroT2_Leap_Tan", "Tier1_EXPS3_0_Tano"];
            };
            case "magnified": {
                _choices = ["Tier1_EXPS3_0_G33_Tano_Up", "Tier1_MicroT2_Leap_G33_Desert_Up"];
            };
            case "rco": {
                _choices = ["rhsusf_acc_ACOG_d"];
            };
            case "lpvo": {
                _choices = ["Tier1_LeupoldM3A_Geissele_Docter_Tan", "Tier1_Shortdot_Geissele_Docter_Tan"];
            };
        };
	};
    default {
          switch (_type) do {
            case "dot": {
                _choices = ["Tier1_EXPS3_0_Black"];
            };
            case "magnified": {
                _choices = ["Tier1_EXPS3_0_G33_Black_Up"];
            };
            case "rco": {
                _choices = ["optic_Hamr"];
            };
            case "lpvo": {
                _choices = ["Tier1_Razor_Gen3_110_Geissele_Docter"];
            };
        };
    };
};


_pick = selectRandom _choices;
[_pick] call CGQC_fnc_switchOptics;

LOG("[getRandomOptic] done");