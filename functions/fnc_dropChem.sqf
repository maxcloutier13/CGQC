// --- dropChem ----------------------------------------------------------
// Drop chemlight
params ["_type", "_item"];
diag_log format ["[CGQC_FNC] dropChem %1/%2 started", _type, _item];

switch (_type) do {
	case "panel": { 
		cgqc_perks_panel = [player, player, [_item, false]] call KNB_panel_fnc_createPanel;
	};
	case "throw": { 
		player addItem _item;
		cgqc_perks_chems = cgqc_perks_chems -1;
		hint format ["%1 prepped. %2 left", _item,  cgqc_perks_chems]; 
		// Get all player grenades
		private _uniformGrenades  = uniformItems  player select {_x call BIS_fnc_isThrowable && _x != _item};
		private _vestGrenades     = vestItems     player select {_x call BIS_fnc_isThrowable && _x != _item};
		private _backpackGrenades = backpackItems player select {_x call BIS_fnc_isThrowable && _x != _item};
		// Remove all grenades not of the desired type
		{player removeItemFromUniform  _x; false} count _uniformGrenades ;
		{player removeItemFromVest     _x; false} count _vestGrenades    ;
		{player removeItemFromBackpack _x; false} count _backpackGrenades;
		// Put them all back
		{player addItemToUniform  _x; false} count _uniformGrenades ;
		{player addItemToVest     _x; false} count _vestGrenades    ;
		{player addItemToBackpack _x; false} count _backpackGrenades;
		[] call ace_advanced_throwing_fnc_drawThrowable;
	};
	default { };
};
diag_log "[CGQC_FNC] dropChem done";