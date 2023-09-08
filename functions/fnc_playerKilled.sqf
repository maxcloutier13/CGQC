// --- playerKilled ----------------------------------------------------------
// Code in the event a player gets dead
params ["_unit", "_killer"];
diag_log "[CGQC_EVENT] playerKilled started";

_unit setVariable["Saved_Loadout",getUnitLoadout _unit];
_unit setVariable["Saved_Face", face _unit];
_unit setVariable["Saved_Slinged", [_unit] call GRAD_slingHelmet_fnc_getSlungHelmet];
// Save radios and ptt priorities
_allRadios = [] call acre_api_fnc_getCurrentRadioList;
_radios = [];
{
	_radio = _x;
	_side = [_x] call acre_api_fnc_getRadioSpatial;
	_vol = [_x] call acre_api_fnc_getRadioVolume;
	_radios pushBack [_radio, _side, _vol];
} forEach _allRadios;
_unit setVariable["Radio_Settings_radios", _radios];
_mpttRadioList = [] call acre_api_fnc_getMultiPushToTalkAssignment;
_unit setVariable["Radio_Settings_ptt", _mpttRadioList];
//hint format ["Woops! tu t'es fait pèté par: %1", _killer];

diag_log "[CGQC_EVENT] playerKilled done";