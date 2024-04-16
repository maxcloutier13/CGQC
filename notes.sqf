// Emptying backpack
_found = true;
hint "Backpack found. Grabbing it";
diag_log "[CGQC_FNC] dropStuff - Backpack found! Grabbing it";
_backpackClassname = typeOf _x;

// Get the content of the backpack
_backpackItems = getItemCargo _x select 0;
_backpackMags = getMagazineCargo _x select 0;
_backpackWeapons = getWeaponCargo _x select 0;

// Contains 2 arrays
[items, amounts];
Need to use both!



// Add the backpack to the player's inventory
player addItem _backpackClassname;
// Refill the new backpack with the old items
{ player addItem _x; } forEach _backpackItems;
{ player addMagazine _x; } forEach _backpackMags;
{ player addWeaponCargo _x; } forEach _backpackItems;
// Delete the backpack object from the ground
deleteVehicle _x;