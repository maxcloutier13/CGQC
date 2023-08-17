// --- mk3GetRadios ----------------------------------------------------------
// Get radios and set everything

if (cgqc_flag_isTraining) then { 
	// Training setup 
	hint "Switching radios... Training";
	_radios = call acre_api_fnc_getCurrentRadioList;  
	{player removeItem _x;}forEach _radios;  
	sleep 0.5;
	player addItem "ACRE_PRC343";
	player addItem "ACRE_PRC152"; 
	sleep 0.5;
	// Delete event in case it exists
	if(!isNil "cgqc_event_148") then {
		["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
	};
	["spartan_2", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
	break;
} else {
	// Proceed
	_item = _this select 0;
	_skip = 0;
	switch (_item) do {
		case "inf":
		{
			hint "Switching radios... Inf";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios; 
			sleep 0.5;
			player addItem "ACRE_PRC343";
			
			/*
			player addItem "ACRE_PRC148"; 
			// Event with notifications if they try to communicate on ch:1
			cgqc_event_148 = ["acre_startedSpeaking", {	
				params ["_unit", "_onRadio", "_radioId", "_speakingType"];	
				if (_onRadio) then {   
					if(_radioId find "148" > -1) then { 
						y_channel = [] call acre_api_fnc_getCurrentRadioChannelNumber; 
						if(y_channel == 1) then { 
							_channel_txt = parseText( "148:Ch1 = Listen Only!!!" + "<br/>" + "En cas d'urgence: Ch2 pour HQ"); 
							[ _channel_txt, 0, 1, 3, 1 ] spawn BIS_fnc_dynamicText; 
						};  
					};   
				};   
			}] call CBA_fnc_addEventHandler;
			*/
			sleep 0.5;
			["spartan", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};
		case "training":
		{
			hint "Switching radios... Training";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios;  
			sleep 0.5;
			player addItem "ACRE_PRC343";
			player addItem "ACRE_PRC152"; 
			sleep 0.5;
			// Delete event in case it exists
			if(!isNil "cgqc_event_148") then {
				["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
			};
			["spartan_2", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};
		case "medic":
		{
			hint "Switching radios... Medic";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios;  
			sleep 0.5;
			player addItem "ACRE_PRC343";
			player addItem "ACRE_PRC152"; 
			sleep 0.5;
			// Delete event in case it exists
			if(!isNil "cgqc_event_148") then {
				["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
			};
			["medic", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};
		case "tl":
		{
			hint "Switching radios... TL";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios;  
			sleep 0.5;
			player addItem "ACRE_PRC343";
			player addItem "ACRE_PRC152"; 
			//player addItem "ACRE_PRC117F"; 
			sleep 0.5;
			// Delete event in case it exists
			if(!isNil "cgqc_event_148") then {
				["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
			};
			["spartan_1", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};
		case "sl":
		{
			hint "Switching radios... SL";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios;  
			sleep 0.5;
			player addItem "ACRE_PRC343";
			player addItem "ACRE_PRC117F"; 
			player addItem "ACRE_PRC117F"; 
			sleep 0.5;
			// Delete event in case it exists
			if(!isNil "cgqc_event_148") then {
				["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
			};
			["hq", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};
		case "recon":
		{
			hint "Switching radios... Recon";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios;  
			sleep 0.5;
			player addItem "ACRE_PRC343"; 
			player addItem "ACRE_PRC152"; 
			player addItem "ACRE_PRC152"; 
			sleep 0.5;
			// Delete event in case it exists
			if(!isNil "cgqc_event_148") then {
				["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
			};
			["recon", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};
		case "pilot":
		{
			hint "Switching radios... Pilot";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios;  
			sleep 0.5;
			player addItem "ACRE_PRC152"; 
			player addItem "ACRE_PRC152"; 
			sleep 0.5;
			// Delete event in case it exists
			if(!isNil "cgqc_event_148") then {
				["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
			};
			["griffon_pieton", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};
		case "driver":
		{
			hint "Switching radios... Driver";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios;  
			sleep 0.5;
			player addItem "ACRE_PRC152"; 
			player addItem "ACRE_PRC152"; 
			sleep 0.5;
			// Delete event in case it exists
			if(!isNil "cgqc_event_148") then {
				["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
			};
			["centaure_pieton", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};
		/*
		case "clout":
		{
			hint "Switching radios... Cloutier";
			_radios = call acre_api_fnc_getCurrentRadioList;  
			{player removeItem _x;}forEach _radios;  
			sleep 0.5;
			player addItem "ACRE_PRC343"; 
			player addItem "ACRE_PRC152"; 
			player addItem "ACRE_PRC152"; 
			sleep 0.5;
			// Delete event in case it exists
			if(!isNil "cgqc_event_148") then {
				["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
			};
			["clout", 1] execVM "\cgqc\functions\fnc_setRadios.sqf";
			break;
		};*/
		default	{
			hint "mk3_getRadios error";
			sleep 3;
		};
	};

};

