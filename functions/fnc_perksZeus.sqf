#include "\CGQC\script_component.hpp"
// --- perksZeus ----------------------------------------------------------
// Perks for the gods
params ["_type", "_briefing_time", ["_targetPlayer", player]];

switch (_type) do {
	case "zeus":{
		if !([player] call CGQC_fnc_checkZeus) then {
			missionNamespace setVariable ["dedmen", player, true];
			[0, {
				if (!isNil "DedmensCur") then {
					//call compile format["[-1, {if (player == dedmen) then {dedmen sideChat ""deleting Curator"";}}] call CBA_fnc_globalExecute;"];
					deleteVehicle DedmensCur;
					missionNamespace setVariable ["DedmensCur", nil, true];
					hint "No mo Zeus";
				};

				if (isNil "DedmensCur") then {
					//call compile format["[-1, {if (player == dedmen) then {dedmen sideChat ""creating Curator"";}}] call CBA_fnc_globalExecute;"];
					if (isNil "DedmensCur_group") then {DedmensCur_group = createGroup sideLogic;};
					DedmensCur = DedmensCur_group createUnit ["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"];
					DedmensCur setVariable ["showNotification",false];

					publicVariable "DedmensCur";
					publicVariable "DedmensCur_group";
					unassignCurator DedmensCur;
					_cfg = (configFile >> "CfgPatches");
					_newAddons = [];
					for "_i" from 0 to((count _cfg) - 1) do {
						_name = configName(_cfg select _i);
						_newAddons pushBack _name;
					};
					if (count _newAddons > 0) then {DedmensCur addCuratorAddons _newAddons};

					DedmensCur setCuratorCoef ["Place", 0];
					DedmensCur setCuratorCoef ["Delete", 0];
				};
				unassignCurator DedmensCur;
				sleep 0.4;
				dedmen assignCurator DedmensCur;
				hint "Now Zeus";
				//call compile format["[-1, {if (player == dedmen) then {dedmen sideChat ""you are Curator"";}}] call CBA_fnc_globalExecute;"];
			}] call CBA_fnc_globalExecute;
		};
	};
	case "check_mods": {
		//Find all valid player except current
		_players = [] call CGQC_int_allHumanPlayers;
		// Initial values
		_version = "--- Versions des mods --- <br/>";
		_ref_version_core = missionNamespace getVariable ["cgqc_version_server_core", "ERROR"];
		_ref_version_addons = player getVariable ["cgqc_version_addons", "ERROR"];
		_ref_version_2023 = "";
		if (cgqc_player_has2023) then {
			_ref_version_2023 = player getVariable "cgqc_version_2023";
		};
		_refVersion_txt = "----- Server Versions -----<br/>";
		{
			_name = name _x;
			_version_core = _x getVariable ["cgqc_version_core", "ERROR"];
			_version_addons = _x getVariable ["cgqc_version_addons", "ERROR"];
			if (isNil "_version_core") then {_version_core = 0};
			if (isNil "_version_addons") then {_version_addons = 0};
			if !(_version_core isEqualTo _ref_version_core) then { // Bad core version
				_version_core = format["<t color='#ff0000'>%1</t>", _version_core];
				_name = format["<t color='#ff0000'>%1</t>",_name];
			};
			if !(_version_addons isEqualTo _ref_version_addons) then { // Bad addons version
				_version_addons = format["<t color='#ff0000'>%1</t>", _version_addons];
				_name = format["<t color='#ff0000'>%1</t>",_name];
			};
			if (cgqc_player_has2023) then {
				_version_2023 = player getVariable "cgqc_version_2023";
				if (isNil "_version_2023") then {_version_2023 = 0};
				if !(_version_2023 isEqualTo _ref_version_2023) then { // Bad addons version
					_version_2023 = format["<t color='#ff0000'>%1</t>", _version_2023];
					_name = format["<t color='#ff0000'>%1</t>",_name];
				};
				_version = _version + format ["%1 -%2 -%3 -%4<br/>", _name, _version_core, _version_addons, _version_2023]
			}else{
				_version = _version + format ["%1 - Core: %2 - Addons: %3 <br/>", _name, _version_core, _version_addons]
			};

		}forEach _players;
		// Turn player versions green for clarity
		_ref_version_addons = format["<t color='#00ff00'>%1</t>", _ref_version_addons];
		_ref_version_core = format["<t color='#00ff00'>%1</t>", _ref_version_core];
		if (cgqc_player_has2023) then {
			_ref_version_2023 = format["<t color='#00ff00'>%1</t>", _ref_version_2023];
			_refVersion_txt = _refVersion_txt + format ["-Core:%1 Addons:%2 2023:%3-<br/>", _ref_version_core, _ref_version_addons, _ref_version_2023];
		}else{
			_refVersion_txt = _refVersion_txt + format ["-Core:%1 Addons:%2-<br/>", _ref_version_core, _ref_version_addons];
		};

		_version = _refVersion_txt + _version;
		hint parseText format ["%1",_version];
		sleep 20;

	};
	case "pause": {
		_allAIs = [] call CGQC_int_allAIUnits;
		{
			_x enableSimulationGlobal false;
			_x disableAI "all";
		} forEach _allAIs;
		[-1,{hint "All AI units PAUSED!"}] call CBA_fnc_globalExecute;
		missionNamespace setVariable ["CGQC_gamestate_mission_AIpaused", true, true];
	};
	case "unpause": {
		_allAIs = [] call CGQC_int_allAIUnits;
		{
			_x enableSimulationGlobal true;
			_x enableAI "all";
		} forEach _allAIs;
		[-1,{hint "All AI units UNPAUSED!"}] call CBA_fnc_globalExecute;
		missionNamespace setVariable ["CGQC_gamestate_mission_AIpaused", false, true]
	};
	case "zeus_radios":
	{
		// Only add radios if they are needed
		[_targetPlayer, "all"] call CGQC_fnc_removeRadios;
		// Add 343
		_targetPlayer addItem "ACRE_PRC343";
		// Add zeus radios
		_targetPlayer addItemCargo ["ACRE_PRC152", 2];
		waitUntil {sleep 0.1;count (call acre_api_fnc_getCurrentRadioList) > 0};
		y_zeusRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
		waitUntil {sleep 0.1;!isNil "y_zeusRadios"};
		y_packRadio_1 = y_zeusRadios select 0;
		y_packRadio_2 = y_zeusRadios select 1;
		waitUntil {sleep 0.1;!isNil "y_packRadio_1"};
		_success = [y_packRadio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan
		waitUntil {sleep 0.1;!isNil "y_packRadio_2"};
		_success = [y_packRadio_2, 9] call acre_api_fnc_setRadioChannel; //Zeus net
		// Set order
		_success = [ [_personalRadio, y_packRadio_1, y_packRadio_2] ] call acre_api_fnc_setMultiPushToTalkAssignment;
		// Set sides
		_success = [_personalRadio, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		_success = [y_packRadio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		_success = [y_packRadio_2, "BOTH" ] call acre_api_fnc_setRadioSpatial;
	};
	case "maprestrict":
	{
		jib_restrictmarkers_enabled = true;
		cgqc_zeus_mapRestricted = true;
		sleep 0.1;
		publicVariable "jib_restrictmarkers_enabled";
		cgqc_zeus_mapRestricted = true;
		hint "Map Sharing is OFF";
	};
	case "mapshare":
	{
		jib_restrictmarkers_enabled = false;
		cgqc_zeus_mapRestricted = false;
		sleep 0.1;
		publicVariable "jib_restrictmarkers_enabled";
		publicVariable "cgqc_zeus_mapRestricted";
		hint "Map Sharing is ON";
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

	};
	case "briefingCmd":
	{
		// Command briefing started
		missionNamespace setVariable ["CGQC_gamestate_1_briefing", true, true];
		missionNamespace setVariable ["CGQC_gamestate_1_briefing_leaders", true, true];
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

	};
	case "briefingCmd_stop":
	{
		// Commanders Briefing done
		missionNamespace setVariable ["CGQC_gamestate_1_briefing", false, true];
		missionNamespace setVariable ["CGQC_gamestate_1_briefing_leaders", false, true];
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
		} forEach [] call CGQC_int_allHumanPlayers;

	};
	case "briefing":
	{
		// Briefing started
		missionNamespace setVariable ["CGQC_gamestate_1_briefing", true, true];
		missionNamespace setVariable ["CGQC_gamestate_1_briefing_full", true, true];

		// Create briefing marker
		_markerstr = createMarker ["cgqcBriefing", player];
		"cgqcBriefing" setMarkerType "mil_objective";
		"cgqcBriefing" setMarkerText "Briefing";
		"cgqcBriefing" setMarkerColor "colorBLUFOR";
		//Timer before briefing start
		while {_briefing_time > 0 && missionNamespace getVariable "CGQC_gamestate_1_briefing_full"} do {
			_min = floor (_briefing_time / 60);
			_sec =  _briefing_time - (_min * 60);
			_min_sec = format["%1:%2", _min, _sec];
			_msg = format["General Briefing in: \n %1", _min_sec];
			[_msg] remoteExec ["hintSilent"];
			"cgqcBriefing" setMarkerText format["General Briefing in %1", _min_sec];
			_briefing_time = _briefing_time - 1;
			sleep 1;
		};
		if(missionNamespace getVariable "CGQC_gamestate_1_briefing_full") then {
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

	};
	case "briefing_stop":
	{
		// Briefing done
		missionNamespace setVariable ["CGQC_gamestate_1_briefing", false, true];
		missionNamespace setVariable ["CGQC_gamestate_1_briefing_full", false, true];

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
		} forEach [] call CGQC_int_allHumanPlayers;

	};
	case "delete": {
		{
			deleteVehicle _x
		} forEach allDead;
		hint "Dead deleted";

	};
	case "343":
	{
		player addItem "ACRE_PRC343";
		hint "Got: 343";

	};
	case "152":
	{
		player addItem "ACRE_PRC152";
		hint "Got: 152";

	};
	case "117":
	{
		player addItem "ACRE_PRC117F";
		hint "Got: 117";

	};
	case "crate":
	{
		_pos_free = getPosATL player findEmptyPosition [1,20,"cgqc_box_mk2_arsenal"];
		zeus_crate = "cgqc_box_mk2_arsenal" createVehicle _pos_free;
		cgqc_zeus_crate = true;
		hint "Mk3 arsenal";

	};
	case "del_crate":
	{
		deleteVehicle zeus_crate;
		cgqc_zeus_crate = false;
		hint "Arsenal deleted";

	};
	case "cargo":
	{
		zeus_cargo="cgqc_box_mk2_cargo" createVehicle (position player);
		cgqc_zeus_cargo = true;
		hint "Mk3 Cargo";

	};
	case "del_cargo":
	{
		deleteVehicle zeus_cargo;
		cgqc_zeus_cargo = false;
		hint "Cargo deleted";

	};
	case "animation_on": {
		cgqc_mk2_animation_locked = true;
		publicVariable "cgqc_mk2_animation_locked";
		hint "Animations LOCKED";

	};
	case "animation_off": {
		cgqc_mk2_animation_locked = false;
		publicVariable "cgqc_mk2_animation_locked";
		hint "Animations UNLOCKED";

	};
	case "punch_on": {
		BRIDGE_KPU_MasterSetting = true;
		publicVariable "BRIDGE_KPU_MasterSetting";
		hint "Punching Unlocked";

	};
	case "punch_off": {
		BRIDGE_KPU_MasterSetting = false;
		publicVariable "BRIDGE_KPU_MasterSetting";
		hint "Punching Locked";

	};
	case "animation_setting": {
		publicVariable "cgqc_mk2_animation_locked";

	};
	case "tp": {
		player setDir getDir _targetPlayer;
  		player setPos (getPos _targetPlayer vectorAdd [2, 0, 0]);
		hint "Teleported";

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

	};
	case "detach":{
		detach Player;
		player setPos zeus_oldPos;
		player hideObjectGlobal false;
		cgqc_zeus_ghost = false;
		cgqc_zeus_attached = false;
		hint "Detached and back to position";

	};
	case "god": {
		while {isDamageAllowed player} do
		{
			[0,{player allowDamage false}] call CBA_fnc_globalExecute;
			sleep 0.5;
		};
		cgqc_zeus_god = true;
		hint "God mode";

	};
	case "mortal": {
		while {!isDamageAllowed player} do
		{
			[0,{player allowDamage true}] call CBA_fnc_globalExecute;
			sleep 0.5;
		};
		cgqc_zeus_god = false;
		hint "Mortal mode";

	};
	case "ghost": {
		// Read to rock to hide the slinged helmet if there
		["ready", true] spawn CGQC_fnc_perksBasic;
		[0,{player hideObjectGlobal true}] call CBA_fnc_globalExecute;
		hint "Ghost mode";
		cgqc_zeus_ghost = true;

	};
	case "visible": {
		[0,{player hideObjectGlobal false}] call CBA_fnc_globalExecute;
		hint "Visible mode";
		cgqc_zeus_ghost = false;

	};
	default
	{
		hint "fnc_perksZeus fucked up";
	};
};
sleep 5;
hintSilent "";