#include "\CGQC\script_component.hpp"
// --- removePrimary ----------------------------------------------------------
//Remove main weapon and mags
params [["_target", player]];
LOG_1(" removePrimary %1 started",_target);

_gun = primaryWeapon _target;
[player] call ace_weaponselect_fnc_putWeaponAway;

if (_gun isNotEqualTo "") then {
	LOG(" removePrimary found gun");
	_mags = primaryWeaponMagazine _target;
	_mainMag = _mags select 0;

	if (!isNil "_mainMag") then {
		LOG(" removePrimary removing mags");
		_target removeMagazines _mainMag;
	};
	if (count _mags > 1) then {
		_target removeMagazines "1Rnd_HE_Grenade_shell";
		_target removeMagazines "1Rnd_Smoke_Grenade_shell";
		_target removeMagazines "1Rnd_SmokeBlue_Grenade_shell";
		_target removeMagazines "1Rnd_SmokeRed_Grenade_shell";
		_target removeMagazines "ACE_40mm_Flare_white";
		_target removeMagazines "UGL_FlareRed_F";
		_target removeMagazines "ACE_40mm_Flare_ir";
	};
	LOG(" removePrimary removing gun");
	_target removeWeapon _gun;
};
LOG(" removePrimary done");