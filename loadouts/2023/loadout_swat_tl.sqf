// --- swat_tl ----------------------------------------------------------
// Team Leader

// === Adjust Uniform ====================================================================================================

// === Radios ==========================================================================================================
["tl"] call CGQC_fnc_getRadioPresets;

// === Primary ==========================================================================================================
["UK3CB_P90C_TR_black"] call CGQC_fnc_getCustomGun;
player addPrimaryWeaponItem "muzzle_snds_570";
player addPrimaryWeaponItem "Tier1_MP7_NGAL_M300C_Black";
player addPrimaryWeaponItem "Tier1_MicroT2_Low_Black";
player addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
// Mags 
[] call CGQC_fnc_addMags;
// === Role Items ==========================================================================================================
player removeItem "ItemAndroid"; //Switch cellphone for tablet
player addItem "ItemcTab";