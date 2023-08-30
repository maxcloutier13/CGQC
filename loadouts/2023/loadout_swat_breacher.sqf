// --- swat_breacher ----------------------------------------------------------
// Breacher

// === Adjust Uniform ====================================================================================================
player addVest "cgqc_vest_mk1_black_ar";
["backpack", "cgqc_pack_mk1_kitbag_black"] call CGQC_fnc_switchStuff;

// === Radios ==========================================================================================================
["tl"] call CGQC_fnc_getRadioPresets;

// === Primary ==========================================================================================================
["sgun_mas_can_benelli_F"] call CGQC_fnc_getCustomGun;
player addPrimaryWeaponItem "7Rnd_mas_can_12Gauge_Slug";

// Mags 
for "_i" from 1 to 20 do {player addItemToVest "7Rnd_mas_can_12Gauge_Slug"};
// === Role Items ==========================================================================================================
player addItemToBackpack "ACE_wirecutter";
for "_i" from 1 to 4 do {player addItemToBackpack "tsp_popperCharge_mag"};
for "_i" from 1 to 2 do {player addItemToBackpack "tsp_stickCharge_mag"};
for "_i" from 1 to 2 do {player addItemToBackpack "tsp_frameCharge_mag"};