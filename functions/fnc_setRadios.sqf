// --- postInit_client ----------------------------------------------------------
// Set radio setups depending on role

_type = _this select 0;
_section = _this select 1;
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

waitUntil {sleep 1;cgqc_postInitClient_done};

//disableUserInput = true;
	switch (_type) do {
		case "radio_init":	{
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
		case "radio_sides":	{
			_radios = call acre_api_fnc_getCurrentRadioList;
			_radio_count = count _radios;
			if (_radio_count > 0) then {
				_radio_1 = _radios select 0;
				_side = [_radio_1] call acre_api_fnc_getRadioSpatial;
				switch (_side) do {
					case "LEFT":	{
						_success = [_radio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
					};
					case "RIGHT":	{
						_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
					};
					case "CENTER":	{
						_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
					};
				};
			};
			if (_radio_count > 1) then {
				_radio_2 = _radios select 1;
				_side_2 = [_radio_2] call acre_api_fnc_getRadioSpatial;
				switch (_side_2) do {
					case "LEFT":	{
						_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
					};
					case "RIGHT":	{
						_success = [_radio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;
					};
					case "CENTER":	{
						_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
					};
				};
			};
			hintSilent "Radio Sides: Set";
		};
		case "patch": {
			// Remove patch
			player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
			// Set the patch 
			[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
			hintSilent "Patch restored";
		};
		case "spartan":	{  //Grunts
			_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
			_handRadio = ["ACRE_PRC148"] call acre_api_fnc_getRadioByType;
			// Channels
			waitUntil {sleep 0.5;!isNil "_personalRadio"};
			[_personalRadio, _section] call acre_api_fnc_setRadioChannel;
			waitUntil {sleep 0.5;!isNil "_handRadio"};
			[_handRadio, 1] call acre_api_fnc_setRadioChannel;
			//Lower volume of the 148 a little bit 
			[_handRadio,0.5] call acre_api_fnc_setRadioVolume;
			// Set sides 
			_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio PTT: 152 is listen-only
			_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			// Fuck up the sending frequency of ch1 to make listen only
			hintSilent parseText "<t>
			Radio1:Gauche/343/Spartan<br/> 
			Radio2:Droite/Listen-Only/Interteam</t>";
		};
		case "spartan_1": { //Team Lead
			_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			_packRadio = ["ACRE_PRC117F"] call acre_api_fnc_getRadioByType;
			// Channels
			waitUntil {sleep 0.5;!isNil "_personalRadio"};
			[_personalRadio, _section] call acre_api_fnc_setRadioChannel; 
			// Channels
			waitUntil {sleep 0.5;!isNil "_handRadio"};
			[_handRadio, 4] call acre_api_fnc_setRadioChannel; 
			waitUntil {sleep 0.5;!isNil "_packRadio"};
			[_packRadio, 1] call acre_api_fnc_setRadioChannel;
			// Set sides 
			_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio orders
			_success = [ [ _personalRadio, _handRadio, _packRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			// Set HQ radio to speaker
			_success = [_packRadio, true] call acre_api_fnc_setRadioSpeaker;
			hintSilent parseText "<t>
			Radio1:Gauche/343/Spartan<br/> 
			Radio2:Droite/152/Interteam <br/> 
			Radio3:Both/117f/HQ</t>";
		};
		case "spartan_2": { //Spartan 2iC
			_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			// Channels
			waitUntil {sleep 0.5;!isNil "_personalRadio"};
			[_personalRadio, _section] call acre_api_fnc_setRadioChannel;
			waitUntil {sleep 0.5;!isNil "_handRadio"};
			[_handRadio, 4] call acre_api_fnc_setRadioChannel;
			// Set sides 
			_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio orders
			_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			hintSilent parseText "<t>
			Radio1:Gauche/343/Spartan<br/> 
			Radio2:Droite/152/Interteam</t>";
		};
		case "centaure": {
			// Emergency 152
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			// Racks
			_racks = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_racks"};
			_rack1 = _racks select 0; 
			_rack2 = _racks select 1; 
			// Channels
			waitUntil {sleep 0.5;!isNil "_handRadio"};
			[_handRadio, 3] call acre_api_fnc_setRadioChannel; //Sol-HQ
			waitUntil {sleep 0.5;!isNil "_rack1"};
			[_rack1, 6] call acre_api_fnc_setRadioChannel; //Interteam
			waitUntil {sleep 0.5;!isNil "_rack2"};
			[_rack2, 3] call acre_api_fnc_setRadioChannel; //Sol-HQ
			// Set sides 
			_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_rack1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_rack2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Lower volume of 152?
			[_handRadio,0.5] call acre_api_fnc_setRadioVolume;
			// Set radio orders
			_success = [ [ _rack1, _rack2, _handRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			hintSilent parseText "<t>
			Radio1:Gauche/117/Inter-Centaure<br/> 
			Radio2:Droite/117/Centaure-HQ<br/> 
			Radio3:Droite/152/Urgence</t>";
		};
		case "griffon":	{
			// Emergency 152
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			// Racks
			_racks = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_racks"};
			_rack1 = _racks select 0; 
			_rack2 = _racks select 1; 
			// Channels
			waitUntil {sleep 0.5;!isNil "_handRadio"};
			[_handRadio, 2] call acre_api_fnc_setRadioChannel; //Air-net
			waitUntil {sleep 0.5;!isNil "_rack1"};
			[_rack1, 5] call acre_api_fnc_setRadioChannel; //Interteam
			waitUntil {sleep 0.5;!isNil "_rack2"};
			[_rack2, 2] call acre_api_fnc_setRadioChannel; //Air-HQ
			// Set radio orders
			_success = [ [ _rack1, _rack2, _handRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			// Set sides 
			_success = [_rack1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_rack2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			hintSilent parseText "<t>
			Radio1:Gauche/117/Inter-Griffon<br/> 
			Radio2:Droite/117/Griffon-HQ<br/> 
			Radio3:Droite/152/Urgence</t>";
		};
		case "jtac": {
			// Radios
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_packRadios"};
			_packRadio_1 = _packRadios select 0;
			_packRadio_2 = _packRadios select 1;
			// Channels
			waitUntil {sleep 0.5;!isNil "_packRadio_1"};
			[_packRadio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan
			waitUntil {sleep 0.5;!isNil "_packRadio_2"};
			[_packRadio_2, 2] call acre_api_fnc_setRadioChannel; //Air-Net
			waitUntil {sleep 0.5;!isNil "_handRadio"};
			[_handRadio, 7] call acre_api_fnc_setRadioChannel; //Recon
			// Set order
			_success = [ [ _handRadio, _packRadio_1, _packRadio_2] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			// Set sides 
			_success = [_handRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_packRadio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_packRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			hintSilent parseText "<t>
			Radio1:Gauche/152/Inter-Recon<br/> 
			Radio2:Droite/117/Spartan-HQ<br/> 
			Radio3:Droite/117/Griffon-HQ</t>";
		};
		case "hq": {
			// 117f's
			_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_packRadios"};
			_packRadio_1 = _packRadios select 0;
			_packRadio_2 = _packRadios select 1;
			_packRadio_3 = _packRadios select 2;
			// Channels
			waitUntil {sleep 0.5;!isNil "_packRadio_1"};
			[_packRadio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan
			waitUntil {sleep 0.5;!isNil "_packRadio_2"};
			[_packRadio_2, 2] call acre_api_fnc_setRadioChannel; //Air-Net
			waitUntil {sleep 0.5;!isNil "_packRadio_3"};
			[_packRadio_3, 3] call acre_api_fnc_setRadioChannel; //Recon
			// Set order
			_success = [ [ _packRadio_1, _packRadio_2, _packRadio_3] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			// Set sides 
			_success = [_packRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_packRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_packRadio_3, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			hintSilent parseText "<t>
			Radio1:Gauche/117/Spartan<br/> 
			Radio2:Droite/117/Griffon<br/> 
			Radio3:Droite/117/Centaure</t>";
		};
		case "recon": {
			_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_handRadios"};
			_handRadio_1 = _handRadios select 0;
			_handRadio_2 = _handRadios select 1;
			// Channels
			waitUntil {sleep 0.5;!isNil "_handRadio_1"};
			[_handRadio_1, 7] call acre_api_fnc_setRadioChannel; 
			waitUntil {sleep 0.5;!isNil "_handRadio_2"};
			[_handRadio_2, 1] call acre_api_fnc_setRadioChannel;
			// Set sides 
			_success = [_handRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio orders
			_success = [ [ _handRadio_1, _handRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			hintSilent parseText "<t>
			Radio1:Gauche/152/Inter/Recon<br/> 
			Radio2:Droite/152/Spartan-HQ</t>";
		};
		case "centaure_pieton":	{
			_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_handRadios"};
			_handRadio_1 = _handRadios select 0;
			_handRadio_2 = _handRadios select 1;
			// Channels
			waitUntil {sleep 0.5;!isNil "_handRadio_1"};
			[_handRadio_1, 6] call acre_api_fnc_setRadioChannel; 
			waitUntil {sleep 0.5;!isNil "_handRadio_2"};
			[_handRadio_2, 3] call acre_api_fnc_setRadioChannel;
			// Set sides 
			_success = [_handRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio orders
			_success = [ [ _handRadio_1, _handRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			hintSilent parseText "<t>
			Radio1:Gauche/152/Inter-Centaure<br/> 
			Radio2:Droite/152/Centaure-HQ</t>";
		};
		case "griffon_pieton": {
			_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_handRadios"};
			_handRadio_1 = _handRadios select 0;
			_handRadio_2 = _handRadios select 1;
			// Channels
			waitUntil {sleep 0.5;!isNil "_handRadio_1"};
			[_handRadio_1, 5] call acre_api_fnc_setRadioChannel; 
			waitUntil {sleep 0.5;!isNil "_handRadio_2"};
			[_handRadio_2, 2] call acre_api_fnc_setRadioChannel;
			// Set sides 
			_success = [_handRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio orders
			_success = [ [ _handRadio_1, _handRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			hintSilent parseText "<t>
			Radio1:Gauche/117/Inter-Griffon<br/> 
			Radio2:Droite/117/Griffon-HQ</t>";
		};
		case "set_griffon":	{
			_vic = vehicle player;
			_player = player;
			//Get racks
			_accessibleRacks = [_vic, _player] call acre_sys_rack_fnc_getAccessibleVehicleRacks;
			//Get mounted radios
			waitUntil {sleep 0.5;!isNil "_accessibleRacks"};
			_rack1 = _accessibleRacks select 0;
			_rack2 = _accessibleRacks select 1;
			waitUntil {sleep 0.5;!isNil "_rack1"};
			_radio1 = [_rack1] call acre_api_fnc_getMountedRackRadio;
			waitUntil {sleep 0.5;!isNil "_rack2"};
			_radio2 = [_rack2] call acre_api_fnc_getMountedRackRadio;
			waitUntil {sleep 0.5;!isNil "_radio1"};
			[_vic, _player, _radio1] call acre_sys_rack_fnc_startUsingMountedRadio;
			waitUntil {sleep 0.5;!isNil "_radio2"};
			[_vic, _player, _radio2] call acre_sys_rack_fnc_startUsingMountedRadio;
			sleep 0.5;
			// Set radios for centaure use
			["griffon"] execVM "\cgqc\functions\fnc_setRadios.sqf";
		};
		case "set_centaure": {
			_vic = vehicle player;
			_player = player;
			//Get racks
			_accessibleRacks = [_vic, _player] call acre_sys_rack_fnc_getAccessibleVehicleRacks;
			//Get mounted radios
			waitUntil {sleep 0.5;!isNil "_accessibleRacks"};
			_rack1 = _accessibleRacks select 0;
			_rack2 = _accessibleRacks select 1;
			waitUntil {sleep 0.5;!isNil "_rack1"};
			_radio1 = [_rack1] call acre_api_fnc_getMountedRackRadio;
			waitUntil {sleep 0.5;!isNil "_rack2"};
			_radio2 = [_rack2] call acre_api_fnc_getMountedRackRadio;
			waitUntil {sleep 0.5;!isNil "_radio_1"};
			[_vic, _player, _radio1] call acre_sys_rack_fnc_startUsingMountedRadio;
			waitUntil {sleep 0.5;!isNil "_radio2"};
			[_vic, _player, _radio2] call acre_sys_rack_fnc_startUsingMountedRadio;
			// Set radios for centaure use
			["centaure"] execVM "\cgqc\functions\fnc_setRadios.sqf";
		};
		case "toggle_speaker": {
			_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_handRadios"};
			_handRadio_1 = _handRadios select 0;
			waitUntil {sleep 0.5;!isNil "_handRadio_1"};
			// Check speaker state
			_isSpeaker = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
			waitUntil {sleep 0.5;!isNil "_isSpeaker"};
			if(_isSpeaker) then {
				// Turn speaker off 
				_success = [_handRadio_1, false] call acre_api_fnc_setRadioSpeaker;
				sleep 0.5;
				_speaker_check = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
				hint format ["%1 Speaker: %2", _handRadio_1, _speaker_check];
			}else{
				// Turn speaker on 
				_success = [_handRadio_1, true] call acre_api_fnc_setRadioSpeaker;
				sleep 0.5;
				_speaker_check = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
				hint format ["%1 Speaker: %2", _handRadio_1, _speaker_check];
			};
		};
		case "toggle_speaker_2": {
			_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
			waitUntil {sleep 0.5;!isNil "_handRadios"};
			_handRadio_2 = _handRadios select 1;
			waitUntil {sleep 0.5;!isNil "_handRadio_2"};
			// Check speaker state
			_isSpeaker = [_handRadio_2] call acre_api_fnc_isRadioSpeaker;
			waitUntil {sleep 0.5;!isNil "_isSpeaker"};
			if(_isSpeaker) then {
				// Turn speaker off 
				_success = [_handRadio_2, false] call acre_api_fnc_setRadioSpeaker;
				sleep 0.5;
				_speaker_check = [_handRadio_2] call acre_api_fnc_isRadioSpeaker;
				hint format ["%1 Speaker: %2", _handRadio_2, _speaker_check];
			}else{
				// Turn speaker on 
				_success = [_handRadio_2, true] call acre_api_fnc_setRadioSpeaker;
				sleep 0.5;
				_speaker_check = [_handRadio_2] call acre_api_fnc_isRadioSpeaker;
				hint format ["%1 Speaker: %2", _handRadio_2, _speaker_check];
			};
		};
		case "training": {	
			// Set radios left/right 
			_radiosNow = call acre_api_fnc_getCurrentRadioList;
			waitUntil {sleep 0.5;!isNil "_radiosNow"};
			_radio_1 = _radiosNow select 0;
			_radio_2 = _radiosNow select 1;
			waitUntil {sleep 0.5;!isNil "_radio_1"};
			_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			waitUntil {sleep 0.5;!isNil "_radio_2"};
			_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			hint "Training Radio Setup";
		};
		default	{
			hint "fnc_setRadios fucked up. ";
		};
	};

sleep 10;
hintSilent "";

