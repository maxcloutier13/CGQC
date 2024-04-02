// --- loadDiaryRoster ----------------------------------------------------------
// List all groups and players + roles
diag_log "[CGQC_FNC] loadDiaryRoster started";

waitUntil {cgqc_start_postInitClient_done};

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
        _weight = _x call ace_common_fnc_getweight;
        _role = _x getVariable "cgqc_player_role";
        if (isNil "_role") then {
            _role = "Unknown";
        };
        _radios = "";
        if ([_x] call acre_api_fnc_hasRadio) then {
            if ([player, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio) then {
                _343s = ["ACRE_PRC343"] call acre_api_fnc_getAllRadiosByType;
                {
                    _radioType = "343";
                    _radioChan = [_x] call acre_api_fnc_getRadioChannel;
                    _radios = _radios + format ["%1/%2-", _radioType, _radioChan];
                } forEach _343s;
            };
            if ([player, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio) then {
                _148s = ["ACRE_PRC148"] call acre_api_fnc_getAllRadiosByType;
                {
                    _radioType = "148";
                    _radioChan = [_x] call acre_api_fnc_getRadioChannel;
                    _radios = _radios + format ["%1/%2-", _radioType, _radioChan];
                } forEach _148s;
            };
            if ([player, "ACRE_PRC152"] call acre_api_fnc_hasKindOfRadio) then {
                _152s = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
                {
                    _radioType = "152";
                    _radioChan = [_x] call acre_api_fnc_getRadioChannel;
                    _radios = _radios + format ["%1/%2-", _radioType, _radioChan];
                } forEach _152s;
            };
            if ([player, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio) then {
                _117s = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
                {
                    _radioType = "117";
                    _radioChan = [_x] call acre_api_fnc_getRadioChannel;
                    _radios = _radios + format ["%1/%2-", _radioType, _radioChan];
                } forEach _117s;
            };
        } else {
            _radios = "No radio";
        };

        switch (_unitColor) do {
            case "RED": {_color = "#CC3333" };
            case "GREEN": {_color = "#5C7829" };
            case "BLUE": {_color = "#087099" };
            case "YELLOW": {_color = "#B7B327" };
            default {_color = "#F0F0F0"};
        };

        _roster = _roster + format ["<font color='%1' size='15'>%2 - %3 - %4 - %5 - %6",_color, _ctr, _role, _unitName, _weight, _radios] + "</font><br/>";
        _ctr = _ctr + 1;
    } forEach units _x;
    _roster = _roster + "<br/>";
} forEach _playerGroups;

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
    player setDiaryRecordText [["CGQC_Roster", _x select 8], ["Roster", _roster]];
};

diag_log "[CGQC_FNC] loadDiaryRoster done";