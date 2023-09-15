// --- setRadios ----------------------------------------------------------
// Set radio channels depending on group
params ["_type", ["_section", 1]];
diag_log format ["[CGQC_FNC] setRadios %1/%2 started", _type, _section];

_running = true;
_handRadios = [];
_racks = [];
_accessibleRacks = [];
_packRadios = [];
_personalRadio = "";
_handRadio = "";
_handRadio_1 = "";
_handRadio_2 = "";
_rack1 = "";
_rack2 = "";
_radio1 = "";
_radio2 = "";
_packRadio_1 = "";
_packRadio_2 = "";
_packRadio_3 = "";

waitUntil {([] call acre_api_fnc_isInitialized)};
//waitUntil {cgqc_player_acre_setup};

switch (_type) do {
	case "defaultLR":	{
		_radios = call acre_api_fnc_getCurrentRadioList;
		_radio_count = count _radios;
		if (_radio_count > 0) then {
			_radio_1 = _radios select 0;
			_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		};
		if (_radio_count > 1) then {
			_radio_2 = _radios select 1;
			_side_2 = [_radio_2] call acre_api_fnc_getRadioSpatial;
			_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		};
	};
	case "training": {
		diag_log "[CGQC_FNC] setRadios - Training mode";
		_radios = call acre_api_fnc_getCurrentRadioList;
		_radio1 = _radios select 0;
		_radio2 = _radios select 1;
		diag_log format ["[CGQC_FNC] setRadios Settings sides for %1/%2", _radio1, _radio2];
		_success = [_radio1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_radio2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		hint parseText "
		--- Training radio setup --- <br/>
		Radio1 - 343|L - Team<br/>
		Radio2 - 152|R|1 - Spartan/HQ<br/>";
	};
	case "flipSides":	{
		_radios = call acre_api_fnc_getCurrentRadioList;
		_radio_count = count _radios;
		if (_radio_count > 0) then {
			_radio_1 = _radios select 0;
			_side = [_radio_1] call acre_api_fnc_getRadioSpatial;
			switch (_side) do {
				case "LEFT":	{_success = [_radio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial};
				case "RIGHT":	{_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;};
				case "CENTER":	{_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;};
			};
		};
		if (_radio_count > 1) then {
			_radio_2 = _radios select 1;
			_side_2 = [_radio_2] call acre_api_fnc_getRadioSpatial;
			switch (_side_2) do {
				case "LEFT":	{_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;};
				case "RIGHT":	{_success = [_radio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;};
				case "CENTER":	{_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;};
			};
		};
		hint "Radio Sides: Set";
	};
	case "patch": {
		// Remove patch
		player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
		// Set the patch
		[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
		hint "Patch restored";
	};
	case "spartan":	{  //Grunts
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		//_handRadio = ["ACRE_PRC148"] call acre_api_fnc_getRadioByType;
		// Channels
		//[_personalRadio, _section] call acre_api_fnc_setRadioChannel;
		//[_handRadio, 1] call acre_api_fnc_setRadioChannel;
		//Lower volume of the 148 a little bit
		//[_handRadio,0.5] call acre_api_fnc_setRadioVolume;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		//_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio PTT: 152 is listen-only
		//_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		_success = [ [ _personalRadio, "", "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "
		--- Infantry radio setup --- <br/>
		Radio1:Gauche/343/Team<br/>";
		//Radio2:Droite/Listen-Only/Interteam</t>";
	};
	case "spartan_1": { //Team Lead
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, _section] call acre_api_fnc_setRadioChannel;
		// Channels
		[_handRadio, 1] call acre_api_fnc_setRadioChannel;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		// Set HQ radio to speaker
		_success = [_handRadio, true] call acre_api_fnc_setRadioSpeaker;
		hint parseText "
		--- TL radio setup ---
		Radio1:Gauche/343/Team<br/>
		Radio2:Droite/152/Spartan/HQ <br/></t>";
	};
	case "spartan_2": { //Spartan 2iC
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Channels

		[_personalRadio, _section] call acre_api_fnc_setRadioChannel;

		[_handRadio, 1] call acre_api_fnc_setRadioChannel;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "
		--- 2iC radio setup ---
		Radio1:Gauche/343/Team<br/>
		Radio2:Droite/152/Spartan/HQ</t>";
	};
	case "medic": { // Medic
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Channels

		[_personalRadio, 4] call acre_api_fnc_setRadioChannel;

		[_handRadio, 1] call acre_api_fnc_setRadioChannel;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "
		--- Medic radio setup ---
		Radio1:Gauche/343/Team: HQ<br/>
		Radio2:Droite/152/Spartan/HQ</t>";
	};
	case "centaure": {
		// Emergency 152
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Racks
		_racks = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
		_rack1 = _racks select 0;
		_rack2 = _racks select 1;
		// Channels
		[_handRadio, 3] call acre_api_fnc_setRadioChannel; //Sol-HQ
		[_rack1, 6] call acre_api_fnc_setRadioChannel; //Interteam
		[_rack2, 3] call acre_api_fnc_setRadioChannel; //Sol-HQ
		// Set sides
		_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_rack1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_rack2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Lower volume of 152?
		[_handRadio,0.5] call acre_api_fnc_setRadioVolume;
		// Set radio orders
		_success = [ [ _rack1, _rack2, _handRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "<t>
		Radio1:Gauche/117/Inter-Centaure<br/>
		Radio2:Droite/117/Centaure-HQ<br/>
		Radio3:Droite/152/Urgence</t>";
	};
	case "griffon":	{
		// Emergency 152
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Racks
		_racks = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
		_rack1 = _racks select 0;
		_rack2 = _racks select 1;
		// Channels
		[_handRadio, 2] call acre_api_fnc_setRadioChannel; //Air-net
		[_rack1, 5] call acre_api_fnc_setRadioChannel; //Interteam
		[_rack2, 2] call acre_api_fnc_setRadioChannel; //Air-HQ
		// Set radio orders
		_success = [ [ _rack1, _rack2, _handRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		// Set sides
		_success = [_rack1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_rack2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		hint parseText "<t>
		Radio1:Gauche/117/Inter-Griffon<br/>
		Radio2:Droite/117/Griffon-HQ<br/>
		Radio3:Droite/152/Urgence</t>";
	};
	case "jtac": {
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_1 = _handRadios select 0;
		_handRadio_2 = _handRadios select 1;
		// Channels

		[_personalRadio, 4] call acre_api_fnc_setRadioChannel;

		[_handRadio_1, 1] call acre_api_fnc_setRadioChannel;

		[_handRadio_2, 3] call acre_api_fnc_setRadioChannel;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [_personalRadio, _handRadio_1, _handRadio_2] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "
		--- JTAC radio setup ---
		Radio1:Gauche/343/Team<br/>
		Radio2:Droite/152/Spartan/HQ<br/>
		Radio3:Gauche/152/Griffon</t>";
	};
	case "hq": {
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		// 117f's
		_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;

		_packRadio_1 = _packRadios select 0;
		_packRadio_2 = _packRadios select 1;
		// Channels

		[_personalRadio, 4] call acre_api_fnc_setRadioChannel;
		// Channels

		[_packRadio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan

		[_packRadio_2, 2] call acre_api_fnc_setRadioChannel; //Support
		// Set order
		_success = [ [_personalRadio, _packRadio_1, _packRadio_2] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_packRadio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_packRadio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		hint parseText "
		--- HQ/SL radio setup ---
		Radio1:Gauche/343/Team: HQ<br/>
		Radio2:Droite/117/Spartan/HQ<br/>
		Radio3:Gauche/117/Support/HQ</t>";
	};
	/*
	case "clout":{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_1 = _handRadios select 0;
		_handRadio_2 = _handRadios select 1;
		// Channels

		[_handRadio_1, 4] call acre_api_fnc_setRadioChannel;

		[_handRadio_2, 1] call acre_api_fnc_setRadioChannel;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_2, "BOTH" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [_personalRadio, _handRadio_1, _handRadio_2] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "<t>
		Radio1:Gauche/343/Team<br/>
		Radio2:Droite/152/Inter-Spartan<br/>
		Radio3:Both/152/Spartan-HQ</t>";
	};*/
	case "recon": {
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_1 = _handRadios select 0;
		_handRadio_2 = _handRadios select 1;
		// Channels

		[_personalRadio, 4] call acre_api_fnc_setRadioChannel;

		[_handRadio_1, 2] call acre_api_fnc_setRadioChannel;

		[_handRadio_2, 5] call acre_api_fnc_setRadioChannel;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [_personalRadio, _handRadio_1, _handRadio_2] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "
		--- Recon radio setup ---
		Radio1:Gauche/343/Team<br/>
		Radio2:Droite/152/Support/HQ<br/>
		Radio3:Gauche/152/Recon</t>";
	};
	case "centaure_pieton":	{
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_1 = _handRadios select 0;
		_handRadio_2 = _handRadios select 1;
		// Channels

		[_handRadio_1, 6] call acre_api_fnc_setRadioChannel;

		[_handRadio_2, 3] call acre_api_fnc_setRadioChannel;
		// Set sides
		_success = [_handRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _handRadio_1, _handRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "
		--- Centaure radio setup ---
		Radio1:Gauche/152/Inter-Centaure<br/>
		Radio2:Droite/152/Centaure-HQ</t>";
	};
	case "griffon_pieton": {
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_1 = _handRadios select 0;
		_handRadio_2 = _handRadios select 1;
		// Channels

		[_handRadio_1, 3] call acre_api_fnc_setRadioChannel;

		[_handRadio_2, 2] call acre_api_fnc_setRadioChannel;
		// Set sides
		_success = [_handRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _handRadio_1, _handRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hint parseText "
		--- Griffon radio setup ---
		Radio1:Gauche/117/Griffon<br/>
		Radio2:Droite/117/Support-HQ</t>";
	};
	case "set_griffon":	{
		_vic = vehicle player;
		_player = player;
		//Get racks
		_accessibleRacks = [_vic, _player] call acre_sys_rack_fnc_getAccessibleVehicleRacks;
		//Get mounted radios

		_rack1 = _accessibleRacks select 0;
		_rack2 = _accessibleRacks select 1;

		_radio1 = [_rack1] call acre_api_fnc_getMountedRackRadio;

		_radio2 = [_rack2] call acre_api_fnc_getMountedRackRadio;

		[_vic, _player, _radio1] call acre_sys_rack_fnc_startUsingMountedRadio;

		[_vic, _player, _radio2] call acre_sys_rack_fnc_startUsingMountedRadio;

		// Set radios for griffon use use
		["griffon"] spawn CGQC_fnc_setRadios;
	};
	case "set_centaure": {
		_vic = vehicle player;
		_player = player;
		//Get racks
		_accessibleRacks = [_vic, _player] call acre_sys_rack_fnc_getAccessibleVehicleRacks;
		//Get mounted radios

		_rack1 = _accessibleRacks select 0;
		_rack2 = _accessibleRacks select 1;

		_radio1 = [_rack1] call acre_api_fnc_getMountedRackRadio;

		_radio2 = [_rack2] call acre_api_fnc_getMountedRackRadio;
		waitUntil {!isNil "_radio_1"};
		[_vic, _player, _radio1] call acre_sys_rack_fnc_startUsingMountedRadio;

		[_vic, _player, _radio2] call acre_sys_rack_fnc_startUsingMountedRadio;
		// Set radios for centaure use
		["centaure"] spawn CGQC_fnc_setRadios;
	};
	case "speaker_off": {
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_1 = _handRadios select 0;

		// Check speaker state
		_isSpeaker = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
		waitUntil {!isNil "_isSpeaker"};
		if(_isSpeaker) then {
			// Turn speaker off
			_success = [_handRadio_1, false] call acre_api_fnc_setRadioSpeaker;

			_speaker_check = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
			hint format ["%1 Speaker: %2", _handRadio_1, _speaker_check];
		};
	};
	case "speaker_on": {
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_1 = _handRadios select 0;

		// Check speaker state
		_isSpeaker = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
		waitUntil {!isNil "_isSpeaker"};
		if !(_isSpeaker) then {
			// Turn speaker on
			_success = [_handRadio_1, true] call acre_api_fnc_setRadioSpeaker;

			_speaker_check = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
			hint format ["%1 Speaker: %2", _handRadio_1, _speaker_check];
		};
	};
	case "toggle_speaker": {
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_1 = _handRadios select 0;

		// Check speaker state
		_isSpeaker = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
		waitUntil {!isNil "_isSpeaker"};
		if(_isSpeaker) then {
			// Turn speaker off
			_success = [_handRadio_1, false] call acre_api_fnc_setRadioSpeaker;

			_speaker_check = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
			hint format ["%1 Speaker: %2", _handRadio_1, _speaker_check];
		}else{
			// Turn speaker on
			_success = [_handRadio_1, true] call acre_api_fnc_setRadioSpeaker;

			_speaker_check = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
			hint format ["%1 Speaker: %2", _handRadio_1, _speaker_check];
		};
	};
	case "toggle_speaker_2": {
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;

		_handRadio_2 = _handRadios select 1;

		// Check speaker state
		_isSpeaker = [_handRadio_2] call acre_api_fnc_isRadioSpeaker;
		waitUntil {!isNil "_isSpeaker"};
		if(_isSpeaker) then {
			// Turn speaker off
			_success = [_handRadio_2, false] call acre_api_fnc_setRadioSpeaker;

			_speaker_check = [_handRadio_2] call acre_api_fnc_isRadioSpeaker;
			hint format ["%1 Speaker: %2", _handRadio_2, _speaker_check];
		}else{
			// Turn speaker on
			_success = [_handRadio_2, true] call acre_api_fnc_setRadioSpeaker;

			_speaker_check = [_handRadio_2] call acre_api_fnc_isRadioSpeaker;
			hint format ["%1 Speaker: %2", _handRadio_2, _speaker_check];
		};
	};

	default	{
		hint "fnc_setRadios fucked up. ";
	};
};

[] call CGQC_fnc_setGroupRadios;

diag_log "[CGQC_FNC] setRadios done";