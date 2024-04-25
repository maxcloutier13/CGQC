#include "\CGQC\script_component.hpp"
// --- loadDiaryRoster ----------------------------------------------------------
// List all groups and players + roles
LOG(" loadDiaryRoster started");

waitUntil {cgqc_start_postInitClient_done};

// Load Everything
[] call CGQC_fnc_loadGroupInfo;

// Calculate time of update
_hour = systemTime select 3;
_mins = systemTime select 4;
_secs = systemTime select 5;
//_roster = _roster + format ["<br/><font color='#282828'> -Updated %1:%2:%3 </font>", _hour, _mins, _secs];

// Define column widths
_posWidth = 4;
_roleWidth = 15;
_nameWidth = 15;
_weightWidth = 6;

// Function to pad string with spaces
padString = {
	private ["_string", "_width"];
	_string = _this select 0;
	_width = _this select 1;
	while {count _string < _width} do {
		_string = _string + " ";
	};
	_string
};

// Pad strings before formatting
{
    _pos = [(_x select 2), _posWidth] call padString;
    _role = [(_x select 1), _roleWidth] call padString;
	_name = [(_x select 0), _nameWidth] call padString;
	_weight = [(_x select 3), _weightWidth] call padString;
	_x set [0, _pos];
	_x set [1, _role];
	_x set [2, _name];
	_x set [3, _weight];
} forEach _soldiers;


_roster = "";

// Header
_hint = format ["%1%2%3%4",
    ([ "No", _posWidth ] call padString),
    ([ "Role", _roleWidth ] call padString),
	([ "Name", _nameWidth ] call padString),
	([ "Weight", _weightWidth ] call padString)
];
_roster = _roster + _hint + "<br/>";
// Separator
_hint = format ["%1%2%3%4",
	([ "", _posWidth ] call padString),
    ([ "", _roleWidth ] call padString),
	([ "", _nameWidth ] call padString),
	([ "", _weightWidth ] call padString)
];
_roster = _roster + _hint + "<br/>";


{
    // Data rows
    {
        _hint = format ["%1%2%3%4",
            _x select 1,
            _x select 2,
            _x select 3,
            _x select 4
        ];
        _roster = _roster + _hint + "<br/>";
    } forEach _x;
} forEach cgqc_allGroupsInfo;

//player createDiarySubject ["CGQC_Roster_test", "Roster_test"];
//player createDiaryRecord ["CGQC_Roster_test", ["Test", _roster]];


_records = player allDiaryRecords "CGQC_Roster_test";
_record = _records select 0;
player setDiaryRecordText [["CGQC_Roster_test", _x select 8], ["Test", _roster]];



/*
if !(player diarySubjectExists "CGQC_Roster") then {
    //Create subject and record
    player createDiarySubject ["CGQC_Roster", "Roster"];
    player createDiaryRecord ["CGQC_Roster", ["Roster", _roster]];
} else {
    _records = player allDiaryRecords "CGQC_Roster";
    _record = _records select 0;
    player setDiaryRecordText [["CGQC_Roster", _record select 8], ["Roster", _roster]];
};*/

LOG(" loadDiaryRoster done");