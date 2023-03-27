// --- perksZeus ----------------------------------------------------------
// Perks for the gods

_type = _this select 0;
y_time = _this select 1;

switch (_type) do {
	case "briefing":
	{
		// Briefing started
		cgqc_zeus_briefing = true;
		// Create briefing marker 
		_markerstr = createMarker ["cgqcBriefing", player];
		"cgqcBriefing" setMarkerType "mil_objective"; 
		"cgqcBriefing" setMarkerText "Briefing";
		"cgqcBriefing" setMarkerColor "colorBLUFOR";
		//Timer before briefing start 
		while {y_time > 0 && cgqc_zeus_briefing} do { 
			_min = floor (y_time / 60);
			_sec =  y_time - (_min * 60); 
			_min_sec = format["%1:%2", _min, _sec];
			hintSilent format["Briefing Général dans: \n %1", _min_sec];
			"cgqcBriefing" setMarkerText format["Briefing dans %1", _min_sec];
			y_time = y_time - 1;   
			sleep 1; 
		};
		if(cgqc_zeus_briefing) then {
			//Super high sharing distance for briefing.
			jibrm_restrictmarkers_shareDistance = 200;
			publicVariable "jibrm_restrictmarkers_shareDistance";
			// Cone of silence for briefing
			// Setup trigger
			y_act = "{[] call ace_volume_fnc_lowerVolume; } forEach (allUnits inAreaArray thisTrigger)";
			y_deAct = "{if (vehicle _x == _x) then {[] call ace_volume_fnc_restoreVolume;};} forEach allPlayers";
			_int = 2;
			// Create trigger
			cgqc_briefing_trg = createTrigger ["EmptyDetector",getPos player, true];
			cgqc_briefing_trg setTriggerArea [20, 20, 0, true];
			cgqc_briefing_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
			cgqc_briefing_trg setTriggerStatements ["this", y_act, y_deAct];
			cgqc_briefing_trg setTriggerInterval _int;
			hint "BRIEFING NOW!!!";
			
			// Redo the briefing marker in case zeus moved
			_markerstr = createMarker ["cgqcBriefing", player];
			"cgqcBriefing" setMarkerType "mil_objective"; 
			"cgqcBriefing" setMarkerText "BRIEFING NOW!!!";
			"cgqcBriefing" setMarkerColor "ColorRed";
			sleep 10;
			hintSilent "";
		};
	};
	case "briefing_stop":
	{
		// Briefing done
		cgqc_zeus_briefing = false;
		hint "Briefing stop!";
		// Delete briefing marker 
		deleteMarker "cgqcBriefing";
		//Return to default map sharing distance
		jibrm_restrictmarkers_shareDistance = 5; 
		publicVariable "jibrm_restrictmarkers_shareDistance";
		// Delete cone of silence 
		deleteVehicle cgqc_briefing_trg;
		// Return hearing to everyone on foot in case.
		{if (vehicle _x == _x) then {[] call ace_volume_fnc_restoreVolume;};} forEach allPlayers
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