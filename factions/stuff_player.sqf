_type = _this select 0;
_mpttSettings = [];
switch (_type)
do
{
	case "radio_sides":
	{
		_radios = call acre_api_fnc_getCurrentRadioList;
		_radio_count = count _radios;
		if (_radio_count > 0) then {
			_radio_1 = _radios select 0;
			_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		};
		if (_radio_count > 1) then {
			_radio_2 = _radios select 1;
			_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		};
		hintSilent "Radios 1/2-Gauche/Droite";
	};
	case "radio_sides_2":
	{
		_radios = call acre_api_fnc_getCurrentRadioList;
		_radio_count = count _radios;
		if (_radio_count > 0) then {
			_radio_1 = _radios select 0;
			_success = [_radio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		};
		if (_radio_count > 1) then {
			_radio_2 = _radios select 1;
			_success = [_radio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		};
		hintSilent "Radios 1/2-Droite/Gauche";
	};
	case "patch":
	{
		//Set the patch 
		[ player, player_patch ] call BIS_fnc_setUnitInsignia;
		hintSilent "Patch restored";
	};
	case "spartan1":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		[_personalRadio, 1] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
	};
	case "spartan2":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		[_personalRadio, 2] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
	};
	case "spartan1_1":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		_longRadio = ["ACRE_PRC177f"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 1] call acre_api_fnc_setRadioChannel; 
		[_handheldRadio, 4] call acre_api_fnc_setRadioChannel;
		[_longRadio, 1] call acre_api_fnc_setRadioChannel; 
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handheldRadio, _longRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent "Radios Spartan1 lead: done";
	};
	case "spartan1_2":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 1] call acre_api_fnc_setRadioChannel;
		[_handheldRadio, 4] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handheldRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent "Radios Spartan1 2ic: done";
	};
	case "spartan2_1":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		_longRadio = ["ACRE_PRC177f"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 2] call acre_api_fnc_setRadioChannel; 
		[_handheldRadio, 4] call acre_api_fnc_setRadioChannel;
		[_longRadio, 1] call acre_api_fnc_setRadioChannel; 
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handheldRadio, _longRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent "Radios Spartan2 lead: done";
	};
	case "spartan2_2":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 2] call acre_api_fnc_setRadioChannel; 
		[_handheldRadio, 4] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handheldRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent "Radios Spartan2 2ic: done";
	};
	case "centaure":
	{
		// Emergency 152
		_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Racks
		_racks = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
		_rack1 = _racks select 0; 
		_rack2 = _racks select 1; 
		// Channels
		[_handheldRadio, 3] call acre_api_fnc_setRadioChannel; //Ground-net
		[_rack1, 6] call acre_api_fnc_setRadioChannel; //Interteam
		[_rack2, 3] call acre_api_fnc_setRadioChannel; //Sol-HQ
		// Set sides 
		_success = [_rack1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_rack2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Lower volume of 152?
		 [_handheldRadio,0.5] call acre_api_fnc_setRadioVolume;
		// Set radio orders
		_success = [ [ _rack1, _rack2, _handheldRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent "Radios Centaure done";
	};
	case "griffon":
	{
		// Emergency 152
		_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Racks
		_racks = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
		_rack1 = _racks select 0; 
		_rack2 = _racks select 1; 
		// Channels
		[_handheldRadio, 2] call acre_api_fnc_setRadioChannel; //Air-net
		[_rack1, 5] call acre_api_fnc_setRadioChannel; //Interteam
		[_rack2, 2] call acre_api_fnc_setRadioChannel; //Air-HQ
		// Set radio orders
		_success = [ [ _rack1, _rack2, _handheldRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		// Set sides 
		_success = [_rack1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_rack2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		hintSilent "Radios Griffon done";
	};
	case "jtac":
	{
		// 152's
		_handheldRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
		_handheldRadio_1 = _mediums select 0;
		_handheldRadio_2 = _mediums select 1;
		_longRadio = ["ACRE_PRC177f"] call acre_api_fnc_getRadioByType;
		// Channels
		[_longRadio, 1] call acre_api_fnc_setRadioChannel; //Spartan
		[_handheldRadio_1, 2] call acre_api_fnc_setRadioChannel; //Air-Net
		[_handheldRadio_2, 7] call acre_api_fnc_setRadioChannel; //Recon
		// Set order
		_success = [ [ _handheldRadio_2, _longRadio, _handheldRadio_1] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		// Set sides 
		_success = [_longRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		hintSilent "Radios JTAC done";
	};
	default
	{
		hint "woops";
	};
};

	