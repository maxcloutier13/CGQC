// --- resetTraits ----------------------------------------------------------
// Remove all traits from target
params ["_target"];
diag_log format ["[CGQC_FNC] resetTraits %1 started", _target];

// Reset a3 perks
player setUnitTrait ["Medic", false];
player setUnitTrait ["engineer", false];
player setUnitTrait ["explosiveSpecialist", false];

// Remove CGQC perks
cgqc_perks_basic = true;
cgqc_perks_recon = false;
cgqc_perks_pilot = false;
cgqc_perks_driver = false;
cgqc_perks_eng = false;
cgqc_perks_medic = false;
cgqc_perks_doctor = false;

diag_log "[CGQC_FNC] resetTraits done";