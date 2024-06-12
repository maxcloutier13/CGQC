#include "\CGQC\script_component.hpp"
// --- sniping ----------------------------------------------------------
// All the new sniping shits
params ["_type"];
LOG("[sniping] started");

switch (_type) do {
    case "tracing": {
        LOG("[sniping] Tracing mode");
        TrainingCourse_BulletPathTracing = !TrainingCourse_BulletPathTracing;
        if (TrainingCourse_BulletPathTracing) then {
            [["Tracing Enabled"], false] call CBA_fnc_notify;
        } else {
            [["Tracing disabled"], false] call CBA_fnc_notify;
        };
    };
    case "bulletCam": {
        LOG("[sniping] BulletCam");
        TrainingCourse_BulletCamera = !TrainingCourse_BulletCamera;
        if (TrainingCourse_BulletCamera) then {
            [["BulletCam Enabled"], false] call CBA_fnc_notify;
        } else {
            [["BulletCam disabled"], false] call CBA_fnc_notify;
        };
    };
    case "reset": {
        LOG("[sniping] Reset stats");
        TrainingCourse_ShotsFired = 0;
        TrainingCourse_TargetsHit = 0;
        TrainingCourse_AverageDistance = 0;
        TrainingCourse_AverageTargetScore = 0;
        TrainingCourse_AverageImpactDeviation = 0;
        [["Stats Reset"], false] call CBA_fnc_notify;
    };
    case "remove": {
        LOG("[sniping] Remove targets");
        {
            _x removeAllEventHandlers "HitPart";
            deleteVehicle _x
        } forEach TrainingCourse_TargetList;
        //Move impact point to nether
        Projectile_Impact_Aux setPos [0, 0, 0];
        [["Targets removed"], false] call CBA_fnc_notify;
    };
    case "impact": {
        LOG("[sniping] Show impact");
        [["Showing Impact"], false] call CBA_fnc_notify;
        if (Projectile_Impact_Aux Distance [0,0,0] > 500) Then
        {
            _position = getPosATL Projectile_Impact_Aux;

            _offsetVector = _position vectorFromTo getPosATL player;
            _offsetVector set [2, 0.0];
            _offsetVector = _offsetVector vectorMultiply 4;
            _offsetVector set [2, 1.0];

            _position = _position vectorAdd _offsetVector;

            _camera = "Camera" CamCreate _position;
            _camera CameraEffect ["INTERNAL", "BACK"];
            _camera CamSetFOV 0.7;
            ShowCinemaBorder False;
            _camera CamSetTarget Projectile_Impact_Aux;
            _camera CamCommit 0;
            Sleep 5.0;
            _camera CameraEffect ["TERMINATE", "BACK"];
            CamDestroy _camera;
        };
    };
    default { };
};


LOG("[sniping] done");
