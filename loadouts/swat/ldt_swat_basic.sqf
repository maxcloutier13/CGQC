#include "\CGQC\script_component.hpp"
// --- swat_basic ----------------------------------------------------------
// Basic
LOG("[swat_basic] starting");
// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1_f_black"];
_goggles = ["rhs_googles_clear"];
_vests = ["cgqc_vest_mk1_black"];
_uniforms = ["cgqc_uniform_swat_cqb"];
_rucks = ["B_LegStrapBag_black_F"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
_gun = ["hlc_pistol_P226R_Combat",
        "Tier1_DBALPL",
        "hlc_15Rnd_9x19_SD_P226"];
[_gun, 4, false] call CGQC_fnc_getCustomHandgun;

// === Uniform ================================================================================================================
_target addItemToUniform "ACE_Flashlight_KSF1";
_target addItemToUniform "G_mas_can_gasmask";
for "_i" from 1 to 6 do {player addItemToUniform "ACE_CableTie"};
// === Vest ================================================================================================================
for "_i" from 1 to 5 do {player addItemToVest "tsp_flashbang_cts"};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell"};
for "_i" from 1 to 10 do {player addItemToVest "ACE_Chemlight_HiGreen"};

// === Backpack ================================================================================================================
player addItemToBackpack "ACE_SpraypaintGreen";


// === Essentials
//for "_i" from 1 to 4 do {player addItemToBackpack "DIGI_M7A3";};

LOG("[swat_basic] done");
