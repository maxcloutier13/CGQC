#include "\CGQC\script_component.hpp"
// --- addPerksSpecial ----------------------------------------------------------
// Add special perks depending on role
params [["_type", "clear"]];
LOG_1("[addPerksSpecial] %1 started", _type);

switch (_type) do {
    case "clear": {
        LOG("[addPerksSpecial]  Clearing perks");
        // Remove all special perks
        {[player,0,[_x]] call ace_interact_menu_fnc_removeActionFromObject;} forEach cgqc_perks_action_list;
        // Remove the possible events
        if !(isNil "cgqc_player_fired") then {
            player removeEventHandler ["Fired", cgqc_player_fired];
        };
    };
    case "heli": {
        LOG("[addPerksSpecial]  Adding Pilot perks");
        // ------ Heli pilot --------------------------------------------------------------------------------------
        _action = [ "cgqc_perk_heli_getCrew", "Spawn Crew", "CGQC\textures\cgqc_ace_heli.paa", {
            ["getCrew"] spawn CGQC_fnc_perksPilot
        }, {
            !cgqc_perks_pilot_hasCrew &&
            (vehicle player isKindOf "Helicopter")
        } ] call ace_interact_menu_fnc_createAction;
        // get crew
        cgqc_action_getCrew = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_getCrew;
        _action = [ "cgqc_perk_heli_delCrew", "Delete Crew", "", {
            ["delCrew"] spawn CGQC_fnc_perksPilot
        }, { cgqc_perks_pilot_hasCrew
        } ] call ace_interact_menu_fnc_createAction;
        // Delete crew
        cgqc_action_delCrew = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
        // Add to perk list
        cgqc_perks_action_list pushBack cgqc_action_delCrew;
    };
    case "driver": {
        LOG("[addPerksSpecial]  Adding Driver perks");
        // ------ Tank driver --------------------------------------------------------------------------------------
        _action = [ "cgqc_perk_driver_getDriver", "Spawn Driver", "", {
            ["getDriver"] spawn CGQC_fnc_perksPilot
        }, {
            !cgqc_perks_driver_hasDriver &&
            (vehicle player isKindOf "LandVehicle")
        } ] call ace_interact_menu_fnc_createAction;
        cgqc_action_getDriver = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_getDriver;
        _action = [ "cgqc_perk_driver_delDriver", "Delete Driver", "", {
            ["delDriver"] spawn CGQC_fnc_perksPilot
        }, { cgqc_perks_driver_hasDriver
        } ] call ace_interact_menu_fnc_createAction;
        cgqc_action_delDriver = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
        // Add to perk list
        cgqc_perks_action_list pushBack cgqc_action_delDriver;
    };
    case "sniper":{
        // Event when firing for the spotter to see the hits
        /*
        if !(isNil "cgqc_player_fired") then {
            player removeEventHandler ["Fired", cgqc_player_fired];
        };
        cgqc_player_fired = player addEventHandler ["Fired", {
            params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
                cgqc_player_hit = _projectile addEventHandler ["HitPart", {
                    params ["_projectile", "_hitEntity", "_projectileOwner", "_pos", "_velocity", "_normal", "_components", "_radius" ,"_surfaceType", "_instigator"];
                    {
                        ["cgqc_event_showHitToSpotter", [_pos], _x] call CBA_fnc_targetEvent;
                    } forEach cgqc_sniping_spotters;
                }];
        }];
        // Setup player to be a spotter
        _spot = missionNamespace getVariable 'cgqc_sniping_spotters';
        _spot pushBack player;
        missionNamespace setVariable ['cgqc_sniping_spotters', _spot, true];
        */
        // Find map latitude
        _action = [ "cgqc_perk_latitude", "Find map latitude", "", {
            _latTxt = format ["%1", ace_common_maplatitude];
            [["Map Latitude", 1.5, [0.161,0.502,0.725,1]], [_latTxt, 1.5], false] call CBA_fnc_notify;
        }, {true} ] call ace_interact_menu_fnc_createAction;
        cgqc_action_lat = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_lat;

        ["recon"] call CGQC_fnc_addPerksSpecial;
    };
    case "recon": {
        LOG("[addPerksSpecial]  Adding Recon perks");

        // ------ Ghillie up --------------------------------------------------------------------------------------
        _action = [ "cgqc_perk_ghillie", " Ghillie up", "cgqc\textures\cgqc_ace_ghillie", {}, { !cgqc_perks_ghillie_isOn
        } ] call ace_interact_menu_fnc_createAction;
        cgqc_action_ghillie = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_ghillie;

        // All types
        _action = [ "cgqc_perk_ghillie_arid", "Arid", "", {
            _ct = ["arid"] spawn CGQC_fnc_perksRecon
        }, {!cgqc_perks_ghillie_isOn
        } ] call ace_interact_menu_fnc_createAction;
        cgqc_action_ghillie_arid = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_ghillie_arid;

        _action = [ "cgqc_perk_ghillie_sarid", "Semi-Arid", "", {
            _ct = ["sarid"] spawn CGQC_fnc_perksRecon
        }, { !cgqc_perks_ghillie_isOn
        } ] call ace_interact_menu_fnc_createAction;
        cgqc_action_ghillie_sarid = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_ghillie_sarid;

        _action = [ "cgqc_perk_ghillie_lush", "Lush", "", {
            _ct = ["lush"] spawn CGQC_fnc_perksRecon
        }, {!cgqc_perks_ghillie_isOn
        } ] call ace_interact_menu_fnc_createAction;
        cgqc_action_ghillie_lush = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_ghillie_lush;

        _action = [ "cgqc_perk_ghillie_jungle", "Jungle", "", {
            _ct = ["jungle"] spawn CGQC_fnc_perksRecon
        }, { !cgqc_perks_ghillie_isOn
        } ] call ace_interact_menu_fnc_createAction;
        cgqc_action_ghillie_jungle = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_ghillie_jungle;

        // uniform
        _action = [ "cgqc_perk_ghillie_uniform", "Ghillie-> Uniforme", "", {
            _ct = ["uniform"] spawn CGQC_fnc_perksRecon
        }, {cgqc_perks_ghillie_isOn
        } ] call ace_interact_menu_fnc_createAction;
        cgqc_action_ghillie_uniform = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
        cgqc_perks_action_list pushBack cgqc_action_ghillie_uniform;

    };
    case "zeus": {
        LOG("[addPerksSpecial]  Adding Zeus perks");
        if (isNil "cgqc_menu_self_zeus") then {
            // Zeus perks ===================================================================================================
            _action = [ "menu_self_zeus", "Zeus", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
            cgqc_menu_self_zeus = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

            // Training
            _action = [ "zeus_gamestate_training", "Phase-> Training", "", {true}, {missionNamespace getVariable "CGQC_gamestate_X_training"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Staging
            _action = [ "zeus_gamestate_staging", "Phase-> Staging", "", {true}, {missionNamespace getVariable "CGQC_gamestate_1_staging"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Briefing mode
            _action = [ "zeus_briefing", "Briefing", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate_staging"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // Commanders briefing
            _action = [ "zeus_briefingCmd_start", "Start Leaders Briefing", "", {["briefingCmd", 0] spawn CGQC_fnc_perksZeus}, {!(missionNamespace getVariable "CGQC_gamestate_1_briefing")} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate_staging", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // Commanders done
            _action = [ "zeus_briefingCmd_stop", "Stop Leader's Briefing", "", {["briefingCmd_stop", 0] spawn CGQC_fnc_perksZeus}, { missionNamespace getVariable "CGQC_gamestate_1_briefing_leaders" } ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // General briefing
            _action = [ "zeus_briefing_start", "Start Full Briefing", "", {["briefing", 0] spawn CGQC_fnc_perksZeus}, {!(missionNamespace getVariable "CGQC_gamestate_1_briefing")} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate_staging", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_briefing_start_2", "Start Full Briefing dans 2mins", "", {["briefing", 120] spawn CGQC_fnc_perksZeus}, {!(missionNamespace getVariable "CGQC_gamestate_1_briefing")} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate_staging", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_briefing_start_5", "Start Full Briefing dans 5mins", "", {["briefing", 300] spawn CGQC_fnc_perksZeus}, {!(missionNamespace getVariable "CGQC_gamestate_1_briefing")} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate_staging", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // Briefing done
            _action = [ "zeus_briefing_stop", "Stop Briefing", "", {["briefing_stop", 0] spawn CGQC_fnc_perksZeus}, {missionNamespace getVariable "CGQC_gamestate_1_briefing_full"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Start the game
            _action = [ "zeus_gamestate_start", "Start Mission", "", {cgqc_outdoor_range_hide = true; publicVariable "cgqc_outdoor_range_hide";["start"] spawn CGQC_fnc_gamestate;}, {missionNamespace getVariable ["CGQC_gamestate_1_staging", false]} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate_staging"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Mission
            _action = [ "zeus_gamestate_mission", "Phase-> Mission", "", {""}, {missionNamespace getVariable "CGQC_gamestate_2_mission_start";} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Show mission name
            _action = [ "zeus_gamestate_showName", "Show mission name", "", {["show"] spawn CGQC_fnc_gamestate;}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate_mission"], _action ] call ace_interact_menu_fnc_addActionToObject;


            // End mission
            _action = [ "zeus_gamestate_start", "End Mission", "", {["end"] spawn CGQC_fnc_gamestate;}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate_mission"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // End Mission
            _action = [ "zeus_gamestate_end", "Phase-> Post Mission", "", {""}, {missionNamespace getVariable "CGQC_gamestate_3_mission_stop";} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // ------ Pause AI
            _action = [ "zeus_pause", "Pause AI", "", {[0,{["pause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {!(missionNamespace getVariable ["CGQC_gamestate_mission_AIpaused", false])} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_unpause", "Unpause AI", "", {[0,{["unpause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {missionNamespace getVariable ["CGQC_gamestate_mission_AIpaused", false]} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_pause"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // ------ Manual snapshot
            _action = [ "zeus_snapshot_save", "Save All Player snapshots", "", {[player, "save", "all", "zeus"] spawn CGQC_fnc_snapshot}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_snapshot_load", "Load All player Snapshots", "", {[player, "load", "all", "zeus"] spawn CGQC_fnc_snapshot}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_zeus_done", false];} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_snapshot_save"], _action ] call ace_interact_menu_fnc_addActionToObject;


            // Other stuff



            // Players stuff
            //_action = [ "zeus_players", "Players", "", {""}, {count [] call CGQC_int_allHumanPlayers > 1} ] call ace_interact_menu_fnc_createAction;
            //_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Yeet
            //#include "\cgqc\functions\cfg_yeetPlayer.hpp"

            // Teleport to player
            //#include "\cgqc\functions\cfg_teleportPlayer.hpp"

            // AttachTo player
            //#include "\cgqc\functions\cfg_attachPlayer.hpp"

            // Blackout player
            //#include "\cgqc\functions\cfg_blackoutPlayer.hpp"

            // Wakeup player
            //_action = [ "zeus_wakeup", "Wakeup player", "", {["wakeup", 0] spawn CGQC_fnc_perksZeus}, {cgqc_blackout_player_on} ] call ace_interact_menu_fnc_createAction;
            //_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Detach from player
            //_action = [ "zeus_detach", "Detach from player", "", {["detach", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_attached} ] call ace_interact_menu_fnc_createAction;
            //_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Fixes
            _action = [ "zeus_fixes", "Fixes", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Dynamic group
            _action = [ "zeus_fixes_group", "Activate Dynamic Groups for all", "", {[-1, {["group", false] spawn CGQC_fnc_perksBasic;}] call CBA_fnc_globalExecute;}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_fixes_self", "Activate Dynamic Groups for Zeus", "", {["group", false] spawn CGQC_fnc_perksBasic;}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;

            // Options
            _action = [ "zeus_options", "Options", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // ------ Langages
            _action = ["zeus_babel_zeus", "Zeus: learn all languages", "", {["side"] call CGQC_fnc_setACRE}, {cgqc_config_sideLanguage }] call ace_interact_menu_fnc_createAction;
            _adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = ["zeus_babel_on", "Separate Languages: Turn On", "", {cgqc_config_sideLanguage = true; [-1, {["side"] call CGQC_fnc_setACRE}] call CBA_fnc_globalExecute;}, {!cgqc_config_sideLanguage} ] call ace_interact_menu_fnc_createAction;
            _adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = ["zeus_babel_off", "Separate Languages: Turn Off", "", {cgqc_config_sideLanguage = false; [-1, {["unlock"] call CGQC_fnc_setACRE}] call CBA_fnc_globalExecute;}, {cgqc_config_sideLanguage }] call ace_interact_menu_fnc_createAction;
            _adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;



            // Faction relations
            _action = ["zeus_relations", "Faction Relations", "",{""}, {true}] call ace_interact_menu_fnc_createAction;
            _adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;

            _action = ["zeus_relations_all", "All enemies", "", {["all"] call CGQC_fnc_setRelations}, {true}] call ace_interact_menu_fnc_createAction;
            _adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options", "zeus_relations"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = ["zeus_relations_west", "Ind friendly to West", "", {["indWest"] call CGQC_fnc_setRelations}, {true}] call ace_interact_menu_fnc_createAction;
            _adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options", "zeus_relations"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = ["zeus_relations_east", "Ind friendly to East", "", {["indEast"] call CGQC_fnc_setRelations}, {true}] call ace_interact_menu_fnc_createAction;
            _adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options", "zeus_relations"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = ["zeus_relations_friend", "Ind friendly to All", "", {["indAll"] call CGQC_fnc_setRelations}, {true}] call ace_interact_menu_fnc_createAction;
            _adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options", "zeus_relations"], _action ] call ace_interact_menu_fnc_addActionToObject;



            // ------ Zeus radios on/off
            _action = [ "zeus_radios_on", "Zeus Radios: Turn On", "", {cgqc_config_zeusRadios = true;["zeus_radios", 0, player] spawn CGQC_fnc_perksZeus;}, {!cgqc_config_zeusRadios} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_radios_off", "Zeus Radios: Turn Off", "", {cgqc_config_zeusRadios = false}, {cgqc_config_zeusRadios }] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // Map Sharing Restriction
            _action = [ "zeus_mapSharing_on", "MapSharing: Turn off", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_mapSharing_off", "MapSharing: Turn on", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // ------ Animation on/off
            _action = [ "zeus_anim_on", "Animations: Turn off", "", {["animation_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_anim_off", "Animations: Turn on", "", {["animation_off", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // ------ Punching on/off
            _action = [ "zeus_punch_on", "Punching: Turn On", "", {["punch_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!BRIDGE_KPU_MasterSetting} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_punch_off", "Punching: Turn Off", "", {["punch_off", 0, ""] spawn CGQC_fnc_perksZeus}, {BRIDGE_KPU_MasterSetting }] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;


            // ------ GRAD Persistence
            _action = [ "zeus_grad_persistence", "Persistence", "", {""}, {false} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_grad_save", "Save Mission", "", { [true, 10] remoteExec ["grad_persistence_fnc_saveMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_grad_load", "Load Mission", "", {[] remoteExec ["grad_persistence_fnc_loadMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_grad_load_players", "LoadPlayers", "", {[] remoteExec ["grad_persistence_fnc_loadAllPlayers",2,false];}, {true}] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_grad_clear", "Clear Data", "", {_x remoteExec ["grad_persistence_fnc_clearMissionData", 2]}, {true}] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // ------- Utils ----------------
            _action = [ "menu_self_utils", "Utilities", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call  ace_interact_menu_fnc_addActionToObject;
             // ------ Delete all dead
            _action = [ "zeus_delete", "Delete Dead", "", {["delete", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // Outdoor range
            _action = [ "zeus_range", "Hide Outdoor Range", "", {cgqc_outdoor_range_hide = true;publicVariable "cgqc_outdoor_range_hide";}, {!cgqc_outdoor_range_hide} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // Check player mod versions
            _action = [ "zeus_checkMods", "Check Player mods", "", {["check_mods", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // ------ Get 343
            _action = [ "zeus_343", "get 343", "", {["343", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // ------ Get 152
            _action = [ "zeus_152", "get 152", "", {["152", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // ------ Get 117
            _action = [ "zeus_117", "get 117f", "", {["117", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // ------ Get Crate
            _action = [ "zeus_getcrate", "Spawn: Arsenal mk3", "", {["crate", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
            //  ------ Delete Crate
            _action = [ "zeus_delcrate", "Delete Arsenal", "", {["del_crate", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // ------ Get Cargo
            _action = [ "zeus_getcargo", "get Cargo", "", {["cargo", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            //  ------ Delete Cargo
            _action = [ "zeus_delcargo", "delete Cargo", "", {["del_cargo", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            // ------ Export Loadout
            _action = [ "zeus_export", "Tartget loadout to Clipboard", "", {[cursorTarget] call CGQC_fnc_loadoutToClipboard}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_export", "Self loadout to Clipboard", "", {[player] call CGQC_fnc_loadoutToClipboard}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // ------ Invincible
            _action = [ "zeus_invincible", "God Mode", "", {["god", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_god} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_mortal", "God Mode->Off", "", {["mortal", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_god} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // ------ Invisible
            _action = [ "zeus_invisible", "Turn Invisible", "", {["ghost", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_ghost} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
            _action = [ "zeus_visible", "Invisible->Off", "", {["visible", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_ghost} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;

            // Get Zeus radios
            _action = [ "zeus_visible", "Get Zeus Radios", "", {[] call CGQC_int_setZeusRadios}, {!(player getVariable ["cgqc_zeus_radios_set", false])} ] call ace_interact_menu_fnc_createAction;
            _adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;


            // Other actions ================================================================================
            // Actual Zeus mode perks ================================================================================
            _action = [ "menu_zeus_trg", "CGQC Triggers", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {false} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

            _action = [ "menu_zeus_trg_1", "Activate 1", "", {hint "Trigger 1"}, {!isNil "cgqc_trg_1"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "menu_zeus_trg_2", "Activate 2", "", {hint "Trigger 2"}, {!isNil "cgqc_trg_2"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "menu_zeus_trg_3", "Activate 3", "", {hint "Trigger 3"}, {!isNil "cgqc_trg_3"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "menu_zeus_trg_4", "Activate 4", "", {hint "Trigger 4"}, {!isNil "cgqc_trg_4"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "menu_zeus_trg_5", "Activate 5", "", {hint "Trigger 5"}, {!isNil "cgqc_trg_5"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "menu_zeus_trg_6", "Activate 6", "", {hint "Trigger 6"}, {!isNil "cgqc_trg_6"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "menu_zeus_trg_7", "Activate 7", "", {hint "Trigger 7"}, {!isNil "cgqc_trg_7"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "menu_zeus_trg_8", "Activate 8", "", {hint "Trigger 8"}, {!isNil "cgqc_trg_8"} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

            // ------ Pause AI
            _action = [ "zeus_pause", "Pause AI", "", {[0,{["pause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute}, {!(missionNamespace getVariable "CGQC_gamestate_mission_AIpaused")} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "zeus_unpause", "Unpause AI", "", {[0,{["unpause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {(missionNamespace getVariable "CGQC_gamestate_mission_AIpaused")} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

            // ------ Delete all dead
            _action = [ "zeus_delete", "Delete Dead", "", {["delete", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

            // Options
            _action = [ "zeus_options", "Zeus Options", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            // Map Sharing Restriction
            _action = [ "zeus_mapSharing_on", "MapSharing: Turn off", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "zeus_mapSharing_off", "MapSharing: Turn on", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            // ------ Animation on/off
            _action = [ "zeus_anim_on", "Animations: Turn off", "", {["animation_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "zeus_anim_off", "Animations: Turn on", "", {["animation_off", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            // ------ Punching on/off
            _action = [ "zeus_punch_on", "Punching: Turn On", "", {["punch_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!BRIDGE_KPU_MasterSetting} ] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
            _action = [ "zeus_punch_off", "Punching: Turn Off", "", {["punch_off", 0, ""] spawn CGQC_fnc_perksZeus}, {BRIDGE_KPU_MasterSetting }] call ace_interact_menu_fnc_createAction;
            _adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
        };
    };
    default { };
};


/*
cgqc_perks_action_list = cgqc_perks_action_list + [cgqc_action_getCrew, cgqc_action_delCrew];
*/
LOG("[addPerksSpecial]  done");