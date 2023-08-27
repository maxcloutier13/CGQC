// --- removeRadios ----------------------------------------------------------
// Remove all radios from target
params ["_target", "_type"];
diag_log format ["[CGQC_FNC] removeRadios %1/%2 started", _target, _type];

// Delete 148 event in case it exists
if(!isNil "cgqc_event_148") then {
	["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
};

switch (_type) do {
	case "all": { 
		// Remove all radios
		_radios = call acre_api_fnc_getCurrentRadioList;
		{
			_target unassignItem _x;
			_target removeItem _x;
		} forEach _radios;

		// Sanity check 
		_radios = call acre_api_fnc_getCurrentRadioList;
		if (count _radios > 0) then {
			diag_log "[CGQC_ERROR] removeRadios issue";
		};
	};
	default {diag_log "[CGQC_ERROR] removeRadios issue";};
};

diag_log "[CGQC_FNC] removeRadios done";