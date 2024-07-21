#include "\CGQC\script_component.hpp"
// --- becomeAmmoBearer ----------------------------------------------------------
// Get some ammo from the target's setup
params ["_target", ["_muzzle", 0]];
LOG_2("[becomeAmmoBearer] %1/%2 started", _target, _muzzle);

//Get target role
_role = _target getVariable ["cgqc_player_roleType", "None"];
// Default stuff
_mag = (primaryWeaponMagazine _target) select _muzzle;
_addMags = 4;
_typeTxt = "mags";

switch (_role) do {
    case "AT": {
        LOG("[becomeAmmoBearer] Target is AT - Getting Rockets");
        _mag = (secondaryWeaponMagazine _target) select _muzzle;
        _addMags = 2;
        _typeTxt = "rockets";
    };
    case "MG": {
        LOG("[becomeAmmoBearer] Target is MG - Getting boxes");
        _addMags = 2;
        _typeTxt = "boxes";
    };
};

_actualMags = 0;
for [{_i = 0}, {_i < _addMags}, {_i = _i + 1}] do {
    if (player canAddItemToBackpack _mag) then {
        LOG("[becomeAmmoBearer] Enough space. Adding");
        ["backpack", _mag, 1, false, false] call CGQC_fnc_addItemWithOverflow;
        _actualMags = _actualMags + 1;
    } else {
        LOG("[becomeAmmoBearer] Not enough space");
        hint "Not enough space in backpack for all mags";
    };
};

_txt = format["You got %1 %2 for %3", _actualMags, _typeTxt, name _target];
[["Ammo Bearer", 1.5],[_txt, 1], false] call CBA_fnc_notify;

LOG("[becomeAmmoBearer] done");