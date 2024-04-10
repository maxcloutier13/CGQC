// --- notifyAll ----------------------------------------------------------
// Handles the gamestate flow
params ["_txt", ["_length", 3], ["_fadeIn", 1], ["_mode", "dynamic"]];
diag_log format ["[CGQC_FNC] notifyAll %1/%2/%3 started", _txt, _length, _fadeIn];
// Make variables accessible...
cgqc_notifAll_txt = _txt;
cgqc_notifAll_length = _length;
cgqc_notifAll_fade = _fadeIn;

switch (_mode) do {
    case "dynamic": {
        // Dynamic text on everyone
        [-1,{[cgqc_notifAll_txt, 0, 0, cgqc_notifAll_length, cgqc_notifAll_fade] spawn BIS_fnc_dynamicText}] call CBA_fnc_globalExecute;
    };
    case "ace" do {
        _units = [] call CGQC_int_allHumanPlayers;
		{
			["ace_common_displayTextStructured", [cgqc_notifAll_txt, cgqc_notifAll_length, _x], [_x]] call CBA_fnc_targetEvent;
		} forEach _units;
    };
};

diag_log "[CGQC_FNC] gamestate finished";