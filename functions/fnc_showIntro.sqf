#include "\CGQC\script_component.hpp"
// --- showIntro ----------------------------------------------------------
// Show intro on load
LOG(" showIntro started");

// Show intro info ------------------------------------------------------------------------------------
waitUntil {!isNull (findDisplay 46)};
waitUntil { time > 1 };
if (cgqc_config_showIntro) then {
	cgqc_intro_running = true;

	if (cgqc_player_isVietnam) then {
		// Black silence
		0 fadeSound 0;
		0 fadeEnvironment 0;
		// Start with a silent black screen.
		titleCut ["", "BLACK FADED", 999];

		_mapSize = worldSize;													// map size
		_mapHalf = _mapSize / 2;												// map half
		_mapCent = [_mapHalf,_mapHalf];											// map center 2D
		_mapDir1 = random 360;													// random 360
		_mapPos1 = _mapCent getPos [random _mapHalf, _mapDir1];					// posA, random distance
		_mapDir2 = _mapPos1 getDir _mapCent;									// direction: A-Center-B
		_mapPos2 = _mapCent getPos [random _mapHalf, _mapDir2];					 // posB, random distance

		_camPosA = [_mapPos1 select 0, _mapPos1 select 1, 50];					// Cam Start
		_camPosB = [_mapPos2 select 0, _mapPos2 select 1, 20];					// Cam End/Target

		//Show splashscreen
		//_rscLayer = ["RscLogo"] call BIS_fnc_rscLayer;
		//_rscLayer cutRsc ["CGQC_splash", "PLAIN", 0, true];
		playMusic "LeadTrack01_F_Jets";


		_cam = "camera" camCreate _camPosA;										// Camera/Visual
		_cam camSetTarget _mapPos2;												// Points To....
		_cam cameraEffect ["INTERNAL", "BACK"];									// ?

		_cam camSetPos _camPosB;												// Move Towards
		_cam camCommit 100;
		sleep 2;
		// Fade from black
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0;
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 5;
		titleCut ["", "BLACK IN", 15];
		sleep 20;
		//_rscLayer cutFadeOut 2;														// Speed
		10 fadeSound 1;
		10 fadeEnvironment 1;
		sleep 10;																// Time
		waitUntil {cgqc_roleSwitch_done};
		titleCut ["", "BLACK FADED", 999];
		_cam cameraEffect ["TERMINATE", "BACK"];								// Reset Visual
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [3];
		"dynamicBlur" ppEffectCommit 0;
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 5;
		titleCut ["", "BLACK IN", 6];
		camDestroy _cam;

		cgqc_intro_running = false;
		cgqc_intro_done = true;
		5 fadeMusic 0;
		sleep 5;
		playMusic "";
		0 fadeMusic 1;
		LOG("[showIntro] Nam intro done");
	} else { //Default Intro
		if (!isNil "cgqc_config_author" && !isNil "cgqc_config_mission_name") then {
			if (cgqc_config_author find "Cpl. Quelque chose" != 0) then {
				ace_hearing_disableVolumeUpdate = true;
				if(!isNil "cgqc_establishing") then {
					waitUntil { scriptDone cgqc_establishing };
				};
				0 fadeSound 0;
				// Start with a silent black screen.
				titleCut ["", "BLACK FADED", 999];
				_text = (
					"<img size= '8' style='vertical-align:middle' shadow='false' image='\cgqc\textures\CGQC.paa'/>" +
					"<br/>" +
					"<t size='2' >%1</t><br /><t size = '1'>par %2</t>"
				);
				waitUntil {cgqc_roleSwitch_done};
				//Pop le logo et le texte
				_text = format [_text, cgqc_config_mission_name, cgqc_config_author];
				[_text, 0, 0, 4, 2] spawn BIS_fnc_dynamicText;
				// Fade from black, to blur, to clear as text types.
				10 fadeSound 1;
				sleep 6;
				"dynamicBlur" ppEffectEnable true;
				"dynamicBlur" ppEffectAdjust [3];
				"dynamicBlur" ppEffectCommit 0;
				"dynamicBlur" ppEffectAdjust [0.0];
				"dynamicBlur" ppEffectCommit 5;
				titleCut ["", "BLACK IN", 6];

				sleep 1;
				cgqc_intro_running = false;
				cgqc_intro_done = true;
				ace_hearing_disableVolumeUpdate = false;

				// Show current phase initially
				LOG("[showIntro] - Show initial phase");
				[] spawn {
					waitUntil {
						sleep 3, cgqc_intro_done
					};
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
					sleep 5;
					[
						[
							[_phaseName, "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
							["", "<br/>"], // line break
							[_phaseTxt, "align = 'center' shadow = '1' size = '1.0'"]
						]
					] spawn BIS_fnc_typeText2;
				};
			};
		};
	};
} else {
	titleCut ["", "BLACK IN", 1];
	1 fadeSound 1;
	cgqc_intro_skipped = true;
	cgqc_intro_done = true;
};

LOG("[showIntro] done");