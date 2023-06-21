// --- loadout_rifleman ----------------------------------------------------------
// Rifleman loadout for Vanilla

// === Adjust Uniform ====================================================================================================

// === Radios ==========================================================================================================
["inf"] execVM "\CGQC\loadouts\mk3_getStuff.sqf";

// === Primary ==========================================================================================================
["arifle_SPAR_02_blk_F"] execVM "\CGQC\functions\fnc_getCustomGun.sqf";
sleep 0.5;
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem "muzzle_snds_M";
player addPrimaryWeaponItem "ACE_acc_pointer_green";
player addPrimaryWeaponItem "optic_Hamr";
player addPrimaryWeaponItem "ACE_30Rnd_556x45_Stanag_Mk262_mag";
// Mags 
for "_i" from 1 to cgqc_setting_limitMags_max do {player addItemToVest "ACE_30Rnd_556x45_Stanag_Mk262_mag"};

// === Role Items ==========================================================================================================
for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade"};