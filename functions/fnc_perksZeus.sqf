// --- perksZeus ----------------------------------------------------------
// Perks for the gods

_type = _this select 0;
briefing_time = _this select 1;
_targetPlayer = _this select 2;

switch (_type) do {
	case "pause": {
		y_allAIs = allUnits - allPlayers;
		{
			_x enableSimulationGlobal false;
			_x disableAI "all";
		} forEach y_allAIs; 
		hint "All units PAUSED!";
		cgqc_zeus_paused = true;
		publicVariable "cgqc_zeus_paused";
	};
	case "unpause": {
		y_allAIs = allUnits - allPlayers;
		{
			_x enableSimulationGlobal true;
			_x enableAI "all";
		} forEach y_allAIs; 
		hint "All units Unpaused.";
		cgqc_zeus_paused = false;
		publicVariable "cgqc_zeus_paused";
	};
	case "zeus_radios":
	{
		_radios = call acre_api_fnc_getCurrentRadioList;
		sleep 0.5;  
		{player removeItem _x;}forEach _radios;
		sleep 0.5;  
		// Add zeus radios  
		if (player canAdd ["ACRE_PRC117F", 2]) then {   
			// There is enough space, add the items 
			hint "Enough space. Adding radios";  
			player addItem "ACRE_PRC117F";   
			player addItem "ACRE_PRC117F";   
		} else {   
			// There is not enough space   
			hint "Not enough inventory space! Zeus backpack on";  
			_items_pack = backpackItems player;  
			removeBackpack player;  
			player addBackpack "cgqc_pack_mk1_magic_zeus";  
			clearAllItemsFromBackpack player;  
			{player addItemToBackpack _x} forEach _items_pack;  
			player addItem "ACRE_PRC117F";   
			player addItem "ACRE_PRC117F";	
		}; 
		sleep 1;
		y_zeusRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType; 
		waitUntil {sleep 1;!isNil "y_zeusRadios"}; 
		y_packRadio_1 = y_zeusRadios select 0; 
		y_packRadio_2 = y_zeusRadios select 1; 
		waitUntil {sleep 0.5;!isNil "y_packRadio_1"}; 
		_success = [y_packRadio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan 
		waitUntil {sleep 1;!isNil "y_packRadio_2"}; 
		_success = [y_packRadio_2, 9] call acre_api_fnc_setRadioChannel; //Air-Net 
		// Set order
		_success = [ [ y_packRadio_1, y_packRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment; 
		// Set sides  
		_success = [y_packRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial; 
		_success = [y_packRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial; 
		hint parseText "<t> 
		--- Zeus Radios -------------<br/> 
		Radio1:Gauche/117/Spartan/HQ<br/>   
		Radio2:Droite/117/Zeus</t>";
		break;
	};
	case "maprestrict":
	{
		jib_restrictmarkers_enabled = true;
		cgqc_zeus_mapRestricted = true;
		sleep 0.1;
		publicVariable "jib_restrictmarkers_enabled";
		cgqc_zeus_mapRestricted = true;
		hint "Map Sharing is OFF";
		break;
	};
	case "mapshare":
	{
		jib_restrictmarkers_enabled = false;
		cgqc_zeus_mapRestricted = false;
		sleep 0.1;
		publicVariable "jib_restrictmarkers_enabled";
		cgqc_zeus_mapRestricted = false;
		hint "Map Sharing is ON";
		break;
	};
	case "yeet":
	{
		_targetID = owner _targetPlayer;
		[_targetPlayer, [0, 0, 200]] remoteExec ["setVelocity", _targetID];
		["Bon... kessé t'as faite encore?"] remoteExec ["hint", _targetID];
		sleep 5; 
		["Chill. Voici un parachute. Tu vas retrouver ton backpack une fois au sol ;o)"] remoteExec ["hint", _targetID];
		_backpack = backpack _targetPlayer; 
		_items = backpackItems _targetPlayer;
		[_targetPlayer] remoteExec ["removeBackpack", _targetID];
		[_targetPlayer, "B_Parachute"] remoteExec ["addBackpack", _targetID];  
		[]spawn {
			waitUntil {getPosATL _targetPlayer select 2 < 100};  // Wait until the player's altitude is less than 100 meters 
			_targetPlayer action ["OpenParachute", _targetPlayer];  // Open the parachute for the player 
		};
		//Make temporarily invincible
		while {isDamageAllowed player} do
		{
			player allowDamage false;
			sleep 0.5;
		};
		waitUntil{sleep 1;isTouchingGround _targetPlayer}; 
		[_targetPlayer] remoteExec ["removeBackpack", _targetID];
		[_targetPlayer, _backpack] remoteExec ["addBackpack", _targetID];  
		{ 
			[_targetPlayer, _x] remoteExec ["addItem", _targetID];  
		}forEach _items; 
		sleep 1;
		["Ton backpack is back"] remoteExec ["hint", _targetID];
		while {!isDamageAllowed player} do
		{
			player allowDamage true;
			sleep 0.5;
		};
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
		if (cgqc_zeus_mapRestricted) then {
			hint "MapSharing is ON";
			//Remove map sharing restriction for briefing
			jib_restrictmarkers_enabled = false;
			publicVariable "jib_restrictmarkers_enabled";
		};
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
		if (cgqc_zeus_mapRestricted) then {
			hint "MapSharing is OFF";
			//Set mapsharing back if needed
			jib_restrictmarkers_enabled = true;
			publicVariable "jib_restrictmarkers_enabled";
		};
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
			if (cgqc_zeus_mapRestricted) then {
				hint "MapSharing is ON";
				//Remove map sharing restriction for briefing
				jib_restrictmarkers_enabled = false;
				publicVariable "jib_restrictmarkers_enabled";
			};
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
		if (cgqc_zeus_mapRestricted) then {
			hint "MapSharing is OFF";
			//Set mapsharing back if needed
			jib_restrictmarkers_enabled = true;
			publicVariable "jib_restrictmarkers_enabled";
		};
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
		break;
	};
	case "del_crate":
	{
		deleteVehicle zeus_crate;
		cgqc_zeus_crate = false;
		hint "Arsenal deleted";		
		break;
	};
	case "cargo":
	{
		zeus_cargo="cgqc_box_mk2_cargo" createVehicle (position player);
		cgqc_zeus_cargo = true;
		hint "Mk3 Cargo";		
		break;
	};
	case "del_cargo":
	{
		deleteVehicle zeus_cargo;
		cgqc_zeus_cargo = false;
		hint "Cargo deleted";		
		break;
	};
	case "animation_on": {
		cgqc_mk2_animation_locked = true; 
		publicVariable "cgqc_mk2_animation_locked";
		hint "Animations LOCKED";		
		break;
	};
	case "animation_off": {
		cgqc_mk2_animation_locked = false;
		publicVariable "cgqc_mk2_animation_locked";
		hint "Animations UNLOCKED";
		break;
	};
	case "punch_on": {
		BRIDGE_KPU_MasterSetting = true; 
		publicVariable "BRIDGE_KPU_MasterSetting";
		hint "Punching Unlocked";
		break;
	};
	case "punch_off": {
		BRIDGE_KPU_MasterSetting = false;
		publicVariable "BRIDGE_KPU_MasterSetting";
		hint "Punching Locked";
		break;
	};
	case "animation_setting": {
		publicVariable "cgqc_mk2_animation_locked";
		break;
	};
	case "tp": {
		player setDir getDir _targetPlayer; 
  		player setPos (getPos _targetPlayer vectorAdd [2, 0, 0]);
		hint "Teleported";
		break;
	};
	case "blackout": {
		cgqc_blackout_player_on = true;
		[_targetPlayer, true] remoteExec ["setUnconscious", owner _targetPlayer];
	};
	case "wakeup":
	{
		cgqc_blackout_player_on = false;
		[_targetPlayer, false] remoteExec ["setUnconscious", owner _targetPlayer];
	};
	case "attach":{
		zeus_oldPos = getPos player;
		// Read to rock to hide the slinged helmet if there
		["ready", true] spawn CGQC_fnc_perksBasic;
		player hideObjectGlobal true;
		cgqc_zeus_ghost = true;
		while {isDamageAllowed player} do
		{
			player allowDamage false;
			sleep 0.5;
		};
		cgqc_zeus_god = true;
		player attachTo [_targetPlayer, [0,-5,1]];
		cgqc_zeus_attached = true;
		hint "Attached";
		break;
	};
	case "detach":{
		detach Player;
		player setPos zeus_oldPos;
		player hideObjectGlobal false;
		cgqc_zeus_ghost = false;
		cgqc_zeus_attached = false;
		hint "Detached and back to position";
		break;
	};
	case "god": {
		while {isDamageAllowed player} do
		{
			[-2,{player allowDamage false}] call CBA_fnc_globalExecute;
			sleep 0.5;
		};
		cgqc_zeus_god = true;
		hint "God mode";
		break;
	};
	case "mortal": {
		while {!isDamageAllowed player} do
		{
			[-2,{player allowDamage true}] call CBA_fnc_globalExecute;
			sleep 0.5;
		};
		cgqc_zeus_god = false;
		hint "Mortal mode";
		break;
	};
	case "ghost": {
		// Read to rock to hide the slinged helmet if there
		["ready", true] spawn CGQC_fnc_perksBasic;
		[0,{player hideObjectGlobal true}] call CBA_fnc_globalExecute;
		hint "Ghost mode";
		cgqc_zeus_ghost = true;
		break;
	};
	case "visible": {
		[0,{player hideObjectGlobal false}] call CBA_fnc_globalExecute;
		hint "Visible mode";
		cgqc_zeus_ghost = false;
		break;
	};
	default
	{
		hint "fnc_perksZeus fucked up";
	};
};
sleep 5;
hintSilent "";