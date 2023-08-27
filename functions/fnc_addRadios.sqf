// --- addRadios ----------------------------------------------------------
// Add specific radios to player and sets things up
params ["_radios"];

{
	(uniformContainer ACE_player) addItemCargoGlobal [_x, 1];
	waitUntil {sleep 0.5; [ACE_player, _x] call acre_api_fnc_hasKindOfRadio;};
}forEach _radios;