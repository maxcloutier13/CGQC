// --- loadDiaryRoster ----------------------------------------------------------
// List all groups and players + roles
diag_log "[CGQC_FNC] loadDiaryRoster started";

if (player diarySubjectExists "CGQC_Roster") then {
	player removeDiarySubject "CGQC_Roster";
};

_side = side player;
_roster = "";
_playerGroups = [];
{
 if ({isPlayer _x} count (units _x) > 0) then {
  _playerGroups pushBack _x;
 };
} forEach allGroups;

{
	_ctr = 1;
	_groupName = groupID _x;
	_roster = _roster + "<font color='#FFFFFF' size='18'>--- " + _groupName + " ---</font><br/>";
	{
		_unitName = name _x;
		_roster = _roster + format ["<font color='#F0F0F0' size='15'>%1 - %2", _ctr, _unitName] + "</font><br/>";
		_ctr = _ctr + 1;
	} forEach units _x;
	_roster = _roster + "<br/>";
} forEach _playerGroups;

_hour = systemTime select 3;
_mins = systemTime select 4;
_secs = systemTime select 5;
_roster = _roster + format ["<br/><font color='#969696'> -Updated %1:%2:%3 </font>", _hour, _mins, _secs];

player createDiarySubject ["CGQC_Roster", "Roster"];
player createDiaryRecord ["CGQC_Roster", ["Roster", _roster]];

diag_log "[CGQC_FNC] loadDiaryRoster done";