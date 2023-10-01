// --- copyClacker ----------------------------------------------------------
// Copy clacker codes
params ["_player", "_target"];
diag_log format ["[CGQC_FNC] copyClacker %1/%2", _player, _target];

if (isPlayer _target) then {
	private _displayText = format ["%1 has copied your clacker codes", [_player] call ace_common_fnc_getName];
	["ace_common_displayTextStructured", [_displayText, 3, _target], [_target]] call CBA_fnc_targetEvent;
};
private _clackers = _target getVariable ["ace_explosives_Clackers", []];
_player setVariable ["ace_explosives_Clackers", _clackers, true];
private _displayText = ["You have copied the clacker codes", "You have copied their clacker codes"] select (_target isKindOf "CAManBase");
["ace_common_displayTextStructured", [_displayText, 3, _player]] call CBA_fnc_localEvent;

diag_log "[CGQC_FNC] copyClacker done";