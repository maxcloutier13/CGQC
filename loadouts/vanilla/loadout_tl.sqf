// --- loadout_tl ----------------------------------------------------------
// TL loadout for Vanilla

// === Adjust Uniform ====================================================================================================
["backpack", "B_Kitbag_rgr"] execVM "\CGQC\loadouts\mk3_switchStuff.sqf";
["vest", "V_PlateCarrier2_rgr"] execVM "\CGQC\loadouts\mk3_switchStuff.sqf";

// === Radios ==========================================================================================================
["tl"] execVM "\CGQC\loadouts\mk3_getStuff.sqf";

// === Adjust Items ====================================================================================================
player unlinkItem "cgqc_item_rangefinder";
player linkItem "cgqc_item_laserdesignator";
player unlinkItem "ItemGPS";
player linkItem "B_UavTerminal";

// === Primary ==========================================================================================================
["arifle_SPAR_01_GL_blk_F"] execVM "\CGQC\functions\fnc_getCustomGun.sqf";
sleep 0.5;
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem "muzzle_snds_M";
player addPrimaryWeaponItem "ACE_acc_pointer_green";
player addPrimaryWeaponItem "optic_Arco_AK_blk_F";
player addPrimaryWeaponItem "ACE_30Rnd_556x45_Stanag_Mk262_mag";
// Mags 
[] execVM "cgqc\functions\fnc_addMags.sqf";

// === Role Items ==========================================================================================================
player addItemToBackpack "KNB_PanelYellow";
player addItemToBackpack "tsp_lockpick";
player addItemToBackpack "tsp_stickCharge_auto_mag";
player addItemToBackpack "tsp_stickCharge_auto_mag";
player addItemToBackpack "tsp_popperCharge_auto_mag";
player addItemToBackpack "tsp_popperCharge_auto_mag";
for "_i" from 1 to 10 do {player addItemToBackpack "1Rnd_HE_Grenade_shell"};
for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell"};
for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell"};
for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_Smoke_Grenade_shell"};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_40mm_Flare_white"};
for "_i" from 1 to 2 do {player addItemToBackpack "UGL_FlareRed_F"};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_40mm_Flare_ir"};
