// --- promotePlayer ----------------------------------------------------------
// Boost level of player so he has access to items/roles
params [["_targetType", "player"]];
diag_log format ["[CGQC_FNC] promotePlayer %1 mode started", _targetType];

_target = player;

if (_targetType isEqualTo "target") then {
	_target = cursorTarget;
};
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
_txt = format ["Promoted to %1", _rankTxt];
[_txt] remoteExec ["hint", _targetId];

diag_log "[CGQC_FNC] promotePlayer finished";