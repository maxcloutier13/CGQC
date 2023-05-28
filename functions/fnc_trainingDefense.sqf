// --- trainingDefense ----------------------------------------------------------
// Wave defense mission
_type = _this select 0;


switch (_type) do
{
	case 0:
	{
		cgqc_training_defense = false;
		cgqc_defense_start = false;
		cgqc_defense_done = false;
		//Delete all units 
		{deleteVehicle _x;} forEach cgqc_defense_target_list;
		{deleteVehicle _x;} forEach allDead;
		{deleteVehicle _x;} forEach nearestObjects [getpos player, ["Weapon", "WeaponHolder", "GroundWeaponHolder"], 1000];
	};
	case 1:
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
		hint "Something doesn't smell right...";
		sleep 10;
		hint "Did you hear that?";
		[] spawn {
			while {cgqc_defense_timer < 600} do {
				sleep 1;
				cgqc_defense_timer = cgqc_defense_timer + 1;
			};
			// Finished!
			//hint "Allright. The wave is slowing down.";
			cgqc_training_defense = false;
		};

		[] spawn {
			cgqc_training_defense = true;
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
								cgqc_defense_done = true;
							};
						}];
					} forEach units cgqc_defense_group;
				};
				//hint format ["%1 new groups", _random_amount];
				sleep 120;
			};

			// Finished!
			//hint "Allright. The wave is slowing down.";
			waitUntil {sleep 1;cgqc_defense_done};
			hint "Good job viper. They're all dead";
			[0] execVM "defense.sqf";
		};
	};
	default
	{
		hint "defense problem";
	};
};

