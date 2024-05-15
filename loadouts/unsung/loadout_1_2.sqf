#include "\CGQC\script_component.hpp"
// --- loadout_12 ----------------------------------------------------------
// Loadout for 1-2 Medic
// Vest
["vest", "UNS_m1956_S4"] call CGQC_fnc_switchStuff;
// Backpack
["backpack", "uns_simc_pack_frem_med5"] call CGQC_fnc_switchStuff;
// primaryWeapon
["nam_car15"] spawn CGQC_fnc_switchPrimary;
// Items
player addItemToBackpack "cgqc_items_ifak";