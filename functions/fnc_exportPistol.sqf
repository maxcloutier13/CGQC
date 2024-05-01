#include "\CGQC\script_component.hpp"
// --- exportPistol ----------------------------------------------------------
// Add specific radios to player and sets things up
LOG("[exportPistol]  Started");

if !(cgqc_config_sidearm) then {
    [["Custom Sidearm is off", 1.5, [0.161, 0.502, 0.725, 1]], ["Check your Addons->[CGQC] Player Settings"], false] call CBA_fnc_notify;
};

_handgun = handgunWeapon  player;
_handgun_acc = handgunItems player;
_silencer = _handgun_acc select 0;
_laser = _handgun_acc select 1;
_optic = _handgun_acc select 2;
_mag = (handgunMagazine player) select 0;

// Export the info to clipboard
_string = "Pistolet: %1" + _br + "Mag: %2" + _br + "Laser: %3" + _br + "Suppressor: %4" + _br + "Optic: %5";
_string = format[_string, _handgun, _mag, _laser, _silencer, _optic];
copyToClipboard _string;


/*
// Set things up
cgqc_config_sidearm_pistol = _handgun;
cgqc_config_sidearm_mag = _mag;
cgqc_config_sidearm_acc = _laser;
cgqc_config_sidearm_suppress = _silencer;
cgqc_config_sidearm_optic = _optic;
*/

[
    ["Custom Sidearm", 1.5, [0.161, 0.502, 0.725, 1]],
    [format["%1 saved",_handgun]]
] call CBA_fnc_notify;

LOG("[exportPistol]  Done");