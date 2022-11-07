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
		hintSilent "Radios L/R";
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
		hintSilent "Radios R/L";
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
		_longRadio = ["ACRE_PRC117F"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 1] call acre_api_fnc_setRadioChannel; 
		[_handheldRadio, 4] call acre_api_fnc_setRadioChannel;
		[_longRadio, 1] call acre_api_fnc_setRadioChannel; 
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handheldRadio, _longRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent "L/343-Spartan1 R/152-Interteam LR/117-HQ";
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
		hintSilent "L/343-Spartan1 R/152-Interteam";
	};
	case "spartan2_1":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		_longRadio = ["ACRE_PRC117F"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 2] call acre_api_fnc_setRadioChannel; 
		[_handheldRadio, 4] call acre_api_fnc_setRadioChannel;
		[_longRadio, 1] call acre_api_fnc_setRadioChannel; 
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handheldRadio, _longRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent "L/343-Spartan2 R/152-Interteam LR/117-HQ";
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
		hintSilent "L/343-Spartan2 R/152-Interteam";
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
		hintSilent "L/117-Interteam R/117-HQ L/152-Emergency";
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
		hintSilent "L/117-Interteam R/117-HQ L/152-Emergency";
	};
	case "jtac":
	{
		// 152's
		_handheldRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
		_handheldRadio_1 = _handheldRadios select 0;
		_handheldRadio_2 = _handheldRadios select 1;
		_longRadio = ["ACRE_PRC117F"] call acre_api_fnc_getRadioByType;
		// Channels
		[_longRadio, 1] call acre_api_fnc_setRadioChannel; //Spartan
		[_handheldRadio_1, 2] call acre_api_fnc_setRadioChannel; //Air-Net
		[_handheldRadio_2, 7] call acre_api_fnc_setRadioChannel; //Recon
		// Set order
		_success = [ [ _handheldRadio_2, _longRadio, _handheldRadio_1] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		// Set sides 
		_success = [_longRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handheldRadio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		hintSilent "L/152-Interteam R/152-Air LR/117-HQ";
	};
	case "hq":
	{
		// 152's
		_longRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
		_longRadio_1 = _longRadios select 0;
		_longRadio_2 = _longRadios select 1;
		_longRadio_3 = _longRadios select 1;
		// Channels
		[_longRadio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan
		[_longRadio_2, 2] call acre_api_fnc_setRadioChannel; //Air-Net
		[_longRadio_3, 3] call acre_api_fnc_setRadioChannel; //Recon
		// Set order
		_success = [ [ _longRadio_1, _longRadio_2, _longRadio_3] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		// Set sides 
		_success = [_longRadio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_longRadio_3, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		hintSilent "LR/117-Spartan L/117-Griffon R/117-Centaure";
	};
	default
	{
		hint "woops";
	};
};

	