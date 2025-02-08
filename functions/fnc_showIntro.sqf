#include "\CGQC\script_component.hpp"
// --- showIntro ----------------------------------------------------------
params [["_show", cgqc_config_showIntro], ["_type", cgqc_config_showIntro_type], ["_variant", "basic"]];
// Show intro on load
LOG_2("[showIntro] Show:%1/Type:%2 started", _show, _type);

// Show intro info ------------------------------------------------------------------------------------
if !(hasInterface || isDedicated) exitWith {};

waitUntil {!isNull findDisplay 46};

if !(isNil "cgqc_establishing") then {waitUntil { scriptDone cgqc_establishing };};

if (_show) then {
	cgqc_intro_running = true;

	switch (_type) do {
		case 0: { //Original Intro backup
			["hide"] spawn CGQC_fnc_toggleUI;
			waitUntil {CGQC_playerLoaded};
			LOG("[showIntro] Original Intro");
			if (!isNil "cgqc_config_author" && !isNil "cgqc_config_mission_name") then {
				if (cgqc_config_author find "Cpl. Quelque chose" != 0) then {
					_text = (
						"<img size= '8' style='vertical-align:middle' shadow='false' image='\cgqc\textures\CGQC.paa'/>" +
						"<br/>" +
						"<t size='2' >%1</t><br /><t size = '1'>par %2</t>"
					);
					waitUntil {cgqc_roleSwitch_done};
					sleep 2;
					_text = format [_text, cgqc_config_mission_name, cgqc_config_author];
					[_text, 0, 0, 4, 2] spawn BIS_fnc_dynamicText;
					// Fade from black, to blur, to clear as text types.
					10 fadeSound 1;
					sleep 5;
					"dynamicBlur" ppEffectEnable true;
					"dynamicBlur" ppEffectAdjust [3];
					"dynamicBlur" ppEffectCommit 0;
					"dynamicBlur" ppEffectAdjust [0.0];
					"dynamicBlur" ppEffectCommit 5;
					cutText ["", "BLACK IN", 6];
					sleep 0.5;
					cgqc_intro_running = false;
					cgqc_intro_done = true;
					ace_hearing_disableVolumeUpdate = false;
					["show"] spawn CGQC_fnc_toggleUI;
					// Show current phase initially
					LOG("[showIntro] - Show initial phase");
					waitUntil {sleep 3, cgqc_intro_done};
					_phase = missionNamespace getVariable "CGQC_gamestate_current";
					_phaseName = "";
					_phaseTxt = "";
					switch (_phase) do {
						case "training": {
							_phaseName = "Training";
							_phaseTxt = "Have fun!";
						};
						case "staging": {
							_phaseName = "Staging";
							_phaseTxt = "Get ready!";
						};
						case "mission": {
							_phaseName = "Mission";
							_phaseTxt = "Here we go!";
						};
					};
					sleep 10;
					[
						[
							[_phaseName, "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
							["", "<br/>"], // line break
							[_phaseTxt, "align = 'center' shadow = '1' size = '1.0'"]
						]
					] spawn BIS_fnc_typeText2;
				};
			} else {
				LOG("[showIntro] Error: No mission name/Author");
				1 fadeSound 1;
				1 fadeEnvironment 1;
				ace_hearing_disableVolumeUpdate = false;
				cutText ["", "BLACK IN", 1];
				cgqc_intro_skipped = true;
				cgqc_intro_done = true;
				cgqc_intro_running = false;
			};
			LOG("[showIntro] Original Intro Done");
		};
		case 1: { //Flying intro
			LOG("[showIntro] Flying Intro");
			0 fadeSound 0;
			cutText ["", "BLACK", 1e-6];
			_track = ["LeadTrack01_F_Jets", 3];
			_initTime = 4;
			_fadeIn = 3;
			_totalTime = 10;
			_textTime = 8;
			switch (_variant) do {
				case "actionDark": {
					_track = ["Track07_ActionDark", 0];
					_initTime = 1;
					_fadeIn = 2;
					_totalTime = 10;
					_textTime = 7;
				};
				case "defcon": {
					_track = ["Defcon", 0];
					_fadeIn = 6;
					_initTime = 3;
					_totalTime = 10;
					_textTime = 6;
				};
			};
			["hide"] spawn CGQC_fnc_toggleUI;
			_mapSize = worldSize;								// Map size
			_mapHalf = _mapSize / 2;							 // Map half
			_mapCent = [_mapHalf, _mapHalf];					 // Map center 2D
			_mapDir1 = random 360;							   // Random 360
			_mapPos1 = _mapCent getPos [random _mapHalf, _mapDir1]; // posA, random distance
			_mapDir2 = _mapPos1 getDir _mapCent;				 // Direction: A-Center-B
			_mapPos2 = _mapCent getPos [random _mapHalf, _mapDir2]; // posB, random distance

			// Sample terrain between A and B to find max terrain height
			_numSamples = 20;  // Number of points to sample along the path
			_highestTerrainHeight = 0;  // Track highest terrain height
			for "_i" from 0 to 1 step (1 / _numSamples) do {
				_samplePos = [
					(_mapPos1 select 0) + (_i * ((_mapPos2 select 0) - (_mapPos1 select 0))),
					(_mapPos1 select 1) + (_i * ((_mapPos2 select 1) - (_mapPos1 select 1)))
				];
				_sampleHeight = getTerrainHeightASL _samplePos;

				if (_sampleHeight > _highestTerrainHeight) then {
					_highestTerrainHeight = _sampleHeight;
				};
			};
			// Set camera height above highest terrain point
			_camHeight = _highestTerrainHeight + 25;  // Keep camera 200m above the highest terrain
			_camPosA = [_mapPos1 select 0, _mapPos1 select 1, _camHeight];  // Cam Start position
			_camPosB = [_mapPos2 select 0, _mapPos2 select 1, _camHeight];  // Cam End position (same height)
			y_dist = _camPosA distance _camPosB;
			_time = y_dist / 50;
			// Music and effects
			0 fadeMusic 0;
			playMusic [_track select 0, _track select 1];
			3 fadeMusic 1;
			_cam = "camera" camCreate _camPosA;				  // Create camera
			_cam camSetTarget _mapPos2;						  // Point towards end position
			_cam cameraEffect ["INTERNAL", "BACK"];
			// Start fade-in from black asynchronously (non-blocking)
			[_initTime, _textTime, _fadeIn] spawn {
				params ["_initTime", "_textTime", "_fadeIn"];
				sleep _initTime; // Slight delay to allow the camera to start moving
				cutText ["", "BLACK IN", _fadeIn];
				if (!isNil "cgqc_config_mission_name" && cgqc_config_author find "Cpl. Quelque chose" != 0) then {
					sleep _textTime;
					_txt = format ["<t shadow='0' font='EtelkaNarrowMediumPro' size='6'>%1</t><br/>", cgqc_config_mission_name];
					cutText [_txt, "PLAIN", 3, true, true];
				};
			};
			// Move camera from A to B smoothly without changing height
			_cam camSetPos _camPosB;
			_cam camCommit _time;  // Adjust this for desired speed (15 seconds travel)

			if (cgqc_mission_isDark) then {
				camUseNVG true;
			};

			// Wait for intro to complete
			sleep _totalTime;  // Match this to the camCommit time

			10 fadeSound 1;
			10 fadeEnvironment 1;
			sleep 13;
			waitUntil {cgqc_roleSwitch_done};
			cutText ["", "BLACK", 1e-6];
			_cam cameraEffect ["TERMINATE", "BACK"];
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [3];
			"dynamicBlur" ppEffectCommit 0;
			"dynamicBlur" ppEffectAdjust [0.0];
			"dynamicBlur" ppEffectCommit 5;
			cutText ["", "BLACK IN", 6];
			camDestroy _cam;
			sleep 2;
			// End music
			5 fadeMusic 0;
			sleep 8;
			playMusic "";
			0 fadeMusic 1;
			cgqc_intro_running = false;
			cgqc_intro_done = true;
			["show"] spawn CGQC_fnc_toggleUI;

			LOG("[showIntro] Flying intro done");
		};
		case 2: { //Establishing shot
			LOG("[showIntro] 3: Establishing shot");
			1 fadeSound 1;
			1 fadeEnvironment 1;
			0 fadeMusic 0;
			playMusic ["LeadTrack01_F_Jets", 2];
			5 fadeMusic 1;
			ace_hearing_disableVolumeUpdate = true;
			cutText ["", "BLACK IN", 1];
			if (isNil "cgqc_establishing_text") then {cgqc_establishing_text = cgqc_config_mission_name;};
			_angle = random 360;
			cgqc_establishing = [player, cgqc_establishing_text, 50, 100, _angle, 1, [], 0, true] spawn BIS_fnc_establishingShot;
			waitUntil { scriptDone cgqc_establishing };
			5 fadeMusic 0;
			sleep 7;
			playMusic "";
			0 fadeMusic 1;
			cgqc_intro_running = false;
			cgqc_intro_done = true;
			LOG("[showIntro] Establishing intro done");
		};
		default {
			LOG_1("[showIntro] Type %1? problem. Defaulting.", _type);
			1 fadeSound 1;
			0 fadeEnvironment 1;
			ace_hearing_disableVolumeUpdate = true;
			cutText ["", "BLACK IN", 1];
			cgqc_intro_skipped = true;
			cgqc_intro_done = true;
			cgqc_intro_running = false;
			LOG("[showIntro] Flying intro done");
		};
	};
} else {
	LOG("[showIntro] Not Showing intro. Skipping.");
	1 fadeSound 1;
	1 fadeEnvironment 1;
	ace_hearing_disableVolumeUpdate = false;
	cutText ["", "BLACK IN", 1];
	cgqc_intro_skipped = true;
	cgqc_intro_done = true;
	cgqc_intro_running = false;
};

// Restore sound stuff in case
sleep 30;
1 fadeSound 1;
1 fadeEnvironment 1;
ace_hearing_disableVolumeUpdate = false;

enableSaving [false, false];
LOG("[showIntro] done");


/* Legacy shit
	LOG("[showIntro] Flying Intro");
			// Black silence
			0 fadeSound 0;
			0 fadeEnvironment 0;
			// Start with a silent black screen.
			cutText ["", "BLACK", 1e-6];

			_mapSize = worldSize;													// map size
			_mapHalf = _mapSize / 2;												// map half
			_mapCent = [_mapHalf,_mapHalf];											// map center 2D
			_mapDir1 = random 360;													// random 360
			_mapPos1 = _mapCent getPos [random _mapHalf, _mapDir1];					// posA, random distance
			_mapDir2 = _mapPos1 getDir _mapCent;									// direction: A-Center-B
			_mapPos2 = _mapCent getPos [random _mapHalf, _mapDir2];					 // posB, random distance

			_camPosA = [_mapPos1 select 0, _mapPos1 select 1, 200];					// Cam Start
			_camPosB = [_mapPos2 select 0, _mapPos2 select 1, 75];					// Cam End/Target

			//Show splashscreen
			//_rscLayer = ["RscLogo"] call BIS_fnc_rscLayer;
			//_rscLayer cutRsc ["CGQC_splash", "PLAIN", 0, true];
			0 fadeMusic 0;
			playMusic ["LeadTrack01_F_Jets", 3];
			3 fadeMusic 1;

			_cam = "camera" camCreate _camPosA;										// Camera/Visual
			_cam camSetTarget _mapPos2;												// Points To....
			_cam cameraEffect ["INTERNAL", "BACK"];									// ?

			_cam camSetPos _camPosB;												// Move Towards
			// Check if night time

			if (cgqc_mission_isDark) then {
				camUseNVG true;
			};
			_cam camCommit 100;
			sleep 1;
			// Fade from black
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [6];
			"dynamicBlur" ppEffectCommit 0;
			"dynamicBlur" ppEffectAdjust [0.0];
			"dynamicBlur" ppEffectCommit 3;
			cutText ["", "BLACK IN", 5];
			sleep 20;
			//_rscLayer cutFadeOut 2;														// Speed
			10 fadeSound 1;
			10 fadeEnvironment 1;
			sleep 10;																// Time
			waitUntil {cgqc_roleSwitch_done};
			cutText ["", "BLACK", 1e-6];
			_cam cameraEffect ["TERMINATE", "BACK"];								// Reset Visual
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [3];
			"dynamicBlur" ppEffectCommit 0;
			"dynamicBlur" ppEffectAdjust [0.0];
			"dynamicBlur" ppEffectCommit 5;
			cutText ["", "BLACK IN", 6];
			camDestroy _cam;

			// All done
			5 fadeMusic 0;
			sleep 5;
			playMusic "";
			0 fadeMusic 1;
			cgqc_intro_running = false;
			cgqc_intro_done = true;
			LOG("[showIntro] Flying intro done");
		*/