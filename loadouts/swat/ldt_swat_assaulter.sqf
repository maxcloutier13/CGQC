// --- swat_mp5sd6 ----------------------------------------------------------
// MP5sd6 Assaulter

// Basic setup
[] call CGQC_ldt_swat_basic;

// === Adjust Uniform ====================================================================================================
_hats = [""];
_goggles = [""];
_vests = ["cgqc_vest_mk1_black_lr"];
_uniforms = [""];
_rucks = [""];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
["arifle_mas_can_mp5sd6_F"] call CGQC_fnc_getCustomGun;
player addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
player addPrimaryWeaponItem "30Rnd_9x21_Mag_SMG_02";

// Mags
[] call CGQC_fnc_addMags;
// === Role Items ==========================================================================================================
