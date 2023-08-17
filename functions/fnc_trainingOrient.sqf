// --- trainingOrient ----------------------------------------------------------
// Orientation training shit

_type = _this select 0;
switch (_type) do {
	case "basic_on":	{
		cgqc_training_orienteering = true;
		cgqc_orient_won = false;
		cgqc_orient_pos = getPosATL player;
		cgqc_orient_targets = [];
		cgqc_orient_target_found = false;
		cgqc_orienteering_timer = 0;
		["basic_orient", true] execVM "\CGQC\loadouts\mk3_transition.sqf";
		// Remove shits
		removeAllAssignedItems player; 
		player removeItem "ACE_microDAGR";
		player removeItem "ItemAndroid";
		hint "Items removed";
		// Give Items 
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player addItem "ACE_MapTools";
		// === Binos
		player addWeapon "Binocular";
		hint "Basic Items Given";
		while {!cgqc_orient_target_found} do {
			_random_pos = [] call BIS_fnc_randomPos;
			player setPos _random_pos;
			hint "Teleported!";
			{ 
				{ 
					_pos = locationPosition _x;
					_nearest = nearestObject _pos;
					if (_nearest distance player > 800 && _nearest distance player < 5000) then {
						cgqc_orient_targets pushBack [_x, text _x, _pos, _nearest distance player];
					};
				} forEach nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [_x], worldSize];  
			} forEach ["NameVillage", "NameCity", "NameCityCapital"];
			if (count cgqc_orient_targets > 0) then {
				cgqc_orient_target = selectRandom cgqc_orient_targets;
				cgqc_orient_target_found = true;
			}else{
				hint "Location unsuitable";
				sleep 2;
				hintSilent "";
			};
		};
		_nearestCity_name = cgqc_orient_target select 1;
		_nearestCity_pos = cgqc_orient_target select 2;
		// Find empty position around target area 
		_searchArea = [_nearestCity_pos, 50, 100, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		cgqc_orient_pos_free = _searchArea findEmptyPosition [1,100,"B_T_VTOL_01_armed_F"];
		// Crate on spawn location 
		//cgqc_orient_crate="cgqc_box_mk2_arsenal" createVehicle (position player);
		cgqc_orient_target_crate="cgqc_box_mk2_arsenal" createVehicle (cgqc_orient_pos_free);
		cgqc_orient_target_flag = "cgqc_flag_coop_white" createVehicle (cgqc_orient_pos_free vectorAdd ((vectorDir player) vectorCrossProduct [0,0,-1] vectorMultiply 2));
		// Create trigger
		_act = "cgqc_orient_won = true; ['basic_done'] execVM '\cgqc\functions\fnc_trainingOrient.sqf';";
		_deAct = "";
		_int = 2;
		if !(isNil "y_markerTarget") then {deleteMarker "cgqc_orient_target";};	 
		if !(isNil "y_markerPlayer") then {deleteMarker "cgqc_orient_player";};
		
		// Trigger
		cgqc_orient_trg = createTrigger ["EmptyDetector",_nearestCity_pos, false];
		cgqc_orient_trg setTriggerArea [10, 10, getDir player, true];
		cgqc_orient_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_orient_trg setTriggerStatements ["this", _act, _deAct];
		cgqc_orient_trg setTriggerInterval _int;
		// Markers 
		//y_markerTarget = createMarker ["cgqc_orient_target", _nearestCity_pos];
		//"cgqc_orient_target" setMarkerType "Contact_circle4"; 
		//"cgqc_orient_target" setMarkerText format["Target:%1", _nearestCity_name];
		//"cgqc_orient_target" setMarkerColor "ColorBlue"; 
		//"cgqc_orient_target" setMarkerSize [1.5, 1.5];
		/*
		//Player marker
		y_markerPlayer = createMarker ["cgqc_orient_player", player];
		"cgqc_orient_player" setMarkerType "mil_objective"; 
		"cgqc_orient_player" setMarkerText "Player";
		"cgqc_orient_player" setMarkerColor "ColorBlue";
		*/
		if(cgqc_orient_opt_patrols) then {
			cgqc_orient_patrol_group = [ _nearestCity_pos, east, cgqc_pax_opfor_patrol] call BIS_fnc_spawnGroup;
			[cgqc_orient_patrol_group, _nearestCity_pos, 100] call BIS_fnc_taskPatrol;
			cgqc_orient_patrol_group setBehaviour "SAFE";
			// add all units to target list
			{
				cgqc_orient_target_list pushBack _x;
			} forEach units cgqc_orient_patrol_group;
		};
		// Hunters 
		if(cgqc_orient_opt_snipers) then {
			_randomPos = [getPos player, 800, 1500, 5, 0, 0, 0, [], []] call BIS_fnc_findSafePos;
			cgqc_orient_snipers_group = [ _randomPos, east, cgqc_pax_opfor_sniper] call BIS_fnc_spawnGroup;
			cgqc_orient_snipers_group setBehaviour "SAFE";
			[cgqc_orient_snipers_group, 2000, 15, [], [], true, false, false] spawn lambs_wp_fnc_taskHunt;
			// add all units to target list
			{
				cgqc_orient_target_list pushBack _x;
			} forEach units cgqc_orient_snipers_group;
		};
		// Task created
		waitUntil{sleep 0.5; cgqc_mk3_transition};
		sleep 10;
		[side player, "task_orient", [
			format["Find your position and reach target: %1", cgqc_orient_target select 1], 
			format["Reach Target: %1",cgqc_orient_target select 1], ""],
			cgqc_orient_pos_free, "ASSIGNED", 1, true, "backpack", false] call BIS_fnc_taskCreate;
		[] spawn {
			while {cgqc_training_orienteering} do {
				cgqc_orienteering_timer = cgqc_orienteering_timer + 1;
				sleep 1;
			};
		};
	};
	case "basic_done":	{
		["task_orient", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		_time = floor (cgqc_orienteering_timer/60);
		hint format['Good job Viper! %1mins', _time];
		sleep 5;
		['basic_off'] execVM '\cgqc\functions\fnc_trainingOrient.sqf';
	};
	
	case "basic_off":	{
		cgqc_training_orienteering = false;
		// Delete trigger
		if !(isNil "cgqc_orient_trg") then {deleteVehicle cgqc_orient_trg;};
		// Delete markers
		//if !(isNil "y_markerTarget") then {deleteMarker "cgqc_orient_target";};	 
		//if !(isNil "y_markerPlayer") then {deleteMarker "cgqc_orient_player";};
		//Delete task 
		["task_orient", true, true] call BIS_fnc_deleteTask;		
		//Delete all units 
		{deleteVehicle _x;} forEach cgqc_orient_target_list;
		{deleteVehicle _x;} forEach allDead;
		{deleteVehicle _x;} forEach nearestObjects [getpos player, ["WeaponHolder", "GroundWeaponHolder"], 5000];
		deleteVehicle cgqc_orient_target_flag;
		deleteVehicle cgqc_orient_target_crate;
		player setPos cgqc_orient_pos;
		hintSilent "";
	};
};