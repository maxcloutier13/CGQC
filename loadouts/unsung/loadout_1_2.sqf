// --- loadout_12 ----------------------------------------------------------
// Loadout for 1-2 Medic
// Vest 
["vest", "UNS_m1956_S4"] call CGQC_fnc_switchStuff;
// Backpack 
["backpack", "uns_simc_pack_frem_med5"] call CGQC_fnc_switchStuff;
// primaryWeapon 
player addWeapon "uns_xm177e2";
player addPrimaryWeaponItem "uns_30Rnd_556x45_Stanag_xm177";
// Primary ammo 
[] call CGQC_fnc_addMags;
// Items 
for "_i" from 1 to 5 do {player addItemToBackpack "uns_30Rnd_556x45_Stanag_xm177";};
for "_i" from 1 to 20 do {player addItemToBackpack "FF_Painkiller";}; // === Meds
for "_i" from 1 to 50 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_splint";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_salineIV";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_salineIV_500";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_salineIV_250";}
