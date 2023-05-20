// --- perksZeus ----------------------------------------------------------
// Perks for the gods

_type = _this select 0;
briefing_time = _this select 1;

switch (_type) do {
	case "zeus_radios":
	{
		sleep 0.5; 
		// 117f's 
		y_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType; 
		waitUntil {sleep 0.5;!isNil "y_packRadios"}; 
		if (count y_packRadios < 3) then { 
			hint "Setting Zeus radios"; 
			//Remove all radios  
			_radios = call acre_api_fnc_getCurrentRadioList; 
			{ 
				player removeItem _x; 
			}forEach _radios; 
			// Add 3 zeus radios 
			if (player canAdd ["ACRE_PRC117F", 3]) then {  
				// There is enough space, add the items  
				player addItem "ACRE_PRC117F";  
				player addItem "ACRE_PRC117F";  
				player addItem "ACRE_PRC117F";  
			} else {  
				// There is not enough space  
				hint "Not enough inventory space!"; 
				_items_pack = backpackItems player; 
				removeBackpack player; 
				player addBackpack "cgqc_pack_mk1_magic_zeus"; 
				clearAllItemsFromBackpack player; 
				{player addItemToBackpack _x} forEach _items_pack; 
				player addItem "ACRE_PRC117F";  
				player addItem "ACRE_PRC117F";  
				player addItem "ACRE_PRC117F";  
			}; 
			sleep 1; 
			y_zeusRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType; 
			waitUntil {sleep 1;!isNil "y_zeusRadios"}; 
			if (count y_zeusRadios < 3) then { 
				hint "What the fuck!"; 
				sleep 5; 
				hintSilent ""; 
			}else { 
				y_packRadio_1 = y_zeusRadios select 0; 
				y_packRadio_2 = y_zeusRadios select 1; 
				y_packRadio_3 = y_zeusRadios select 2; 
				waitUntil {sleep 0.5;!isNil "y_packradio_1"}; 
				[y_packradio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan 
				waitUntil {sleep 0.5;!isNil "y_packradio_2"}; 
				[y_packradio_2, 2] call acre_api_fnc_setRadioChannel; //Air-Net 
				waitUntil {sleep 0.5;!isNil "y_packradio_3"}; 
				[y_packradio_3, 3] call acre_api_fnc_setRadioChannel; //Ground-Net 
				// Set order 
				_success = [ [ y_packradio_1, y_packradio_2, y_packradio_3] ] call acre_api_fnc_setMultiPushToTalkAssignment; 
				// Set sides  
				_success = [y_packradio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial; 
				_success = [y_packradio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial; 
				_success = [y_packradio_3, "RIGHT" ] call acre_api_fnc_setRadioSpatial; 
				hint parseText "<t> 
				--- Zeus Radios -------------<br/> 
				Radio1:Gauche/117/Spartan<br/>  
				Radio2:Droite/117/Griffon<br/>  
				Radio3:Droite/117/Centaure</t>";
				sleep 10;
				hintSilent "";
			}; 
		};
		
        break; 
	};
	case "maprestrict":
	{
		jib_restrictmarkers_enabled = true;
		sleep 0.1;
		publicVariable "jib_restrictmarkers_enabled";
		cgqc_zeus_mapRestricted = true;
		hint "Map Sharing Restricted";
        break;
	};
	case "mapshare":
	{
		jib_restrictmarkers_enabled = false;
		sleep 0.1;
		publicVariable "jib_restrictmarkers_enabled";
		cgqc_zeus_mapRestricted = false;
		hint "Map Sharing UN-Restricted";
        break;
	};
	case "briefingCmd":
	{
		// Command briefing started
		cgqc_zeus_briefingCmd = true;
		// Create briefing marker 
		_markerstr = createMarker ["cgqcBriefingCmd", player];
		"cgqcBriefingCmd" setMarkerType "mil_objective"; 
		"cgqcBriefingCmd" setMarkerText "Commander's Briefing";
		"cgqcBriefingCmd" setMarkerColor "colorBLUFOR";
		//Remove map sharing restriction for briefing
		jib_restrictmarkers_enabled = false;
		publicVariable "jib_restrictmarkers_enabled";
		// Cone of silence for briefing
		// Run code directly instead of with the activation. Trigger is only for getting player list
		_startBriefing = execVM "\cgqc\functions\fnc_briefingCmdStart.sqf";
		_act = "";
		_deAct = "";
		_int = 2;
		// Create trigger
		cgqc_briefingCmd_trg = createTrigger ["EmptyDetector",getPos player, false];
		cgqc_briefingCmd_trg setTriggerArea [cgqc_setting_briefingCmd_area, cgqc_setting_briefingCmd_area, getDir player, true];
		cgqc_briefingCmd_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_briefingCmd_trg setTriggerStatements ["this", _act, _deAct];
		cgqc_briefingCmd_trg setTriggerInterval _int;
        break;
	};
	case "briefingCmd_stop":
	{
		// Commanders Briefing done
		cgqc_zeus_briefingCmd = false;
		publicVariable "cgqc_zeus_briefingCmd";
		// Delete briefing marker 
		deleteMarker "cgqcBriefing";
		//Restriction back on
		jib_restrictmarkers_enabled = true;
		publicVariable "jib_restrictmarkers_enabled";
		// Delete trigger of silence
		if !(isNil "cgqc_briefingCmd_trg") then {
			deleteVehicle cgqc_briefingCmd_trg;
		};	 
		// Remote reset volumes on everyone
		{['\cgqc\functions\fnc_briefingCmdStop.sqf'] remoteExec ['execVM',vehicle _x];
		} forEach allPlayers;
        break;
	};
	case "briefing":
	{
		// Briefing started
		cgqc_zeus_briefing = true;
		publicVariable "cgqc_zeus_briefing";
		// Create briefing marker 
		_markerstr = createMarker ["cgqcBriefing", player];
		"cgqcBriefing" setMarkerType "mil_objective"; 
		"cgqcBriefing" setMarkerText "Briefing";
		"cgqcBriefing" setMarkerColor "colorBLUFOR";
		//Timer before briefing start 
		while {briefing_time > 0 && cgqc_zeus_briefing} do { 
			_min = floor (briefing_time / 60);
			_sec =  briefing_time - (_min * 60); 
			_min_sec = format["%1:%2", _min, _sec];
			_msg = format["General Briefing in: \n %1", _min_sec];
			[_msg] remoteExec ["hintSilent"];
			"cgqcBriefing" setMarkerText format["General Briefing in %1", _min_sec];
			briefing_time = briefing_time - 1;   
			sleep 1; 
		};
		if(cgqc_zeus_briefing) then {
			//Remove map sharing restriction for briefing
			jib_restrictmarkers_enabled = false;
			publicVariable "jib_restrictmarkers_enabled";
			// Cone of silence for briefing
			// Act: lowerVolume on units_in. LowerVoice on units_out 
			_startBriefing = execVM "\cgqc\functions\fnc_briefingStart.sqf";
			_act = "";
			_deAct = "";
			_int = 2;
			// Create trigger
			cgqc_briefing_trg = createTrigger ["EmptyDetector",getPos player, false];
			cgqc_briefing_trg setTriggerArea [cgqc_setting_briefing_area, cgqc_setting_briefing_area, getDir player, true];
			cgqc_briefing_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
			cgqc_briefing_trg setTriggerStatements ["this", _act, _deAct];
			cgqc_briefing_trg setTriggerInterval _int;
			["BRIEFING NOW!!!"] remoteExec ["hint"];
			// Redo the briefing marker in case zeus moved
			_markerstr = createMarker ["cgqcBriefing", player];
			"cgqcBriefing" setMarkerType "mil_objective"; 
			"cgqcBriefing" setMarkerText "BRIEFING NOW!!!";
			"cgqcBriefing" setMarkerColor "ColorRed";
			sleep 10;
			[""] remoteExec ["hintSilent"];
		};
        break;
	};
	case "briefing_stop":
	{
		// Briefing done
		cgqc_zeus_briefing = false;
		publicVariable "cgqc_zeus_briefing";
		// Delete briefing marker 
		deleteMarker "cgqcBriefing";
		//Restriction back on
		jib_restrictmarkers_enabled = true;
		publicVariable "jib_restrictmarkers_enabled";
		// Delete trigger of silence
		if !(isNil "cgqc_briefing_trg") then {
			deleteVehicle cgqc_briefing_trg;
		};	 
		// Remote reset volumes on everyone
		{['\cgqc\functions\fnc_briefingStop.sqf'] remoteExec ['execVM',vehicle _x];
		} forEach allPlayers;
        break;
	};
	case "delete": {
		{
			deleteVehicle _x
		} forEach allDead;
		hint "Dead deleted";
        break;
	};
	case "343":
	{
		player addItem "ACRE_PRC343";
		hint "Got: 343";
        break;
	};
	case "152":
	{
		player addItem "ACRE_PRC152";
		hint "Got: 152";
        break;
	};
	case "117":
	{
		player addItem "ACRE_PRC117F";
		hint "Got: 117";
        break;
	};
	case "crate":
	{
		_pos_free = getPosATL player findEmptyPosition [1,20,"cgqc_box_mk2_arsenal"];
		zeus_crate = "cgqc_box_mk2_arsenal" createVehicle _pos_free;
		cgqc_zeus_crate = true;
		hint "Mk3 arsenal";
		sleep 5;
		hintSilent "";
        break;
	};
	case "del_crate":
	{
		deleteVehicle zeus_crate;
		cgqc_zeus_crate = false;
		hint "Arsenal deleted";
		sleep 5;
		hintSilent "";
        break;
	};
	case "cargo":
	{
		zeus_cargo="cgqc_box_mk2_cargo" createVehicle (position player);
		cgqc_zeus_cargo = true;
		hint "Mk3 Cargo";
		sleep 5;
		hintSilent "";
        break;
	};
	case "del_cargo":
	{
		deleteVehicle zeus_cargo;
		cgqc_zeus_cargo = false;
		hint "Cargo deleted";
		sleep 5;
		hintSilent "";
        break;
	};
	case "animation_on": {
		cgqc_mk2_animation_locked = true; 
		publicVariable "cgqc_mk2_animation_locked";
		hint "Animations LOCKED";
		sleep 5;
		hintSilent "";
        break;
	};
	case "animation_off": {
		cgqc_mk2_animation_locked = false;
		publicVariable "cgqc_mk2_animation_locked";
		hint "Animations UNLOCKED";
		sleep 5;
		hintSilent "";
        break;
	};
	case "punch_on": {
		BRIDGE_KPU_MasterSetting = true; 
		publicVariable "BRIDGE_KPU_MasterSetting";
		hint "Punching LOCKED";
		sleep 5;
		hintSilent "";
        break;
	};
	case "punch_off": {
		BRIDGE_KPU_MasterSetting = false;
		publicVariable "BRIDGE_KPU_MasterSetting";
		hint "Punching UNLOCKED";
		sleep 5;
		hintSilent "";
        break;
	};
	case "animation_setting": {
		publicVariable "cgqc_mk2_animation_locked";
        break;
	};
	default
	{
		hint "fnc_perksZeus fucked up";
	};
};