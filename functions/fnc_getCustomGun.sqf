#include "\CGQC\script_component.hpp"
// --- getCustomGun ----------------------------------------------------------
// Get player custom gun if exists
params ["_gun"];
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

LOG("[getCustomGun] done");