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
	_roster = _roster + "<font color='#969696' size='18'>--- " + _groupName + " ---</font><br/>";
	{
		_unitName = name _x;
		_color = "";
		_unitColor = assignedTeam _x;
		_weight = [_x] call ace_common_fnc_getweight;
		_role = _x getVariable "player_role";
		/*if (cgqc_player_role isEqualTo "") then {
			_role = typeOf player;
		};*/
		switch (_unitColor) do {
			case "RED": {_color = "#CC3333" };
			case "GREEN": {_color = "#5C7829" };
			case "BLUE": {_color = "#087099" };
			case "YELLOW": {_color = "#B7B327" };
			default {_color = "#F0F0F0"};
		};
		_roster = _roster + format ["<font color='%1' size='15'>%2 - %3 - %4 - %5",_color, _ctr, _role, _unitName, _weight] + "</font><br/>";
		_ctr = _ctr + 1;
	} forEach units _x;
	_roster = _roster + "<br/>";
} forEach _playerGroups;

_hour = systemTime select 3;
_mins = systemTime select 4;
_secs = systemTime select 5;
_roster = _roster + format ["<br/><font color='#282828'> -Updated %1:%2:%3 </font>", _hour, _mins, _secs];

player createDiarySubject ["CGQC_Roster", "Roster"];
player createDiaryRecord ["CGQC_Roster", ["Roster", _roster]];

diag_log "[CGQC_FNC] loadDiaryRoster done";