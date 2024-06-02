#include "\CGQC\script_component.hpp"
// --- resetTraits ----------------------------------------------------------
// Remove all traits from target
params ["_target"];
LOG_1(" resetTraits %1 started", _target);

// Reset a3 perks
player setUnitTrait ["Medic", false];
player setUnitTrait ["engineer", false];
player setUnitTrait ["UAVHacker", false];
player setUnitTrait ["explosiveSpecialist", false];

// Coefficients
player setUnitTrait ["audibleCoef", 1];
player setUnitTrait ["camouflageCoef", 1];
player setUnitTrait ["loadCoef", 1];

// Delete all perks actions
{
	[player,0,[_x]] call ace_interact_menu_fnc_removeActionFromObject;
} forEach cgqc_perks_action_list;

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


LOG(" resetTraits done");