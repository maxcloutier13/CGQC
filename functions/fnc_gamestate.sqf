// --- gamestate ----------------------------------------------------------
// Handles the gamestate flow
params ["_type"];
diag_log format ["[CGQC_FNC] gamestate %1 mode started", _type];

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
				sleep 30;
				// notify all
				_txt = "Staging Phase";
				[_txt, 3, 0, "ace"] call CGQC_fnc_notifyAll;
			};
		};
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
		// Start message for everyone
		_text = ("<br/><br/><br/><br/><br/><br/><t size='1' >Mission Started!<br/>Player Snapshot saved<br/>Good luck, Viper!</t><br/>");
		[_text, 5, 2] call CGQC_fnc_notifyAll;
	};
	case "end": {
		missionNamespace setVariable ["CGQC_gamestate_3_mission_stop", true, true];
		missionNamespace setVariable ["CGQC_gamestate_current", "end", true];
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