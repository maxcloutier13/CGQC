#include "script_component.hpp"
// --- trainingDefense ----------------------------------------------------------
// Wave defense mission
params ["_type"];

[_type] spawn {
	params ["_type"];
	diag_log format ["[CGQC_FNC] trainingDefense %1 started", _type];
	switch (_type) do {
		case "start":
		{
			cgqc_defense_timer = 0;
			cgqc_training_defense = false;
			cgqc_defense_start = false;
			cgqc_defense_done = false;
			cgqc_defense_target_list = [];
			cgqc_defense_list = [];
			_random_spawn = [];
			_randomPos = [];
			_randomTask = 0;

			[] spawn {
				hint "Something doesn't smell right...";
				sleep 10;
				hint "Did you hear that?";
				while {cgqc_defense_timer < 600} do {
					sleep 1;
					cgqc_defense_timer = cgqc_defense_timer + 1;
				};
				// Finished!
				hint "Allright. The wave is slowing down.";
				cgqc_training_defense = false;
			};

			[] spawn {
				cgqc_training_defense = true;
				[side player, "task_defend",
				["Defend your position!",
				"Defend", ""],
				getPos player, "ASSIGNED", 1, true, "defend", false] call BIS_fnc_taskCreate;

				while {cgqc_training_defense} do {
					_random_amount = selectRandom [1,2,3];
					for "_i" from 1 to _random_amount do {
						_random_spawn = selectRandom [cgqc_pax_opfor_hunter, cgqc_pax_opfor_hunter, cgqc_pax_opfor_hunter, cgqc_pax_opfor_team, cgqc_pax_opfor_team, cgqc_pax_opfor_squad];
						sleep 0.5;
						_randomPos = [getPos player, 200, 300, 5, 0, 0, 0, [], []] call BIS_fnc_findSafePos;
						_randomTask = selectRandom [1,2,3];
						cgqc_defense_group = [ _randomPos, east, _random_spawn] call BIS_fnc_spawnGroup;
						cgqc_defense_group setBehaviour "AWARE";
						switch (_randomTask) do {
							case 1: {[cgqc_defense_group, getPos player, false, 10, 15, false] spawn lambs_wp_fnc_taskAssault;};
							case 2: {[cgqc_defense_group, 1000, 15, [], [], true, false, false] spawn lambs_wp_fnc_taskHunt;};
							case 3: {[cgqc_defense_group, 1000, 15, [], [], true] spawn lambs_wp_fnc_taskRush;};
						};

						{
							cgqc_defense_target_list pushBack _x;
							cgqc_defense_list pushBack _x;
							_x addEventHandler ["Killed", { // Killed EventHandler
								params ["_unit", "_killer"];
								hint "Killed";
								cgqc_defense_list = cgqc_defense_list - [_x];
								//systemChat format ["%1 killed by %2. %3 left", typeOf _unit, name _killer, _left];
								//cgqc_cqb_list = cgqc_cqb_list - _unit;
								if (count cgqc_defense_list < 1) then {
									['done'] call fnc_trainingDefense;
								};
							}];
						} forEach units cgqc_defense_group;
					};
					//hint format ["%1 new groups", _random_amount];
					sleep 120;
				};
			};

		};
		case "stop": {
			cgqc_defense_done = true;
			hint "Defense canceled";
			["task_defend", "SUCCEEDED", true] call BIS_fnc_taskSetState;
			["clear"] call fnc_trainingDefense;

		};
		case "clear":
		{
			cgqc_training_defense = false;
			cgqc_defense_start = false;
			cgqc_defense_done = false;
			//Delete all units
			{deleteVehicle _x;} forEach cgqc_defense_target_list;
			{deleteVehicle _x;} forEach allDead;
			{deleteVehicle _x;} forEach nearestObjects [getpos player, ["Weapon", "WeaponHolder", "GroundWeaponHolder"], 1000];

		};
		case "done": {
			cgqc_defense_done = true;
			hint "Good job viper. They're all dead";
			["task_defend", "SUCCEEDED", true] call BIS_fnc_taskSetState;
			["clear"] call fnc_trainingDefense;

		};
		default{diag_log "[CGQC_ERROR] trainingDefense fail";};
	};
};
diag_log "[CGQC_FNC] trainingDefense done";