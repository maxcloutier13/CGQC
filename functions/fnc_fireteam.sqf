// --- fireteam ----------------------------------------------------------
// Handles the CGQC "subgroups" fireteam
params [["_target", player]];
diag_log format ["[CGQC_FNC] fireteam %1 started", _target];

CGQC_int_getTeamNbr = {
    params [["_target", player]];
    // 0-HQ / 1/2 = fireteams
    _teamNbr = 0;
    _color = assignedTeam _target;
    switch (_color) do {
        case "RED": {_teamNbr = 1};
        case "GREEN": {_teamNbr = 1};
        case "BLUE": {_teamNbr = 2};
        case "YELLOW": {_teamNbr = 2};
    };
    _teamNbr;
};

CGQC_int_getTeamName = {
     params [["_target", player]];
    _groupName = groupId group _target;
    _team = [_target] call CGQC_int_getTeamNbr;
    if (_team < 1) then {
        _team = "HQ";
    };
    _name = format ["%1-%2", _groupName, _team];
    _name;
};

_group = group _target;

_groupName = groupID _group;
_lead = leader _target;
_white = [_lead];
// Fireteam 1
_tl_1 = "";
_red = [];
_green = [];
// Fireteam 2
_tl_2 = "";
_blue = [];
_yellow = [];

// Remove squadlead
_units = units _group;
_units = _units - _lead;

{
    _soldier = _x;
    _unitColor = assignedTeam _soldier;

    // Identify if TeamLeader or not?

    switch (_unitColor) do {
        case "RED": {_red pushBack [_soldier]};
        case "GREEN": {_green pushBack [_soldier]};
        case "BLUE": {_blue pushBack [_soldier]};
        case "YELLOW": {_yellow pushBack [_soldier]};
        default {_white pushBack [_soldier]};
    };
} forEach units _group;

// Build the team arrays
_hq = [_lead, _white];
_team1 = [_tl_1, _red, _green];
_team2 = [_tl_2, _blue, _yellow];

// Return that group shit
[_group, _groupName, _hq, _team1, _team2];

diag_log "[CGQC_FNC] fireteam done";