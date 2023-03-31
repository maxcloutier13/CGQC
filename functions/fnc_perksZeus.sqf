// --- perksZeus ----------------------------------------------------------
// Perks for the gods

_type = _this select 0;
briefing_time = _this select 1;

switch (_type) do {
	case "maprestrict":
	{
		jib_restrictmarkers_enabled = true;
		publicVariable "jib_restrictmarkers_enabled";
		cgqc_zeus_mapRestricted = true;
	};
	case "mapshare":
	{
		jib_restrictmarkers_enabled = false;
		publicVariable "jib_restrictmarkers_enabled";
		cgqc_zeus_mapRestricted = false;
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
		//Super high sharing distance for briefing.
		jibrm_restrictmarkers_shareDistance = 2000;
		publicVariable "jibrm_restrictmarkers_shareDistance";
		// Cone of silence for briefing
		// Act: lowerVolume on units_in. LowerVoice on units_out 
		_act = format ["['\cgqc\functions\fnc_briefingCmdStart.sqf'] remoteExec ['execVM',%1];", player];
		_deAct = "";
		_int = 2;
		// Create trigger
		cgqc_briefingCmd_trg = createTrigger ["EmptyDetector",getPos player, false];
		cgqc_briefingCmd_trg setTriggerArea [cgqc_setting_briefingCmd_area, cgqc_setting_briefingCmd_area, getDir player, true];
		cgqc_briefingCmd_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		cgqc_briefingCmd_trg setTriggerStatements ["this", _act, _deAct];
		cgqc_briefingCmd_trg setTriggerInterval _int;
	};
	case "briefingCmd_stop":
	{
		// Commanders Briefing done
		cgqc_zeus_briefingCmd = false;
		publicVariable "cgqc_zeus_briefingCmd";
		// Delete briefing marker 
		deleteMarker "cgqcBriefing";
		//Return to default map sharing distance
		jibrm_restrictmarkers_shareDistance = 5; 
		publicVariable "jibrm_restrictmarkers_shareDistance";
		// Delete trigger of silence
		if !(isNil "cgqc_briefingCmd_trg") then {
			deleteVehicle cgqc_briefingCmd_trg;
		};	 
		// Remote reset volumes on everyone
		{['\cgqc\functions\fnc_briefingCmdStop.sqf'] remoteExec ['execVM',vehicle _x];
		} forEach allPlayers;
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
			//Super high sharing distance for briefing.
			jibrm_restrictmarkers_shareDistance = 200;
			publicVariable "jibrm_restrictmarkers_shareDistance";
			// Cone of silence for briefing
			// Act: lowerVolume on units_in. LowerVoice on units_out 
			_act = format ["['\cgqc\functions\fnc_briefingStart.sqf'] remoteExec ['execVM',%1];", player];
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
	};
	case "briefing_stop":
	{
		// Briefing done
		cgqc_zeus_briefing = false;
		publicVariable "cgqc_zeus_briefing";
		// Delete briefing marker 
		deleteMarker "cgqcBriefing";
		//Return to default map sharing distance
		jibrm_restrictmarkers_shareDistance = 5; 
		publicVariable "jibrm_restrictmarkers_shareDistance";
		// Delete trigger of silence
		if !(isNil "cgqc_briefing_trg") then {
			deleteVehicle cgqc_briefing_trg;
		};	 
		// Remote reset volumes on everyone
		{['\cgqc\functions\fnc_briefingStop.sqf'] remoteExec ['execVM',vehicle _x];
		} forEach allPlayers;
	};
	case "delete": {
		{
			deleteVehicle _x
		} forEach allDead;
		hint "Dead deleted";
	};
	case "343":
	{
		player addItemToBackpack "ACRE_PRC343";
		hint "Got: 343";
	};
	case "152":
	{
		player addItemToBackpack "ACRE_PRC152";
		hint "Got: 152";
	};
	case "117":
	{
		player addItemToBackpack "ACRE_PRC117F";
		hint "Got: 117";
	};
	case "crate":
	{
		zeus_crate="cgqc_box_mk2_arsenal" createVehicle (position player);
		cgqc_zeus_crate = true;
	};
	case "del_crate":
	{
		deleteVehicle zeus_crate;
		cgqc_zeus_crate = false;
	};
	case "cargo":
	{
		zeus_cargo="cgqc_box_mk2_cargo" createVehicle (position player);
		cgqc_zeus_cargo = true;
	};
	case "del_cargo":
	{
		deleteVehicle zeus_cargo;
		cgqc_zeus_cargo = false;
	};
	case "animation_on": {
		cgqc_mk2_animation_locked = true; 
		publicVariable "cgqc_mk2_animation_locked";
	};
	case "animation_off": {
		cgqc_mk2_animation_locked = false;
		publicVariable "cgqc_mk2_animation_locked";
	};
	case "animation_setting": {
		publicVariable "cgqc_mk2_animation_locked";
	};
	default
	{
		hint "fnc_perksZeus fucked up";
	};
};