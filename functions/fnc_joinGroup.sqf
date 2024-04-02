// --- joinGroup ----------------------------------------------------------
// Group stuff
params ["_groupName", ["_side", west]];
diag_log format ["[CGQC_FNC] joinGroup %1", _groupName];

n_targetGroup = nil;
_allGroups = ["GetAllGroups"] call BIS_fnc_dynamicGroups;
{
    if (groupID _x isEqualTo _groupName) then {
        n_targetGroup = _x;
    }
} forEach _allGroups;

// Check if group is registered
if (["IsGroupRegistered", [n_targetGroup]] call BIS_fnc_dynamicGroups) then {
    // Join the group
    ["SwitchGroup", [n_targetGroup, player]] remoteExecCall ["BIS_fnc_dynamicGroups", 2];
} else {// Not registered
    // Check if group already exists itself
    _exists = false;
    {
        if (groupId _x isEqualTo _groupName) then {
            _exists = true;
            n_targetGroup = _x;
        };
    } forEach allGroups;
    if !(_exists) then {
        // Create and join as leader
        n_targetGroup = createGroup _side;
	    n_targetGroup setGroupId [_groupName]; // Event when a unit joins the group
        [player] joinSilent n_targetGroup;
    };
    if (leader group player isEqualTo player) then {
        // Player is leader
        n_data = ["cgqc_patch_logo", _groupName, false];
        ["RegisterGroup", [n_targetGroup, leader n_targetGroup, n_data]] remoteExec ["BIS_fnc_dynamicGroups", 2];
    };
    /*
    n_targetGroup addEventHandler ["UnitJoined", {
        params ["_group", "_newUnit"];
        [] call CGQC_fnc_setGroupRadios;
    }];*/
};

cgqc_player_group = n_targetGroup;
cgqc_player_groupID = groupId player;

//[] call CGQC_fnc_setGroupRadios;
//[] call CGQC_fnc_setTeamColors;

hint format ["You've joined %1", _groupName];

diag_log format ["[CGQC_FNC] joinGroup Player %1 joined %2", cgqc_custom_playername,  _groupName];

diag_log "[CGQC_FNC] getRadioPresets done";