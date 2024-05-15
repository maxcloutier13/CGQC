#include "\CGQC\script_component.hpp"
// --- loadout_10 ----------------------------------------------------------
// Loadout for 1-0 Team leader

// Vest
["vest", "UNS_M1956_S3"] call CGQC_fnc_switchStuff;
// Backpack
["backpack", "UNS_Alice_1"] call CGQC_fnc_switchStuff;
// primaryWeapon
["nam_car15GL"] spawn CGQC_fnc_switchPrimary;};
// Primary ammo
player addItemToUniform "ACRE_SEM52SL";
// Items
player addItemToBackpack "UNS_TrapKit";
