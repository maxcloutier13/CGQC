#include "script_component.hpp"
// --- switchNonLethal ----------------------------------------------------------
// switch to nonLethal setup
diag_log "[CGQC_FNC] switchNonLethal started";

_grenadeTypes = ["HandGrenade", "MiniGrenade", "rhs_mag_m67"];
_rubberNade = "training_grenade_mag_m67";
_rubberMags = ["training_pmag_30rnd_rubber_blue", "training_mag_stanag_20rnd_rubber", "training_mag_556_200rnd_rubber"];
_rubberHandgunMags = "17rnd_9x21_Mag_Rubber";
_rubberSilencers = ["training_attachment_suppressor_alt_blue", "training_attachment_suppressor_762_blue"];

// Check if compatible mag exists
_primary = primaryWeapon player;
_compatibleMags = compatibleMagazines _primary;
_mag = _rubberMags arrayIntersect _compatibleMags;
if (_mag isNotEqualTo []) then {
	_mag = _mag select 0;
    _oldMag = primaryWeaponMagazine player select 0;
    _oldHandgunMag = handgunMagazine player select 0;
    _items = magazines player;
    _countMags = {_x isEqualTo _oldMag } count _items;
    _countHandgunMags = {_x isEqualTo _oldHandgunMag } count _items;
    player removeMagazines _oldMag;
    player removeMagazines _oldHandgunMag;
    // Give rubber mag to primary
	player addPrimaryWeaponItem _mag;
    // Silencer
	_compatibleSilencer = compatibleItems _primary;
	_silencer = _rubberSilencers arrayIntersect _compatibleSilencer;
	if (_silencer isNotEqualTo []) then {
		_silencer = _silencer select 0;
		player addPrimaryWeaponItem _silencer;
	};
    for "_i" from 0 to _countMags do {
        player addItem _mag;
    };
    for "_i" from 0 to _countHandgunMags do {
        player addItem _rubberHandgunMags;
    };
	// switch pistol
	player removeWeapon handgunWeapon player;
	player addWeapon "hgun_mas_can_p226_F";
	player addHandgunItem "17rnd_9x21_Mag_Rubber";
	// switch grenades
	_grenades = magazines player select {
		_x call BIS_fnc_isThrowable
	};
	{
		if (_x in _grenadeTypes) then {
			player removeItem _x;
			player addItem _rubberNade;
		};
	} forEach _grenades;
	_40mm = magazines player select {
		_x isEqualTo "1Rnd_HE_Grenade_shell"
	};
    if ("1Rnd_HE_Grenade_shell" in primaryWeaponMagazine player) then {
        player removePrimaryWeaponItem "1Rnd_HE_Grenade_shell";
        player addPrimaryWeaponItem "training_40mm_mag_he";
    };
	{
		player removeItem _x;
		player addItem "training_40mm_mag_he";
	} forEach _40mm;
    ["<br/><br/><br/><br/><br/>Switched to Non-Lethal", 0, 0, 3, 2] spawn BIS_fnc_dynamicText;
} else {
	["<br/><br/><br/><br/>Gun not compatible with non-lethal. Try another one...", 0, 0, 3, 2] spawn BIS_fnc_dynamicText;
};

diag_log "[CGQC_FNC] switchNonLethal done";