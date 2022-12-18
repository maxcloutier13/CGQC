// --- perksPilot ----------------------------------------------------------
// Perks for the flyin man
params ["_type"];

if (hasInterface) then {
	// Init stuff
	_vic = vehicle player;
	_pilot_class = "CGQC_units_mk1_4_pilot_heli";
	_gunner_class = "CGQC_units_mk1_4_crew_heli";
	_driver_class = "CGQC_units_mk1_4_Tank_Crew";

	// find player group
	_player_group = group player;

	switch (_type) do	{
		case "getCrew":{
			cgqc_crew_heli = [];
			_turrets = count (allTurrets _vic);
			if(_turrets > 0) then {
				// spawn copilot  
				_copilot = _player_group createUnit [_pilot_class, [0, 0, 100], [], 0, "CAN_COLLIDE"];
				_copilot moveInTurret [_vic, [0]];
				_copilot setUnloadInCombat [false, false];
				_copilot disableAI "PATH";
				cgqc_crew_heli pushBack _copilot;
				sleep 0.1;
			};
			if(_turrets > 1) then {
				// spawn gunners
				_gunner_left = _player_group createUnit [_gunner_class, [0, 0, 100], [], 0, "CAN_COLLIDE"];
				_gunner_left moveInTurret [_vic, [1]];
				_gunner_left setUnloadInCombat [false, false];
				_gunner_left disableAI "PATH";
				cgqc_crew_heli pushBack _gunner_left;
				sleep 0.1;
			};
			if(_turrets > 2) then {
				_gunner_right = _player_group createUnit [_gunner_class, [0, 0, 100], [], 0, "CAN_COLLIDE"];
				_gunner_right moveInTurret [_vic, [2]];
				_gunner_right setUnloadInCombat [false, false];
				_gunner_right disableAI "PATH";
				cgqc_crew_heli pushBack _gunner_right;
				sleep 0.1;
			};
			cgqc_perks_pilot_hasCrew = true;
			hint "Heli crew spawned";
		};
		case "delCrew":{
			{
				deleteVehicle _x;
			} forEach cgqc_crew_heli;
			cgqc_perks_pilot_hasCrew = false;
			hint "Heli crew deleted";
		};
		case "getDriver":{
			// spawn driver  
			cgqc_crew_driver = _player_group createUnit [_driver_class, [0, 0, 100], [], 0, "CAN_COLLIDE"];
			cgqc_crew_driver moveInDriver _vic;
			cgqc_crew_driver setUnloadInCombat [false, false];
			sleep 0.1;
			cgqc_perks_driver_hasDriver = true;
			hint "Driver crew spawned";
		};
		case "delDriver":{
			deleteVehicle cgqc_crew_driver;
			cgqc_perks_driver_hasDriver = false;
			hint "Driver crew deleted";
		};
		default {
			hintSilent "perksPilot fail";
		};
	};
};


