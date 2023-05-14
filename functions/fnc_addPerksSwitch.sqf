// --- addPerksSwitch ----------------------------------------------------------
// Event that adds perks when player uses unit the first time 

["ace_interact_menu_newControllableObject", {
    params ["_object", "_type"]; // string of the object's classname
    if (!(_type isKindOf "CAManBase")) exitWith {}; // All humans
	// Zeus ---------------------------------------------------------------------------------------------------------------
	_action = [ "menu_self_zeus", "Zeus", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToClass;

	// Briefing mode
	_action = [ "zeus_briefing", "Briefing", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// Commanders briefing
	_action = [ "zeus_briefingCmd_start", "Start Commanders:Briefing", "", {["briefingCmd", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// Commanders done 
	_action = [ "zeus_briefingCmd_stop", "Stop Briefing", "", {["briefingCmd_stop", 0] spawn CGQC_fnc_perksZeus}, {[player] call CGQC_fnc_checkZeus && cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// General briefing
	_action = [ "zeus_briefing_start", "Start Gen:Briefing", "", {["briefing", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToClass;
	_action = [ "zeus_briefing_start_2", "Start Briefing dans 2mins", "", {["briefing", 120] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToClass;
	_action = [ "zeus_briefing_start_5", "Start Briefing dans 5mins", "", {["briefing", 300] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_briefing && !cgqc_zeus_briefingCmd} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// Briefing done
	_action = [ "zeus_briefing_stop", "Stop Briefing", "", {["briefing_stop", 0] spawn CGQC_fnc_perksZeus}, {[player] call CGQC_fnc_checkZeus && cgqc_zeus_briefing} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// Map Sharing Restriction
	_action = [ "zeus_mapSharing_on", "MapSharing Restriction: Turn on", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_mapRestricted} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToClass;
	_action = [ "zeus_mapSharing_off", "MapSharing Restriction: Turn off", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_mapRestricted} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// ------ GRAD Persistence 
	_action = [ "zeus_grad_persistence", "Persistence", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToClass;
	_action = [ "zeus_grad_save", "Save Mission", "", { [true, 10] remoteExec ["grad_persistence_fnc_saveMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToClass;
	_action = [ "zeus_grad_load", "Load Mission", "", {[] remoteExec ["grad_persistence_fnc_loadMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToClass;
	_action = [ "zeus_grad_load_players", "LoadPlayers", "", {[] remoteExec ["grad_persistence_fnc_loadAllPlayers",2,false];}, {true}] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToClass;
	_action = [ "zeus_grad_clear", "Clear Data", "", {_x remoteExec ["grad_persistence_fnc_clearMissionData", 2]}, {true}] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// ------- Utils ----------------
	_action = [ "menu_self_utils", "Utils", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call  ace_interact_menu_fnc_addActionToClass;
	// ------ Animation on/off 
	_action = [ "zeus_anim_on", "Animations: Lock", "", {["animation_on"] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;
	_action = [ "zeus_anim_off", "Animations: Unlock", "", {["animation_off"] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// ------ Punch on/off 
	//_action = [ "zeus_punch_on", "Punching: Lock", "", {["punch_on"] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_punch_locked} ] call ace_interact_menu_fnc_createAction;
	//_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;
	//_action = [ "zeus_punch_off", "Punching: Unlock", "", {["punch_off"] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_punch_locked }] call ace_interact_menu_fnc_createAction;
	//_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// ------ Delete all dead
	_action = [ "zeus_delete", "Delete Dead", "", {["delete"] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// ------ Get 343
	_action = [ "max_343", "get 343", "", {["343"] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;		
	// ------ Get 152
	_action = [ "max_152", "get 152", "", {["152"] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// ------ Get 117
	_action = [ "max_117", "get 117f", "", {["117"] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;		
	// ------ Get Crate
	_action = [ "zeus_getcrate", "Spawn: Arsenal mk3", "", {["crate"] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToClass;	
	//  ------ Delete Crate 
	_action = [ "zeus_delcrate", "Delete Arsenal", "", {["del_crate"] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToClass;
	// ------ Get Cargo
	_action = [ "zeus_getcargo", "get Cargo", "", {["cargo"] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;	
	//  ------ Delete Cargo 
	_action = [ "zeus_delcargo", "delete Cargo", "", {["del_cargo"] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _type, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToClass;	
}] call CBA_fnc_addEventHandler;