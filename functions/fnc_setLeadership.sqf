#include "\CGQC\script_component.hpp"
// --- setLeadership ----------------------------------------------------------
// Sets the leadership level of the player
params ["_type", ["_player", player], ["_target", player]];
LOG_3(" setLeadership %1/%2/%3 started", _type, _player, _target);

if (isPlayer _target && _player isNotEqualTo _target) then {
	_displayText = format ["%1 has designated you %2", [_player] call ace_common_fnc_getName, _type];
	["ace_common_displayTextStructured", [_displayText, 3, _target], [_target]] call CBA_fnc_targetEvent;
};

_target setVariable ["cgqc_player_isHQ", false, true];
_target setVariable ["cgqc_player_isSL", false, true];
_target setVariable ["cgqc_player_isTL", false, true];
_target setVariable ["cgqc_player_is2IC", false, true];

switch (_type) do {
	case "HQ":{
		_target setVariable ["cgqc_player_isHQ", true, true];
	};
	case "SL":{
		_target setVariable ["cgqc_player_isSL", true, true];
	};
	case "TL":{
		_target setVariable ["cgqc_player_isTL", true, true];
	};
	case "2IC":{
		_target setVariable ["cgqc_player_is2IC", true, true];
		_target addItem "ACRE_PRC152";
	};
};

LOG(" setLeadership done");