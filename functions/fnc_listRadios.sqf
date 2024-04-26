#include "\CGQC\script_component.hpp"
// --- handleRadios ----------------------------------------------------------
// Returns a list of the unit radio and their settings
// ONLY WORKS ON PLAYER FOR NOW. remote some other way
params [["_target", player]];
LOG_1(" listRadios %1 started", _target);

_radios = [];
_ptt =  [] call acre_api_fnc_getMultiPushToTalkAssignment;
_allPossible = [] call acre_api_fnc_getAllRadios select 0;
{
 if ([_target, _x] call acre_api_fnc_hasKindOfRadio) then {
  _foundRadios = [_x, _target] call acre_api_fnc_getAllRadiosByType;
  {
   _pttFound = _ptt find _x;
   _radios pushBack [_pttFound, _x];
  } forEach _foundRadios;
 };
} forEach _allPossible;

// Order the radios by PTT
_sortedRadios = [];
_radios sort true;
{
  _temp = _x select 1;
 _sortedRadios pushBack _temp;
} forEach _radios;

_entry = [];
// List and stores the info
{
	_radio = _x ;
	_entry_type = "";
	{
		_radioName = _x;
		if ([_radio, _radioName] call acre_api_fnc_isKindOf) then {
			_entry_type = _radioName;
			break;
		};
	} forEach _allPossible;
	_entry_chan = [_radio] call acre_api_fnc_getRadioChannel;
	_entry_side = [_radio] call acre_api_fnc_getRadioSpatial;
	_entry_vol = [_radio] call acre_api_fnc_getRadioVolume;
	_entry_speaker = [_radio] call acre_api_fnc_isRadioSpeaker;
	_entry = _entry + [[_entry_type, _entry_chan, _entry_side, _entry_vol, _entry_speaker]];
} forEach _sortedRadios;
LOG(" listRadios done");

_entry;