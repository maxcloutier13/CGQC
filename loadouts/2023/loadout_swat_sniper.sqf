// --- swat_sniper ----------------------------------------------------------
// Swat Sniper. Duh.

// Basic setup
[] call CGQC_ldt_swat_basic;

// === Adjust Uniform ====================================================================================================
player addVest "cgqc_vest_mk1_black_rf";

// === Linked items ==================================================================================================================
["2023_basic", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
["rhs_weap_m24sws"] call CGQC_fnc_getCustomGun;
player addPrimaryWeaponItem "rhsusf_acc_m24_silencer_black";
player addPrimaryWeaponItem "Tier1_LeupoldM3A_Geissele_Docter_Black";
player addPrimaryWeaponItem "rhsusf_5Rnd_762x51_m118_special_Mag";
player addPrimaryWeaponItem "rhsusf_acc_harris_swivel";

// Mags
[] call CGQC_fnc_addMags;

// === Role Items ==========================================================================================================
player addItemToBackpack "ACE_Tripod";