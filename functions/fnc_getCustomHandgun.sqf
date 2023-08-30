// --- getCustomHandgun ----------------------------------------------------------
// Get player custom handgun from config
params [ "_gun"];
diag_log format ["[CGQC_FNC] getCustomHandgun %1 started", _gun select 0];

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
    // === Standard secondary weapon
    player addWeapon _gun select 0;
	// Remove gun from array
	_gun deleteAt 0;
	// Add all other elements to gun
	{player addHandgunItem _x;} forEach _gun;
};

diag_log "[CGQC_FNC] getCustomHandgun done";