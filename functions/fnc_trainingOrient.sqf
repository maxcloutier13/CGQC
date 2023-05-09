// --- trainingOrient ----------------------------------------------------------
// Orientation training shit

_type = _this select 0;
switch (_type) do {
	case "basic_on":	{
		cgqc_orienteering = true;
		cgqc_orient_won = false;
		cgqc_orient_pos = getPosATL player;
		cgqc_orient_targets = [];
		cgqc_orient_target_found = false;
		cgqc_orienteering_timer = 0;
		["basic_orient"] execVM "\CGQC\loadouts\mk3_transition.sqf";
		// Remove shits 
		player unlinkItem "ItemGPS";
		player removeItem "ACE_microDAGR";
		player removeItem "ItemAndroid";
		player removeWeapon "Laserdesignator_01_khk_F";
		player removeWeapon "Laserdesignator_01_khk_F";
		player removeWeapon "Laserdesignator_03";
		player removeWeapon "Laserdesignator";
		hint "Items removed";
		// Give Items 
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player addItem "ACE_MapTools";
		// === Binos
		if (cgqc_player_isModern) then {
			player addWeapon "cgqc_item_rangefinder";
		};
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
				hint format ["Reach Target: %1m", cgqc_orient_target select 3];
				cgqc_orient_target_found = true;
			}else{
				hint "Location unsuitable";
				sleep 2;
				hintSilent "";
			};
		};
		
		// Create trigger
		_act = "cgqc_orient_won = true; ['basic_off'] execVM '\cgqc\functions\fnc_trainingOrient.sqf';";
		_deAct = "";
		_int = 2;
		if !(isNil "y_markerTarget") then {deleteMarker "cgqc_orient_target";};	 
		if !(isNil "y_markerPlayer") then {deleteMarker "cgqc_orient_player";};
		y_nearestCity_name = cgqc_orient_target select 1;
		y_nearestCity_pos = cgqc_orient_target select 2;
		// Crate on spawn location 
		cgqc_orient_crate="cgqc_box_mk2_arsenal" createVehicle (position player);
		cgqc_orient_target_crate="cgqc_box_mk2_arsenal" createVehicle (y_nearestCity_pos);
		// Trigger
		cgqc_orient_trg = createTrigger ["EmptyDetector",y_nearestCity_pos, false];
		cgqc_orient_trg setTriggerArea [50, 50, getDir player, true];
		cgqc_orient_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_orient_trg setTriggerStatements ["this", _act, _deAct];
		cgqc_orient_trg setTriggerInterval _int;
		// Markers 
		y_markerTarget = createMarker ["cgqc_orient_target", y_nearestCity_pos];
		"cgqc_orient_target" setMarkerType "Contact_circle4"; 
		"cgqc_orient_target" setMarkerText format["Target:%1", y_nearestCity_name];
		"cgqc_orient_target" setMarkerColor "ColorBlue"; 
		"cgqc_orient_target" setMarkerSize [1.5, 1.5];
		/*
		//Player marker
		y_markerPlayer = createMarker ["cgqc_orient_player", player];
		"cgqc_orient_player" setMarkerType "mil_objective"; 
		"cgqc_orient_player" setMarkerText "Player";
		"cgqc_orient_player" setMarkerColor "ColorBlue";
		*/
		if(cgqc_orient_opt_patrols) then {
			cgqc_orient_patrol_group = [ y_nearestCity_pos, east, cgqc_orient_patrol] call BIS_fnc_spawnGroup;
			[cgqc_orient_patrol_group, y_nearestCity_pos, 100] call BIS_fnc_taskPatrol;
			cgqc_orient_patrol_group setBehaviour "SAFE";
			// add all units to target list
			{
				cgqc_orient_target_list pushBack _x;
			} forEach units cgqc_orient_patrol_group;
		};
		// Hunters 
		if(cgqc_orient_opt_hunters) then {
			_randomPos = [getPos player, 800, 1500, 5, 0, 0, 0, [], []] call BIS_fnc_findSafePos;
			cgqc_orient_hunters_group = [ _randomPos, east, cgqc_orient_hunters] call BIS_fnc_spawnGroup;
			cgqc_orient_hunters_group setBehaviour "SAFE";
			[cgqc_orient_hunters_group, 2000, 15, [], [], true, false, false] spawn lambs_wp_fnc_taskHunt;
			// add all units to target list
			{
				cgqc_orient_target_list pushBack _x;
			} forEach units cgqc_orient_hunters_group;
		};
		[] spawn {
			while {cgqc_orienteering} do {
				cgqc_orienteering_timer = cgqc_orienteering_timer + 1;
				sleep 1;
			};
		};
	};
	case "basic_off":	{
		cgqc_orienteering = false;
		// Delete trigger
		if !(isNil "cgqc_orient_trg") then {deleteVehicle cgqc_orient_trg;};
		// Delete markers
		if !(isNil "y_markerTarget") then {deleteMarker "cgqc_orient_target";};	 
		if !(isNil "y_markerPlayer") then {deleteMarker "cgqc_orient_player";};
		//Delete all units 
		{deleteVehicle _x;} forEach cgqc_orient_target_list;
		{deleteVehicle _x;} forEach allDead;
		{deleteVehicle _x;} forEach nearestObjects [getpos player, ["WeaponHolder", "GroundWeaponHolder"], 5000];
		deleteVehicle cgqc_orient_crate;
		deleteVehicle cgqc_orient_target_crate;
		player setPos cgqc_orient_pos;
		if (cgqc_orient_won) then {
			hint format['Good job Viper! %1mins', cgqc_orienteering_timer/60];
			sleep 15;
		}else{
			hint "Orientation off";
			sleep 5;
		};
		hintSilent "";
	};
};