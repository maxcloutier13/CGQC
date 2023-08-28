// --- swat_mp5sd6 ----------------------------------------------------------
// MP5sd6 Assaulter

// === Adjust Uniform ====================================================================================================
player addVest "cgqc_vest_mk1_black_lr";

// === Radios ==========================================================================================================
["tl"]call CGQC_fnc_getRadioPresets;

// === Primary ==========================================================================================================
["UK3CB_MP5SD6"] call CGQC_fnc_getCustomGun;
sleep 0.5;
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem "Tier1_MicroT2_Leap_Black";
player addPrimaryWeaponItem "30Rnd_9x21_Mag_SMG_02";

// Mags 
[] execVM "cgqc\functions\fnc_addMags.sqf";
// === Role Items ==========================================================================================================
player addItemToBackpack "ACE_wirecutter";
