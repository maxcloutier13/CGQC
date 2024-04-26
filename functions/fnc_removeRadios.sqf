#include "\CGQC\script_component.hpp"
// --- removeRadios ----------------------------------------------------------
// Remove all radios from target
params ["_target", "_type"];
LOG_1(" removeRadios %1/%2 started", _target, _type);

// Delete 148 event in case it exists
if(!isNil "cgqc_event_148") then {
	LOG(" removeRadios cgqc_event_148 found: deleting");
	["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
};

switch (_type) do {
	case "all": {
		LOG(" removeRadios _type = all. Deleting everything");
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
	default {LOG("[CGQC_ERROR] removeRadios _type not matched");};
};

LOG(" removeRadios done");