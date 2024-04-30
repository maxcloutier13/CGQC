#include "\CGQC\script_component.hpp"
// --- getCustomHandgun ----------------------------------------------------------
// Get player custom handgun from config
params [ "_gunArray"];
LOG_1(" getCustomHandgun %1 started", _gunArray select 0);

[player] call CGQC_fnc_removeHandgun;

if (cgqc_config_sidearm) then {
	// === Custom Sidearm
	player addWeapon cgqc_config_sidearm_pistol;
	player addHandgunItem cgqc_config_sidearm_mag;
	if (cgqc_config_sidearm_acc != "") then {
		player addHandgunItem cgqc_config_sidearm_acc;
	};
	if (cgqc_config_sidearm_suppress != "") then {
		player addHandgunItem cgqc_config_sidearm_suppress;
	};
	if (cgqc_config_sidearm_optic != "") then {
		player addHandgunItem cgqc_config_sidearm_optic;
	};
	[
    ["Custom Sidearm", 1.5, [0.161, 0.502, 0.725, 1]],
		[format["%1 Loaded!",cgqc_config_sidearm_pistol]]
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
_nbr = 2;
if (isNil "_magHandgun") then {
		ERROR("[CGQC_ERROR] getCustomHandgun - can't ID mags");
} else {
	// Make sure there is at least one mag...
	if (count _magHandgun > 0) then {
		// Check if custom sidearm is set. If it is use the mag nbr setting
		if (cgqc_config_sidearm) then {_nbr = cgqc_config_sidearm_mag_nbr};
		for "_i" from 1 to _nbr do {player addItem _magHandgun};
	};
};

LOG(" getCustomHandgun done");