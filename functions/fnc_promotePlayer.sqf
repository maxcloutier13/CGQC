// --- promotePlayer ----------------------------------------------------------
// Boost level of player so he has access to items/roles
diag_log "[CGQC_FNC] promotePlayer started";

cgqc_player_rank = cgqc_player_rank + 1;

_rank = "";
switch (cgqc_player_rank) do {
    case 2: {_rank = "Caporal";};
    case 3: {_rank = "Caporal-Chef";};
    case 4: {_rank = "Sergent";};
    case 5: {_rank = "Adjudent";};
    case 6: {_rank = "Sous-Lieutenant";};
    case 7: {_rank = "Lieutenant";};
    case 8: {_rank = "Capitaine";};
    case 9: {_rank = "Major";};
    case 10: {_rank = "Lieutenant Colonel";};
    case 11: {_rank = "Colonel";};
};

_txt = format ["Promoted to:<br/>%1", _rank];
[ _txt, 0, 1.15, 1, 0.8 ] spawn BIS_fnc_dynamicText;

diag_log "[CGQC_FNC] promotePlayer finished";