// --- addPerksSwitch ----------------------------------------------------------
// Event that adds perks when player uses unit the first time 
["ace_interact_menu_newControllableObject", {
    params ["_type"]; // string of the object's classname
    if (!(_type isKindOf "CAManBase")) exitWith {}; // All humans
	[_type] spawn {
		params ["_type"];
		hint "Unit compatible, Zeus perks";
		// Add Zeus radios 
		/*
		{
			_unit = _x;
			if (typeOf _unit == _type) then {
				["zeus_radios", 0, _unit] spawn CGQC_fnc_perksZeus;
			}
		} forEach allUnits;
		*/
		// If killed: remove zeus radios ?

		// Zeus ===================================================================================================
		_action = [ "menu_self_zeus", "Zeus", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToCLass;

		// ------ Pause AI
		_action = [ "zeus_pause", "Pause AI", "", {[0,{["pause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute}, {!cgqc_zeus_paused} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_unpause", "Unpause AI", "", {[0,{["unpause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {cgqc_zeus_paused} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;

		// ------ Invincible
		_action = [ "zeus_invincible", "God Mode", "", {["god", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_god} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_mortal", "God Mode->Off", "", {["mortal", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_god} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;

		// ------ Invisible
		_action = [ "zeus_invisible", "Turn Invisible", "", {["ghost", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_ghost} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_visible", "Invisible->Off", "", {["visible", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_ghost} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;

		// Briefing mode
		_action = [ "zeus_briefing", "Briefing", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// Commanders briefing
		_action = [ "zeus_briefingCmd_start", "Start Mini Briefing", "", {["briefingCmd", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// Commanders done 
		_action = [ "zeus_briefingCmd_stop", "Stop Briefing", "", {["briefingCmd_stop", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// General briefing
		_action = [ "zeus_briefing_start", "Start Full Briefing", "", {["briefing", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_briefing_start_2", "Start Briefing dans 2mins", "", {["briefing", 120] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_briefing_start_5", "Start Briefing dans 5mins", "", {["briefing", 300] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// Briefing done
		_action = [ "zeus_briefing_stop", "Stop Briefing", "", {["briefing_stop", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_briefing} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToCLass;

		// Options
		_action = [ "zeus_options", "Options", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// Map Sharing Restriction
		_action = [ "zeus_mapSharing_on", "MapSharing: Turn off", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_mapSharing_off", "MapSharing: Turn on", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// ------ Animation on/off 
		_action = [ "zeus_anim_on", "Animations: Turn off", "", {["animation_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_anim_off", "Animations: Turn on", "", {["animation_off", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// ------ Punching on/off 
		_action = [ "zeus_punch_on", "Punching: Turn On", "", {["punch_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!BRIDGE_KPU_MasterSetting} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_punch_off", "Punching: Turn Off", "", {["punch_off", 0, ""] spawn CGQC_fnc_perksZeus}, {BRIDGE_KPU_MasterSetting }] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToCLass;


		// ------ GRAD Persistence 
		_action = [ "zeus_grad_persistence", "Persistence", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_grad_save", "Save Mission", "", { [true, 10] remoteExec ["grad_persistence_fnc_saveMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_grad_load", "Load Mission", "", {[] remoteExec ["grad_persistence_fnc_loadMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_grad_load_players", "LoadPlayers", "", {[] remoteExec ["grad_persistence_fnc_loadAllPlayers",2,false];}, {true}] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		_action = [ "zeus_grad_clear", "Clear Data", "", {_x remoteExec ["grad_persistence_fnc_clearMissionData", 2]}, {true}] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToCLass;

		// ------- Utils ----------------
		_action = [ "menu_self_utils", "Utilities", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call  ace_interact_menu_fnc_addActionToCLass;
		// ------ Delete all dead
		_action = [ "zeus_delete", "Delete Dead", "", {["delete", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// ------ Get 343
		_action = [ "max_343", "get 343", "", {["343", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToCLass;		
		// ------ Get 152
		_action = [ "max_152", "get 152", "", {["152", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// ------ Get 152
		_action = [ "max_117", "get 117f", "", {["117", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToCLass;		
		// ------ Get Crate
		_action = [ "zeus_getcrate", "Spawn: Arsenal mk3", "", {["crate", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToCLass;	
		//  ------ Delete Crate 
		_action = [ "zeus_delcrate", "Delete Arsenal", "", {["del_crate", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToCLass;
		// ------ Get Cargo
		_action = [ "zeus_getcargo", "get Cargo", "", {["cargo", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToCLass;	
		//  ------ Delete Cargo 
		_action = [ "zeus_delcargo", "delete Cargo", "", {["del_cargo", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToCLass;	
		// ------ Export Loadout  
		_action = [ "zeus_export", "Loadout to Clipboard", "", {[] execVM "\cgqc\functions\fnc_getLoadout.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToCLass;
	};
}] call CBA_fnc_addEventHandler;




