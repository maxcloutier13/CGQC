#include "\CGQC\script_component.hpp"
// --- getCustomHandgun ----------------------------------------------------------
// Get player custom handgun from config
params [ "_gunArray", ["_nbr", 2], ["_loadPlayerHandgun", true]];
LOG_2("[getCustomHandgun] %1/%2 started", _gunArray select 0, _nbr);

[player] call CGQC_fnc_removeHandgun;

if (!cgqc_player_isVietnam && cgqc_config_sidearm && _loadPlayerHandgun) then {
	// === Custom Sidearm
	player addWeapon (trim cgqc_config_sidearm_pistol);
	player addHandgunItem (trim cgqc_config_sidearm_mag);
	if (cgqc_config_sidearm_acc != "") then {
		player addHandgunItem (trim cgqc_config_sidearm_acc);
	};
	if (cgqc_config_sidearm_suppress != "") then {
		player addHandgunItem (trim cgqc_config_sidearm_suppress);
	};
	if (cgqc_config_sidearm_optic != "") then {
		player addHandgunItem (trim cgqc_config_sidearm_optic);
	};
	_name = getText(configFile >> "CfgWeapons" >> cgqc_config_sidearm_pistol >> "displayname");

	[
    ["Custom Sidearm", 1.5, [0.161, 0.502, 0.725, 1]],
		[format["%1 Loaded!", _name]]
	] call CBA_fnc_notify;
}else{
	_gun = _gunArray select 0;
	// Remove gun from array
	_gunArray deleteAt 0;
    // === Add gun
    player addWeapon _gun;
	// Add all other elements to gun
	{player addHandgunItem _x;} forEach _gunArray;
};

// Handgun ======================================================================
_magHandgun = (handgunMagazine player) select 0;
if (isNil "_magHandgun") then {
		ERROR("[CGQC_ERROR] getCustomHandgun - can't ID mags");
} else {
	if (_loadPlayerHandgun) then {
		// Make sure there is at least one mag...
		if (count _magHandgun > 0) then {
			// Check if custom sidearm is set. If it is use the mag nbr setting
			if (!cgqc_player_isVietnam && cgqc_config_sidearm) then {_nbr = cgqc_config_sidearm_mag_nbr};
			if (_nbr > 2) then {
				_excess = _nbr - 2;
				LOG("[getCustomHandgun] 2 mags to uniform");
				["uniform", _magHandgun, 2] call CGQC_fnc_addItemWithOverflow;
				if (_excess > 6) then {
					["vest", _magHandgun, 6] call CGQC_fnc_addItemWithOverflow;
					LOG("[getCustomHandgun] 6 mags to vest");
					_excess = _excess - 6;
					["backpack", _magHandgun, _excess] call CGQC_fnc_addItemWithOverflow;
					LOG(format["[getCustomHandgun] % mags to backpack", _excess]);
				} else {
					LOG(format["[getCustomHandgun] % mags to vest", _excess]);
					["vest", _magHandgun, _excess] call CGQC_fnc_addItemWithOverflow;
				};
			} else {
				for "_i" from 0 to _nbr do {player addItem _magHandgun};
			};
		}else{
			LOG("[getCustomHandgun] Error: No mags?");
		};
	} else {
		for "_i" from 0 to _nbr do {player addItem _magHandgun};
	};
};
LOG("[getCustomHandgun] done");