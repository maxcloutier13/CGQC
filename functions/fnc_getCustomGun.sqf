#include "\CGQC\script_component.hpp"
// --- getCustomGun ----------------------------------------------------------
// Get player custom gun if exists
params ["_gun", ["_type", "none"], ["_era", "2023"]];
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

// Remove potential default attachments
removeAllPrimaryWeaponItems player;

// Get a random scope if called for
if (_type isNotEqualTo "none") then {
    [_type, _era] spawn CGQC_fnc_getRandomOptic;
};

LOG("[getCustomGun] done");