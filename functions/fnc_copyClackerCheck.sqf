#include "\CGQC\script_component.hpp"
// --- copyClackerCheck ----------------------------------------------------------
// Check if player can copy clacker codes
params ["_player", "_target"];
LOG_2(" copyClackerCheck %1/%2", _player, _target);

if (isNull _target) exitWith {false};
private _tClackers = _target getVariable ["ace_explosives_Clackers", []];
if (_tClackers isEqualTo []) exitWith {false};
private _pClackers = [_player] call ace_explosives_fnc_getDetonators;
if (_pClackers isEqualTo []) exitWith {false};

LOG(" copyClackerCheck done");
true