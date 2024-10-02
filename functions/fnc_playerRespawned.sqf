#include "\CGQC\script_component.hpp"
// --- playerRespawned ----------------------------------------------------------
// Code in the event a player respawns
params ["_unit", "_corpse"];
LOG_2("[playerRespawned] %1/%2 started", _unit, _corpse);

if (local _unit) then {

	// Restore controls in case player got killed during a bad moment
	disableUserInput false;

	// Save stuff for player respawn
	// Corpse position
	player setVariable["corpse_position", getPosASL _corpse];
	// Loadout
	player setUnitLoadout(player getVariable["Saved_Loadout",[]]); //Load loadout saved on death
	// Face/identity
	_face = player getVariable["Saved_Face",""];
	if (_face isNotEqualTo "") then {
		player setFace _face;
	} else {
		ERROR("[CGQC_ERROR] playerRespawned - Could not read saved face");
	};

	// Slinged helmet
	[player, player getVariable["Saved_Slinged",[]]] call GRAD_slingHelmet_fnc_addSlungHelmet;

	/*
	[] spawn {
		_second = player getVariable["Saved_second",[]];
		if (count _second > 0) then {
			player spawn WBK_CreateWeaponSecond;
			sleep 1;
			player addWeapon (_second select 0);
			_second deleteAt 0;
			{
				if (typeName _x isEqualTo "ARRAY") then {
					player addPrimaryWeaponItem (_x select 0);
				} else {
					player addPrimaryWeaponItem _x;
				};
			} forEach _second;
				sleep 1;
			player spawn WBK_CreateSwitchBetweenWeapons;
		};
	};*/

	// Get a copy of the drone the player had at death
	if !(isNil "cgqc_player_uav") then {
		_uav = "";
		switch (cgqc_player_uav) do {
			case "sps_black_hornet_01_F": {_uav = "sps_black_hornet_01_Static_F";};
			case "Rev_darter_b": {_uav = "Rev_darter_item";};
			case "Rev_pelican_b": {_uav = "Rev_pelican_item";};
			case "Rev_demine_b": {_uav = "Rev_demine_item";};
		};
		if (_uav isNotEqualTo "") then {
			player addItemToBackpack _uav;
		};
	};

	// Set patch
	[] call CGQC_fnc_setPatch;
	// Set color
	[] call CGQC_fnc_setTeamColorReload;
	// Reload fucking traits
	[] call CGQC_fnc_reloadTraits;

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
					//[_radioID, _volume] call acre_api_fnc_setRadioVolume;
					[_radioID, _spatial] call acre_api_fnc_setRadioSpatial;
				} forEach _radios;
			},
			[_newUnit, _radioType, _radioChannel, _radioVolume, _radioSpatial, _pttList, _newRadioList],
			1
		] call CBA_fnc_waitAndExecute; // delay 1 second for new radio IDs
	} forEach ["ACRE_PRC77", "ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC343", "ACRE_SEM52SL", "ACRE_SEM70", "ACRE_BF888S"]; // for each available ACRE radio

	/*
	LOG("[playerRespawned] Reloading radios");
	_allRadios = [] call acre_api_fnc_getCurrentRadioList;
	_radios = player getVariable "Radio_Settings_radios";
	_pos = 0;
	{
		_radio = _x;
		_settings = _radios select _pos;
		_side = _settings select 1;
		_vol = _settings select 2;
		_chan = _settings select 3;
		LOG_4("[playerRespawned] Reloading %1/%2/%3/%4", _radio, _side, _vol, _chan);
		[_radio, _side] call acre_api_fnc_setRadioSpatial;
		[_radio, _vol] call acre_api_fnc_setRadioVolume;
		[_radio, _chan] call acre_api_fnc_setRadioChannel;
		_pos = _pos + 1;
	} forEach _allRadios;
	LOG("[playerRespawned] Done reloading radios");

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
	*/

	// Reset ptt's
	//_mpttRadioList = player getVariable "Radio_Settings_ptt";
	//_success = [_mpttRadioList] call acre_api_fnc_setMultiPushToTalkAssignment;
	// Lower gun
	[player] call ace_weaponselect_fnc_putWeaponAway;

	// Run wakeup routine to bring back interface, sound and radio
	["respawn"] spawn cgqc_fnc_wakeup;

	// Add earplugs if missing
	if !([player, "ACE_EarPlugs"] call ace_common_fnc_hasItem) then {
		player addItem "ACE_EarPlugs";
		LOG("[playerRespawned] Player had no earplugs? Adding");
	};
} else {
	LOG("[playerRespawned] Unit not local");
};
LOG("[playerRespawned] done");