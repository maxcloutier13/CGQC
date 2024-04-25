#include "\CGQC\script_component.hpp"
// --- landNav ----------------------------------------------------------
// Land Navigation training

CGQC_fnc_landNav_openUI = {
	disableSerialization;
	player action ["WeaponOnBack", player];
	createDialog "RscCGQCLandnav";
};

cgqc_fnc_landnav_cleanInventory = {
	// Save player's original linked items
	cgqc_training_landnav_playerAssigned = assignedItems player;
	// Binocs
	cgqc_training_landnav_playerBinos = binocular player;
	removeAllAssignedItems player;
	// Items
	_player_items = items player;
	// Remove shits
	if ({_x isEqualTo "ACE_microDAGR" } count _player_items > 0 ) then {
		player removeItem "ACE_microDAGR";
		cgqc_training_landnav_playerItems pushBack "ACE_microDAGR";
	};
	if ({_x isEqualTo "ItemAndroid" } count _player_items > 0 ) then {
		player removeItem "ItemAndroid";
		cgqc_training_landnav_playerItems pushBack "ItemAndroid";
	};
};

CGQC_fnc_landnav_error = {
	_text = ("<br/>" + "<br/>" + "<br/>" +"<t size='1' >Could not find location. Try other settings.</t><br/>");
	[_text, 0, 0, 2, 1] spawn BIS_fnc_dynamicText;
	[] call CGQC_fnc_training_landnav_off; //There was an error. Quitting
	// Player wakeup
	titleFadeOut 2;
	// Wake up with blur
	titleCut ["", "BLACK IN", 2];
};

CGQC_fnc_landnav_done = {
	[] spawn {
		["task_orient", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		_current_time = time;
		_time = floor((_current_time - cgqc_training_landnav_start_time) /60);
		_text = ("<br/>" + "<br/>" + "<br/>" +
			"<t size='2' >Good job Viper!</t><br/>" +
			"<t size='1' >%1kms in %2mins</t><br/>"
		);
		_text = format [_text, _time, cgqc_training_landnav_distance];
		[_text, 0, 0, 5, 2] spawn BIS_fnc_dynamicText;
		sleep 5;
		[] call CGQC_fnc_training_landnav_off;
	};
};

CGQC_fnc_landnav_off = {
	[] spawn {
		// Delete trigger
		if !(isNil "cgqc_landnav_trg") then {deleteVehicle cgqc_landnav_trg;};
		//Delete task
		["task_orient", true, true] call BIS_fnc_deleteTask;
		//Delete all units
		{deleteVehicle _x;} forEach cgqc_training_landnav_targetlist;
		{deleteVehicle _x;} forEach allDead;
		{deleteVehicle _x;} forEach nearestObjects [getpos player, ["WeaponHolder", "GroundWeaponHolder"], 5000];
		if (!isNil "cgqc_landnav_target_flag") then {deleteVehicle cgqc_landnav_target_flag};
		if (!isNil "cgqc_landnav_target_crate") then {deleteVehicle cgqc_landnav_target_crate};
		// Return items to player
		{player linkItem _x;} forEach cgqc_training_landnav_playerAssigned;
		{player addItem _x;} forEach cgqc_training_landnav_playerItems;
		player addWeapon cgqc_training_landnav_playerBinos;
		// Reset all variables
		cgqc_training_landnav = false;
		cgqc_training_landnav_start_time = 0;
		cgqc_training_landnav_targetlist = [];
		cgqc_training_landnav_distance = 0;
		// Landnav default options
		cgqc_training_landnav_objective = "city";
		cgqc_training_landnav_difficulty = 1;
		cgqc_training_landnav_min = 1000;
		cgqc_training_landnav_max = 4000;
		cgqc_training_landnav_patrols = 0;
		cgqc_training_landnav_hunters = 0;
		cgqc_training_landnav_playerItems = [];
		cgqc_training_landnav_playerAssigned = [];
		cgqc_training_landnav_playerBinos = "";
		// Return player to his original position
		player setPos cgqc_training_landnav_pos;
		hintSilent "";
	};
};

CGQC_fnc_landnav_start = {
	[] spawn {
		   // Fade to black
		cutText ["", "BLACK FADED", 999];
		titleText ["", "PLAIN"];

		// -- Prep -------------------------------------------------------------------------------
		cgqc_training_landnav_pos = getPosATL player;
		cgqc_training_landnav_objectives = [];
		cgqc_training_landnav_target_found = false;
		cgqc_training_landnav_timer = 0;

		// -- Objective -------------------------------------------------------------------------------
		// Possibilities
		// Random/All: "NameLocal", "NameVillage", "NameCity", "NameCityCapital", "CulturalProperty", "HistoricalSite", "CivilDefense"
		// Mountain stuff: "ViewPoint"
		_targets = [];
		switch (cgqc_training_landnav_objective) do {
			case "random": {
				_targets = ["NameLocal", "NameVillage", "NameCity", "NameCityCapital", "CulturalProperty", "HistoricalSite", "CivilDefense"];
			};
			case "city":{
				_targets = ["NameVillage", "NameCity", "NameCityCapital"];
			};
			case "viewpoints":{
				_targets = ["ViewPoint"];
			};
		};
		// Shuffle the target types for more random
		_targets = _targets call BIS_fnc_arrayShuffle;
		// Find all possible targets of the selected types
		{
			{
				cgqc_training_landnav_objectives pushBack [_x];
			} forEach nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [_x], worldSize];
		} forEach _targets;

		// Quit if no objectives found
		if (count cgqc_training_landnav_objectives < 1) exitWith {[] call CGQC_fnc_landnav_error;};

		// Selecting random location and finding position
		_text = ("<br/>" + "<br/>" + "<br/>" +"<t size='1' >Finding a suitable destination...</t><br/>");
		[_text, 0, 0, 2, 1] spawn BIS_fnc_dynamicText;
		//Find a random position within settings around getObjectViewDistance
		cgqc_training_landnav_objectives = cgqc_training_landnav_objectives call BIS_fnc_arrayShuffle;
		// This is our objective right here
		_random = selectRandom cgqc_training_landnav_objectives;
		_target = _random select 0;
		_pos = locationPosition _target;
		_nearest = nearestObject _pos;
		cgqc_training_landnav_target = [_target, text _target, _pos];

		// Find a Target position
		_nearestLocation_name = cgqc_training_landnav_target select 1;
		_nearestLocation_pos = cgqc_training_landnav_target select 2;

		// Find player spawn area
		_playerArea = [_nearestLocation_pos, cgqc_training_landnav_min, cgqc_training_landnav_max, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		_playerPos = _playerArea findEmptyPosition [1,100,"B_T_VTOL_01_armed_F"];
		// Teleport player to starting area
		player setPos _playerPos;
		cgqc_training_landnav_distance = _playerPos distance _nearestLocation_pos;

		// Crate and flag on target location
		_searchArea = [_nearestLocation_pos, 50, 100, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		cgqc_landnav_pos_free = _searchArea findEmptyPosition [1,100,"B_T_VTOL_01_armed_F"];
		cgqc_landnav_target_crate="cgqc_box_mk2_arsenal" createVehicle (cgqc_landnav_pos_free);
		cgqc_landnav_target_flag = "cgqc_flag_coop_white" createVehicle (cgqc_landnav_pos_free vectorAdd ((vectorDir player) vectorCrossProduct [0,0,-1] vectorMultiply 2));

		// -- Items -------------------------------------------------------------------------------
		// Remove orientation items
		[] call cgqc_fnc_landnav_cleanInventory;
		// Items difficulty
		_diffulty_txt = "Items: Map/Watch";
		// Just the basics
		player linkItem "ItemMap";
		player linkItem "ItemWatch";
		if (cgqc_training_landnav_difficulty < 3) then { // Hard
			player addWeapon "Binocular";
			_diffulty_txt = _diffulty_txt + "/Binoculars";
		};
		if (cgqc_training_landnav_difficulty < 2) then {// Normal
			player linkItem "ItemCompass";
			player addItem "ACE_MapTools";
			_diffulty_txt = _diffulty_txt + "/Compass/MapTools";
		};
		if (cgqc_training_landnav_difficulty < 1) then { // Easy
			player addItem "ACE_microDAGR";
			player addItem "ItemAndroid";
			player linkItem "ItemGPS";
			_diffulty_txt = _diffulty_txt + "/GPS/Everything";
		};

		hint format ["%1", _diffulty_txt];

		// -- Create trigger -------------------------------------------------------------------------------
		_act = "call CGQC_fnc_landnav_done;";
		_deAct = "";
		_int = 2;
		cgqc_landnav_trg = createTrigger ["EmptyDetector",getPos cgqc_landnav_target_flag, false];
		cgqc_landnav_trg setTriggerArea [20, 20, getDir player, true];
		cgqc_landnav_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_landnav_trg setTriggerStatements ["this", _act, _deAct];
		cgqc_landnav_trg setTriggerInterval _int;

		// -- Patrols -------------------------------------------------------------------------------
		if(cgqc_training_landnav_patrols > 0) then {
			for "_i" from 1 to cgqc_training_landnav_patrols do {
				cgqc_landnav_patrol_group = [ _nearestLocation_pos, east, cgqc_pax_opfor_patrol] call BIS_fnc_spawnGroup;
				[cgqc_landnav_patrol_group, _nearestLocation_pos, 100] call BIS_fnc_taskPatrol;
				cgqc_landnav_patrol_group setBehaviour "SAFE";
				// add all units to target list
				{
					cgqc_training_landnav_targetlist pushBack _x;
				} forEach units cgqc_landnav_patrol_group;
			};
		};
		// -- Hunters -------------------------------------------------------------------------------
		if(cgqc_training_landnav_hunters > 0) then {
			for "_i" from 1 to cgqc_training_landnav_hunters do {
				_randomPos = [getPos player, 600, 1000, 5, 0, 0, 0, [], []] call BIS_fnc_findSafePos;
				cgqc_landnav_snipers_group = [ _randomPos, east, cgqc_pax_opfor_hunter] call BIS_fnc_spawnGroup;
				cgqc_landnav_snipers_group setBehaviour "SAFE";
				[cgqc_landnav_snipers_group, 2000, 15, [], [], true, false, false] spawn lambs_wp_fnc_taskHunt;
				// add all units to target list
				{
					cgqc_training_landnav_targetlist pushBack _x;
				} forEach units cgqc_landnav_snipers_group;
			};
		};

		// startup message to player
		_text = ("<br/>" + "<br/>" + "<br/>" +
		"<t size='2' >Land Navigation Training</t><br/>" +
		"<t size='1' >Find your way to the Flag at the Objective</t><br/>");
		[_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;

		// Player wakeup
		titleFadeOut 4;
		// Wake up with blur
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0;
		titleCut ["", "BLACK IN", 4];
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 2;

		// Wait a bit and create task
		sleep 8;
		[side player, "task_orient", [
			format["Find your position and reach target: %1", cgqc_training_landnav_target select 1],
			format["Reach Target: %1",cgqc_training_landnav_target select 1], ""],
		cgqc_landnav_pos_free, "ASSIGNED", 1, true, "backpack", false] call BIS_fnc_taskCreate;
		cgqc_training_landnav_start_time = time;
		cgqc_training_landnav = true;

		sleep 2;
		if(cgqc_training_landnav_hunters > 0) then {
			_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Watch out: %1 teams hunting you down</t><br/>";
			_text = format [_text, cgqc_training_landnav_hunters];
			[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
			sleep 6;
		};

		if(cgqc_training_landnav_patrols > 0) then {
			_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Watch out: %1 patrols around your objective</t><br/>";
			_text = format [_text, cgqc_training_landnav_patrols];
			[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
			sleep 6;
		};
	};
};