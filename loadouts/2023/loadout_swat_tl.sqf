// --- swat_tl ----------------------------------------------------------
// Team Leader

// Basic setup
[] call CGQC_ldt_swat_basic;

// === Adjust Uniform ====================================================================================================
// === Linked items ==================================================================================================================
["2023_command", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
["UK3CB_P90C_TR_black"] call CGQC_fnc_getCustomGun;
player addPrimaryWeaponItem "muzzle_snds_570";
player addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
player addPrimaryWeaponItem "Tier1_MicroT2_Low_Black";
player addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
// Mags
[] call CGQC_fnc_addMags;
// === Role Items ==========================================================================================================
