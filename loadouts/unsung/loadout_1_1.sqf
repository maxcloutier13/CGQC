// --- loadout_11 ----------------------------------------------------------
// Loadout for 1-1 RadioGuy
sleep 0.5;
// Vest 
["vest", "UNS_M1956_S1"] execVM "\CGQC\loadouts\mk3_switchStuff.sqf";
// Backpack 
["backpack", "UNS_SF_RTO"] execVM "\CGQC\loadouts\mk3_switchStuff.sqf";
waitUntil {cgqc_mk3_switching_vest};
waitUntil {cgqc_mk3_switching_backpack};
// primaryWeapon 
player addWeapon "uns_xm177e2";
player addPrimaryWeaponItem "uns_30Rnd_556x45_Stanag_xm177";
// Primary ammo 
[] execVM "cgqc\functions\fnc_addMags.sqf";
// Items 
player addItemToBackpack "UNS_TrapKit";
player addItemToBackpack "ACRE_PRC77";
for "_i" from 1 to 5 do {player addItemToBackpack "uns_30Rnd_556x45_Stanag_xm177";};
