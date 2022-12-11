// --- postInit_client ----------------------------------------------------------
// Set radio setups depending on role

_type = _this select 0;
_section = _this select 1;
//_type = param [0, 1];
//_section = param [0, 2];

//disableUserInput = true;
if (!cgqc_flag_isTraining) then {
	switch (_type) do {
		case "radio_sides":	{
			_radios = call acre_api_fnc_getCurrentRadioList;
			_radio_count = count _radios;
			if (_radio_count > 0) then {
				hintSilent "Radio1: Gauche";
				_radio_1 = _radios select 0;
				_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			};
			if (_radio_count > 1) then {
				hintSilent "Radio2: Droite";
				_radio_2 = _radios select 1;
				_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			};
			hintSilent "Radios L/R Done";
			sleep 2;
			hintSilent"";
		};
		case "radio_sides_2": {
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
			hintSilent "Radios R/L Done";
			sleep 2;
			hintSilent"";
		};
		case "patch": {
			// Remove patch
			player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
			// Set the patch 
			[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;
			hintSilent "Patch restored";
			sleep 3;
			hintSilent"";
		};
		case "spartan":	{  //Grunts
			_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
			[_personalRadio, _section] call acre_api_fnc_setRadioChannel;
			sleep 0.5;
			// Set sides 
			_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			//Lock superfluous channels
			["low"] spawn CGQC_fnc_lockChannels;
			hintSilent "Radio1:Gauche/343/Spartan";
			sleep 10;
		};
		case "spartan_1": { //Team Lead
			_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			_packRadio = ["ACRE_PRC117F"] call acre_api_fnc_getRadioByType;
			sleep 0.5;
			// Channels
			[_personalRadio, _section] call acre_api_fnc_setRadioChannel; 
			[_handRadio, 4] call acre_api_fnc_setRadioChannel;
			[_packRadio, 1] call acre_api_fnc_setRadioChannel; 
			// Set sides 
			_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio orders
			_success = [ [ _personalRadio, _handRadio, _packRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			hintSilent parseText "<t>
			Radio1:Gauche/343/Spartan<br/> 
			Radio2:Droite/152/Interteam <br/> 
			Radio3:Both/117/HQ</t>";
			//Lock superfluous channels
			["low"] spawn CGQC_fnc_lockChannels;
			// Turn speaker on 
			//_success = [_handRadio, true] call acre_api_fnc_setRadioSpeaker;
			sleep 10;
		};
		case "spartan_2": { //Spartan 2iC
			_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			sleep 0.5;
			// Channels
			[_personalRadio, _section] call acre_api_fnc_setRadioChannel;
			[_handRadio, 4] call acre_api_fnc_setRadioChannel;
			// Set sides 
			_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio orders
			_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			hintSilent parseText "<t>
			Radio1:Gauche/343/Spartan<br/> 
			Radio2:Droite/152/Interteam</t>";
			//Lock superfluous channels
			["low"] spawn CGQC_fnc_lockChannels;
			sleep 10;
		};
		case "centaure": {
			sleep 1;
			// Emergency 152
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			sleep 0.5;
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
			hintSilent parseText "<t>
			Radio1:Gauche/117/Inter-Centaure<br/> 
			Radio2:Droite/117/Centaure-HQ<br/> 
			Radio3:Droite/152/Urgence</t>";
			//Lock superfluous channels
			["low"] spawn CGQC_fnc_lockChannels;
			sleep 10;
		};
		case "griffon":	{
			sleep 1;
			// Emergency 152
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			sleep 0.5;
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
			hintSilent parseText "<t>
			Radio1:Gauche/117/Inter-Griffon<br/> 
			Radio2:Droite/117/Griffon-HQ<br/> 
			Radio3:Droite/152/Urgence</t>";
			//Channel setup 
			//Lock superfluous channels
			["high"] spawn CGQC_fnc_lockChannels;
			sleep 10;
		};
		case "jtac": {
			// Radios
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
			_packRadio_1 = _packRadios select 0;
			_packRadio_2 = _packRadios select 1;
			sleep 0.5;
			// Channels
			[_packRadio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan
			[_packRadio_2, 2] call acre_api_fnc_setRadioChannel; //Air-Net
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
			//Lock superfluous channels
			["high"] spawn CGQC_fnc_lockChannels;
			sleep 10;
		};
		case "hq": {
			// 152's
			_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
			_packRadio_1 = _packRadios select 0;
			_packRadio_2 = _packRadios select 1;
			_packRadio_3 = _packRadios select 2;
			sleep 0.5;
			// Channels
			[_packRadio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan
			[_packRadio_2, 2] call acre_api_fnc_setRadioChannel; //Air-Net
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
			//Lock superfluous channels
			["high"] spawn CGQC_fnc_lockChannels;
			sleep 10;
		};
		case "recon": {
			_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
			_handRadio_1 = _handRadios select 0;
			_handRadio_2 = _handRadios select 1;
			sleep 0.5;
			// Channels
			[_handRadio_1, 7] call acre_api_fnc_setRadioChannel; 
			[_handRadio_2, 4] call acre_api_fnc_setRadioChannel;
			// Set sides 
			_success = [_handRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			_success = [_handRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
			// Set radio orders
			_success = [ [ _handRadio_1, _handRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
			hintSilent parseText "<t>
			Radio1:Gauche/152/Inter/Recon<br/> 
			Radio2:Droite/152/Spartan-HQ</t>";
			//Lock superfluous channels
			["high"] spawn CGQC_fnc_lockChannels;
			sleep 10;
		};
		case "centaure_pieton":	{
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			[_handRadio, 3] call acre_api_fnc_setRadioChannel;
			sleep 0.5;
			// Set sides 
			_success = [_handRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			// Add eventHandler to auto-connect to racks 
			cgqc_event_driver = player addEventHandler ["GetInMan", {
				params ["_unit", "_role", "_vehicle", "_turret"];	
				if (_role == "driver" || _role == "commander" || _role == "gunner") then 
				{
					["set_centaure"] execVM "\cgqc\functions\fnc_setRadios.sqf";
				};
			}];
			hintSilent "Radio1:Gauche/152/Centaure-HQ";
			sleep 10;
		};
		case "griffon_pieton": {
			_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
			[_handRadio, 2] call acre_api_fnc_setRadioChannel;
			sleep 0.5;
			// Set sides 
			_success = [_handRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
			cgqc_event_driver = player addEventHandler ["GetInMan", {
				params ["_unit", "_role", "_vehicle", "_turret"];	
				if (_role == "driver" || _role == "commander" || _role == "gunner") then 
				{
					["set_griffon"] execVM "\cgqc\functions\fnc_setRadios.sqf";
				};
			}];
			hintSilent "Radio1:Gauche/152/Griffon-HQ";
			sleep 10;
		};
		case "set_griffon":	{
			_vic = vehicle player;
			_player = player;
			//hintc format ["Vic:%1/Plyr:%2", _vic, _player];	
			sleep 1;
			//Get racks
			_accessibleRacks = [_vic, _player] call acre_sys_rack_fnc_getAccessibleVehicleRacks;
			sleep 0.5;
			//_rack_count = count _accessibleRacks;
			//hintc format ["Racks Count: %1", _rack_count];
			//Get mounted radios
			_rack1 = _accessibleRacks select 0;
			_rack2 = _accessibleRacks select 1;
			sleep 0.5;
			//hintc format ["Rack1: %1/Rack2:%2", _rack1, _rack2];
			_radio1 = [_rack1] call acre_api_fnc_getMountedRackRadio;
			_radio2 = [_rack2] call acre_api_fnc_getMountedRackRadio;
			sleep 0.5;
			[_vic, _player, _radio1] call acre_sys_rack_fnc_startUsingMountedRadio;
			[_vic, _player, _radio2] call acre_sys_rack_fnc_startUsingMountedRadio;
			sleep 1;
			// Set radios for centaure use
			["griffon"] execVM "\cgqc\functions\fnc_setRadios.sqf";
		};
		case "set_centaure": {
			_vic = vehicle player;
			_player = player;
			//hintc format ["Vic:%1/Plyr:%2", _vic, _player];	
			sleep 1;
			//Get racks
			_accessibleRacks = [_vic, _player] call acre_sys_rack_fnc_getAccessibleVehicleRacks;
			sleep 0.5;
			//_rack_count = count _accessibleRacks;
			//hintc format ["Racks Count: %1", _rack_count];
			//Get mounted radios
			_rack1 = _accessibleRacks select 0;
			_rack2 = _accessibleRacks select 1;
			sleep 0.5;
			//hintc format ["Rack1: %1/Rack2:%2", _rack1, _rack2];
			_radio1 = [_rack1] call acre_api_fnc_getMountedRackRadio;
			_radio2 = [_rack2] call acre_api_fnc_getMountedRackRadio;
			sleep 0.5;
			[_vic, _player, _radio1] call acre_sys_rack_fnc_startUsingMountedRadio;
			[_vic, _player, _radio2] call acre_sys_rack_fnc_startUsingMountedRadio;
			sleep 1;
			// Set radios for centaure use
			["centaure"] execVM "\cgqc\functions\fnc_setRadios.sqf";
		};
		case "toggle_speaker": {
			_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
			{
				_isSpeaker = [_x] call acre_api_fnc_isRadioSpeaker;
				sleep 0.5;
				if(_isSpeaker) then {
					// Turn speaker off 
					_success = [_x, false] call acre_api_fnc_setRadioSpeaker;
					sleep 0.5;
					_speaker_check = [_x] call acre_api_fnc_isRadioSpeaker;
					hint format ["%1 Speaker: %2", _x, _speaker_check];
					sleep 5;
					hintSilent "";
				}else{
					// Turn speaker on 
					_success = [_x, true] call acre_api_fnc_setRadioSpeaker;
					sleep 0.5;
					_speaker_check = [_x] call acre_api_fnc_isRadioSpeaker;
					hint format ["%1 Speaker: %2", _x, _speaker_check];
					sleep 5;
					hintSilent "";
				};
			} 
			forEach _handRadios;
		};
		
		default	{
			hint "fnc_setRadios fucked up. ";
		};
	};
} else { //Training radio setup
	// Remove all radios 
	_radios = call acre_api_fnc_getCurrentRadioList;
	{
		player removeItem _x;
	} forEach _radios;
	player addItemToUniform "ACRE_PRC343";
	player addItemToUniform "ACRE_PRC152";
	sleep 0.5;
	// Set radios left/right 
	_radiosNow = call acre_api_fnc_getCurrentRadioList;
	_radio_1 = _radiosNow select 0;
	_radio_2 = _radiosNow select 1;
	sleep 0.5;
	_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
	_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
	hint "Training Radio Setup";
	// Disable channels except global
	["init"] spawn CGQC_fnc_lockChannels;
	sleep 5;
	hintSilent "";
};
//true
//disableUserInput = false;