#include "\CGQC\script_component.hpp"
// --- promotePlayer ----------------------------------------------------------
// Boost level of player so he has access to items/roles
params [["_targetType", "player"]];
LOG_1(" promotePlayer %1 mode started", _targetType);

_target = player;


if (_targetType isEqualTo "target") then {
	_target = cursorTarget;
};
_name = name _target;
_targetId = owner _target;
_rank = _target getVariable "cgqc_player_rank";
_rank = _rank + 1;
_target setVariable ["cgqc_player_rank", _rank, true];
_rankTxt = "";
switch (_rank) do {
    case 2: {_rankTxt = "Caporal";};
    case 3: {_rankTxt = "Caporal-Chef";};
    case 4: {_rankTxt = "Sergent";};
    case 5: {_rankTxt = "Adjudent";};
    case 6: {_rankTxt = "Sous-Lieutenant";};
    case 7: {_rankTxt = "Lieutenant";};
    case 8: {_rankTxt = "Capitaine";};
    case 9: {_rankTxt = "Major";};
    case 10: {_rankTxt = "Lieutenant Colonel";};
    case 11: {_rankTxt = "Colonel";};
};
_txt = format ["%1 Promoted to %2", _name, _rankTxt];
[_txt] remoteExec ["hint", _targetId];

LOG(" promotePlayer finished");