#include "\CGQC\script_component.hpp"
// --- trainingPara ----------------------------------------------------------
// Paradrop shenanigans
params ["_jumpHeight", ["_tpVersion", 0], ["_playerTarget", ""]];

// Jump target composition
cgqc_position_jump =
[
	["PortableHelipadLight_01_blue_F",[0.461914,8.99194,-0.00117397],0,1,0,[0,0],"","",true,false],
	["Land_JumpTarget_F",[0.282715,9.00098,0],0,1,0,[0,0],"","",true,false]
];

[_jumpHeight, _tpVersion, _playerTarget] spawn {
	params ["_jumpHeight", "_tpVersion", "_playerTarget"];
	LOG_3(" trainingPara %1/%2/%3 started", _jumpHeight, _tpVersion, _playerTarget);

	cgqc_jump_backpack = "";
	cgqc_jump_backpack_items = [];
	cgqc_quickjump = false;
	cgqc_jump_clickPos = nil;

	if (_jumpHeight == 0) then { // Quickjump - 500m no targets
		player allowDammage false;
		_jumpHeight = 300;
		cgqc_training_jump_target = true;
		// Quickset parachute
		cgqc_jump_backpack = backpack player;
		cgqc_jump_backpack_items = backpackItems player;
		sleep 0.1;
		removeBackpack player;
		player addBackpack "B_Parachute";
		sleep 0.1;
		cgqc_quickjump = true;
	};


	if (backpack player isEqualTo "B_Parachute" || backpack player isEqualTo "rhsusf_eject_Parachute_backpack" || backpack player isEqualTo "ACE_NonSteerableParachute") then {
		cgqc_training_jump = true;
		if (_tpVersion > 0) then {
			// Position is target player
			cgqc_jump_clickPos = getPos _playerTarget;
		}else{
			// Ask to click on map
			hint "Click on map to choose jump point.";
			cgqc_jump_clickPos = nil;
			// Define the event handler function for MapSingleClick
			onMapClick = {
				params["_control", "_pos", "_shift", "_alt", "_ctrl"];
				// Store the clicked position
				cgqc_jump_clickPos = _pos;
				// Remove the MapSingleClick event handler
				removeMissionEventHandler ["MapSingleClick", y_clickEvent];
				openMap [false, false];
				hintSilent "";
			};
			// Add the MapSingleClick event handler
			y_clickEvent = addMissionEventHandler ["MapSingleClick", onMapClick];
			openMap [true, true];
			// Wait for the player to click on the map
			waitUntil {sleep 0.5; !(isNil "cgqc_jump_clickPos") };
		};

		if (cgqc_quickjump) then {
			player setVelocity [0, 0, 50];
			playSound3D ["a3\data_f_curator\sound\cfgsounds\wind3.wss", player];
			//playSound3D ["a3\sounds_f\weapons\launcher\nlaw_final_2.wss", player];
			hint "Hold on to your butt. Parachute WILL auto-open";
			sleep 3;
		};
		// Good to jump
		cutText ["", "BLACK", 1e-6];
		if (cgqc_quickjump) then {
			y_jumpPosition = cgqc_jump_clickPos;
		}else{
			// Fade to black
			titleText ["Prêt?", "PLAIN"];
			// Inputs
			_altitude = _jumpHeight;  // Player's altitude in meters
			_speed = 200; //speed player;      // Player's forward speed in meters per second
			// Constants
			_gravity = 9.81;  // Acceleration due to gravity in m/s^2
			// Calculate falling time
			y_fallingTime = sqrt((2 * _jumpHeight) / _gravity);
			// Calculate horizontal distance
			y_horizontalDistance = 4 * _speed;
			// Adjust the distance if needed
			y_adjustedDistance = (y_horizontalDistance * -1) + 200;  // Add any adjustments here
			// Calculate the desired jump position
			y_jumpPosition = cgqc_jump_clickPos vectorAdd [0, y_adjustedDistance, 0];
			// Use the jump position for further processing or actions
			hint format ["Jump in 5s - Position: %1", y_jumpPosition];
			sleep 5;
		};

		// Teleport to location
		player setPos [y_jumpPosition select 0, y_jumpPosition select 1, _jumpHeight];
		if !(cgqc_quickjump) then {
			// Give some velocity
			player setVelocity [0, 150, 0];
		}else {
			playSound3D ["a3\data_f_warlords\sfx\flyby.wss", player];//, false, getPosASL player, 2, 1, 100];
			sleep 3;
		};

		//Create jump target if ON
		if (cgqc_training_jump_target) then {
			cgqc_training_jump_comp_on = true;
			cgqc_training_jump_comp = [cgqc_jump_clickPos, getDir player, cgqc_position_jump] call BIS_fnc_ObjectsMapper;
			if !(cgqc_quickjump) then {
				[] spawn {
					sleep 5;
					cgqc_training_jump_smoking = true;
					while {cgqc_training_jump_comp_on && cgqc_training_jump_smoking} do {
						cgqc_jump_smoke = createVehicle ["SmokeShellPurple", cgqc_jump_clickPos, [], 0, "NONE"];
						waitUntil {isNull cgqc_jump_smoke};
						if((player distance cgqc_jump_clickPos) < 100) then {
							cgqc_training_jump_smoking = false;
						}else{
							hint format ["Distance to target:%1", player distance cgqc_jump_clickPos];
						};
					};
				};
			};
			//Jump marker
			y_markerJump = createMarker ["cgqc_jump_marker", cgqc_jump_clickPos];
			"cgqc_jump_marker" setMarkerType "hd_join";
			"cgqc_jump_marker" setMarkerText "Jump Target";
			"cgqc_jump_marker" setMarkerColor "ColorBlue";
		};

		// Wake up with blur
		titleFadeOut 2;
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0;
		cutText ["", "BLACK IN", 3];
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 2;
		if (cgqc_quickjump || cgqc_training_jump_autoOpen) then {
			//Auto open at 100m
			[]spawn {
				waitUntil {getPosATL player select 2 < 75};  // Wait until the player's altitude is less than 100 meters
				if !(vehicle player isKindOf "ParachuteBase") then {
					player action ["OpenParachute", player];  // Open the parachute for the player
					hint "Parachute auto-opened";
				} else {
					hint "Parachute already opened";
				};

			};
		};
		waitUntil{isTouchingGround player};
		cgqc_training_jump = false;

		[] spawn {
			// Delete all the stuffs
			if (cgqc_training_jump_comp_on) then {
				sleep 10;
				//hint "Clearing all in 10s";
				{
					deleteVehicle _x
				} forEach cgqc_training_jump_comp;
				cgqc_training_jump_comp_on = false;
				if !(isNil "y_markerJump") then {deleteMarker "cgqc_jump_marker";};
			};
		};

		if (cgqc_quickjump) then {
			// Remove parachute
			removeBackpack player;
			player addBackpack cgqc_jump_backpack;
			clearAllItemsFromBackpack player;
			{
				player addItemToBackpack _x;
			}forEach cgqc_jump_backpack_items;
			cgqc_quickjump = false;
			hint "Good to go bruv!";
			sleep 10;
			player allowDammage true;
		} else{
			hint "Good job! Ace Self->Action: Drop ton parachute!";
		};

	} else {
	hint "Sans parachute? T'es malade!";
	};
};
LOG(" trainingParachute done");