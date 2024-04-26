#include "\CGQC\script_component.hpp"
// --- swat_breacher ----------------------------------------------------------
// Breacher

// Basic setup
[] call CGQC_ldt_swat_basic;

// === Adjust Uniform ====================================================================================================
_hats = [""];
_goggles = [""];
_vests = ["cgqc_vest_mk1_black_ar"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_kitbag_black"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
["sgun_mas_can_benelli_F"] call CGQC_fnc_getCustomGun;
player addPrimaryWeaponItem "7Rnd_mas_can_12Gauge_Slug";

// Mags
for "_i" from 1 to 20 do {player addItemToVest "7Rnd_mas_can_12Gauge_Slug"};
// === Role Items ==========================================================================================================
player addItemToBackpack "ACE_wirecutter";
for "_i" from 1 to 4 do {player addItemToBackpack "tsp_popperCharge_mag"};
for "_i" from 1 to 2 do {player addItemToBackpack "tsp_stickCharge_mag"};
for "_i" from 1 to 2 do {player addItemToBackpack "tsp_frameCharge_mag"};