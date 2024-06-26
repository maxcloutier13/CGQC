#include "\CGQC\script_component.hpp"
// --- removeHandgun ----------------------------------------------------------
// Remove handgun and mags
params [["_target", player]];
LOG_1("[removeHandgun] %1 started",_target);

// Remove handgun and old ammo
_gun = handgunWeapon _target;
[player] call ace_weaponselect_fnc_putWeaponAway;

if (_gun isNotEqualTo "") then {
	_mags = handgunMagazine _target;
	_mainMag = _mags select 0;
	if (!isNil "_mainMag") then {_target removeMagazines _mainMag;};
	_target removeWeapon _gun;
};

LOG("[removeHandgun] done");