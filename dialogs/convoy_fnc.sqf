// --- convoy ----------------------------------------------------------
// Convoy training


CGQC_fnc_convoy_openUI = {
	disableSerialization;
	player action ["WeaponOnBack", player];
	createDialog "RscCGQCConvoy";
};

CGQC_fnc_convoy_clear = {
	{deleteVehicle _x;} forEach cgqc_training_convoy_allUnits;
	{deleteVehicle _x;} forEach cgqc_training_convoy_allVics;
	{deleteVehicle _x;} forEach allDead;
	cgqc_training_convoy_speed = 60;
	cgqc_training_convoy_distance = 15;
	cgqc_training_convoy_behavior = 0; // other is "AWARE"
	cgqc_training_convoy_vics = ["random", "random", "random", "random", "nothing", "nothing" ];
	cgqc_training_convoy_debug = false;
	cgqc_training_convoy_allUnits = [];
	cgqc_training_convoy_allVics = [];

};

CGQC_fnc_convoy_error = {
	_text = ("<br/>" + "<br/>" + "<br/>" +"<t size='1' >Could not create convoy. Try other settings.</t><br/>");
	[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
	[] call CGQC_fnc_convoy_off; //There was an error. Quitting
};

CGQC_fnc_convoy_off = {
	[] spawn {
		[] call CGQC_fnc_convoy_clear;
		_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Might be errors popping up... Ignore them ;o) Convoy off.</t><br/>";
		[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
		cgqc_training_convoy = false;
	};
};

CGQC_fnc_convoy_spawn = {
	[] spawn {
		// Get all the valid entries from the settings
		_vicType = "";
		cgqc_training_convoy_vic_selection = [];
		cgqc_training_convoy_vic_selection_type = [];
		{
			if !(_x isEqualTo "nothing") then {
				if (_x isEqualTo "random") then {
					_randomVic = selectRandom ["cgqc_pax_opfor_vic_tank", "cgqc_pax_opfor_vic_apc", "cgqc_pax_opfor_vic_transport_squad", "cgqc_pax_opfor_vic_transport_team", "cgqc_pax_opfor_vic_transport_fuel", "cgqc_pax_opfor_vic_transport_ammo", "cgqc_pax_opfor_vic_transport_repair", "cgqc_pax_opfor_vic_technical_mg", "cgqc_pax_opfor_vic_technical_gl" ];
					_vicType = selectRandom (missionNamespace getVariable _randomVic);
				}else {
					_vicType = selectRandom (missionNamespace getVariable _x);
				};
				cgqc_training_convoy_vic_selection pushBack _vicType;
				cgqc_training_convoy_vic_selection_type pushBack _x;
			};
		} forEach cgqc_training_convoy_vics;

		// Check settings
		_speed = 0;
		_behavior = "";
		_distance = 0;

		// Speed
		if (cgqc_training_convoy_speed isEqualTo 0) then {
			//Random speed
			_speed = selectRandom [30,40,50,60,70,80];
		};

		// Behavior
		switch (cgqc_training_convoy_behavior) do {
			case 0: {_behavior = selectRandom ["AWARE", "pushThroughContact"] };
			case 1: {_behavior = "AWARE";};
			case 2: {_behavior = "pushThroughContact";};
			default { };
		};

		// Debug
		_debug = false;
		if (cgqc_training_convoy_debug isEqualTo 1) then {
			_debug = true;
		};

		_firstRun = true;
		if (count cgqc_training_convoy_vic_selection > 0) then {
			// Spawn each vehicles with their own groups with crew on map target_1
			{
				_type = cgqc_training_convoy_vic_selection_type select _forEachIndex;
				// Check for valid position
				_validPos = [];
				if (_firstRun) then {
					_validPos = cgqc_convoy_start findEmptyPosition [1, 30, _x];
				} else {
					_previous = cgqc_training_convoy_allVics select (_forEachIndex - 1);
					_pos = _previous modelToWorld [0, 0, -5];
					_validPos = _pos findEmptyPosition [1, 20, _x];
					//_validPos = cgqc_convoy_start findEmptyPosition [1, 30, _x];
				};
				if ( count _validPos > 0) then {
					_vic = _x createVehicle _validPos;
					// Point towards road
					_vicPos = getPos _vic;
					//_roadPos = [_vicPos] call BIS_fnc_nearestRoad;
					_dir = _vicPos getDir cgqc_convoy_end;
					_vic setDir _dir;
					//Create crew
					createVehicleCrew _vic;
					// Create group
					_group = createGroup east;
					[_vic] joinSilent _group;
					crew _vic joinSilent _group;
					if (_firstRun) then {
						_firstRun = false;
						cgqc_training_convoy_leadGroup = _group;
					};

					// Check special cases
					if (_type isEqualTo "cgqc_pax_opfor_vic_transport_squad") then {
						// Create random squad
						_squad = [selectRandom cgqc_pax_opfor_lead, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier];
						_infantry_group = [ _validPos, east, _squad] call BIS_fnc_spawnGroup;
						{_x moveInCargo _vic} forEach units _infantry_group;
					};
					if (_type isEqualTo "cgqc_pax_opfor_vic_transport_team") then {
						_team = [selectRandom cgqc_pax_opfor_lead, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier];
						_infantry_group = [ _validPos, east, _team] call BIS_fnc_spawnGroup;
						{_x moveInCargo _vic} forEach units _infantry_group;
					};

					// Compile all units from this vic
					cgqc_training_convoy_allVics pushBack _vic;
					{cgqc_training_convoy_allUnits pushBack _x} forEach crew _vic;
				} else {
					[] call CGQC_fnc_convoy_error;
				};
			} forEach cgqc_training_convoy_vic_selection;

			// Vehicles are ready. Creating the logic
			// create the logic (alternative to placing a synchronized module named Convoy_01)
			_logicCenter_01 = createCenter sideLogic;
			_logicGroup_01 = createGroup _logicCenter_01;
			Convoy_01 = _logicGroup_01 createUnit ["Logic", [0,0,0], [], 0, "NONE"];
			Convoy_01 setVariable ["maxSpeed", cgqc_training_convoy_speed];
			Convoy_01 setVariable ["convSeparation", cgqc_training_convoy_distance];
			Convoy_01 setVariable ["stiffnessCoeff", 0.2]; //How much lead brakes to keep separation
			Convoy_01 setVariable ["dampingCoeff", 0.3]; // How much acceleration to keep separation
			Convoy_01 setVariable ["curvatureCoeff", 0.4]; // How much braking for winding roads
			Convoy_01 setVariable ["stiffnessLinkCoeff", 0.2]; // How much followers accelerate/brake
			Convoy_01 setVariable ["pathFrequecy", 0.05];
			Convoy_01 setVariable ["speedFrequecy", 0.2];
			Convoy_01 setVariable ["speedModeConv", "NORMAL"];
			Convoy_01 setVariable ["behaviourConv", _behavior];
			Convoy_01 setVariable ["debug", _debug];

			// create the convoy
			// does not like the array... at all...
			//call{ 0 = [Convoy_01,[cgqc_convoy_vic_lead,cgqc_convoy_vic_troops,cgqc_convoy_vic_vip, cgqc_convoy_vic_last]] execVM "\nagas_Convoy\functions\fn_initConvoy.sqf" };

			call{ 0 = [Convoy_01,cgqc_training_convoy_allVics] execVM "\nagas_Convoy\functions\fn_initConvoy.sqf" };

			// Set waypoint on map target_2
			cgqc_training_convoy_leadGroup addWaypoint [cgqc_convoy_end, 0];
			[cgqc_training_convoy_leadGroup, 1] setWaypointType "MOVE";

			// Message to player
			_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Convoy created. Get ready...</t><br/>";
			[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
			// Started
			cgqc_training_convoy = true;

		} else {
			[] call CGQC_fnc_convoy_error;
		};
	};
};

CGQC_fnc_convoy_start = {
	[] spawn {

		cgqc_convoy_start = nil;
		// Define the event handler function for MapSingleClick
		onMapClick = {
			params["_control", "_pos", "_shift", "_alt", "_ctrl"];
			// Store the clicked position
			cgqc_convoy_start = _pos;
			// Remove the MapSingleClick event handler
			removeMissionEventHandler ["MapSingleClick", y_clickEvent];
			hintSilent "";
		};

		// Add the MapSingleClick event handler
		y_clickEvent = addMissionEventHandler ["MapSingleClick", onMapClick];
		openMap [true, true];
		// Ask for start point
		_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Click on a road for the Starting Point of the convoy</t><br/>";
		[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
		// Wait for the player to click on the map
		waitUntil {!(isNil "cgqc_convoy_start") };

		// Fade to black
		cutText ["", "BLACK FADED", 999];
		titleText ["", "PLAIN"];
		titleCut ["", "BLACK IN", 1];
		// Ask for destination point
		_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Click on road for Convoy destination point</t><br/>";
		[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
		cgqc_convoy_end = nil;
		// Define the event handler function for MapSingleClick
		onMapClick = {
			params["_control", "_pos", "_shift", "_alt", "_ctrl"];
			// Store the clicked position
			cgqc_convoy_end = _pos;
			// Remove the MapSingleClick event handler
			removeMissionEventHandler ["MapSingleClick", y_clickEvent];
			openMap [false, false];
			hintSilent "";
		};
		// Add the MapSingleClick event handler
		y_clickEvent = addMissionEventHandler ["MapSingleClick", onMapClick];
		// Wait for the player to click on the map
		waitUntil {sleep 0.5; !(isNil "cgqc_convoy_end") };

		// Show the interface for the rest of the settings
		_convoyUI = [] call CGQC_fnc_convoy_openUI;
	};
};