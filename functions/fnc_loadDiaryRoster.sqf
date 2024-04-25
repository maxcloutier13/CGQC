#include "\CGQC\script_component.hpp"
// --- loadDiaryRoster ----------------------------------------------------------
// List all groups and players + roles
LOG(" loadDiaryRoster started");

waitUntil {cgqc_start_postInitClient_done};

// Load Everything
[] call CGQC_fnc_loadGroupInfo;

_roster = "";

{ // For each valid group
	_groupName = _x select 0;
	_group = _x select 1;
	_roster = _roster + "<font color='#969696' size='20'>------- " + _groupName + " ----------------------------------------</font><br/>";
	_setGroup1 = true;
	_setGroup2 = true;
    _setHQ = true;
	_firstRun = true;
	{ // For each Soldiers
		_unit = _x select 0;
		_color = _x select 1;
		_pos = _x select 2;
		_role = _x select 3;
		_name = _x select 4;
		_weight = _x select 5;
		_radio = _x select 6;
		_versionCheck = "</font>";
		if (cgqc_player_max) then {
			_versionCore = _unit getVariable ["cgqc_version_core", "ERROR"];
			_ref_version_core = missionNamespace getVariable ["cgqc_version_server_core", "ERROR"];
			if (_versionCore isNotEqualTo _ref_version_core) then {
				_versionCheck = "</font><font color='CC3333' size='15'>!!!</font>";
			};
		};

		if (_firstRun) then {
			_roster = _roster + format ["<font color='%1' size='15'>%2 - %3 - %4 - %5 - %6 - %7",_color, _pos, _role, _name, _weight, _radio, _versionCheck ] + "<br/>";
		};
		if (_setGroup1 && (_color isEqualTo "#CC3333" || _color isEqualTo "#5C7829")) then {
			_roster = _roster + format ["<font color='#CC3333' size='18'>	 --- %1-1 ---</font><br/>", _groupName];
			_setGroup1 = false;
		};
		if (_setGroup2 && (_color isEqualTo "#087099" || _color isEqualTo "#B7B327")) then {
			_roster = _roster + format ["<font color='#087099' size='18'>	 --- %1-2 ---</font><br/>", _groupName];
			_setGroup2 = false;
		};
		if (!_firstRun && !_setGroup1 && _setHQ && _color isEqualTo "#F0F0F0" ) then {
			_roster = _roster + format ["<font color='#ffffff' size='18'>	 --- %1-HQ ---</font><br/>", _groupName];
            _setHQ = false;
        };
		if !(_firstRun) then {
			_roster = _roster + format ["<font color='%1' size='15'>%2 - %3 - %4 - %5 - %6 - %7",_color, _pos, _role, _name, _weight, _radio, _versionCheck] + "<br/>";
		};
		_firstRun = false;
	} forEach _group;
	_roster = _roster + "<br/>";
} forEach cgqc_allGroupsInfo;

// Timestamp for the update
_hour = systemTime select 3;
_mins = systemTime select 4;
_secs = systemTime select 5;
_roster = _roster + format ["<br/><font color='#282828'> -Updated %1:%2:%3 </font>", _hour, _mins, _secs];

if !(player diarySubjectExists "CGQC_Roster") then {
    //Create subject and record
    player createDiarySubject ["CGQC_Roster", "Roster"];
    player createDiaryRecord ["CGQC_Roster", ["Roster", _roster]];
} else {
    _records = player allDiaryRecords "CGQC_Roster";
    _record = _records select 0;
    player setDiaryRecordText [["CGQC_Roster", _record select 8], ["Roster", _roster]];
};

LOG(" loadDiaryRoster done");