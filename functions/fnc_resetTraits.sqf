#include "\CGQC\script_component.hpp"
// --- resetTraits ----------------------------------------------------------
// Remove all traits from target
params ["_target"];
LOG_1("[resetTraits] %1 started", _target);

// Reset a3 perks
player setUnitTrait ["Medic", false];
player setUnitTrait ["engineer", false];
player setUnitTrait ["UAVHacker", false];
player setUnitTrait ["explosiveSpecialist", false];

// Coefficients
player setUnitTrait ["audibleCoef", 1];
player setUnitTrait ["camouflageCoef", 1];
player setUnitTrait ["loadCoef", 1];
cgqc_player_trait_audibleCoef  = player getUnitTrait "audibleCoef";
cgqc_player_trait_camoCoef  = player getUnitTrait "camouflageCoef";
cgqc_player_trait_loadCoef  = player getUnitTrait "loadCoef";
// Remove CGQC perks
cgqc_perks_basic = true;

cgqc_perks_hq = false;
cgqc_perks_sl = false;
cgqc_perks_tl = false;

cgqc_perks_eng = false;
cgqc_perks_medic = false;
cgqc_perks_doctor = false;

cgqc_perks_recon = false;
cgqc_perks_pilot = false;
cgqc_perks_driver = false;


LOG("[resetTraits] done");