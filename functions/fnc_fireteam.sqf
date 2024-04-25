#include "\CGQC\script_component.hpp"
// --- fireteam ----------------------------------------------------------
// Handles the CGQC "subgroups" fireteam


// Structure:
// [_group, _groupName, _hq, _team1, _team2];
//
// _group = yeah. The whole group
// _groupName = Full name
// _hq[] = team HQ
//     _lead = group leader
//     _white[] = White team (HQ)
// _team1[] = Fireteam 1
//     _1-1[] = RED
//          _tl = team leader
//          _red[] = red team
//     _1-2[] = GREEN
//          _tl = team leader
//          _green[] = grean team
// _team2[] = Fireteam 2
//     _2-1[] = BLUE
//          _tl = team leader
//          _blue[] = blue team
//     _2-2[] = YELLOW
//          _tl = team leader
//          _yellow[] = red team

params [["_target", player]];
LOG_1(" fireteam %1 started", _target);

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
_2iC_1 = "";
_red = [];
_green = [];
// Fireteam 2
_tl_2 = "";
_2iC_2 = "";
_blue = [];
_yellow = [];

// Remove squadlead
_units = units _group;
_units = _units - [_lead];

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

// Find team 1 leader
{
    //152? You're the TL friend!
    if ([_x, 'ACRE_PRC152'] call BIS_fnc_hasItem) then {
        _tl_1 = _x;
        _red = _red - [_x];
        break;
    };
} forEach _red;

{
    //148? You're the 2iC  buddy!
    if ([_x, 'ACRE_PRC148'] call BIS_fnc_hasItem) then {
        _2iC_1 = _x;
        _green = _green - [_x];
    };
} forEach _green;

// Find team 2 leader
{
    //152? You're the TL friend!
    if ([_x, 'ACRE_PRC152'] call BIS_fnc_hasItem) then {
        _tl_2 = _x;
        _blue = _blue - [_x];
        break;
    };
} forEach _blue;

{
    //148? You're the 2iC  buddy!
    if ([_x, 'ACRE_PRC148'] call BIS_fnc_hasItem) then {
        _2iC_2 = _x;
        _yellow = _yellow - [_x];
    };
} forEach _yellow;

// Build the team arrays
_hq = [_lead, _white];
_binome_1_1 = [_tl_1, _red];
_binome_1_2 = [_2iC_1, _green];
_binome_2_1 = [_tl_2, _blue];
_binome_2_2 = [_2iC_2, _yellow];

_team1 = [_binome_1_1, _binome_1_2];
_team2 = [_binome_2_1, _binome_2_2];

// Return that group shit
[_group, _groupName, _hq, _team1, _team2];

LOG(" fireteam done");