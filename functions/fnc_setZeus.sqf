// --- setZeus ----------------------------------------------------------
// Set zeus and keeps them there
diag_log format ["[CGQC_FNC] setZeus started"];

[] spawn {
	// Delay until the server time has sync'd
	waitUntil {	time > 5};
	// for JIP, wait until the main screen loads
	waitUntil {	!isNull (findDisplay 46)};
	// Check if player name contains the word "Zeus"

	if (["zeus", format["%1", roleDescription player]] call BIS_fnc_inString || ["zeus", format["%1", player]] call BIS_fnc_inString) then {
		hint "Zeus!";
		sleep 1;

		/*
		[] spawn {
			while {true} do {
				// Make sure radios are on
				if (cgqc_config_zeusRadios) then {
					[player] spawn CGQC_fnc_zeusUnit;
					_zeusRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
					if (count _zeusRadios < 2) then {
						["zeus_radios", 0, player] spawn CGQC_fnc_perksZeus;
					};
				};
				sleep 20;
			};
		};*/
		// Ensure Zeus keeps slot, despite admin logging
		while { true } do {
			// Check that Zeus has been assigned to player
			if (isNull (getAssignedCuratorLogic player)) then {
				// find all curators and reverse list so to lessen chance of admin Zeus conflicts
				private _curatorList = allCurators;
				reverse _curatorList;
				private _exitLoop = false;
				{
					// find an unassigned Zeus slot and assign it to the player
					if (isNull (getAssignedCuratorUnit _x)) then {
						[player, _x] remoteExecCall ["assignCurator", 2];
						sleep 2.0;
						// Check if a valid Zeus slot
						if (isNull (getAssignedCuratorLogic player)) then {
							// Broken Zeus slot, so clear and repeat
							_x remoteExecCall ["unassignCurator", 2];
							sleep 2.0;
						} else {
							hint format["Zeus assigned to curator %1", _x];
							_exitLoop = true;
						};
					};
					if (_exitLoop) exitWith {};
				} forEach _curatorList;
			};
		sleep 25.0;
		};
	};
};
diag_log "[CGQC_FNC] setZeus done";