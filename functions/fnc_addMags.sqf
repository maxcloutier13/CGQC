#include "\CGQC\script_component.hpp"
// --- addMags ----------------------------------------------------------
// Add the maximum allowed mag with overflow in backpack.
params [["_target", player], ["_nbr", 0], ["_muzzle", 0]];
LOG_2("[addMags] Target:%1/Nbr:%2 started", _target, _nbr);
// Primary ======================================================================
_mag = (primaryWeaponMagazine _target) select _muzzle;
_addMags = _nbr;
if (isNil "_mag") then {
	ERROR("[addMags] - can't ID mags");
} else {
	_vest = vest _target;
	if (_nbr isEqualTo 0) then {
		_addMags = cgqc_setting_limitMags_max;
		// max = 30Rnd
		// x1.5 for 20Rnd
		// x2 for smaller
		// /2 for bigger

		// Extract the magazine size from the class name
		_magSize = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
		if (_magSize isEqualTo 1) exitWith {
			//Probably got the GL for some reason. Switch muzzle
			[player, _nbr, 1] spawn CGQC_fnc_addMags;
		};
		// Compare the magazine size
		switch (true) do {
			case (_magSize < 20): {_addMags = _addMags * 1.6};
			case (_magSize == 20): {_addMags = _addMags * 1.5};
			case (_magSize > 30): {_addMags = _addMags * 0.8};
			case (_magSize > 60): {_addMags = _addMags * 0.7};
			case (_magSize > 100): {_addMags = _addMags * 0.6};
		};
		_addmags = floor _addmags;
	};
	// Add amount of mags
	LOG_1("[addMags] - adding %1 mags", _addMags);
	if (_addMags <= 8) then {
		["vest", _mag, _addMags] call CGQC_fnc_addItemWithOverflow;
	} else {
		_additional = _addMags - 8;
		["vest", _mag, 8] call CGQC_fnc_addItemWithOverflow;
		["backpack", _mag, _additional] call CGQC_fnc_addItemWithOverflow;
	};
};

LOG("[addMags] done");