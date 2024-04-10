// --- gamestate ----------------------------------------------------------
// Handles the gamestate flow
params ["_type"];
diag_log format ["[CGQC_FNC] gamestate %1 mode started", _type];

switch (_type) do {
    case "anti": {
        missionNamespace setVariable ["CGQC_gamestate_staging", false, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_start", true, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_post", false, true];
		missionNamespace setVariable ["CGQC_gamestate_training", false, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_AIpaused", false, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "anti", true];
    };
	case "training": {
		missionNamespace setVariable ["CGQC_gamestate_staging", false, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_start", false, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_post", false, true];
		missionNamespace setVariable ["CGQC_gamestate_training", true, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_AIpaused", false, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "training", true];
	};
	case "staging": {
		missionNamespace setVariable ["CGQC_gamestate_staging", true, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_start", false, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_post", false, true];
		missionNamespace setVariable ["CGQC_gamestate_training", false, true];
		missionNamespace setVariable ["CGQC_gamestate_mission_AIpaused", cgqc_config_state_pause, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "staging", true];

		// Notify the player of staging phase once in a while
		[] spawn {
			while { missionNamespace getVariable "CGQC_gamestate_staging" } do {
				sleep 30;
				// notify all
				_txt = "Staging Phase";
				[_txt, 3, 0, "ace"] call CGQC_fnc_notifyAll;
			};
		};
	};
	case "start": {
		// Sets variables
		missionNamespace setVariable ["CGQC_gamestate_staging", false];
		missionNamespace setVariable ["CGQC_gamestate_mission_start", true];
		missionNamespace setVariable ["CGQC_gamestate_mission_post", false];
		missionNamespace setVariable ["CGQC_gamestate_training", false];
		missionNamespace setVariable ["CGQC_gamestate_current", "mission"];
		// Save "start" snapshot
		[player, "save", "all", "start"] spawn CGQC_fnc_snapshot;
		// Unpause the AI if they are paused
		if (missionNamespace getVariable "CGQC_gamestate_mission_AIpaused") then {
			[0, {
				["unpause", 0, ""] spawn CGQC_fnc_perksZeus
			}] call CBA_fnc_globalExecute;
			hint "AI Unpaused!";
		};
		// Start message for everyone
		_text = ("<br/><br/><br/><br/><br/><br/><t size='1' >Mission Started!<br/>Player Snapshot saved<br/>Good luck, Viper!</t><br/>");
		[_text, 5, 2] call CGQC_fnc_notifyAll;
	};
	case "end": {
		missionNamespace setVariable ["CGQC_gamestate_staging", false];
		missionNamespace setVariable ["CGQC_gamestate_mission_start", false];
		missionNamespace setVariable ["CGQC_gamestate_mission_post", true];
		missionNamespace setVariable ["CGQC_gamestate_current", "end"];
		// Pause the AI?
		if !(missionNamespace getVariable "CGQC_gamestate_mission_AIpaused") then {
			[0, {
				["pause", 0, ""] spawn CGQC_fnc_perksZeus
			}] call CBA_fnc_globalExecute;
			hint "AI paused!";
		};
		// End message for everyone
		_text = ("<br/><br/><br/><t size='1' >Mission Ended!<br/>Good job, Viper!</t><br/>");
		[_text, 5, 2] call CGQC_fnc_notifyAll;
	};
	default {};
};

diag_log "[CGQC_FNC] gamestate finished";