// --- swat_mp5sd6 ----------------------------------------------------------
// MP5sd6 Assaulter

// === Adjust Uniform ====================================================================================================
player addVest "cgqc_vest_mk1_black_lr";

// === Radios ==========================================================================================================
["tl"] call CGQC_fnc_getRadioPresets;

// === Primary ==========================================================================================================
["UK3CB_MP5SD6"] call CGQC_fnc_getCustomGun;
player addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
player addPrimaryWeaponItem "30Rnd_9x21_Mag_SMG_02";

// Mags 
[] call CGQC_fnc_addMags;
// === Role Items ==========================================================================================================
