// Snapshots --------------------------------------------------------------------------------------------------------------
_action = [ "menu_snapshots", "Snapshots", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_snapshot_save", "Save Player Snapshot", "", {[player, "save"] spawn CGQC_fnc_snapshot;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_snapshot_load", "Load Snapshot", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_snapshot_load_player", "Player Snapshot", "", {[player, "load"] spawn CGQC_fnc_snapshot;}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_done", false];} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots", "menu_snapshot_load"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_snapshot_load_auto", "Auto Snapshot", "", {[player, "load", "single", "auto"] spawn CGQC_fnc_snapshot;}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_auto_done", false];} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots", "menu_snapshot_load"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_snapshot_load_start", "Start Snapshot", "", {[player, "load", "single", "start"] spawn CGQC_fnc_snapshot;}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_start_done", false];} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots", "menu_snapshot_load"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_snapshot_load_zeus", "Zeus Snapshot", "", {[player, "load", "single", "zeus"] spawn CGQC_fnc_snapshot;}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_zeus_done", false];} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots", "menu_snapshot_load"], _action ] call  ace_interact_menu_fnc_addActionToObject;