#include "\CGQC\script_component.hpp"
// --- loadDiaryRoster ----------------------------------------------------------
// List all groups and players + roles
LOG(" loadDiaryRoster started");

waitUntil {CGQC_playerLoaded};

CGQC_int_hasSilencer = {
	params ["_target"];
	_return = false;
	_currentWeapon = primaryWeapon _target;
	_allCompatible = _currentWeapon call bis_fnc_compatibleItems;
	_compatible = _allCompatible - cgqc_list_brakes;
	_compatibleSilencers = [];
	{
		_type = (_x call bis_fnc_itemType) select 1;
		if (_type isEqualTo "AccessoryMuzzle") then {
			_compatibleSilencers pushBack _x;
		};
	} forEach _compatible;

	_items = primaryWeaponItems _target;
	{
	if (_x in _items) exitWith {_return = true};
	} forEach _compatibleSilencers;
	_return;
};

CGQC_int_processTeam = {
	params ["_soldiers"];
	{
		_unit = _x#0;
		_color = _x#1;
		_pos = _x#2;
		_role = _x#3;
		_name = _x#4;
		_weight = _x#5;
		_radio = _x#6;
		_versionCheck = "";
		_versionCore = _unit getVariable ["cgqc_version_core", "ERROR"];
		_ref_version_core = missionNamespace getVariable ["cgqc_version_server_core", "ERROR"];
		_silencedCheck = "Loud";
		_silenced = [_unit] call CGQC_int_hasSilencer;
		if (_versionCore isNotEqualTo _ref_version_core) then {
			_versionCheck = "</font><font color='CC3333' size='15'>!!!</font>";
		};
		if (_silenced) then {
			_silencedCheck = "Silent";
		};
		cgqc_group_roster = cgqc_group_roster + format ["<font color='%1' size='15'>%2 - %3 - %4 - %5 - %6 - %7 - %8",_color, _pos, _role, _name, _weight, _radio, _silencedCheck, _versionCheck ] + "<br/>";
	} forEach _soldiers;
};

// Load Everything
[] call CGQC_fnc_loadGroupInfo;
cgqc_group_roster = "";

{
	// Get all the info about the group
	_groupName = _x#0;
	_leader = _x#1;
	_teamRed = _x#2;
	_teamGreen = _x#3;
	_teamBlue = _x#4;
	_teamYellow = _x#5;
	_teamWhite = _x#6;

	// Start printing the roster
	cgqc_group_roster = cgqc_group_roster + "<font color='#969696' size='20'>------- " + _groupName + " ----------------------------------------</font><br/>";
	[_leader] call CGQC_int_processTeam;
	if (count _teamRed > 0 || count _teamGreen > 0) then {
		cgqc_group_roster = cgqc_group_roster + format ["<font color='#CC3333' size='18'>	 --- %1-1 ---</font><br/>", _groupName];
		[_teamRed] call CGQC_int_processTeam;
		[_teamGreen] call CGQC_int_processTeam;
	};
	if (count _teamBlue > 0 || count _teamYellow > 0) then {
		cgqc_group_roster = cgqc_group_roster + format ["<font color='#087099' size='18'>	 --- %1-2 ---</font><br/>", _groupName];
		[_teamBlue] call CGQC_int_processTeam;
		[_teamYellow] call CGQC_int_processTeam;
	};
	if (count _teamWhite > 0) then {
		cgqc_group_roster = cgqc_group_roster + format ["<font color='#ffffff' size='18'>	 --- %1-HQ ---</font><br/>", _groupName];
		[_teamWhite] call CGQC_int_processTeam;
	};
	cgqc_group_roster = cgqc_group_roster + "<br/>";
} forEach cgqc_allGroupsInfo;

// Timestamp for the update
_hour = systemTime#3;
_mins = systemTime#4;
_secs = systemTime#5;
cgqc_group_roster = cgqc_group_roster + format ["<br/><font color='#6A6A6A'> -Updated %1:%2:%3 </font>", _hour, _mins, _secs];

if (!(player diarySubjectExists "CGQC_Roster")) then {
    //Create subject and record
    player createDiarySubject ["CGQC_Roster", "Roster"];
    player createDiaryRecord ["CGQC_Roster", ["Roster", cgqc_group_roster]];
} else {
    _records = player allDiaryRecords "CGQC_Roster";
    _record = _records#0;
    player setDiaryRecordText [["CGQC_Roster", _record#8], ["Roster", cgqc_group_roster]];
};

cgqc_diary_stats = "<font size='18'>";
// Civs
if (cgqc_stats_civilianCasualties > 0 ) then {
	cgqc_diary_stats = cgqc_diary_stats + format ["<br/><br/>- Civilians: %1<br/>", cgqc_stats_civilianCasualties];
	_killers = "";
	{
		_killers = _killers + format["%1,", _x];
	} forEach cgqc_stats_civilianKillers;
	cgqc_diary_stats = cgqc_diary_stats + format ["---- Murderer: %1<br/>", _killers];
};
// Friendlies
if (cgqc_stats_friendlyCasualties > 0 ) then {
	cgqc_diary_stats = cgqc_diary_stats + format ["<br/>- Friendly Forces: %1<br/>", cgqc_stats_friendlyCasualties];
	_killers = "";
	{
		_killers = _killers + format["%1,", _x];
	} forEach cgqc_stats_friendlyKillers;
	cgqc_diary_stats = cgqc_diary_stats + format ["---- Murderer: %1<br/>", _killers];
};
// Teamkills
if (cgqc_stats_teamCasualties > 0 ) then {
	cgqc_diary_stats = cgqc_diary_stats + format ["<br/>- TeamKills: %1<br/>", cgqc_stats_teamCasualties];
	_killers = "";
	{
		_killers = _killers + format["%1,", _x];
	} forEach cgqc_stats_teamKillers;
	cgqc_diary_stats = cgqc_diary_stats + format ["---- Murderer: %1<br/>", _killers];
};
// Enemies
if (cgqc_stats_enemyCasualties > 0 ) then {
	cgqc_diary_stats = cgqc_diary_stats + format ["<br/>- Enemies: %1<br/>", cgqc_stats_enemyCasualties];
};

// Close the font bracket
cgqc_diary_stats = cgqc_diary_stats + "</font>";

if (!(player diarySubjectExists "CGQC_Stats")) then {
    //Create subject and record
    player createDiarySubject ["CGQC_Stats", "Stats"];
    player createDiaryRecord ["CGQC_Stats", ["Casualties", cgqc_diary_stats]];
} else {
    _records = player allDiaryRecords "CGQC_Stats";
    _record = _records#0;
    player setDiaryRecordText [["CGQC_Stats", _record#8], ["Casualties", cgqc_diary_stats]];
};



LOG(" loadDiaryRoster done");