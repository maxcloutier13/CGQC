#include "\CGQC\script_component.hpp"
// --- switchPrimary ----------------------------------------------------------
// Switch primary weapons
params ["_type", ["_target", player]];
LOG_1("[switchPrimary] %1 started", _type);

_needGL = false;
// Remove gun and ammo
[_target] call CGQC_fnc_removePrimary;

// Add gun
switch (_type) do {
	#include "\cgqc\loadouts\2023\primary.hpp"
	#include "\cgqc\loadouts\swat\primary.hpp"
	#include "\cgqc\loadouts\unsung\primary.hpp"
};

if (_needGL) then { // Load with grenade launcher stuff
	if (cgqc_player_isVietnam) then {
		LOG(" primarySwitch - Nam Style - adding GL stuff");
		_target addItemToVest "uns_m406vest";
		for "_i" from 1 to 10 do {_target addItemToBackpack "Uns_1Rnd_HE_M406"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "uns_1Rnd_SmokeGreen_40mm"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "uns_1Rnd_SmokeRed_40mm"};
	} else {
		LOG(" primarySwitch - adding GL stuff");
		for "_i" from 1 to 5 do {_target addItemToVest "1Rnd_HE_Grenade_shell"};
		for "_i" from 1 to 10 do {_target addItemToBackpack "1Rnd_HE_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_SmokeRed_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_Smoke_Grenade_shell"};
		[] call CGQC_fnc_isDaytime;
		if !(cgqc_mission_daytime) then {
			LOG("[primarySwitch] Night-time. Get flares");
			[["Night. get some flares", 1], false] call CBA_fnc_notify;
			for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_white"};
			for "_i" from 1 to 2 do {_target addItemToBackpack "UGL_FlareRed_F"};
			for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_ir"};
		} else {
			LOG("[primarySwitch] Daytime. Skip flares");
			[["Daytime. Skip flares", 1], false] call CBA_fnc_notify;
		};
	};
};

// Remove silencer if daytime
if (cgqc_mission_daytime) then {
	LOG("[switchPrimary] Daytime! Silencer to backpack");
	//Put silencer in backpack
	 _currentWeapon = primaryWeapon player;
	_compatible = _currentWeapon call bis_fnc_compatibleItems;
    _compatibleSilencers = [];
	_actualSilencer = "";
	{
		_type = (_x call bis_fnc_itemType) select 1;
		if (_type isEqualTo "AccessoryMuzzle") then {
			_compatibleSilencers pushBack _x;
		};
	} forEach _compatible;
	_compatibleSilencers = _compatibleSilencers - cgqc_list_brakes;
	_items = primaryWeaponItems player;
	{
		_silencerClassName = _x;
		if (_silencerClassName in _items) then {
			LOG("[switchPrimary] Silencer to backpack");
			// Remove the silencer from the current weapon
			player removePrimaryWeaponItem _silencerClassName;
			// Add the silencer to the player's backpack
			player addItemToBackpack _silencerClassName;
			_txt = format ["Silencer '%1' removed from %2 and added to backpack.", _silencerClassName, _currentWeapon];
			[[_txt, 1], false] call CBA_fnc_notify;
		}
	} forEach _compatibleSilencers;
} else {
	LOG("[switchPrimary] Night. Keep silenced.");
};

// Add mags to vest
[_target] call CGQC_fnc_addMags;
[_target] call ace_weaponselect_fnc_putWeaponAway;

LOG("[switchPrimary] done");