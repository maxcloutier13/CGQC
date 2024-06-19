#include "\CGQC\script_component.hpp"
// --- trainingSniping ----------------------------------------------------------
// Sniping shenanigans
params ["_type"];
LOG_1(" trainingSniping %1 started", _type);

switch (_type) do {
	case 0: { // Sniping off
		// Turn it all off
		cgqc_training_sniping = false;
		// Remove all targets
		{
			_x removeAllEventHandlers "HitPart";
			deleteVehicle _x
		} forEach cgqc_training_targetList;
		// Remove all dead Bodies
		{
			deleteVehicle _x
		} forEach allDead;
		deleteVehicle Projectile_Impact_Aux;

		cgqc_training_targetList = [];
		TrainingCourse_BulletPathTracing = false;
		TrainingCourse_BulletCamera = false;
		TrainingCourse_BulletCameraAbort = false;

		TrainingCourse_ShotsFired = 0;
		TrainingCourse_TargetsHit = 0;
		TrainingCourse_TotalTargetScore = 0;
		TrainingCourse_AverageDistance = 0;
		TrainingCourse_AverageTargetScore = 0;
		TrainingCourse_AverageImpactDeviation = 0;

 		[player,0,["cgqc_action_sniping"]] call ace_interact_menu_fnc_removeActionFromObject;

		// Remove eventhandlers
		player removeEventHandler ["fired", range_event1];
		player removeEventHandler ["fired", range_event2];
	};
	case 1: { // Sniping on
		hint "Sniping mode ON - Check your scrollwheel menu";
		// Here we go. This is some sweet stuff.
		waitUntil {
			!isNull player
		};
		cgqc_training_sniping = true;
		cgqc_training_targetList = [];
		TrainingCourse_BulletPathTracing = false;
		TrainingCourse_BulletCamera = false;
		TrainingCourse_BulletCameraAbort = false;
		TrainingCourse_ShotsFired = 0;
		TrainingCourse_TargetsHit = 0;
		TrainingCourse_TotalTargetScore = 0;
		TrainingCourse_AverageDistance = 0;
		TrainingCourse_AverageTargetScore = 0;
		TrainingCourse_AverageImpactDeviation = 0;

		range_event1 = player addEventHandler ["fired", {
			_this execVM "\cgqc\functions\fnc_bullet_trace.sqf"
		}];
		range_event2 = player addEventHandler ["fired", {
			_this execVM "\cgqc\functions\fnc_bullet_camera.sqf"
		}];

		Projectile_Impact_Aux = "Sign_Sphere10cm_F" createVehicle [0, 0, 0];
	};
	case 2: {
		cgqc_training_sniping_comp_on = true;
		cgqc_training_sniping_comp = [position player, getDir player, cgqc_position_sniping] call BIS_fnc_ObjectsMapper;
	};
	case 3: {
		{
			deleteVehicle _x
		} forEach cgqc_training_sniping_comp;
		cgqc_training_sniping_comp_on = false;
	};
	default {
		LOG("[CGQC_ERROR] trainingSniping done");
	};
};
LOG(" trainingSniping done");