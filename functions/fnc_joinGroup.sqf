// --- joinGroup ----------------------------------------------------------
// Group stuff
params ["_groupName", ["_side", west]];
diag_log format ["[CGQC_FNC] joinGroup %1", _groupName];

_targetGroup = nil;
{
    if (groupID _x isEqualTo _groupName) then {
        _targetGroup = _x;
    }
} forEach allGroups;

if (!isNil "_targetGroup") then {
   [player] joinSilent _targetGroup;
} else {
    _targetGroup = createGroup _side;
	_targetGroup setGroupId [_groupName];
	[player] joinSilent _targetGroup;
};

cgqc_player_group = _targetGroup;
cgqc_player_groupID = groupId player;
if (!cgqc_flag_isTraining) then {
	["group"] call CGQC_fnc_setRadios;
};
hint format ["You've joined %1", _groupName];

diag_log format ["[CGQC_FNC] joinGroup Player %1 joined %2", cgqc_custom_playername,  _groupName];

diag_log "[CGQC_FNC] getRadioPresets done";