// --- holsterWeapon ----------------------------------------------------------
// Make sure all weapons are put away 
diag_log "[CGQC_FNC] holsterWeapons started";
player action ["SwitchWeapon", player, player, 250];  // wep on back
sleep 0.5;
//player action ["HandGunOffStand", player]; // holster sidearm
diag_log "[CGQC_FNC] holsterWeapons done";