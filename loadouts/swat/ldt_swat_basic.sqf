#include "\CGQC\script_component.hpp"
// --- swat_basic ----------------------------------------------------------
// Basic

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1_f_black"];
_goggles = ["USP_BALACLAVA_BLK"];
_vests = ["cgqc_vest_mk1_black"];
_uniforms = ["cgqc_uniform_mk1_black"];
_rucks = ["cgqc_pack_mk1_assault_black"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
_gun = ["cgqc_gun_glock19_wood", "Tier1_20Rnd_9x19_JHP", "tier1_dbalpl", "tier1_sig_romeo1"];
[_gun] call CGQC_fnc_getCustomHandgun;

// === Vest ================================================================================================================
// Throwables
//for "_i" from 1 to 2 do {player addItemToVest "DIGI_M7A3"};
for "_i" from 1 to 6 do {player addItemToVest "ACE_M84"};
for "_i" from 1 to 3 do {player addItemToVest "SmokeShell"};

// === Uniform ================================================================================================================

// === Vest ================================================================================================================

// === Backpack ================================================================================================================
// === Essentials

// === Grenades
for "_i" from 1 to 6 do {player addItemToBackpack "ACE_M84";};
//for "_i" from 1 to 4 do {player addItemToBackpack "DIGI_M7A3";};
for "_i" from 1 to 4 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};