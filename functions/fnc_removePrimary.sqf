// --- removePrimary ----------------------------------------------------------
//Remove main weapon and mags
params [["_target", player]];
diag_log format ["[CGQC_FNC] removePrimary %1 started",_target];

_gun = primaryWeapon _target;
[player] call ace_weaponselect_fnc_putWeaponAway;

if (_gun isNotEqualTo "") then {
	diag_log"[CGQC_FNC] removePrimary found gun";
	_mags = primaryWeaponMagazine _target;
	_mainMag = _mags select 0;

	if (!isNil "_mainMag") then {
		diag_log"[CGQC_FNC] removePrimary removing mags";
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
	diag_log"[CGQC_FNC] removePrimary removing gun";
	_target removeWeapon _gun;
};
diag_log "[CGQC_FNC] removePrimary done";