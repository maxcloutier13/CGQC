// --- dropChem ----------------------------------------------------------
// Drop chemlight
_chem = _this select 0;
player addItem _chem;
cgqc_perks_chems = cgqc_perks_chems -1;
hint format ["%1 prepped. %2 left", _chem,  cgqc_perks_chems]; 
// Get all player grenades
private _uniformGrenades  = uniformItems  player select {_x call BIS_fnc_isThrowable && _x != _chem};
private _vestGrenades     = vestItems     player select {_x call BIS_fnc_isThrowable && _x != _chem};
private _backpackGrenades = backpackItems player select {_x call BIS_fnc_isThrowable && _x != _chem};
// Remove all grenades not of the desired type
{player removeItemFromUniform  _x; false} count _uniformGrenades ;
{player removeItemFromVest     _x; false} count _vestGrenades    ;
{player removeItemFromBackpack _x; false} count _backpackGrenades;
// Put them all back
{player addItemToUniform  _x; false} count _uniformGrenades ;
{player addItemToVest     _x; false} count _vestGrenades    ;
{player addItemToBackpack _x; false} count _backpackGrenades;


call ace_advanced_throwing_fnc_drawThrowable;