#include "\CGQC\script_component.hpp"
// --- notifyAll ----------------------------------------------------------
// Handles the gamestate flow
params ["_txt", ["_length", 3], ["_fadeIn", 1], ["_mode", "dynamic"], ["_txt2", ""], ["_txt3", ""]];
LOG_3(" notifyAll %1/%2/%3 started", _txt, _length, _fadeIn);
// Make variables accessible...
cgqc_notifAll_txt = _txt;
cgqc_notifAll_txt_2 = _txt2;
cgqc_notifAll_txt_3 = _txt3;
cgqc_notifAll_length = _length;
cgqc_notifAll_fade = _fadeIn;

switch (_mode) do {
	case "mission_start":{
		[-1, {
			[
				[
					[cgqc_notifAll_txt, "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"]
				]
			] spawn BIS_fnc_typeText2;
		}] call CBA_fnc_globalExecute;
		//["ace_common_displayTextStructured", [_displayText, 3, _target], [_target]] call CBA_fnc_targetEvent;
	};
	case "cba_notify_phase": {
		cgqc_notifPhase = cgqc_notifAll_txt;
		publicVariable "cgqc_notifPhase";
		[-1, {
			[[cgqc_notifPhase, 1.5], true] call CBA_fnc_notify;
		}] call CBA_fnc_globalExecute;
	};
	case "cba_notify_start": {
		cgqc_notifStart = cgqc_notifAll_txt;
		cgqc_notifStart2 = cgqc_notifAll_txt_2;
		publicVariable "cgqc_notifStart";
		publicVariable "cgqc_notifStart2";
		[-1, {
			[[cgqc_notifStart, 1.5], [cgqc_notifStart2], false] call CBA_fnc_notify;
		}] call CBA_fnc_globalExecute;
	};
	case "dynamic": {
		// Dynamic text on everyone
		[-1, {
			[cgqc_notifAll_txt, 0, 0, cgqc_notifAll_length, cgqc_notifAll_fade] spawn BIS_fnc_dynamicText
		}] call CBA_fnc_globalExecute;
		//["ace_common_displayTextStructured", [_displayText, 3, _target], [_target]] call CBA_fnc_targetEvent;

	};
	case "ace" do {
		_units = [] call CGQC_int_allHumanPlayers;
		{
			["ace_common_displayTextStructured", [cgqc_notifAll_txt, cgqc_notifAll_length, _x], [_x]] call CBA_fnc_targetEvent;
		} forEach _units;
	};
};

LOG(" notifyAll finished");