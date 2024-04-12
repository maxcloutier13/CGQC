// --- notifyAll ----------------------------------------------------------
// Handles the gamestate flow
params ["_txt", ["_length", 3], ["_fadeIn", 1], ["_mode", "dynamic"], ["_txt2", ""], ["_txt3", ""]];
diag_log format ["[CGQC_FNC] notifyAll %1/%2/%3 started", _txt, _length, _fadeIn];
// Make variables accessible...
cgqc_notifAll_txt = _txt;
cgqc_notifAll_length = _length;
cgqc_notifAll_fade = _fadeIn;

switch (_mode) do {
	case "phase_msg": {
		[
			[
				[_txt, "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
				            ["", "<br/>"], // line break
				[_txt2, "align = 'center' shadow = '1' size = '1.0'"]
			]
		] spawn BIS_fnc_typeText2;
	};
	case "mission": {
		[_txt, _txt2, _txt3] spawn BIS_fnc_infoText;
	};
	case "dynamic": {
		// Dynamic text on everyone
		[-1, {
			[cgqc_notifAll_txt, 0, 0, cgqc_notifAll_length, cgqc_notifAll_fade] spawn BIS_fnc_dynamicText
		}] call CBA_fnc_globalExecute;
	};
	case "ace" do {
		_units = [] call CGQC_int_allHumanPlayers;
		{
			["ace_common_displayTextStructured", [cgqc_notifAll_txt, cgqc_notifAll_length, _x], [_x]] call CBA_fnc_targetEvent;
		} forEach _units;
	};
};

diag_log "[CGQC_FNC] notifyAll finished";