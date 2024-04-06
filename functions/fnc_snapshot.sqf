// --- snapshotSingle ----------------------------------------------------------
// Get player custom gun if exists
params ["_target"];
diag_log format ["[CGQC_FNC] snapshot %1 started", _target];

// Get snapshot, or create it if not found
_snapshot = missionNamespace getVariable "cgqc_snapshot";
if (isNil "_snapshot") then {
    _snapshot = [];
};
_name = name _target;
_entry = [_name, "Various info", ["More info"]];

_id = 0;
_found = false;
{
    if (_x select 0 isEqualTo _name) then {
        // Delete the entry
        _snapshot deleteAt _id;
        _found = true;
    };
    _id = _id + 1;
} forEach _snapshot;

if ( _found) then {
    diag_log "[CGQC_FNC] snapshot : found player snapshot - Overwriting with current";
}else{
    diag_log "[CGQC_FNC] snapshot : NO player snapshot - Creating new one";
};
_snapshot = _snapshot + _entry;

missionNamespace setVariable ["cgqc_snapshot", _snapshot, true];
/*
// Gather all the needed player info
_variables = allvariables _target;

//Team
_team = group _target;
//Color
_color = _target getVariable "CGQC_teamColor";
// Current soldier equipment
_headgear = headgear _target;
_uniform = uniform _target;
_vest = vest _target;
_backpack = backpack _target;
_goggles = goggles _target;
// Save inventory
_uniformItems = uniformItems _target;
_vestItems = vestItems _target;
_backpackItems = backpackItems _target;
*/

diag_log "[CGQC_FNC] snapshot done";