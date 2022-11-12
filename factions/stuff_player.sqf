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
		hintSilent "Radios R/L Done";
		sleep 2;
		hintSilent"";
	};
	case "patch":
	{
		//Set the patch 
		[ player, player_patch ] call BIS_fnc_setUnitInsignia;
		hintSilent "Patch restored";
		sleep 3;
		hintSilent"";
	};
	case "spartan1":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		[_personalRadio, 1] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		hintSilent "Radio1:Gauche/343/Spartan-1";
		sleep 10;
	};
	case "spartan2":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		[_personalRadio, 2] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		hintSilent "Radio1:Gauche/343/Spartan-2";
		sleep 10;
	};
	case "spartan1_1":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		_packRadio = ["ACRE_PRC117F"] call acre_api_fnc_getRadioByType;
		sleep 1;
		// Channels
		[_personalRadio, 1] call acre_api_fnc_setRadioChannel; 
		[_handRadio, 4] call acre_api_fnc_setRadioChannel;
		[_packRadio, 1] call acre_api_fnc_setRadioChannel; 
		sleep 1;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		sleep 1;
		// Set radio orders
		_success = [ [ _personalRadio, _handRadio, _packRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent parseText "<t>
		Radio1:Gauche/343/Spartan-1 <br/> 
		Radio2:Droite/152/Interteam <br/> 
		Radio3:Both/117/HQ</t>";
		sleep 10;
	};
	case "spartan1_2":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 1] call acre_api_fnc_setRadioChannel;
		[_handRadio, 4] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent parseText "<t>
		Radio1:Gauche/343/Spartan-1 <br/> 
		Radio2:Droite/152/Interteam</t>";
		sleep 10;
	};
	case "spartan2_1":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		_packRadio = ["ACRE_PRC117F"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 2] call acre_api_fnc_setRadioChannel; 
		[_handRadio, 4] call acre_api_fnc_setRadioChannel;
		[_packRadio, 1] call acre_api_fnc_setRadioChannel; 
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handRadio, _packRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent parseText "<t>
		Radio1:Gauche/343/Spartan-2<br/> 
		Radio2:Droite/152/Interteam<br/> 
		Radio3:Both/117/HQ</t>";
		sleep 10;
	};
	case "spartan2_2":
	{
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		// Channels
		[_personalRadio, 2] call acre_api_fnc_setRadioChannel; 
		[_handRadio, 4] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _personalRadio, _handRadio, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent parseText "<t>
		Radio1:Gauche/343/Spartan-2<br/> 
		Radio2:Droite/152/Interteam</t>";
		sleep 10;
	};
	case "centaure":
	{
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
		hintSilent parseText "<t>
		Radio1:Gauche/117/Inter-Centaure<br/> 
		Radio2:Droite/117/Centaure-HQ<br/> 
		Radio3:Droite/152/Urgence</t>";
		sleep 10;
	};
	case "griffon":
	{
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
		hintSilent parseText "<t>
		Radio1:Gauche/117/Inter-Griffon<br/> 
		Radio2:Droite/117/Griffon-HQ<br/> 
		Radio3:Droite/152/Urgence</t>";
		sleep 10;
	};
	case "jtac":
	{
		// Radios
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
		_packRadio_1 = _packRadios select 0;
		_packRadio_2 = _packRadios select 1;
		
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
		sleep 10;
	};
	case "hq":
	{
		// 152's
		_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType;
		_packRadio_1 = _packRadios select 0;
		_packRadio_2 = _packRadios select 1;
		_packRadio_3 = _packRadios select 2;
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
		sleep 10;
	};
	case "recon":
	{
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
		_handRadio_1 = _handRadios select 0;
		_handRadio_2 = _handRadios select 1;
		// Channels
		[_handRadio_1, 6] call acre_api_fnc_setRadioChannel; 
		[_handRadio_2, 4] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_handRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [_handRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		// Set radio orders
		_success = [ [ _handRadio_1, _handRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		hintSilent parseText "<t>
		Radio1:Gauche/152/Inter/Recon<br/> 
		Radio2:Droite/152/Spartan-HQ</t>";
		sleep 10;
	};
	case "centaure_pieton":
	{
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		[_handRadio, 3] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_handRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		hintSilent "Radio1:Gauche/152/Centaure-HQ";
		sleep 10;
	};
	case "griffon_pieton":
	{
		_handRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
		[_handRadio, 2] call acre_api_fnc_setRadioChannel;
		// Set sides 
		_success = [_handRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		hintSilent "Radio1:Gauche/152/Griffon-HQ";
		sleep 10;
	};
	default
	{
		hint "woops";
	};
};

	