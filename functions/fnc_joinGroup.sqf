#include "\CGQC\script_component.hpp"
// --- joinGroup ----------------------------------------------------------
// Group stuff
params ["_groupName", ["_color", "MAIN"], ["_side", WEST]];
LOG_1(" joinGroup %1", _groupName);

waitUntil {!isNull player};
waitUntil {time > 0};

n_targetGroup = nil;
_allGroups = ["GetAllGroups"] call BIS_fnc_dynamicGroups;
{
    if (groupID _x isEqualTo _groupName) then {
        n_targetGroup = _x;
    }
} forEach _allGroups;

if (!isNil "n_targetGroup") then {
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
    };
} else {
    LOG(" joinGroup - Group not in dynamic?");
    // Doesn't exist? Create and join as leader
    n_targetGroup = createGroup _side;
    n_targetGroup setGroupId [_groupName]; // Event when a unit joins the group
    [player] joinSilent n_targetGroup;
    n_data = ["cgqc_patch_logo", _groupName, false];
    ["RegisterGroup", [n_targetGroup, leader n_targetGroup, n_data]] remoteExec ["BIS_fnc_dynamicGroups", 2];
};

cgqc_player_group = n_targetGroup;
cgqc_player_groupID = groupId player;

[_groupName, _color] call CGQC_fnc_setGroupRadios;
hint format ["You've joined %1", _groupName];
sleep 0.5;
[_color] call CGQC_fnc_setTeamColor;

LOG_2(" joinGroup Player %1 joined %2", cgqc_custom_playername,  _groupName);
LOG(" joinGroup done");