// --- removeRadios ----------------------------------------------------------
// Remove all radios from target
params ["_target", "_type"];
diag_log format ["[CGQC_FNC] removeRadios %1/%2 started", _target, _type];

// Delete 148 event in case it exists
if(!isNil "cgqc_event_148") then {
	diag_log "[CGQC_FNC] removeRadios cgqc_event_148 found: deleting";
	["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
};

switch (_type) do {
	case "all": {
		diag_log "[CGQC_FNC] removeRadios _type = all. Deleting everything";
		// Remove all radios
		_radios = call acre_api_fnc_getCurrentRadioList;
		while {count _radios > 0} do {
			{
			_target unassignItem _x;
			_target removeItem _x;
			} forEach _radios;
			_radios = call acre_api_fnc_getCurrentRadioList;
		};
	};
	default {diag_log "[CGQC_ERROR] removeRadios _type not matched";};
};

diag_log "[CGQC_FNC] removeRadios done";