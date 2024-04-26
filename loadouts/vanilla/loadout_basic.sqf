#include "\CGQC\script_component.hpp"
// --- loadout_basic ----------------------------------------------------------
// Basic loadout for Vanilla

// === Clothing ==========================================================================================================
// === Random Hat
_hats = ["H_HelmetSpecB"];
_goggles = [""];
_vests = ["V_PlateCarrier1_rgr"];
_uniforms = ["cgqc_uniform_mk1"];
_rucks = ["B_AssaultPack_rgr"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
_gun = ["cgqc_gun_p99_wood", "16Rnd_9x21_Mag"];
[_gun] call CGQC_fnc_getCustomHandgun;

// === Vest ================================================================================================================
// Throwables
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade"};
for "_i" from 1 to 3 do {player addItemToVest "ACE_M84"};
for "_i" from 1 to 3 do {player addItemToVest "SmokeShell"};

// === Uniform ================================================================================================================

// === Backpack ================================================================================================================
// === Essentials
player addItemToBackpack "ACE_Canteen";
player addItemToBackpack "ACE_EntrenchingTool";
// === Grenades
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
