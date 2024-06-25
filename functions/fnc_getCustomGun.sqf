#include "\CGQC\script_component.hpp"
// --- getCustomGun ----------------------------------------------------------
// Get player custom gun if exists
params ["_gun", ["_opticType", "none"], ["_opticEra", "2023"], ["_removeAccessories", true]];
LOG_1("[getCustomGun] %1 started", _gun);

//param [0, objNull, [objNull]];
_customGun = _gun + "_" + cgqc_custom_playername;
player addWeapon _customGun;
if !(player hasWeapon _customGun) then {
    LOG("[getCustomGun] no custom gun: Adding base version");
    player addWeapon _gun;
}else{
    LOG_1("[getCustomGun] %1 custom gun found", _customGun);
    hint format ["Custom Gun :%1", _customGun];
};

if (_removeAccessories) then {
    // Remove potential default attachments
    removeAllPrimaryWeaponItems player;
};


// Get a random scope if called for
if (_opticType isNotEqualTo "none") then {
    [_opticType, _opticEra] spawn CGQC_fnc_getRandomOptic;
};

LOG("[getCustomGun] done");