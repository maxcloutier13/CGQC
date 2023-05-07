// --- trainingOrient ----------------------------------------------------------
// Orientation training shit

_type = _this select 0;
switch (_type) do {
	case "basic_on":	{
		cgqc_orienteering = true;
		cgqc_orient_pos = getPosATL player;
		cgqc_orient_targets = [];
		cgqc_orient_target = [];
		cgqc_orient_target_found = false;
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
		player addWeapon "cgqc_item_rangefinder";
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
				hint format ["Target: %1m", cgqc_orient_target select 3];
				cgqc_orient_target_found = true;
			}else{
				hint "Location unsuitable";
				sleep 2;
				hintSilent "";
			};
		};
		// Create trigger
		_act = "hint 'Good job Viper!';player setPos cgqc_orient_pos; ['basic_off'] execVM '\cgqc\functions\fnc_trainingOrient.sqf';";
		_deAct = "";
		_int = 2;
		if !(isNil "y_markerTarget") then {deleteMarker "cgqc_orient_target";};	 
		if !(isNil "y_markerPlayer") then {deleteMarker "cgqc_orient_player";};
		y_nearestCity_name = cgqc_orient_target select 1;
		y_nearestCity_pos = cgqc_orient_target select 2;
		cgqc_orient_trg = createTrigger ["EmptyDetector",y_nearestCity_pos, false];
		cgqc_orient_trg setTriggerArea [50, 50, getDir player, true];
		cgqc_orient_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_orient_trg setTriggerStatements ["this", _act, _deAct];
		cgqc_orient_trg setTriggerInterval _int;
		y_markerTarget = createMarker ["cgqc_orient_target", y_nearestCity_pos];
		"cgqc_orient_target" setMarkerType "mil_objective"; 
		"cgqc_orient_target" setMarkerText format["Target:%1", y_nearestCity_name];
		"cgqc_orient_target" setMarkerColor "ColorRed"; 
		//Player marker
		y_markerPlayer = createMarker ["cgqc_orient_player", player];
		"cgqc_orient_player" setMarkerType "mil_objective"; 
		"cgqc_orient_player" setMarkerText "Player";
		"cgqc_orient_player" setMarkerColor "ColorBlue";
	};
	case "basic_off":	{
		cgqc_orienteering = false;
		// Delete trigger
		if !(isNil "cgqc_orient_trg") then {deleteVehicle cgqc_orient_trg;};
		// Delete markers
		if !(isNil "y_markerTarget") then {deleteMarker "cgqc_orient_target";};	 
		if !(isNil "y_markerPlayer") then {deleteMarker "cgqc_orient_player";};
		hint "Orientation off";
		sleep 5;
		hintSilent "";
	};
};