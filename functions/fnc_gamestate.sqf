#include "\CGQC\script_component.hpp"
// --- gamestate ----------------------------------------------------------
// Handles the gamestate flow
params ["_type"];
LOG_1("[gamestate] %1 mode started", _type);

cgqc_var_gamestates = [
	"CGQC_gamestate_0_init",
	"CGQC_gamestate_1_staging",
	"CGQC_gamestate_1_briefing",
	"CGQC_gamestate_1_briefing_leaders",
	"CGQC_gamestate_1_briefing_full",
	"CGQC_gamestate_2_mission_start",
	"CGQC_gamestate_2_mission_start_snapshot",
	"CGQC_gamestate_3_mission_stop",
	"CGQC_gamestate_X_training",
	"CGQC_gamestate_X_anti"
];

CGQC_int_resetGamestate = {
	// Set all states to false
	{
		missionNamespace setVariable [_x, false, true];
	} forEach cgqc_var_gamestates;
	true;
};

[] call CGQC_int_resetGamestate;

switch (_type) do {
	case "init": {
		missionNamespace setVariable ["CGQC_gamestate_current", "Init", true];
		missionNamespace setVariable ["CGQC_gamestate_0_init", true, true];
	};
	case "anti": {
		missionNamespace setVariable ["CGQC_gamestate_X_anti", true, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "anti", true];
	};
	case "training": {
		missionNamespace setVariable ["CGQC_gamestate_X_training", true, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "training", true];
	};
	case "staging": {
		missionNamespace setVariable ["CGQC_gamestate_1_staging", true, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "staging", true];

		// Notify the player of staging phase once in a while
		[] spawn {
			while { missionNamespace getVariable "CGQC_gamestate_1_staging" } do {
				sleep 15;
				// notify all
				if !(cgqc_intro_running) then {
					_txt = "Staging Phase";
					[_txt, 3, 0, "cba_notify_phase"] call CGQC_fnc_notifyAll;
				};
			};
		};
	};
	case "show": {
		[cgqc_config_mission_name, 5, 2, "mission_start"] spawn CGQC_fnc_notifyAll;
	};
	case "start": {
		// Sets variables
		missionNamespace setVariable ["CGQC_gamestate_2_mission_start", true, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "mission", true];
		// Save "start" snapshot
		[player, "save", "all", "start"] spawn CGQC_fnc_snapshot;
		missionNamespace setVariable ["CGQC_gamestate_2_mission_start_snapshot", true, true];
		// Unpause the AI if they are paused
		if (missionNamespace getVariable "CGQC_gamestate_mission_AIpaused") then {
			[0, {
				["unpause", 0, ""] spawn CGQC_fnc_perksZeus
			}] call CBA_fnc_globalExecute;
			hint "AI Unpaused!";
		};
		// Voice level to normal
		[0, {
				[player, "normal"] call CGQC_fnc_setVoiceVolume;
		}] call CBA_fnc_globalExecute;
		// Start message for everyone
		_txt = "Mission Started!";
		_txt2 = "Player Snapshot saved";
		_txt3 = "Good luck, Viper!";
		[_txt, 3, 0, "cba_notify_start", _txt2, _txt3] call CGQC_fnc_notifyAll;
	};
	case "end": {
		LOG("[gamestate] Ending mission");
		missionNamespace setVariable ["CGQC_gamestate_3_mission_stop", true, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "end", true];
		// Pause the AI?
		if !(missionNamespace getVariable "CGQC_gamestate_mission_AIpaused") then {
			LOG("[gamestate] Pausing AI");
			[0, {
				["pause", 0, ""] spawn CGQC_fnc_perksZeus
			}] call CBA_fnc_globalExecute;
			hint "AI paused!";
		};
		// End message for everyone
		LOG("[gamestate] Notifying end of mission");
		_text = ("<br/><br/><br/><t size='1' >Mission Ended!<br/>Good job, Viper!</t><br/>");
		[_text, 5, 2] call CGQC_fnc_notifyAll;
	};
	default {};
};

LOG("[gamestate] finished");