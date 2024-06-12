#include "\CGQC\script_component.hpp"
// --- trainingQualification ----------------------------------------------------------
// Qualifications diverses
params ["_type", ["_subtype", "prep"]];
LOG_2("[trainingQualification] %1/%2 started", _type, _subtype);

CGQC_int_qualificationSave = {
    params ["_type"];
    LOG("[trainingQualification] saveQualification: Saving");
    // Save the results
    // Do this on the _target computer!!!
    _previousResults = MissionProfileNamespace getVariable [_type, []];
    if (isNil "_previousResults") then {_previousResults = [];};
    _previousResults pushBack _results;
    MissionProfileNamespace setVariable [_type, _previousResults];
    // Save data
    saveMissionProfileNamespace;
    LOG("[trainingQualification] Saving finished");
};

CGQC_int_qualificationRemoveActions = {
    params ["_target"];
    // Remove all
    {
        [_target,0,[_x]] call ace_interact_menu_fnc_removeActionFromObject;
    } forEach action_qualif_list;
};

CGQC_int_qualificationRemoveEvent = {
    params ["_target"];
    _target removeEventHandler ["fired", qualification_shoot_event];
};

switch (_type) do {
    case "rifle": { //Rifle qualification
        switch (_subtype) do {
            case "prep": {
                 LOG("[trainingQualification] prepping Rifle Qualification");
                cgqc_qualification_running = true;

                // Reset variables
                rifle_range_results = [];
                rifle_range_totalShots = 0;

                rifle_range_student = cursorTarget
                rifle_range_gun = primaryWeapon rifle_range_student;
                //_targetID = owner _target;

                // Course settings
                _range_distances = [100, 150, 200, 250, 300, 350, 400, 450, 500];
                _range_neededHits = 2;

                // Actions
                _action = [ "menu_qualif_rifle", "Rifle Qualification", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
                action_qualif_rifle = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
                _action = [ "menu_qualif_rifles", "Start -> Face where you want targets", "", {['rifle', 'start'] spawn CGQC_fnc_trainingQualification;}, {!cgqc_qualification_running} ] call ace_interact_menu_fnc_createAction;
                action_qualif_rifles = [ player, 1, ["ACE_SelfActions", "menu_qualif_rifle"], _action ] call  ace_interact_menu_fnc_addActionToObject;
                _action = [ "menu_qualif_riflep", "Pause", "", {['rifle', 'pause'] spawn CGQC_fnc_trainingQualification;}, {cgqc_qualification_running} ] call ace_interact_menu_fnc_createAction;
                action_qualif_riflep = [ player, 1, ["ACE_SelfActions", "menu_qualif_rifle"], _action ] call  ace_interact_menu_fnc_addActionToObject;
                _action = [ "menu_qualif_riflec", "Cancel", "", {['rifle', 'cancel'] spawn CGQC_fnc_trainingQualification;}, {cgqc_qualification_running} ] call ace_interact_menu_fnc_createAction;
                action_qualif_riflec = [ player, 1, ["ACE_SelfActions", "menu_qualif_rifle"], _action ] call  ace_interact_menu_fnc_addActionToObject;
                action_qualif_list = [action_qualif_rifle, action_qualif_rifles, action_qualif_riflep, action_qualif_riflec];

                // Event when the player shoots
                qualification_shoot_event = rifle_range_student addEventHandler ["fired", {
                    // The student shot
                    rifle_range_totalShots = rifle_range_totalShots + 1;
                }];
            };
            case "pause": {

            };
            case "stop": {
                LOG("[trainingQualification] Stopping");
                playSound "cgqc_sound_roundEnd";
                ["cgqc_qualification_1_rifle"] call CGQC_int_qualificationSave;
                [rifle_range_student] call CGQC_int_qualificationRemoveActions;
                [rifle_range_student] call CGQC_int_CGQC_int_qualificationRemoveEvent;
                cgqc_qualification_running = false;
            };
            case "cancel": {
                LOG("[trainingQualification] Cancelled");
                [rifle_range_student] call CGQC_int_qualificationRemoveActions;
                [rifle_range_student] call CGQC_int_CGQC_int_qualificationRemoveEvent;
                cgqc_qualification_running = false;
            };
            case "start": {
                playSound "cgqc_sound_roundNew";
                // Start creating targets
                _playerPos = getPos _player;
                _playerDir = getDir _player;
                {
                    [_x, _playerPos, _playerDir] call CGQC_int_createTarget;
                } forEach _range_distances;
            };

        };
    };
};

CGQC_int_createTarget = {
    params ["_range", "_pos", "_dir"];
    LOG_1("[trainingQualification] Creating target at %1", _range);
    // Create target
    _position = screenToWorld [0.5, 0.5];
    _spawnPos = _pos getPos [_range, _dir];
    _target = "metalTarget_Stand_AZone" createVehicle [0, 0, 0];
    _target setPosATL [_spawnPos select 0, _spawnPos select 1, 0.0];
    _vecToTarget = (getPosASL player) vectorFromTo (getPosASL _target);
    _direction = (_vecToTarget select 0) atan2 (_vecToTarget select 1);
    _target setDir _direction;
    _target addEventHandler ["HitPart", {
        [_this select 0] spawn CGQC_fnc_targetHit;
    }];
};

// Show instructions in Diary
// Wait for signal to start

// Can be paused?

// Save player score in his namespace
// Save the instructor's name
// Show the scores in a diary entry?

LOG("[trainingQualification] done");