#include "\CGQC\script_component.hpp"
// --- loadGroupInfo ----------------------------------------------------------
// Load all of the info about groups and members
LOG(" loadGroupInfo started");

_side = side player;
_roster = "";
_playerGroups = [];
cgqc_allGroupsInfo = [];

// Find all groups that contain players
{
	if ({isPlayer _x} count (units _x) > 0) then {
		_playerGroups pushBack _x;
	};
} forEach allGroups;

{
	_currentGroup = _x;
	_groupName = groupID _currentGroup;
    _group = [];
	{
        _soldier = _x;
        _position = groupId _soldier;
		_unitName = name _soldier;
		_color = "";
		_unitColor = assignedTeam _soldier;
		_weight = _soldier call ace_common_fnc_getweight;
		_role = _soldier getVariable "cgqc_player_role";
		if (isNil "_role") then {
			_role = "Unknown";
		};
		_radios = [];
        _radioTxt = "";
		if ([_soldier] call acre_api_fnc_hasRadio) then {
			if ([_soldier, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio) then {
				_343s = ["ACRE_PRC343", _soldier] call acre_api_fnc_getAllRadiosByType;
				{
					_radioType = "SR";
					_radioChan = [_x] call acre_api_fnc_getRadioChannel;
                    _txt = format ["%1:%2", _radioType, _radioChan];
					_radios pushBack _txt;
				} forEach _343s;
			};
			if ([_soldier, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio) then {
				_148s = ["ACRE_PRC148", _soldier] call acre_api_fnc_getAllRadiosByType;
				{
					_radioType = "LR";
					_radioChan = [_x] call acre_api_fnc_getRadioChannel;
                     _txt = format ["%1:%2", _radioType, _radioChan];
					_radios pushBack _txt;
				} forEach _148s;
			};
			if ([_soldier, "ACRE_PRC152"] call acre_api_fnc_hasKindOfRadio) then {
				_152s = ["ACRE_PRC152", _soldier] call acre_api_fnc_getAllRadiosByType;
				{
					_radioType = "LR";
					_radioChan = [_x] call acre_api_fnc_getRadioChannel;
                     _txt = format ["%1:%2", _radioType, _radioChan];
					_radios pushBack _txt;
				} forEach _152s;
			};
			if ([_soldier, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio) then {
				_117s = ["ACRE_PRC117F", _soldier] call acre_api_fnc_getAllRadiosByType;
				{
					_radioType = "LR";
					_radioChan = [_x] call acre_api_fnc_getRadioChannel;
                     _txt = format ["%1:%2", _radioType, _radioChan];
					_radios pushBack _txt;
				} forEach _117s;
			};
            _count = count _radios;
            {
                if (_count > 1) then {
                    _radioTxt = _radioTxt + _x + "-";
                    _count = _count - 1;
                } else {
                    // Last/only entry
                    _radioTxt = _radioTxt + _x;
                };
            } forEach _radios;
		} else {
			_radioTxt = "No radio";
		};

		switch (_unitColor) do {
			case "RED": {_color = "#CC3333" };
			case "GREEN": {_color = "#5C7829" };
			case "BLUE": {_color = "#087099" };
			case "YELLOW": {_color = "#B7B327" };
			default {_color = "#F0F0F0"};
		};
        _group pushBack [_soldier, _color, _position, _role, _unitName, _weight, _radioTxt];
	} forEach units _x;

    // Sort the groups by color
    // Leader/Red/Green/Blue/Yellow/White
    _leader = _group deleteAt 0;
    _red = [];
    _green = [];
    _blue = [];
    _yellow = [];
    _white = [];
	{
		_color = _x select 1;
		_index = _group find _x;
		 switch (true) do {
			case (_color isEqualTo "#CC3333"): {_red pushBack _x};
			case (_color isEqualTo "#5C7829"): {_green pushBack _x};
			case (_color isEqualTo "#087099"): {_blue pushBack _x};
			case (_color isEqualTo "#B7B327"): {_yellow pushBack _x};
			default {_white pushBack _x};
		};
	} forEach _group;
    // Store the group
    cgqc_allGroupsInfo pushBack [_groupName, [_leader], _red, _green, _blue, _yellow, _white];
} forEach _playerGroups;

LOG(" loadGroupInfo done");