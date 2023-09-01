// --- getCustomHandgun ----------------------------------------------------------
// Get player custom handgun from config
params [ "_gunArray"];
diag_log format ["[CGQC_FNC] getCustomHandgun %1 started", _gunArray select 0];

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
}else{
	_gun = _gunArray select 0;
	// Remove gun from array
	_gunArray deleteAt 0;
    // === Add gun
    player addWeapon _gun;
	// Add all other elements to gun
	{player addHandgunItem _x;} forEach _gunArray;
};

diag_log "[CGQC_FNC] getCustomHandgun done";