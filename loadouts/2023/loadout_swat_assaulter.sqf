// --- swat_mp5sd6 ----------------------------------------------------------
// MP5sd6 Assaulter

// === Adjust Uniform ====================================================================================================
player addVest "cgqc_vest_mk1_black_lr";

// === Radios ==========================================================================================================
["tl"] execVM "\CGQC\loadouts\mk3_getRadios.sqf";

// === Primary ==========================================================================================================
["UK3CB_MP5SD6"] execVM "\CGQC\functions\fnc_getCustomGun.sqf";
sleep 0.5;
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
player addPrimaryWeaponItem "30Rnd_9x21_Mag_SMG_02";

// Mags 
[] execVM "cgqc\functions\fnc_addMags.sqf";
// === Role Items ==========================================================================================================
player addItemToBackpack "ACE_wirecutter";
