// --- trainingSniping ----------------------------------------------------------
// Sniping shenanigans
params ["_type"];

[_type] spawn {
	params ["_type"];
	diag_log format ["[CGQC_FNC] trainingSniping %1 started", _type];

	switch (_type) do {
		case 0: { // Sniping off
			// Turn it all off
			cgqc_training_sniping = false;
			// Remove all targets 
			{
				_x removeAllEventHandlers "HitPart";
				deleteVehicle _x
			} forEach TrainingCourse_TargetList;
			// Remove all dead Bodies 
			{
				deleteVehicle _x
			} forEach allDead;

			TrainingCourse_TargetList = [];
			TrainingCourse_BulletPathTracing = false;
			TrainingCourse_BulletCamera = false;
			TrainingCourse_BulletCameraAbort = false;

			TrainingCourse_ShotsFired = 0;
			TrainingCourse_TargetsHit = 0;
			TrainingCourse_AverageDistance = 0;
			TrainingCourse_AverageTargetScore = 0;
			TrainingCourse_AverageImpactDeviation = 0;

			// Remove all actions
			player removeAction range_act1;
			player removeAction range_act2;
			player removeAction range_act3;
			player removeAction range_act4;
			// player removeAction range_act5;
			player removeAction range_act6;
			player removeAction range_act7;
			player removeAction range_act8;
			player removeAction range_act9;
			player removeAction range_act10;
			// player removeAction range_act11;
			// player removeAction range_act12;
			player removeAction range_act13;
			player removeAction range_act14;
			player removeAction range_act15;
			player removeAction range_act16;
			player removeAction range_act17;
			player removeAction range_act18;

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
			TrainingCourse_TargetList = [];
			TrainingCourse_BulletPathTracing = false;
			TrainingCourse_BulletCamera = false;
			TrainingCourse_BulletCameraAbort = false;
			TrainingCourse_ShotsFired = 0;
			TrainingCourse_TargetsHit = 0;
			TrainingCourse_AverageDistance = 0;
			TrainingCourse_AverageTargetScore = 0;
			TrainingCourse_AverageImpactDeviation = 0;
			range_act1 = player addaction [("<t color=""#FF4444"">" + "---Mode sniper: OFF" + "</t>"), {
				nul=[0] call CGQC_fnc_trainingSniping;
			}, "", 0, false, false];
			range_act2 = player addaction [("<t color=""#BBBBBB"">" + "---Reset statistiques" + "</t>"), "\cgqc\functions\fnc_reset_stats.sqf", "", 0, false, false];
			range_act3 = player addaction [("<t color=""#BBBBBB"">" + "--Enlever les cibles" + "</t>"), "\cgqc\functions\fnc_generate_targets.sqf", ["", 0, true, 50, 1500], 0, false, false];
			range_act4 = player addaction [("<t color=""#BBBBBB"">" + "--Voir impact" + "</t>"), "\cgqc\functions\fnc_check_impact.sqf", "", 0, false, false];
			/*
				range_act5 = player addaction [("<t color=""#BBBBBB"">" + "--Changer le vent (Faible)" + "</t>"), {
					["cgqc_changewind", []] call CBA_fnc_serverEvent;
				}, "", 0, false, false];
			*/
			range_act8 = player addaction [("<t color=""#559999"">" + "Cible standard" + "</t>"), "\cgqc\functions\fnc_create_target.sqf", ["TargetP_Inf2_Acc2_NoPop_F", false, false], 0, false, false];
			range_act9 = player addaction [("<t color=""#559999"">" + "Cible Popup" + "</t>"), "\cgqc\functions\fnc_create_target.sqf", ["TargetP_Inf2_Acc2_F", false, false], 0, false, false];
			range_act10 = player addaction [("<t color=""#559999"">" + "Cible mouvante" + "</t>"), "\cgqc\functions\fnc_create_target.sqf", ["TargetP_Inf2_Acc2_F", false, true], 0, false, false];
			range_act16 = player addaction [("<t color=""#999999"">" + "Cibles aléatoire (Courte portée)" + "</t>"), "\cgqc\functions\fnc_generate_targets.sqf", ["TargetP_Inf2_Acc2_F", 100, false, 15, 500], 0, false, false];
			range_act17 = player addaction [("<t color=""#999999"">" + "Cibles aléatoire (Moyenne portée)" + "</t>"), "\cgqc\functions\fnc_generate_targets.sqf", ["TargetP_Inf2_Acc2_F", 250, false, 50, 1500], 0, false, false];
			range_act18 = player addaction [("<t color=""#999999"">" + "Cibles aléatoire (Longue portée)" + "</t>"), "\cgqc\functions\fnc_generate_targets.sqf", ["TargetP_Inf2_Acc2_F", 500, false, 100, 2500], 0, false, false];
			// range_act11 = player addaction [("<t color=""#55CC66"">" + "Add Steel Plate" + "</t>"), "\cgqc\functions\fnc_create_target.sqf", ["Land_Target_Oval_F", false, false], 0, false, false];
			// range_act12 = player addaction [("<t color=""#55CC66"">" + "Add balloon target" + "</t>"), "\cgqc\functions\fnc_create_balloon_target.sqf", ["Land_Balloon_01_water_F", false, false], 0, false, false];
			range_act13 = player addaction [("<t color=""#CCAA44"">" + "Traçage de tir" + "</t>"), "\cgqc\functions\fnc_toggle_path_tracing.sqf", "", 0, false, false];
			range_act14 = player addaction [("<t color=""#CCAA44"">" + "Caméra de tir" + "</t>"), "\cgqc\functions\fnc_toggle_bullet_camera.sqf", "", 0, false, false];
			// player addaction [("<t color=""#AA9977"">" + "King of the hill" + "</t>"), "fnc_king_of_the_hill.sqf", "", 0, false, false];
			range_act6 = player addaction [("<t color=""#995599"">" + "DANGER - Soldat" + "</t>"), "\cgqc\functions\fnc_create_soldier.sqf", ["O_G_Soldier_F", false, false, false], 0, false, false];
			range_act7 = player addaction [("<t color=""#995599"">" + "DANGER - Patrouille" + "</t>"), "\cgqc\functions\fnc_create_soldier.sqf", ["I_G_Soldier_F", false, true, true], 0, false, false];
			range_act15 = player addaction [("<t color=""#559999"">" + "DANGER - Char blindé" + "</t>"), "\cgqc\functions\fnc_create_target.sqf", ["tank", true, false], 0, false, false];
			// player addaction [("<t color=""#559999"">" + "Tank Targets" + "</t>"), "fnc_generate_targets.sqf", ["O_MBT_02_cannon_F", 50, true, 50, 1500], 0, false, false];

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
			diag_log "[CGQC_ERROR] trainingSniping done";
		};
	};
	diag_log "[CGQC_FNC] trainingSniping done";
};