#include "\CGQC\script_component.hpp"
// --- loadout_11 ----------------------------------------------------------
// Loadout for 1-1 RadioGuy
// Vest
["vest", "UNS_M1956_S1"] call CGQC_fnc_switchStuff;
// Backpack
["backpack", "UNS_SF_RTO"] call CGQC_fnc_switchStuff;
// primaryWeapon
["nam_car15"] spawn CGQC_fnc_switchPrimary;
// Items
player addItemToBackpack "UNS_TrapKit";
player addItemToUniform "ACRE_SEM52SL";
player addItemToBackpack "ACRE_PRC77";