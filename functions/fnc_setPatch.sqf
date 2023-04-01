// --- setPatch ----------------------------------------------------------
// Set player patch and keeps it set
waitUntil {cgqc_player_patch_found};
//Set patch initially
player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
// Ensure Zeus keeps slot, despite admin logging
_count = 0;
_sleep = 60;
while { true } do {
	sleep _sleep;
	_count = _count + 1;
	player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
	[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
	//hint "Insigna on!";
	if (_count > 40) then { //Change timer after 30 mins 
		//hintc "Timer change";
		_sleep = 300; // Set patch every 5mins
	};
};
