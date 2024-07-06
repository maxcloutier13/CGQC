#include "\CGQC\script_component.hpp"
// --- trainingEod ----------------------------------------------------------
// Eod shenanigans
params [["_type", "create"], ["_expType", "TrainingMine_Ammo"], ["_showMarker", true]];
LOG_1("[trainingEod] %1 started", _type);

// Indicator presence
_markerClass = "Land_JumpTarget_F";
_newPos = screenToWorld [0.5, 0.5];

switch (_type) do {
	case "clear": {
		{
			deleteVehicle _x;
		} forEach cgqc_training_eod_objects;
		[["All Explosives Cleared", 1.5], false] call CBA_fnc_notify;
	};
	case "create": {
        _mine = _expType createVehicle _newPos;
        cgqc_training_eod_objects pushBack _mine;
        if (_showMarker) then {
            _mark = _markerClass createVehicle _newPos;
            cgqc_training_eod_objects pushBack _mark;
            _mine setVariable ["CGQC_eod_marker", _mark];
        };
		[["Explosive Ready!", 1.5], false] call CBA_fnc_notify;
	};
};
LOG("[trainingEod] done");