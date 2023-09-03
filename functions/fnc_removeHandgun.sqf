// --- removeHandgun ----------------------------------------------------------
// Remove handgun and mags
params [["_target", player]];
diag_log format ["[CGQC_FNC] removeHandgun %1 started",_target];

// Remove handgun and old ammo
_gun = handgunWeapon _target;
_target action ['SwitchWeapon', _target, _target, 250];

if (_gun isNotEqualTo "") then {
	_mags = handgunMagazine _target;
	_mainMag = _mags select 0;
	if (!isNil "_mainMag") then {_target removeMagazines _mainMag;};
	_target removeWeapon _gun;
};

diag_log "[CGQC_FNC] removeHandgun done";