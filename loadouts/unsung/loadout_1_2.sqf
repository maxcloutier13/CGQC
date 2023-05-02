// --- loadout_12 ----------------------------------------------------------
// Loadout for 1-2 Medic
sleep 0.5;
// Vest 
["vest", "UNS_m1956_S4"] execVM "\CGQC\loadouts\mk3_switchStuff.sqf";
// Backpack 
["backpack", "uns_simc_pack_frem_med5"] execVM "\CGQC\loadouts\mk3_switchStuff.sqf";
waitUntil {cgqc_mk3_switching_vest};
waitUntil {cgqc_mk3_switching_backpack};
// primaryWeapon 
player addWeapon "uns_xm177e2";
player addPrimaryWeaponItem "uns_30Rnd_556x45_Stanag_xm177";
// Primary ammo 
for "_i" from 1 to 10 do {player addItemToVest "uns_30Rnd_556x45_Stanag_xm177";};
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
