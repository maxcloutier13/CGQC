// --- swat_sniper ----------------------------------------------------------
// Swat Sniper. Duh. 

// === Adjust Uniform ====================================================================================================
player addVest "cgqc_vest_mk1_black_rf";
// === Radios ==========================================================================================================
["2ic"] execVM "\CGQC\loadouts\mk3_getStuff.sqf";

// === Primary ==========================================================================================================
["rhs_weap_m24sws"] execVM "\CGQC\functions\fnc_getCustomGun.sqf";
sleep 0.5;
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem "rhsusf_acc_m24_silencer_black";
player addPrimaryWeaponItem "Tier1_LeupoldM3A_Geissele_Docter_Black";
player addPrimaryWeaponItem "rhsusf_5Rnd_762x51_m118_special_Mag";
player addPrimaryWeaponItem "rhsusf_acc_harris_swivel";

// Mags 
[] execVM "cgqc\functions\fnc_addMags.sqf";
// More secondary mags 
for "_i" from 1 to 4 do {player addItemToVest cgqc_config_sidearm_mag};
// === Role Items ==========================================================================================================
player addItemToBackpack "ACE_wirecutter";
player addItemToBackpack "ACE_Tripod";