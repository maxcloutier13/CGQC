// --- getCustomGun ----------------------------------------------------------
// Get player custom gun if exists
params ["_gun"];
diag_log format ["[CGQC_FNC] getCustomGun %1 started", _gun];

//param [0, objNull, [objNull]];
_customGun = _gun + "_" + cgqc_custom_playername;
player addWeapon _customGun;
if !(player hasWeapon _customGun) then {
    diag_log "[CGQC_FNC] getCustomGun no custom gun: Adding base version";
    player addWeapon _gun;
}else{
    diag_log format ["[CGQC_FNC] getCustomGun %1 custom gun found", _customGun];
    hint format ["Custom Gun :%1", _customGun];
};

// Remove potential default attachments
removeAllPrimaryWeaponItems player;

diag_log "[CGQC_FNC] getCustomGun done";