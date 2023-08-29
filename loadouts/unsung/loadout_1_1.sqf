// --- loadout_11 ----------------------------------------------------------
// Loadout for 1-1 RadioGuy
// Vest 
["vest", "UNS_M1956_S1"] call CGQC_fnc_switchStuff;
// Backpack 
["backpack", "UNS_SF_RTO"] call CGQC_fnc_switchStuff;
waitUntil {cgqc_mk3_switching_vest};
waitUntil {cgqc_mk3_switching_backpack};
// primaryWeapon 
player addWeapon "uns_xm177e2";
player addPrimaryWeaponItem "uns_30Rnd_556x45_Stanag_xm177";
// Primary ammo 
[] call CGQC_fnc_addMags;
// Items 
player addItemToBackpack "UNS_TrapKit";
player addItemToBackpack "ACRE_PRC77";
for "_i" from 1 to 5 do {player addItemToBackpack "uns_30Rnd_556x45_Stanag_xm177";};
