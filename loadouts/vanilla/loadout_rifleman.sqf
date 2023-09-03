// --- loadout_rifleman ----------------------------------------------------------
// Rifleman loadout for Vanilla

// === Adjust Uniform ====================================================================================================

// === Items ==================================================================================================================
["vanilla_basic", "cgqc_item_rangefinder", "ACE_NVG_Gen4_Black"] call CGQC_fnc_getLinkedItems;


// === Primary ==========================================================================================================
["arifle_SPAR_02_blk_F"] call CGQC_fnc_getCustomGun;
player addPrimaryWeaponItem "muzzle_snds_M";
player addPrimaryWeaponItem "ACE_acc_pointer_green";
player addPrimaryWeaponItem "optic_Hamr";
player addPrimaryWeaponItem "ACE_30Rnd_556x45_Stanag_Mk262_mag";
// Mags
[] call CGQC_fnc_addMags;
// === Role Items ==========================================================================================================
for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade"};