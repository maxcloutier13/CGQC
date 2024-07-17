#include "\CGQC\script_component.hpp"
// --- playerRespawned ----------------------------------------------------------
// Code in the event a player respawns
params ["_unit", "_corpse"];
LOG_2("[playerRespawned] %1/%2 started", _unit, _corpse);

// Restore controls in case player got killed during a bad moment
if (userInputDisabled) then {disableUserInput false;};

// Save stuff for player respawn
// Corpse position
_unit setVariable["corpse_position", getPosASL _corpse];
// Loadout
_unit setUnitLoadout(_unit getVariable["Saved_Loadout",[]]); //Load loadout saved on death
// Face/identity
_unit setFace(_unit getVariable["Saved_Face",[]]);
// Slinged helmet
[_unit, _unit getVariable["Saved_Slinged",[]]] call GRAD_slingHelmet_fnc_addSlungHelmet;
// WBK Secondary weapon
cgqc_player_second = _unit getVariable "WBK_SecondWeapon";

// Set patch
[] call CGQC_fnc_setPatch;
// Set color
[] call CGQC_fnc_setTeamColorReload;
// Reload fucking traits
[] call CGQC_fnc_reloadTraits;
/*

// Reload radios
_radios = _unit getVariable "Radio_Settings_radios";
{
	_radio = _x select 0;
	_side = _x select 1;
	_vol = _x select 2;
	[_radio, _side] call acre_api_fnc_setRadioSpatial;
	[_radio, _vol] call acre_api_fnc_setRadioVolume;
} forEach _radios;
// Reset ptt's
_mpttRadioList = _unit getVariable "Radio_Settings_ptt";
_success = [_mpttRadioList] call acre_api_fnc_setMultiPushToTalkAssignment;
*/

// Reload radios
_newRadioList = [1, 1, 1]; // initialize with default values
{
	private _radioType = _x;
	private _radios = [_radioType, _corpse] call acre_api_fnc_getAllRadiosByType; // array of unique Radio IDs from the corpse
	private _radioChannel = [];
	private _radioVolume = [];
	private _radioSpatial = [];
	private _pttList = [];
	_pttRadioList = [] call acre_api_fnc_getMultiPushToTalkAssignment; // return array of radio IDs assigned to each PTT key

	{
		private _radioID = _x;
		private _currentChannel = [_radioID] call acre_api_fnc_getRadioChannel; // channel of Radio
		private _currentVolume = [_radioID] call acre_api_fnc_getRadioVolume; // volume of Radio
		private _currentSpatial = [_radioID] call acre_api_fnc_getRadioSpatial; // spatial of Radio

		switch (_radioID) do
		{
			// if PTT1 radio, add int 1
			case (_pttRadioList select 0):
			{
				_pttList pushBack 1;
			};
			// if PTT2 radio, add int 2
			case (_pttRadioList select 1):
			{
				_pttList pushBack 2;
			};
			// if PTT3 radio, add int 3
			case (_pttRadioList select 2):
			{
				_pttList pushBack 3;
			};
			// if radio without PTT set, add int 9
			default
			{
				_pttList pushBack 9;
			};
		};

		_radioChannel pushBack _currentChannel; // set channel to radioChannel
		_radioVolume pushBack _currentVolume; // set volume to radioVolume
		_radioSpatial pushBack _currentSpatial; // set spatial to radioSpatial
	} forEach _radios;

	[
		{
			params ["_newUnit", "_radioType", "_radioChannel", "_radioVolume", "_radioSpatial", "_pttList", "_newRadioList"];
			private _radios = [_radioType, _newUnit] call acre_api_fnc_getAllRadiosByType;

			{
				// iterate through all NEW radios by IDs, add properties in the order set above
				private _radioID = _x;
				private _channel = _radioChannel select _forEachIndex;
				private _volume = _radioVolume select _forEachIndex;
				private _spatial = _radioSpatial select _forEachIndex;
				private _pttKey = _pttList select _forEachIndex;

				if (_pttKey == 1) then {_newRadioList set [0, _radioID]}; // assign new radio to PTT slot 1
				if (_pttKey == 2) then {_newRadioList set [1, _radioID]}; // assign new radio to PTT slot 2
				if (_pttKey == 3) then {_newRadioList set [2, _radioID]}; // assign new radio to PTT slot 3

				[_radioID, _channel] call acre_api_fnc_setRadioChannel;
				[_radioID, _volume] call acre_api_fnc_setRadioVolume;
				[_radioID, _spatial] call acre_api_fnc_setRadioSpatial;
			} forEach _radios;
		},
		[_newUnit, _radioType, _radioChannel, _radioVolume, _radioSpatial, _pttList, _newRadioList],
		1
	] call CBA_fnc_waitAndExecute; // delay 1 second for new radio IDs
} forEach ["ACRE_PRC77", "ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC343", "ACRE_SEM52SL", "ACRE_SEM70", "ACRE_BF888S"]; // for each available ACRE radio

[
	{
		params ["_newRadioList"];
		// assign the radio IDs of those with assigned PTTs
		private _ptt1 = _newRadioList select 0;
		private _ptt2 = _newRadioList select 1;
		private _ptt3 = _newRadioList select 2;
		_pttNewRadioList = [ [_ptt1, _ptt2, _ptt3] ] call acre_api_fnc_setMultiPushToTalkAssignment; // assign new radios to old PTT setup
	},
	[_newRadioList],
	1
] call CBA_fnc_waitAndExecute; // wait 1 second to execute

// Reset UI
["show"] spawn CGQC_fnc_toggleUI;
// Reset Volumes
_vol = _unit getVariable "cgqc_player_wakeup_volume";
[_vol] call acre_api_fnc_setGlobalVolume;

// Add earplugs if missing
if !([player, "ACE_EarPlugs"] call ace_common_fnc_hasItem) then {player addItem "ACE_EarPlugs";};


// Lower gun
[player] call ace_weaponselect_fnc_putWeaponAway;

LOG("[playerRespawned] done");